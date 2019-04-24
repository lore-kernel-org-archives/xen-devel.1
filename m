Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFD4C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:28:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB0C20811
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 14:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="SfowaB6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB0C20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJIs6-0002Gf-IN; Wed, 24 Apr 2019 14:27:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pzk9=S2=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hJIs5-0002Ga-6t
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 14:27:37 +0000
X-Inumbo-ID: 1a337d6d-669d-11e9-92d7-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::70e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a337d6d-669d-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrRqfKKrbZoYLciP80Q3T0MVoqxcJoVteJlfVcPVl7M=;
 b=SfowaB6Ua6/lezQUssnL8llaRmQ0XHj/7hb7cdJBjJy8Kb1VHIhM/rG1x5vyRCLIvD4vSzoujrQgY82ifvjE0GskZTxxgY7FrG/CTKiKcC5YdIH5CJ+sxsRLvohWt3P9/PfojAXjDunmGo+1ixId6Uy1GTUeZ18BQ+V1daL4J8A=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3327.eurprd02.prod.outlook.com (52.134.15.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.17; Wed, 24 Apr 2019 14:27:32 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::89a9:54d2:cf14:66a7]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::89a9:54d2:cf14:66a7%9]) with mapi id 15.20.1835.010; Wed, 24 Apr 2019
 14:27:32 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v1] x86/mm: Make change_type_range return error
