class ApiEndPointsPaySprint {
  //Uility
  final String getOperatorList = "recharge/recharge/getoperator";
  final String doRecharge = "recharge/recharge/dorecharge";
  final String browsePlan = "recharge/hlrapi/browseplan";
  final String billpayOperatorList = "bill-payment/bill/getoperator";
  final String dthInfo = "recharge/hlrapi/dthinfo";
  final String fetchBillDetails = "bill-payment/bill/fetchbill";
  final String paybill = "bill-payment/bill/paybill";
  final String lpgBillOperatorList = "bill-payment/lpg/getoperator";
  //DMT
  final String queryRemitter = "dmt/remitter/queryremitter";
  final String registerRemitter = "dmt/remitter/registerremitter";
  final String addBeneficiary = "dmt/beneficiary/registerbeneficiary";
  final String deleteBeneficiary = "dmt/beneficiary/registerbeneficiary/deletebeneficiary";
  final String fetchBeneficiary = "dmt/beneficiary/registerbeneficiary/fetchbeneficiary";
  final String fetchBeneficiaryById = "dmt/beneficiary/registerbeneficiary/fetchbeneficiarybybeneid";
  final String pannyDrop = "dmt/beneficiary/registerbeneficiary/benenameverify";
  final String transact = "dmt/transact/transact";
  final String querytransact = "dmt/transact/transact/querytransact";

}