Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CDDC282DA
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:04:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7915B20880
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:04:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="btCXUyMJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7915B20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpTw-0005ql-39; Tue, 09 Apr 2019 12:04:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xtw0=SL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hDpTu-0005qE-AS
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:04:02 +0000
X-Inumbo-ID: 8f8c61fb-5abf-11e9-92d7-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::718])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f8c61fb-5abf-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owta9WrNUe0kPuZmGRjF2IO/FGMqGR2j75nhjLn8wSM=;
 b=btCXUyMJwn4KrRyAQm2qfIHCTFt7Bbf6/HEIt+I1lxD+nEMr7Ph060uKsp7UrXmC8bBw10YQPMSVkRYOS9c42NkGfcq+sDmQnqxXSN3jOIl+MjYv5yFGqOaJcuzjdZjPwJtb/kNE7ZdjdH4PrBccXUyiXt1MxwrcNrxjaosZAE8=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3328.eurprd02.prod.outlook.com (52.134.15.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Tue, 9 Apr 2019 12:03:58 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 12:03:58 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/3] x86/mm: Introduce altp2m_set_entry_by_page_order
Thread-Index: AQHU7sxQ+KX9XNKHYECIICmH90QLYA==
Date: Tue, 9 Apr 2019 12:03:58 +0000
Message-ID: <20190409120324.13940-2-aisaila@bitdefender.com>
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
x-ms-office365-filtering-correlation-id: c95226dc-aa99-4513-7e0f-08d6bce3724f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3328; 
x-ms-traffictypediagnostic: VI1PR0202MB3328:|VI1PR0202MB3328:
x-microsoft-antispam-prvs: <VI1PR0202MB3328E80444707C01E7EADA26AB2D0@VI1PR0202MB3328.eurprd02.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(376002)(366004)(346002)(189003)(199004)(6916009)(66066001)(6436002)(54906003)(3846002)(6512007)(8676002)(52116002)(6116002)(53936002)(102836004)(1076003)(486006)(97736004)(86362001)(316002)(81156014)(6486002)(81166006)(5660300002)(71200400001)(71190400001)(4326008)(5640700003)(26005)(2906002)(386003)(107886003)(2351001)(8936002)(478600001)(6506007)(14444005)(25786009)(186003)(106356001)(256004)(305945005)(11346002)(105586002)(68736007)(14454004)(76176011)(50226002)(476003)(99286004)(7736002)(2501003)(2616005)(446003)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3328;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eUHoPNC+0z2gUe37MdHARAbD6Q7HpPfMTGLNv2VqlR7Qkf5Al+GgadFYLg+BDmP/wKnFRWWkpNXKmYRg2HiY9VVk05beFzwQuBjZ+fFMIfxWVUAE0L4DgMQZ7+RIz+QCebdT6KnGrVbmzlcnLlc/xCYEccIpMAgu1KvgPYa98d5VzQ+RN92UcCtImJlKQz90RDClcaEDR8+aYUL9GxH/EhjOXb+jGBSr4U+cdz+z2Vj7t8WzOjFMxxUfcypK4Vp+uNiJKCt9BKPWHHF+pPWxsoTJdoW6HL1W5Urny/Wpm8CdCgCN84tFMo9Sktt+zUHSw4TlJfqJCuLzf6Osy12jXOfwvzxA80jIRBcn+v+8LVwcFfkEOyQ0N2yJJGnmr3/Ukxeb6lfLbit8tcwfVO8IEAIKXZ7sILtvt/v9/YQSPrE=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c95226dc-aa99-4513-7e0f-08d6bce3724f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 12:03:58.3646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3328
Subject: [Xen-devel] [PATCH v3 2/3] x86/mm: Introduce
 altp2m_set_entry_by_page_order
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
Message-ID: <20190409120358.Sy1jFGy7IExO9xKl2J2GLHyaQoSYSOYBNB28oVy-snA@z>

VGhpcyBwYXRjaCBtb3ZlcyBjb21tb24gY29kZSBmcm9tIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nl
c3MoKSBhbmQNCnAybV9jaGFuZ2VfYWx0cDJtX2dmbigpIGludG8gb25lIGZ1bmN0aW9uDQoNClNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0K
LS0tDQogeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8ICAyICstDQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9wMm0uaCAgICB8IDExICsrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
bW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KaW5kZXggYmY2
N2RkYjE1YS4uNmEyMjUxMjU1NSAxMDA2NDQNCi0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNj
ZXNzLmMNCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCkBAIC0yNzksNyArMjc5
LDcgQEAgaW50IHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IHAybV9kb21haW4gKmhwMm0sDQogICAgICAgICBnZm5fdCBnZm4yID0gX2dmbihnZm5fbCAm
IG1hc2spOw0KICAgICAgICAgbWZuX3QgbWZuMiA9IF9tZm4obWZuX3gobWZuKSAmIG1hc2spOw0K
IA0KLSAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRv
IGEgc2hhcmVkIGVudHJ5ICovDQorCS8qIE5vdGU6IGN1cnJlbnRseSBpdCBpcyBub3Qgc2FmZSB0
byByZW1hcCB0byBhIHNoYXJlZCBlbnRyeSAqLw0KICAgICAgICAgaWYgKCB0ICE9IHAybV9yYW1f
cncgKQ0KICAgICAgICAgICAgIHJldHVybiAtRVNSQ0g7DQogDQpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9wMm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCmluZGV4IDZk
ZTE1NDZkNzYuLjkwYTZjMTM1YTcgMTAwNjQ0DQotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Ay
bS5oDQorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oDQpAQCAtNDY3LDYgKzQ2NywxNyBA
QCBzdGF0aWMgaW5saW5lIG1mbl90IGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKA0KICAgICBy
ZXR1cm4gbWZuOw0KIH0NCiANCitzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fc2V0X2VudHJ5X2J5
X3BhZ2Vfb3JkZXIoDQorICAgIHN0cnVjdCBwMm1fZG9tYWluICphcDJtLCB1bnNpZ25lZCBsb25n
IGdmbiwgIG1mbl90IG1mbiwNCisgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXIsIHAybV90eXBl
X3QgdCwgcDJtX2FjY2Vzc190IGEpDQorew0KKyAgICB1bnNpZ25lZCBsb25nIG1hc2sgPSB+KCgx
VUwgPDwgcGFnZV9vcmRlcikgLSAxKTsNCisgICAgZ2ZuX3QgZ2ZuMiA9IF9nZm4oZ2ZuICYgbWFz
ayk7DQorICAgIG1mbl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsNCisNCisgICAg
cmV0dXJuIGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBh
LCAxKTsNCit9DQorDQogLyogU3ludGFjdGljIHN1Z2FyOiBtb3N0IGNhbGxlcnMgd2lsbCB1c2Ug
b25lIG9mIHRoZXNlLiAqLw0KICNkZWZpbmUgZ2V0X2dmbihkLCBnLCB0KSAgICAgICAgIGdldF9n
Zm5fdHlwZSgoZCksIChnKSwgKHQpLCBQMk1fQUxMT0MpDQogI2RlZmluZSBnZXRfZ2ZuX3F1ZXJ5
KGQsIGcsIHQpICAgZ2V0X2dmbl90eXBlKChkKSwgKGcpLCAodCksIDApDQotLSANCjIuMTcuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
