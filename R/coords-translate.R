
#' Parse coordinates into well-known formats
#'
#' These functions provide the reverse function of [wkt_coords()]
#' and company: they parse vectors of coordinate values into well-known
#' formats. Polygon rings are automatically closed, as
#' closed rings are assumed or required by many parsers.
#'
#' @param x,y,z,m Vectors of coordinate values
#' @param feature_id,ring_id Vectors for which a change in
#'   sequential values indicates a new feature or ring. Use [factor()]
#'   to convert from a character vector.
#' @param buffer_size The buffer size to use when converting to WKB.
#' @inheritParams wk::wkb_translate_wkt
#'
#' @return `*_translate_wkt()` returns a character vector of
#'   well-known text; `*_translate_wkb()` returns a list
#'   of raw vectors.
#'
#' @export
#'
#' @examples
#' coords_point_translate_wkt(1:3, 2:4)
#' coords_linestring_translate_wkt(1:5, 2:6, feature_id = c(1, 1, 1, 2, 2))
#' coords_polygon_translate_wkt(c(0, 10, 0), c(0, 0, 10))
#'
coords_point_translate_wkt <- function(x, y, z = NA, m = NA,
                                       precision = 16, trim = TRUE) {
  recycled <- vctrs::vec_recycle_common(x, y, z, m)
  cpp_coords_point_translate_wkt(
    recycled[[1]], recycled[[2]], recycled[[3]], recycled[[4]],
    precision = precision,
    trim = trim
  )
}

#' @rdname coords_point_translate_wkt
#' @export
coords_point_translate_wkb <- function(x, y, z = NA, m = NA,
                                       endian = wk::wk_platform_endian(), buffer_size = 2048) {
  recycled <- vctrs::vec_recycle_common(x, y, z, m)
  cpp_coords_point_translate_wkb(
    recycled[[1]], recycled[[2]], recycled[[3]], recycled[[4]],
    endian = endian,
    bufferSize = buffer_size
  )
}

#' @rdname coords_point_translate_wkt
#' @export
coords_linestring_translate_wkt <- function(x, y, z = NA, m = NA, feature_id = 1L,
                                       precision = 16, trim = TRUE) {
  recycled <- vctrs::vec_recycle_common(x, y, z, m, feature_id)
  cpp_coords_linestring_translate_wkt(
    recycled[[1]], recycled[[2]], recycled[[3]], recycled[[4]],
    recycled[[5]],
    precision = precision,
    trim = trim
  )
}

#' @rdname coords_point_translate_wkt
#' @export
coords_linestring_translate_wkb <- function(x, y, z = NA, m = NA, feature_id = 1L,
                                            endian = wk::wk_platform_endian(), buffer_size = 2048) {
  recycled <- vctrs::vec_recycle_common(x, y, z, m, feature_id)
  cpp_coords_linestring_translate_wkb(
    recycled[[1]], recycled[[2]], recycled[[3]], recycled[[4]],
    recycled[[5]],
    endian = endian,
    bufferSize = buffer_size
  )
}

#' @rdname coords_point_translate_wkt
#' @export
coords_polygon_translate_wkt <- function(x, y, z = NA, m = NA, feature_id = 1L, ring_id = 1L,
                                         precision = 16, trim = TRUE) {
  recycled <- vctrs::vec_recycle_common(x, y, z, m, feature_id, ring_id)
  cpp_coords_polygon_translate_wkt(
    recycled[[1]], recycled[[2]], recycled[[3]], recycled[[4]],
    recycled[[5]], recycled[[6]],
    precision = precision,
    trim = trim
  )
}

#' @rdname coords_point_translate_wkt
#' @export
coords_polygon_translate_wkb <- function(x, y, z = NA, m = NA, feature_id = 1L, ring_id = 1L,
                                         endian = wk::wk_platform_endian(), buffer_size = 2048) {
  recycled <- vctrs::vec_recycle_common(x, y, z, m, feature_id, ring_id)
  cpp_coords_polygon_translate_wkb(
    recycled[[1]], recycled[[2]], recycled[[3]], recycled[[4]],
    recycled[[5]], recycled[[6]],
    endian = endian,
    bufferSize = buffer_size
  )
}