Thread-Index: AQHU+qnahqk7Qfv5gU6tW7kXrs6RHg==
Date: Wed, 24 Apr 2019 14:27:32 +0000
Message-ID: <20190424142718.14721-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR0102CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:209:14::16) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ca20a73-4e47-4d18-7d99-08d6c8c0fcb0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3327; 
x-ms-traffictypediagnostic: VI1PR0202MB3327:|VI1PR0202MB3327:
x-microsoft-antispam-prvs: <VI1PR0202MB332790BA6911518A1571B179AB3C0@VI1PR0202MB3327.eurprd02.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39860400002)(189003)(199004)(6486002)(71190400001)(36756003)(256004)(6116002)(14444005)(3846002)(71200400001)(5640700003)(2616005)(14454004)(476003)(68736007)(486006)(107886003)(305945005)(7736002)(2501003)(478600001)(8936002)(4326008)(6512007)(53936002)(97736004)(8676002)(2351001)(6436002)(102836004)(81166006)(50226002)(6916009)(25786009)(52116002)(99286004)(86362001)(26005)(64756008)(6506007)(66476007)(5660300002)(186003)(2906002)(316002)(1076003)(66556008)(66066001)(386003)(66446008)(66946007)(73956011)(54906003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3327;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lxKFRiIQLq5iIlHFLFiIeZND4J6fmrZ3GijWpIoR5DPXUqAXzdSadzj3CrnmUhCX5nMCIJKJB8RwoN1yurt2KiTjzOkudvz9a8LXmw6Ejoi6HqcuguHnnqY8N1Drjj+AzLBn61S9lOSaPY8E7tK9wm5a5YSsinmCiam223mJVVs5FZHBInOr1dfQfg0YtbG4ioxsH6eFdoNIXrJA5Ioqq5xnzg75lPt8Huq/64TY6BjRNmjO7YaQNk3/hkTKz8nN7edgB+HJI5uqXYQ6l5egZu7aUL07pTTy1h2iXMlsY9IEAMZFfA/WfR7UlOTSND/3KjX4z0GRSXNsoqKy/1vNBu5D0VvIlw0u6n/hTZSrN3e2uaECRoCYfVQ3UXpZCd53Url2TNYKjVv/l9q3dZtrnP38gGuBqjXaBFhkyEz3hTU=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca20a73-4e47-4d18-7d99-08d6c8c0fcb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 14:27:32.1637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3327
Subject: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return error
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424142732.1FS5P-lwlrdaVI4tN-k-tun2Vuww_aCL5o8eB_mBjI8@z>

QXQgdGhpcyBtb21lbnQgY2hhbmdlX3R5cGVfcmFuZ2UoKSBwcmludHMgYSB3YXJuaW5nIGluIGNh
c2UgZW5kID4NCmhvc3RfbWF4X3Bmbi4gV2hpbGUgdGhpcyBpcyB1bmxpa2VseSB0byBoYXBwZW4g
dGhlIGZ1bmN0aW9uIHNob3VsZA0KcmV0dXJuIGEgZXJyb3IgYW5kIHByb3BhZ2F0ZSBpdCB0byB0
aGUgY2FsbGVyLCBoYXBfdHJhY2tfZGlydHlfdnJhbSgpDQoNClRoaXMgcGF0Y2ggbWFrZXMgY2hh
bmdlX3R5cGVfcmFuZ2UoKSByZXR1cm4gLUVJTlZBTCBvciAwIGlmIGFsbCBpcyBvay4NCg0KU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQot
LS0NCiB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIHwgMTIgKysrKysrKystLS0tDQogeGVuL2Fy
Y2gveDg2L21tL3AybS5jICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
DQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCB8ICA2ICsrKy0tLQ0KIDMgZmlsZXMgY2hhbmdl
ZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0vaGFwL2hhcC5jIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYw0KaW5kZXgg
NDEyYTQ0MmI2YS4uYjExM2MzMTU0YiAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAv
aGFwLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMNCkBAIC0xMDgsMTUgKzEwOCwx
OSBAQCBpbnQgaGFwX3RyYWNrX2RpcnR5X3ZyYW0oc3RydWN0IGRvbWFpbiAqZCwNCiAgICAgICAg
ICAgICBwYWdpbmdfdW5sb2NrKGQpOw0KIA0KICAgICAgICAgICAgIGlmICggb2VuZCA+IG9zdGFy
dCApDQotICAgICAgICAgICAgICAgIHAybV9jaGFuZ2VfdHlwZV9yYW5nZShkLCBvc3RhcnQsIG9l
bmQsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX2xvZ2Rp
cnR5LCBwMm1fcmFtX3J3KTsNCisgICAgICAgICAgICAgICAgcmMgPSBwMm1fY2hhbmdlX3R5cGVf
cmFuZ2UoZCwgb3N0YXJ0LCBvZW5kLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwMm1fcmFtX2xvZ2RpcnR5LCBwMm1fcmFtX3J3KTsNCisgICAgICAgICAgICBp
ZiAoIHJjICkNCisgICAgICAgICAgICAgICAgZ290byBvdXQ7DQogDQogICAgICAgICAgICAgLyoN
CiAgICAgICAgICAgICAgKiBTd2l0Y2ggdnJhbSB0byBsb2cgZGlydHkgbW9kZSwgZWl0aGVyIGJ5
IHNldHRpbmcgbDFlIGVudHJpZXMgb2YNCiAgICAgICAgICAgICAgKiBQMk0gdGFibGUgdG8gYmUg
cmVhZC1vbmx5LCBvciB2aWEgaGFyZHdhcmUtYXNzaXN0ZWQgbG9nLWRpcnR5Lg0KICAgICAgICAg
ICAgICAqLw0KLSAgICAgICAgICAgIHAybV9jaGFuZ2VfdHlwZV9yYW5nZShkLCBiZWdpbl9wZm4s
IGJlZ2luX3BmbiArIG5yLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1f
cmFtX3J3LCBwMm1fcmFtX2xvZ2RpcnR5KTsNCisgICAgICAgICAgICByYyA9IHAybV9jaGFuZ2Vf
dHlwZV9yYW5nZShkLCBiZWdpbl9wZm4sIGJlZ2luX3BmbiArIG5yLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fcncsIHAybV9yYW1fbG9nZGlydHkpOw0K
KyAgICAgICAgICAgIGlmICggcmMgKQ0KKyAgICAgICAgICAgICAgICBnb3RvIG91dDsNCiANCiAg
ICAgICAgICAgICBmbHVzaF90bGJfbWFzayhkLT5kaXJ0eV9jcHVtYXNrKTsNCiANCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCmluZGV4
IDllODFhMzBjYzQuLjI3Njk3ZDVhNzcgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJt
LmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KQEAgLTEwMjgsNyArMTAyOCw3IEBAIGlu
dCBwMm1fY2hhbmdlX3R5cGVfb25lKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2Zu
X2wsDQogfQ0KIA0KIC8qIE1vZGlmeSB0aGUgcDJtIHR5cGUgb2YgW3N0YXJ0LCBlbmRfZXhjbHVz
aXZlKSBmcm9tIG90IHRvIG50LiAqLw0KLXN0YXRpYyB2b2lkIGNoYW5nZV90eXBlX3JhbmdlKHN0
cnVjdCBwMm1fZG9tYWluICpwMm0sDQorc3RhdGljIGludCBjaGFuZ2VfdHlwZV9yYW5nZShzdHJ1
Y3QgcDJtX2RvbWFpbiAqcDJtLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kX2V4Y2x1c2l2ZSwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IG90LCBwMm1fdHlwZV90IG50KQ0KIHsNCkBA
IC0xMDUzLDE1ICsxMDUzLDExIEBAIHN0YXRpYyB2b2lkIGNoYW5nZV90eXBlX3JhbmdlKHN0cnVj
dCBwMm1fZG9tYWluICpwMm0sDQogICAgICAqIFRoaXMgc2hvdWxkIGJlIHJldmlzaXRlZCBsYXRl
ciwgYnV0IGZvciBub3cgcG9zdCBhIHdhcm5pbmcuDQogICAgICAqLw0KICAgICBpZiAoIHVubGlr
ZWx5KGVuZCA+IGhvc3RfbWF4X3BmbikgKQ0KLSAgICB7DQotICAgICAgICBwcmludGsoWEVOTE9H
X0dfV0FSTklORyAiRG9tJWQgbG9nZGlydHkgcmFuZ2VzZXQgY2xpcHBlZCB0byBtYXhfbWFwcGVk
X3BmblxuIiwNCi0gICAgICAgICAgICAgICBkLT5kb21haW5faWQpOw0KLSAgICAgICAgZW5kID0g
aW52YWxpZGF0ZV9lbmQgPSBob3N0X21heF9wZm47DQotICAgIH0NCisgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KIA0KICAgICAvKiBJZiB0aGUgcmVxdWVzdGVkIHJhbmdlIGlzIG91dCBvZiBzY29w
ZSwgcmV0dXJuIGRvaW5nIG5vdGhpbmcuICovDQogICAgIGlmICggc3RhcnQgPiBlbmQgKQ0KLSAg
ICAgICAgcmV0dXJuOw0KKyAgICAgICAgcmV0dXJuIDA7DQogDQogICAgIGlmICggcDJtX2lzX2Fs
dHAybShwMm0pICkNCiAgICAgICAgIGludmFsaWRhdGVfZW5kID0gbWluKGludmFsaWRhdGVfZW5k
LCBtYXhfcGZuKTsNCkBAIC0xMTE1LDEzICsxMTExLDE2IEBAIHN0YXRpYyB2b2lkIGNoYW5nZV90
eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sDQogICAgICAgICAgICAgICAgcmMsIGQt
PmRvbWFpbl9pZCk7DQogICAgICAgICBkb21haW5fY3Jhc2goZCk7DQogICAgIH0NCisNCisgICAg
cmV0dXJuIDA7DQogfQ0KIA0KLXZvaWQgcDJtX2NoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBkb21h
aW4gKmQsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwg
dW5zaWduZWQgbG9uZyBlbmQsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVf
dCBvdCwgcDJtX3R5cGVfdCBudCkNCitpbnQgcDJtX2NoYW5nZV90eXBlX3JhbmdlKHN0cnVjdCBk
b21haW4gKmQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0
LCB1bnNpZ25lZCBsb25nIGVuZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBl
X3Qgb3QsIHAybV90eXBlX3QgbnQpDQogew0KICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdHAy
bSA9IHAybV9nZXRfaG9zdHAybShkKTsNCisgICAgaW50IHJjID0gMDsNCiANCiAgICAgQVNTRVJU
KG90ICE9IG50KTsNCiAgICAgQVNTRVJUKHAybV9pc19jaGFuZ2VhYmxlKG90KSAmJiBwMm1faXNf
Y2hhbmdlYWJsZShudCkpOw0KQEAgLTExMjksNyArMTEyOCwxMCBAQCB2b2lkIHAybV9jaGFuZ2Vf
dHlwZV9yYW5nZShzdHJ1Y3QgZG9tYWluICpkLA0KICAgICBwMm1fbG9jayhob3N0cDJtKTsNCiAg
ICAgaG9zdHAybS0+ZGVmZXJfbmVzdGVkX2ZsdXNoID0gMTsNCiANCi0gICAgY2hhbmdlX3R5cGVf
cmFuZ2UoaG9zdHAybSwgc3RhcnQsIGVuZCwgb3QsIG50KTsNCisgICAgcmMgPSBjaGFuZ2VfdHlw
ZV9yYW5nZShob3N0cDJtLCBzdGFydCwgZW5kLCBvdCwgbnQpOw0KKw0KKyAgICBpZiAoIHJjICkN
CisgICAgICAgIGdvdG8gb3V0Ow0KIA0KICNpZmRlZiBDT05GSUdfSFZNDQogICAgIGlmICggdW5s
aWtlbHkoYWx0cDJtX2FjdGl2ZShkKSkgKQ0KQEAgLTExNDIsOCArMTE0NCwxMSBAQCB2b2lkIHAy
bV9jaGFuZ2VfdHlwZV9yYW5nZShzdHJ1Y3QgZG9tYWluICpkLA0KICAgICAgICAgICAgICAgICBz
dHJ1Y3QgcDJtX2RvbWFpbiAqYWx0cDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2ldOw0KIA0KICAg
ICAgICAgICAgICAgICBwMm1fbG9jayhhbHRwMm0pOw0KLSAgICAgICAgICAgICAgICBjaGFuZ2Vf
dHlwZV9yYW5nZShhbHRwMm0sIHN0YXJ0LCBlbmQsIG90LCBudCk7DQorICAgICAgICAgICAgICAg
IHJjID0gY2hhbmdlX3R5cGVfcmFuZ2UoYWx0cDJtLCBzdGFydCwgZW5kLCBvdCwgbnQpOw0KICAg
ICAgICAgICAgICAgICBwMm1fdW5sb2NrKGFsdHAybSk7DQorDQorICAgICAgICAgICAgICAgIGlm
ICggcmMgKQ0KKyAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7DQogICAgICAgICAgICAgfQ0K
ICAgICB9DQogI2VuZGlmDQpAQCAtMTE1MSw3ICsxMTU2LDEwIEBAIHZvaWQgcDJtX2NoYW5nZV90
eXBlX3JhbmdlKHN0cnVjdCBkb21haW4gKmQsDQogICAgIGlmICggbmVzdGVkaHZtX2VuYWJsZWQo
ZCkgKQ0KICAgICAgICAgcDJtX2ZsdXNoX25lc3RlZHAybShkKTsNCiANCitvdXQ6DQogICAgIHAy
bV91bmxvY2soaG9zdHAybSk7DQorDQorICAgIHJldHVybiByYzsNCiB9DQogDQogLyoNCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9w
Mm0uaA0KaW5kZXggMjgwMWE4Y2NjYS4uYTExODgxMjAyNSAxMDA2NDQNCi0tLSBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvcDJtLmgNCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCkBAIC02
MTMsOSArNjEzLDkgQEAgdm9pZCBwMm1fY2hhbmdlX2VudHJ5X3R5cGVfZ2xvYmFsKHN0cnVjdCBk
b21haW4gKmQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qg
b3QsIHAybV90eXBlX3QgbnQpOw0KIA0KIC8qIENoYW5nZSB0eXBlcyBhY3Jvc3MgYSByYW5nZSBv
ZiBwMm0gZW50cmllcyAoc3RhcnQgLi4uIGVuZC0xKSAqLw0KLXZvaWQgcDJtX2NoYW5nZV90eXBl
X3JhbmdlKHN0cnVjdCBkb21haW4gKmQsIA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLA0KLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHAybV90eXBlX3Qgb3QsIHAybV90eXBlX3QgbnQpOw0KK2ludCBwMm1fY2hhbmdl
X3R5cGVfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwNCisgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgcDJtX3R5cGVfdCBvdCwgcDJtX3R5cGVfdCBudCk7DQogDQogLyogQ29tcGFy
ZS1leGNoYW5nZSB0aGUgdHlwZSBvZiBhIHNpbmdsZSBwMm0gZW50cnkgKi8NCiBpbnQgcDJtX2No
YW5nZV90eXBlX29uZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbiwNCi0tIA0K
Mi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
