Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF11C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:26:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6758021850
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="WOAw6zWt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6758021850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCOqp-0001hJ-LA; Fri, 05 Apr 2019 13:25:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMyJ=SH=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hCOqp-0001h3-2l
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:25:47 +0000
X-Inumbo-ID: 513e703a-57a6-11e9-92d7-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::700])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 513e703a-57a6-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqnW9CjdNaE53AQr7SKN37fBX7Fitu0jmFudcf2eHkA=;
 b=WOAw6zWtsiy5zVNMHEJJNf7aXISEEbvpi0iCRp6bkmo4xLjO6FURvkVOtHMeczTk5tBHzXLdmis2F/+Dn87k0nKnyfLp4CcNnbsU3JgIF5opDjcn717joAaPnvpZ+BKlGTAcPTBgVdq6SndGjiAsbo9KBDVYKA9uopfj1yJ0748=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3551.eurprd02.prod.outlook.com (52.134.18.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Fri, 5 Apr 2019 13:25:42 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 13:25:42 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/3] x86/mm: Fix p2m_set_suppress_ve
Thread-Index: AQHU67MRw6H5cMuNKk+McX+MnD77RQ==
Date: Fri, 5 Apr 2019 13:25:42 +0000
Message-ID: <20190405132521.6630-3-aisaila@bitdefender.com>
References: <20190405132521.6630-1-aisaila@bitdefender.com>
In-Reply-To: <20190405132521.6630-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P194CA0023.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::36) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a65e5b2-8637-4816-f2c5-08d6b9ca33f3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3551; 
x-ms-traffictypediagnostic: VI1PR0202MB3551:|VI1PR0202MB3551:
x-microsoft-antispam-prvs: <VI1PR0202MB355199D849DA83E4393CF6C6AB510@VI1PR0202MB3551.eurprd02.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(39860400002)(376002)(396003)(189003)(199004)(36756003)(68736007)(6512007)(4326008)(8936002)(81166006)(7736002)(53936002)(81156014)(5640700003)(50226002)(66066001)(6486002)(8676002)(256004)(14444005)(6436002)(99286004)(107886003)(305945005)(97736004)(316002)(6116002)(3846002)(54906003)(52116002)(102836004)(2616005)(6506007)(86362001)(2501003)(76176011)(476003)(6916009)(486006)(186003)(446003)(14454004)(11346002)(26005)(25786009)(478600001)(1076003)(105586002)(2351001)(386003)(5660300002)(4744005)(106356001)(71190400001)(2906002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3551;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vwadOkniOy0Xbfayq1CGwa4y0q7B9bLIj6vMdOK49if1QaHvmc7zfKMdwSv1Ig8m6jhDDmOhkpwwYKeSgSU1F2FNi2HGcUSsvFOnnpHN4AmKLCH5HWe2SrVztHtemFwgr2Nl6NhC7YOYtJSV9ethKgrVniR6O+ZfBtl2y7UefotPb/e8OlET1S8dEFEPXEffqonvNiQ5PLxI2xRMx+xdz6iSxOgUzka6DMHHbhLzmjElw9pMIiJTpzDQyLVIl47HkgilPKyaG6tgs5CJ98F7B1DudPZbtJFDQObDaKK7DYEDt505nTTEcptm2M+5TGjlUzq372/JuOQHBkoccnJuUrr/mtmUlNq5reX2N9trWakFAo2XODpEgJRaX3ouLcTwVh7+iGCUr+CXFQh02keiPHlW2aPvIRWW/hNOpWd2nsE=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a65e5b2-8637-4816-f2c5-08d6b9ca33f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 13:25:42.8604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3551
Subject: [Xen-devel] [PATCH v2 3/3] x86/mm: Fix p2m_set_suppress_ve
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
Message-ID: <20190405132542.6_X2_aCq02jxMu_tVmi7nIC91SlwWJADQBEku-FA_Mk@z>

T24gYSBuZXcgYWx0cDJtIHZpZXcgdGhlIHAybV9zZXRfc3VwcHJlc3NfdmUoKSBmdW5jIHdpbGwg
ZmFpbCB3aXRoIGludmFsaWQgbWZuCmZyb20gcDJtLT5nZXRfZW50cnkoKSBpZiBwMm0tPnNldF9l
bnRyeSgpIHdhcyBub3QgY2FsbGVkIGJlZm9yZS4KClRoaXMgcGF0Y2ggc29sdmVzIHRoZSBwcm9i
bGVtIGJ5IGdldHRpbmcgdGhlIG1mbiBmcm9tIGhvc3RwMm0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYv
bW0vcDJtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0uYwppbmRleCAxZjg1MjY5NGZmLi42ZGVlMDA1MmY4IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0yOTc0LDYg
KzI5NzQsNyBAQCBpbnQgcDJtX3NldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5f
dCBnZm4sIGJvb2wgc3VwcHJlc3NfdmUsCiAgICAgcDJtX2FjY2Vzc190IGE7CiAgICAgcDJtX3R5
cGVfdCB0OwogICAgIGludCByYzsKKyAgICBib29sIGZvdW5kX2luX2hvc3RwMm07CiAKICAgICBp
ZiAoIGFsdHAybV9pZHggPiAwICkKICAgICB7CkBAIC0yOTkxLDcgKzI5OTIsNyBAQCBpbnQgcDJt
X3NldF9zdXBwcmVzc192ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgc3VwcHJl
c3NfdmUsCiAgICAgaWYgKCBhcDJtICkKICAgICAgICAgcDJtX2xvY2soYXAybSk7CiAKLSAgICBt
Zm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwgJnQsICZhLCAwLCBOVUxMLCBOVUxMKTsKKyAg
ICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcyhwMm0sIGdmbiwgJnQsICZhLCBOVUxM
LCAmZm91bmRfaW5faG9zdHAybSk7CiAgICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQogICAgIHsK
ICAgICAgICAgcmMgPSAtRVNSQ0g7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
