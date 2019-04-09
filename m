Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC26C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:04:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 793062133D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="OSC1HMZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 793062133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpTw-0005r7-DL; Tue, 09 Apr 2019 12:04:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xtw0=SL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hDpTu-0005qF-B5
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:04:02 +0000
X-Inumbo-ID: 9015082d-5abf-11e9-92d7-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::718])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9015082d-5abf-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDKhZAoi1Ql3FNdnpucSDMHqWk+uaYPCr+59SLfRSIA=;
 b=OSC1HMZcxlrMTSWLKy3XO2Cx7/eMr2sU6piET10qnM/cjpDHqAKHWiy5YRgdQLfzbUf/iRfqgsWMns6daaBN/7p6QI6B+05r0cuEbS9bzXUK2NsYUWgUt1tvqNUoLDbdHqN/4ee6oYafprmbJX4aUDZJkBeGysDuOTOhaaGwnNc=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3328.eurprd02.prod.outlook.com (52.134.15.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Tue, 9 Apr 2019 12:04:00 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 12:04:00 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 3/3] x86/mm: Fix p2m_set_suppress_ve
Thread-Index: AQHU7sxQFaeXQ0Sbd0+5R1BM40gWCw==
Date: Tue, 9 Apr 2019 12:04:00 +0000
Message-ID: <20190409120324.13940-3-aisaila@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
In-Reply-To: <20190409120324.13940-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR05CA0013.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::26) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a390dd93-0f59-4041-7882-08d6bce3734b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3328; 
x-ms-traffictypediagnostic: VI1PR0202MB3328:|VI1PR0202MB3328:
x-microsoft-antispam-prvs: <VI1PR0202MB33280D2E9984667DF324191AAB2D0@VI1PR0202MB3328.eurprd02.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(376002)(366004)(346002)(189003)(199004)(6916009)(66066001)(6436002)(54906003)(3846002)(6512007)(8676002)(52116002)(6116002)(53936002)(102836004)(1076003)(486006)(97736004)(86362001)(316002)(81156014)(6486002)(81166006)(5660300002)(71200400001)(71190400001)(4326008)(5640700003)(26005)(2906002)(386003)(107886003)(2351001)(8936002)(4744005)(478600001)(6506007)(14444005)(25786009)(186003)(106356001)(256004)(305945005)(11346002)(105586002)(68736007)(14454004)(76176011)(50226002)(476003)(99286004)(7736002)(2501003)(2616005)(446003)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3328;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y64mP2DoaOkPoBb6HeEfVLtbkEbav/clyk1XX77IfJzu9zqRhq8EdUGa8L5r2F/V2uQA6lkA5uP5Ccpj0RuqRFAENnUGzmLmzFo+2Yjj6hsiZnhus8+WDsNyhC26KWKHK9YnLX5ZhRswKc1xsXKkLcQT37C1RpvsTr8qxAkuiS9PR+kehacGLPW7M39wmmUxTNx8RwbKp/pL0PlEnUWj/NMHbK4H6bygeo9PN7+XLnf0jd29ic9vKfBSbZ8o044NSGj/M6d1UXkTG7578zunvJtjXFT2iFop6sTO2g0+UXoAaowo75toq62VjHJWz7QQJQmyA6egSxLApN0pgj0cqSZ/IHZ9OhuJ2EyBVEl6t1lCIavR11HKsI0RVOpSpNOw6IIdjB9bZ3b4Z21r+bS3zB8BZUiFuT/9xFI6vVCossg=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a390dd93-0f59-4041-7882-08d6bce3734b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 12:04:00.0180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3328
Subject: [Xen-devel] [PATCH v3 3/3] x86/mm: Fix p2m_set_suppress_ve
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
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409120400.A3pmF6F0uohTcpRMK3EAzKW0Z9-hqzwGg0VZEpyhjfw@z>

T24gYSBuZXcgYWx0cDJtIHZpZXcgdGhlIHAybV9zZXRfc3VwcHJlc3NfdmUoKSBmdW5jIHdpbGwg
ZmFpbCB3aXRoIGludmFsaWQgbWZuDQpmcm9tIHAybS0+Z2V0X2VudHJ5KCkgaWYgcDJtLT5zZXRf
ZW50cnkoKSB3YXMgbm90IGNhbGxlZCBiZWZvcmUuDQoNClRoaXMgcGF0Y2ggc29sdmVzIHRoZSBw
cm9ibGVtIGJ5IGdldHRpbmcgdGhlIG1mbiBmcm9tIGhvc3RwMm0uDQoNClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KLS0tDQogeGVuL2Fy
Y2gveDg2L21tL3AybS5jIHwgMyArKy0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94
ZW4vYXJjaC94ODYvbW0vcDJtLmMNCmluZGV4IGQzOGQ3YzI5Y2EuLmFlZTgyZjgxNGQgMTAwNjQ0
DQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Yw0KQEAgLTI5ODIsNiArMjk4Miw3IEBAIGludCBwMm1fc2V0X3N1cHByZXNzX3ZlKHN0cnVjdCBk
b21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCBzdXBwcmVzc192ZSwNCiAgICAgcDJtX2FjY2Vzc190
IGE7DQogICAgIHAybV90eXBlX3QgdDsNCiAgICAgaW50IHJjOw0KKyAgICBib29sIGZvdW5kX2lu
X2hvc3RwMm07DQogDQogICAgIGlmICggYWx0cDJtX2lkeCA+IDAgKQ0KICAgICB7DQpAQCAtMjk5
OSw3ICszMDAwLDcgQEAgaW50IHAybV9zZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwg
Z2ZuX3QgZ2ZuLCBib29sIHN1cHByZXNzX3ZlLA0KICAgICBpZiAoIGFwMm0gKQ0KICAgICAgICAg
cDJtX2xvY2soYXAybSk7DQogDQotICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCAm
dCwgJmEsIDAsIE5VTEwsIE5VTEwpOw0KKyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2Fj
Y2VzcyhwMm0sIGdmbiwgJnQsICZhLCBOVUxMLCAmZm91bmRfaW5faG9zdHAybSk7DQogICAgIGlm
ICggIW1mbl92YWxpZChtZm4pICkNCiAgICAgew0KICAgICAgICAgcmMgPSAtRVNSQ0g7DQotLSAN
CjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
