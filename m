Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08E8C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:26:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD46021850
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="OY+ssKjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD46021850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCOqm-0001gb-RD; Fri, 05 Apr 2019 13:25:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMyJ=SH=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hCOql-0001gW-BV
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:25:43 +0000
X-Inumbo-ID: 4eae6474-57a6-11e9-92d7-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::721])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4eae6474-57a6-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McJ1GpuTh9bn9nG/Ub3LNjpgUWwMMB/nMCXvxcPtxww=;
 b=OY+ssKjDHLzbO3r8TrFfLmUAu1Co3zr0bvqXjrk5JzET5MF3gX2OH3E93Q2V1DbVXHWV90WWTptRltARUXM1Px84tsYQ13m/jK8FEYLEivVtXtxqPlbaMosMbCttL4x6RuzKVo/2X1zzHkc6+SS3TG3nyb01vyRb4wakbM0UuBs=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3280.eurprd02.prod.outlook.com (52.134.15.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Fri, 5 Apr 2019 13:25:38 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 13:25:38 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 1/3] x86/mm: Introduce altp2m_get_gfn_type_access
Thread-Index: AQHU67MOOt6j14oTzUCFLR1+mgEKCw==
Date: Fri, 5 Apr 2019 13:25:37 +0000
Message-ID: <20190405132521.6630-1-aisaila@bitdefender.com>
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
x-ms-office365-filtering-correlation-id: 83e7b6c1-68b0-4e7a-a87c-08d6b9ca30f1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3280; 
x-ms-traffictypediagnostic: VI1PR0202MB3280:|VI1PR0202MB3280:
x-microsoft-antispam-prvs: <VI1PR0202MB32802A7FC1EF59ECDCF3CD70AB510@VI1PR0202MB3280.eurprd02.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(68736007)(6486002)(316002)(71200400001)(71190400001)(4326008)(106356001)(105586002)(97736004)(2351001)(54906003)(478600001)(1076003)(81156014)(81166006)(53936002)(25786009)(5640700003)(86362001)(6916009)(8936002)(8676002)(2906002)(107886003)(3846002)(6116002)(6512007)(6436002)(14454004)(50226002)(5660300002)(7736002)(305945005)(476003)(14444005)(2616005)(386003)(6506007)(26005)(102836004)(2501003)(36756003)(256004)(66066001)(99286004)(52116002)(486006)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3280;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y5B4ZHQstgxj2knS/bxbQx8X8YhLdrgWfD5GjVT4u/0bZ+2G+DdZ+1PE/Yur/KqWnQ2whP/tht9OYHAYs3mbyCzhOPajGWrAlvNv9Uj8X1r3NGONX/4cpgYtrCMa8nhCqa52Hn5GfGtLYFJ7D2zQ/cwyrQq/V5lKhp/rXkp3wDfeoK3g8ZrSnbU4mARQ/MsEevi1vkEaoy/ACEU29J1BL0j9D0YSneMzqxG/DTo06o7BDyBiK23w1fwLJb5eBEYQfci+6K4D5Ohc8SyayeJj1/ovznbhYsMccvtvZ7d7CsNGjvXNnm/H/6g4+bryVkHlY4IAtk52EpkFc+lYvn4ZMmzscPHZNBSkrt+j8c3KreadbxJTRiEUKlG/ckVJfGwkubupwiK1bFFmLm5AUyrAu9aj/Nrh2Mv2uCZfuUEytNM=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e7b6c1-68b0-4e7a-a87c-08d6b9ca30f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 13:25:37.8372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3280
Subject: [Xen-devel] [PATCH v2 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
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
Message-ID: <20190405132537.hiqVxNpumZuxZKF40Q8LJfR1py5-ue2xZBFsFCmbpC8@z>

VGhpcyBwYXRjaCBtb3ZlcyBjb21tb24gY29kZSBmcm9tIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nl
c3MoKSBhbmQKcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKCkgaW50byBvbmUgZnVuY3Rpb24KClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCAzMCArKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQogeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICB8IDM3ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCAgICB8IDIz
ICsrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygr
KSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nl
c3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKaW5kZXggNTZjMDZhNGZjNi4uNjA4
Zjc0OGE1NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYworKysgYi94
ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCkBAIC0yNjUsMzEgKzI2NSwyMyBAQCBpbnQgcDJt
X3NldF9hbHRwMm1fbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFp
biAqaHAybSwKICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsKICAgICB1bnNpZ25lZCBsb25n
IGdmbl9sID0gZ2ZuX3goZ2ZuKTsKICAgICBpbnQgcmM7CisgICAgYm9vbCBmb3VuZF9pbl9ob3N0
cDJtOwogCi0gICAgbWZuID0gYXAybS0+Z2V0X2VudHJ5KGFwMm0sIGdmbiwgJnQsICZvbGRfYSwg
MCwgTlVMTCwgTlVMTCk7CisgICAgbWZuID0gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nlc3MoYXAy
bSwgZ2ZuLCAmdCwgJm9sZF9hLCAmcGFnZV9vcmRlciwgJmZvdW5kX2luX2hvc3RwMm0pOwogCi0g
ICAgLyogQ2hlY2sgaG9zdCBwMm0gaWYgbm8gdmFsaWQgZW50cnkgaW4gYWx0ZXJuYXRlICovCiAg
ICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQotICAgIHsKKyAgICAgICAgcmV0dXJuIC1FU1JDSDsK
IAotICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoaHAybSwgZ2ZuX2wsICZ0LCAm
b2xkX2EsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MgfCBQ
Mk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOworICAgIC8qIElmIHRoaXMgaXMgYSBzdXBlcnBh
Z2UsIGNvcHkgdGhhdCBmaXJzdCAqLworICAgIGlmICggcGFnZV9vcmRlciAhPSBQQUdFX09SREVS
XzRLICYmIGZvdW5kX2luX2hvc3RwMm0gKQorICAgIHsKKyAgICAgICAgdW5zaWduZWQgbG9uZyBt
YXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7CisgICAgICAgIGdmbl90IGdmbjIgPSBf
Z2ZuKGdmbl9sICYgbWFzayk7CisgICAgICAgIG1mbl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikg
JiBtYXNrKTsKIAotICAgICAgICByYyA9IC1FU1JDSDsKLSAgICAgICAgaWYgKCAhbWZuX3ZhbGlk
KG1mbikgfHwgdCAhPSBwMm1fcmFtX3J3ICkKKyAgICAgICAgcmMgPSBhcDJtLT5zZXRfZW50cnko
YXAybSwgZ2ZuMiwgbWZuMiwgcGFnZV9vcmRlciwgdCwgb2xkX2EsIDEpOworICAgICAgICBpZiAo
IHJjICkKICAgICAgICAgICAgIHJldHVybiByYzsKLQotICAgICAgICAvKiBJZiB0aGlzIGlzIGEg
c3VwZXJwYWdlLCBjb3B5IHRoYXQgZmlyc3QgKi8KLSAgICAgICAgaWYgKCBwYWdlX29yZGVyICE9
IFBBR0VfT1JERVJfNEsgKQotICAgICAgICB7Ci0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIG1h
c2sgPSB+KCgxVUwgPDwgcGFnZV9vcmRlcikgLSAxKTsKLSAgICAgICAgICAgIGdmbl90IGdmbjIg
PSBfZ2ZuKGdmbl9sICYgbWFzayk7Ci0gICAgICAgICAgICBtZm5fdCBtZm4yID0gX21mbihtZm5f
eChtZm4pICYgbWFzayk7Ci0KLSAgICAgICAgICAgIHJjID0gYXAybS0+c2V0X2VudHJ5KGFwMm0s
IGdmbjIsIG1mbjIsIHBhZ2Vfb3JkZXIsIHQsIG9sZF9hLCAxKTsKLSAgICAgICAgICAgIGlmICgg
cmMgKQotICAgICAgICAgICAgICAgIHJldHVybiByYzsKLSAgICAgICAgfQogICAgIH0KIAogICAg
IC8qCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0v
cDJtLmMKaW5kZXggYjliYmI4ZjQ4NS4uYjJhNWMwYzQyZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMjYyNiw2ICsyNjI2
LDcgQEAgaW50IHAybV9jaGFuZ2VfYWx0cDJtX2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25l
ZCBpbnQgaWR4LAogICAgIG1mbl90IG1mbjsKICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsK
ICAgICBpbnQgcmMgPSAtRUlOVkFMOworICAgIGJvb2wgZm91bmRfaW5faG9zdHAybTsKIAogICAg
IGlmICggaWR4ID49IE1BWF9BTFRQMk0gfHwgZC0+YXJjaC5hbHRwMm1fZXB0cFtpZHhdID09IG1m
bl94KElOVkFMSURfTUZOKSApCiAgICAgICAgIHJldHVybiByYzsKQEAgLTI2MzYsNyArMjYzNyw3
IEBAIGludCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
aW50IGlkeCwKICAgICBwMm1fbG9jayhocDJtKTsKICAgICBwMm1fbG9jayhhcDJtKTsKIAotICAg
IG1mbiA9IGFwMm0tPmdldF9lbnRyeShhcDJtLCBvbGRfZ2ZuLCAmdCwgJmEsIDAsIE5VTEwsIE5V
TEwpOworICAgIG1mbiA9IGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKGFwMm0sIG9sZF9nZm4s
ICZ0LCAmYSwgJnBhZ2Vfb3JkZXIsICZmb3VuZF9pbl9ob3N0cDJtKTsKIAogICAgIGlmICggZ2Zu
X2VxKG5ld19nZm4sIElOVkFMSURfR0ZOKSApCiAgICAgewpAQCAtMjY0OCwzNSArMjY0OSwyNSBA
QCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGlu
dCBpZHgsCiAKICAgICAvKiBDaGVjayBob3N0IHAybSBpZiBubyB2YWxpZCBlbnRyeSBpbiBhbHRl
cm5hdGUgKi8KICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCi0gICAgewotICAgICAgICBtZm4g
PSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoaHAybSwgZ2ZuX3gob2xkX2dmbiksICZ0LCAmYSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAyTV9BTExPQywgJnBhZ2Vfb3JkZXIs
IDApOwotCi0gICAgICAgIGlmICggIW1mbl92YWxpZChtZm4pIHx8IHQgIT0gcDJtX3JhbV9ydyAp
Ci0gICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgIGdvdG8gb3V0OwogCi0gICAgICAgIC8q
IElmIHRoaXMgaXMgYSBzdXBlcnBhZ2UsIGNvcHkgdGhhdCBmaXJzdCAqLwotICAgICAgICBpZiAo
IHBhZ2Vfb3JkZXIgIT0gUEFHRV9PUkRFUl80SyApCi0gICAgICAgIHsKLSAgICAgICAgICAgIGdm
bl90IGdmbjsKLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFzazsKKyAgICAvKiBJZiB0aGlz
IGlzIGEgc3VwZXJwYWdlLCBjb3B5IHRoYXQgZmlyc3QgKi8KKyAgICBpZiAoIHBhZ2Vfb3JkZXIg
IT0gUEFHRV9PUkRFUl80SyAmJiBmb3VuZF9pbl9ob3N0cDJtICkKKyAgICB7CisgICAgICAgIGdm
bl90IGdmbjsKKyAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrOwogCi0gICAgICAgICAgICBtYXNr
ID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7Ci0gICAgICAgICAgICBnZm4gPSBfZ2ZuKGdm
bl94KG9sZF9nZm4pICYgbWFzayk7Ci0gICAgICAgICAgICBtZm4gPSBfbWZuKG1mbl94KG1mbikg
JiBtYXNrKTsKKyAgICAgICAgbWFzayA9IH4oKDFVTCA8PCBwYWdlX29yZGVyKSAtIDEpOworICAg
ICAgICBnZm4gPSBfZ2ZuKGdmbl94KG9sZF9nZm4pICYgbWFzayk7CisgICAgICAgIG1mbiA9IF9t
Zm4obWZuX3gobWZuKSAmIG1hc2spOwogCi0gICAgICAgICAgICBpZiAoIGFwMm0tPnNldF9lbnRy
eShhcDJtLCBnZm4sIG1mbiwgcGFnZV9vcmRlciwgdCwgYSwgMSkgKQotICAgICAgICAgICAgICAg
IGdvdG8gb3V0OwotICAgICAgICB9CisgICAgICAgIGlmICggYXAybS0+c2V0X2VudHJ5KGFwMm0s
IGdmbiwgbWZuLCBwYWdlX29yZGVyLCB0LCBhLCAxKSApCisgICAgICAgICAgICBnb3RvIG91dDsK
ICAgICB9CiAKLSAgICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgbmV3X2dmbiwgJnQsICZh
LCAwLCBOVUxMLCBOVUxMKTsKKyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2Vzcyhh
cDJtLCBuZXdfZ2ZuLCAmdCwgJmEsICZwYWdlX29yZGVyLCAmZm91bmRfaW5faG9zdHAybSk7CiAK
ICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCi0gICAgICAgIG1mbiA9IGhwMm0tPmdldF9lbnRy
eShocDJtLCBuZXdfZ2ZuLCAmdCwgJmEsIDAsIE5VTEwsIE5VTEwpOwotCi0gICAgLyogTm90ZTog
Y3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRvIGEgc2hhcmVkIGVudHJ5ICovCi0g
ICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgfHwgKHQgIT0gcDJtX3JhbV9ydykgKQogICAgICAgICBn
b3RvIG91dDsKIAogICAgIGlmICggIWFwMm0tPnNldF9lbnRyeShhcDJtLCBvbGRfZ2ZuLCBtZm4s
IFBBR0VfT1JERVJfNEssIHQsIGEsCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3Ay
bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAppbmRleCAyODAxYThjY2NhLi40MjA2OGI0
YWVkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcDJtLmgKQEAgLTQ0OCw2ICs0NDgsMjkgQEAgc3RhdGljIGlubGluZSBtZm5f
dCBfX25vbm51bGwoMykgZ2V0X2dmbl90eXBlKAogICAgIHJldHVybiBnZXRfZ2ZuX3R5cGVfYWNj
ZXNzKHAybV9nZXRfaG9zdHAybShkKSwgZ2ZuLCB0LCAmYSwgcSwgTlVMTCk7CiB9CiAKK3N0YXRp
YyBpbmxpbmUgbWZuX3QgYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nlc3MoCisgICAgc3RydWN0IHAy
bV9kb21haW4gKmFwMm0sIGdmbl90IGdmbiwgcDJtX3R5cGVfdCAqdCwgcDJtX2FjY2Vzc190ICph
LAorICAgIHVuc2lnbmVkIGludCAqcGFnZV9vcmRlciwgYm9vbCAqZm91bmRfaW5faG9zdHAybSkK
K3sKKyAgICBtZm5fdCBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgZ2ZuLCB0LCBhLCAwLCBO
VUxMLCBOVUxMKTsKKworICAgICpmb3VuZF9pbl9ob3N0cDJtID0gZmFsc2U7CisKKyAgICAvKiBD
aGVjayBob3N0IHAybSBpZiBubyB2YWxpZCBlbnRyeSBpbiBhbHRlcm5hdGUgKi8KKyAgICBpZiAo
ICFtZm5fdmFsaWQobWZuKSApCisgICAgeworICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlwZV9h
Y2Nlc3MocDJtX2dldF9ob3N0cDJtKGFwMm0tPmRvbWFpbiksIGdmbl94KGdmbiksIHQsIGEsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFS
RSwgcGFnZV9vcmRlciwgZmFsc2UpOworICAgICAgICAqZm91bmRfaW5faG9zdHAybSA9IHRydWU7
CisKKyAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRv
IGEgc2hhcmVkIGVudHJ5ICovCisgICAgICAgIGlmICggIW1mbl92YWxpZChtZm4pIHx8ICp0ICE9
IHAybV9yYW1fcncgKQorICAgICAgICAgICAgcmV0dXJuIElOVkFMSURfTUZOOworICAgIH0KKwor
ICAgIHJldHVybiBtZm47Cit9CisKIC8qIFN5bnRhY3RpYyBzdWdhcjogbW9zdCBjYWxsZXJzIHdp
bGwgdXNlIG9uZSBvZiB0aGVzZS4gKi8KICNkZWZpbmUgZ2V0X2dmbihkLCBnLCB0KSAgICAgICAg
IGdldF9nZm5fdHlwZSgoZCksIChnKSwgKHQpLCBQMk1fQUxMT0MpCiAjZGVmaW5lIGdldF9nZm5f
cXVlcnkoZCwgZywgdCkgICBnZXRfZ2ZuX3R5cGUoKGQpLCAoZyksICh0KSwgMCkKLS0gCjIuMTcu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
