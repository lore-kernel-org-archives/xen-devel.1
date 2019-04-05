Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D5C10F00
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:26:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5F321855
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="H3MHYXD9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5F321855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCOqp-0001hB-AO; Fri, 05 Apr 2019 13:25:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xMyJ=SH=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hCOqn-0001gr-ED
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:25:45 +0000
X-Inumbo-ID: 4fdf2cc2-57a6-11e9-92d7-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::712])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4fdf2cc2-57a6-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8tI1W4r1pG/1D39xfwpMfTbT6SxUJSH5WdhZXluYwo=;
 b=H3MHYXD90D9cUiytATBkT/eJ5Vl0BVnEeoCWTvMK0JLQueBFk1vME+GAmrBwkb1NYahxk8/g+NevL/2S3vKeUtqODtZ6IyjwCoKgnAUAgsVeTrrEecH0h8kESxziKxvma1EJ+sTcUq1dplNUy6BCmPuKe2jC+QX1nw6x/AYRCYI=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3280.eurprd02.prod.outlook.com (52.134.15.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Fri, 5 Apr 2019 13:25:41 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 13:25:41 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/3] x86/mm: Introduce altp2m_set_entry_by_page_order
Thread-Index: AQHU67MQbz1qF5J0RU2Towq8lOMqBQ==
Date: Fri, 5 Apr 2019 13:25:40 +0000
Message-ID: <20190405132521.6630-2-aisaila@bitdefender.com>
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
x-ms-office365-filtering-correlation-id: 186d4c29-b3e3-47ec-26a2-08d6b9ca32d5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3280; 
x-ms-traffictypediagnostic: VI1PR0202MB3280:|VI1PR0202MB3280:
x-microsoft-antispam-prvs: <VI1PR0202MB3280131F33D1AAE7964E6ADBAB510@VI1PR0202MB3280.eurprd02.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(68736007)(6486002)(316002)(71200400001)(71190400001)(4326008)(106356001)(105586002)(97736004)(2351001)(54906003)(478600001)(1076003)(81156014)(81166006)(53936002)(25786009)(5640700003)(86362001)(6916009)(8936002)(8676002)(2906002)(107886003)(3846002)(6116002)(6512007)(6436002)(14454004)(50226002)(5660300002)(7736002)(305945005)(76176011)(446003)(476003)(11346002)(14444005)(2616005)(386003)(6506007)(26005)(102836004)(2501003)(36756003)(256004)(66066001)(99286004)(52116002)(486006)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3280;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nvm2XfgPmvIA35yYVv0eZhLkjyBAgHo+9PN0NprBao82Q+OHPORAvO9tgM88uZW+2wqRWgWnHT0oEXpmG2BmUGFnxqkZHjRbaGZIUYW4msALqPGMKKJX8KNrrDbvdvavmi2BdC9SAIdFNuAeB66Pxw59sr6fOC0+QcMrwSxx675Q4F2yZumCh6VKG8U+yRKyhex+C2ESwSpcgSgjIexu26PINbjqexb+QlJfqbK8hmxSvR2YKv9iSz37n/dFUTKuRS3eSMsZ/JegVlACfagfQn8f3Oz/bK6zc75yjsXKtrjBIyV3lDlJPUPFFlS7UP/rAx9O7h5h1LL/7FZMna31HFl/XLrKbdEFBmnlpw7o1eUFOjuZHC0qDwnVgoi74uhonH5RPWvbBc5Go+HtoTiSVJlUa0kDifERWewygf8Xe20=
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186d4c29-b3e3-47ec-26a2-08d6b9ca32d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 13:25:40.9638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3280
Subject: [Xen-devel] [PATCH v2 2/3] x86/mm: Introduce
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
Message-ID: <20190405132540.dcUqEfO8VHhbfO0OAUJbQZjGkQnLDNi7pi8UBhX1Opc@z>

