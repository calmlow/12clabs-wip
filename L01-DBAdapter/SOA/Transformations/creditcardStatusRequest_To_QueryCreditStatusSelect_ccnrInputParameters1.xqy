xquery version "1.0" encoding "utf-8";

import schema namespace cca="http://www.globalcompany.com/ns/CCAuthorizationService" at "../Schemas/creditcheck.xsd";
import schema namespace que="http://xmlns.oracle.com/pcbpel/adapter/db/top/QueryCreditStatus" at "../Schemas/QueryCreditStatus_table.xsd";

declare variable $in.part as schema-element(cca:creditcardStatusRequest) external;

declare function local:mediatorTransform($in.part as schema-element(cca:creditcardStatusRequest)) as schema-element(que:QueryCreditStatusSelect_ccnrInputParameters) {
    validate {
        <que:QueryCreditStatusSelect_ccnrInputParameters>
            <que:ccnr>{fn:data($in.part/cca:CCNumber)}</que:ccnr>
        </que:QueryCreditStatusSelect_ccnrInputParameters>
    }
};

local:mediatorTransform($in.part)
