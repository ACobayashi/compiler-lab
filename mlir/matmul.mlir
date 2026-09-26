module {
  func @matmul(%A: memref<2x4xf32>,
               %B: memref<4x3xf32>,
               %C: memref<2x3xf32>) {
    linalg.matmul
      ins(%A, %B : memref<2x4xf32>, memref<4x3xf32>)
      outs(%C : memref<2x3xf32>)
    return
  }
}