VGhpcyBwYXRjaCBtb3ZlcyBjb21tb24gY29kZSBmcm9tIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nl
c3MoKSBhbmQKcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKCkgaW50byBvbmUgZnVuY3Rpb24KClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCAgNyArKy0tLS0tCiB4ZW4vYXJjaC94ODYv
bW0vcDJtLmMgICAgICAgIHwgMTIgKystLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3Ay
bS5oICAgIHwgMTEgKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nl
c3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKaW5kZXggNjA4Zjc0OGE1Ny4uYTI2
NzI3ZGZlZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYworKysgYi94
ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCkBAIC0yNzUsMTEgKzI3NSw4IEBAIGludCBwMm1f
c2V0X2FsdHAybV9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwMm1fZG9tYWlu
ICpocDJtLAogICAgIC8qIElmIHRoaXMgaXMgYSBzdXBlcnBhZ2UsIGNvcHkgdGhhdCBmaXJzdCAq
LwogICAgIGlmICggcGFnZV9vcmRlciAhPSBQQUdFX09SREVSXzRLICYmIGZvdW5kX2luX2hvc3Rw
Mm0gKQogICAgIHsKLSAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vf
b3JkZXIpIC0gMSk7Ci0gICAgICAgIGdmbl90IGdmbjIgPSBfZ2ZuKGdmbl9sICYgbWFzayk7Ci0g
ICAgICAgIG1mbl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsKLQotICAgICAgICBy
YyA9IGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRf
YSwgMSk7CisgICAgICAgIHJjID0gYWx0cDJtX3NldF9lbnRyeV9ieV9wYWdlX29yZGVyKGFwMm0s
IGdmbl9sLCBtZm4sIHBhZ2Vfb3JkZXIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHQsIG9sZF9hKTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICBy
ZXR1cm4gcmM7CiAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVu
L2FyY2gveDg2L21tL3AybS5jCmluZGV4IGIyYTVjMGM0MmUuLjFmODUyNjk0ZmYgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYworKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKQEAg
LTI2NTMsMTcgKzI2NTMsOSBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21h
aW4gKmQsIHVuc2lnbmVkIGludCBpZHgsCiAKICAgICAvKiBJZiB0aGlzIGlzIGEgc3VwZXJwYWdl
LCBjb3B5IHRoYXQgZmlyc3QgKi8KICAgICBpZiAoIHBhZ2Vfb3JkZXIgIT0gUEFHRV9PUkRFUl80
SyAmJiBmb3VuZF9pbl9ob3N0cDJtICkKLSAgICB7Ci0gICAgICAgIGdmbl90IGdmbjsKLSAgICAg
ICAgdW5zaWduZWQgbG9uZyBtYXNrOwotCi0gICAgICAgIG1hc2sgPSB+KCgxVUwgPDwgcGFnZV9v
cmRlcikgLSAxKTsKLSAgICAgICAgZ2ZuID0gX2dmbihnZm5feChvbGRfZ2ZuKSAmIG1hc2spOwot
ICAgICAgICBtZm4gPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsKLQotICAgICAgICBpZiAoIGFw
Mm0tPnNldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgcGFnZV9vcmRlciwgdCwgYSwgMSkgKQorICAg
ICAgICBpZiAoIGFsdHAybV9zZXRfZW50cnlfYnlfcGFnZV9vcmRlcihhcDJtLCBnZm5feChvbGRf
Z2ZuKSwgbWZuLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YWdlX29yZGVyLCB0LCBhKSApCiAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICB9CiAKICAgICBt
Zm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcyhhcDJtLCBuZXdfZ2ZuLCAmdCwgJmEsICZw
YWdlX29yZGVyLCAmZm91bmRfaW5faG9zdHAybSk7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvcDJtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCmluZGV4IDQyMDY4YjRh
ZWQuLjhhYzk0Mjc3NDMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaApAQCAtNDcxLDYgKzQ3MSwxNyBAQCBzdGF0aWMg
aW5saW5lIG1mbl90IGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKAogICAgIHJldHVybiBtZm47
CiB9CiAKK3N0YXRpYyBpbmxpbmUgaW50IGFsdHAybV9zZXRfZW50cnlfYnlfcGFnZV9vcmRlcigK
KyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgdW5zaWduZWQgbG9uZyBnZm4sICBtZm5fdCBt
Zm4sCisgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXIsIHAybV90eXBlX3QgdCwgcDJtX2FjY2Vz
c190IGEpCit7CisgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIp
IC0gMSk7CisgICAgZ2ZuX3QgZ2ZuMiA9IF9nZm4oZ2ZuICYgbWFzayk7CisgICAgbWZuX3QgbWZu
MiA9IF9tZm4obWZuX3gobWZuKSAmIG1hc2spOworCisgICAgcmV0dXJuIGFwMm0tPnNldF9lbnRy
eShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBhLCAxKTsKK30KKwogLyogU3ludGFj
dGljIHN1Z2FyOiBtb3N0IGNhbGxlcnMgd2lsbCB1c2Ugb25lIG9mIHRoZXNlLiAqLwogI2RlZmlu
ZSBnZXRfZ2ZuKGQsIGcsIHQpICAgICAgICAgZ2V0X2dmbl90eXBlKChkKSwgKGcpLCAodCksIFAy
TV9BTExPQykKICNkZWZpbmUgZ2V0X2dmbl9xdWVyeShkLCBnLCB0KSAgIGdldF9nZm5fdHlwZSgo
ZCksIChnKSwgKHQpLCAwKQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
