as.Seurat.SingleCellExperiment <- function(
  x,
  counts = 'counts',
  data = 'logcounts',
  assay = NULL,
  project = 'SingleCellExperiment',
  ...
) {
  CheckDots(...)
  if (!PackageCheck('SingleCellExperiment', error = FALSE)) {
    stop(
      "Please install SingleCellExperiment from Bioconductor before converting to a SingeCellExperiment object.",
      "\nhttps://bioconductor.org/packages/SingleCellExperiment/",
      call. = FALSE
    )
  }
  meta.data <- as.data.frame(x = SummarizedExperiment::colData(x = x))
  if (packageVersion(pkg = "SingleCellExperiment") >= "1.14.0") {
    orig.exp <- SingleCellExperiment::mainExpName(x = x) %||% "originalexp"
  } else {
    orig.exp <- "originalexp"
  }
  if (!is.null(SingleCellExperiment::altExpNames(x = x))) {
    assayn <- assay %||% SingleCellExperiment::altExpNames(x = x)
    if (!all(assay %in% SingleCellExperiment::altExpNames(x = x))) {
      stop("One or more of the assays you are trying to convert is not in the SingleCellExperiment object")
    }
    assayn <- c(orig.exp, assayn)
  } else {
    assayn <- orig.exp
  }
  for (assay in assayn) {
    if (assay != orig.exp) {
      x <- SingleCellExperiment::swapAltExp(x = x, name = assay, saved = NULL)
    }
    # Pull matrices
    mats <- list(counts = counts, data = data)
    mats <- Filter(f = Negate(f = is.null), x = mats)
    if (length(x = mats) == 0) {
      stop("Cannot pass 'NULL' to both 'counts' and 'data'")
    }
    for (m in 1:length(x = mats)) {
      mats[[m]] <- tryCatch(
        expr = SummarizedExperiment::assay(x = x, i = mats[[m]]),
        error = function(e) {
          stop("No data in provided assay - ", mats[[m]], call. = FALSE)
        }
      )
      # if cell names are NULL, fill with cell_X
      if (is.null(x = colnames(x = mats[[m]]))) {
        warning(
          "The column names of the ",
          names(x = mats)[m],
          " matrix is NULL. Setting cell names to cell_columnidx (e.g 'cell_1').",
          call. = FALSE,
          immediate. = TRUE
        )
        cell.names <- paste0("cell_", 1:ncol(x = mats[[m]]))
        colnames(x = mats[[m]]) <- cell.names
        rownames(x = meta.data) <- cell.names
      }
    }
    assays <- if (is.null(x = mats$counts)) {
      list(CreateAssayObject(data = mats$data))
    } else if (is.null(x = mats$data)) {
      list(CreateAssayObject(counts = mats$counts))
    } else {
      a <- CreateAssayObject(counts = mats$counts)
      a <- SetAssayData(object = a, slot = 'data', new.data = mats$data)
      list(a)
    }
    names(x = assays) <- assay
    Key(object = assays[[assay]]) <- paste0(tolower(x = assay), '_')
    # Create the Seurat object
    if (!exists(x = "object")) {
      object <- CreateSeuratObject(
        counts = assays[[assay]],
        Class = 'Seurat',
        assay = assay,
        meta.data = meta.data,
        version = packageVersion(pkg = 'Seurat'),
        project.name = project
      )
    } else {
      object[[assay]] <- assays[[assay]]
    }
    DefaultAssay(object = object) <- assay
    # add feature level meta data
    md <- SingleCellExperiment::rowData(x = x)
    if (ncol(x = md) > 0) {
      # replace underscores
      rownames(x = md) <- gsub(pattern = "_", replacement = "-", x = rownames(x = md))
      md <- as.data.frame(x = md)
      # ensure order same as data
      md <- md[rownames(x = object[[assay]]), , drop = FALSE]
      object[[assay]] <- AddMetaData(
        object = object[[assay]],
        metadata = md
      )
    }
    Idents(object = object) <- project
    # Get DimReduc information, add underscores if needed and pull from different alt EXP
    if (length(x = SingleCellExperiment::reducedDimNames(x = x)) > 0) {
      for (dr in SingleCellExperiment::reducedDimNames(x = x)) {
        embeddings <- as.matrix(x = SingleCellExperiment::reducedDim(x = x, type = dr))
        if (is.null(x = rownames(x = embeddings))) {
          rownames(x = embeddings)  <- cell.names
        } else {
          rownames(x = embeddings) <- make.unique(names = rownames(x = embeddings))
        }
        if (isTRUE(x = !grepl('_$',
        gsub(pattern = "[[:digit:]]",
          replacement = "_",
          x = colnames(x = SingleCellExperiment::reducedDim(x = x, type = dr))[1]
        )))) {
        key <- gsub(
          pattern = "[[:digit:]]",
          replacement = "_",
          x = colnames(x = SingleCellExperiment::reducedDim(x = x, type = dr))[1]
        )
        } else
        {
          key <- gsub(
            pattern = "[[:digit:]]",
            replacement = "",
            x = colnames(x = SingleCellExperiment::reducedDim(x = x, type = dr))[1]
          )
       }
        if (length(x = key) == 0) {
          key <- paste0(dr, "_")
        }
        colnames(x = embeddings) <- paste0(key, 1:ncol(x = embeddings))
        object[[dr]] <- CreateDimReducObject(
          embeddings = embeddings,
          key = key,
          assay = DefaultAssay(object = object)
        )
      }
    }
  }
  return(object)
}

