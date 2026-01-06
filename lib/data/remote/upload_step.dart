enum UploadStep {
  idle,
  uploading,
  analyzing,
  separating,
  converting,
  zipping,
  completed,
  downloading,
  success,
  failed;

  static UploadStep fromString(String value) {
    switch (value.toLowerCase()) {
      case 'idle':
        return UploadStep.idle;
      case 'uploading':
        return UploadStep.uploading;
      case 'analyzing':
        return UploadStep.analyzing;
      case 'separating':
        return UploadStep.separating;
      case 'converting':
        return UploadStep.converting;
      case 'zipping':
        return UploadStep.zipping;
      case 'completed':
        return UploadStep.completed;
      case 'downloading':
        return UploadStep.downloading;
      case 'success':
        return UploadStep.success;
      case 'failed':
        return UploadStep.failed;
      default:
        throw ArgumentError('Invalid UploadStep value: $value');
    }
  }
}
