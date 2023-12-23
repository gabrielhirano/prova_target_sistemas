enum StatusResponse { idle, awaiting, sucess, failed }

extension StatusResponseExtensions on StatusResponse {
  bool get isIdle {
    return this == StatusResponse.idle;
  }

  bool get isAwaiting {
    return this == StatusResponse.awaiting;
  }

  bool get hasSucessfull {
    return this == StatusResponse.sucess;
  }

  bool get hasFailed {
    return this == StatusResponse.failed;
  }
}
