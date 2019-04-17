Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0114EC10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 07:15:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B453C20821
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 07:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="Sa1rRBDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B453C20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGeml-0007ih-SS; Wed, 17 Apr 2019 07:15:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HOhf=ST=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hGemk-0007ic-Gs
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 07:15:10 +0000
X-Inumbo-ID: 87c9173b-60e0-11e9-92d7-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::712])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 87c9173b-60e0-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqXJM3l4j7DulVk2xRte9RI40IWkXoSBkiil6JfFTRc=;
 b=Sa1rRBDELbKeLj5pCCGByIkSvNxxo3C9H5NGQbeU6Sg5wr6qmKOSEBofTV7GXtpMd783FRALP1Wi1ZjYTbmNQYP9SHYfhUIHDY+KCKwfMTWh5Ca6zJksVDnz17CTCB/0IdT4yutthRGQzq9QKZ1pF8ldwq/yuUCOCr1/ABCmoVQ=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1SPR00MB249.eurprd02.prod.outlook.com (10.168.68.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Wed, 17 Apr 2019 07:15:05 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::8957:73b5:ea4e:f726]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::8957:73b5:ea4e:f726%10]) with mapi id 15.20.1792.018; Wed, 17 Apr
 2019 07:15:05 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, Tamas K Lengyel
 <tamas@tklengyel.com>
Thread-Topic: [PATCH v5] x86/altp2m: Aggregate get entry and populate into
 common funcs
Thread-Index: AQHU9DDH6oc5DJYpnEKtehvBZ5FEHaY+zLkAgAAEpYCAAAT/AIAADY6AgAEOPwA=
Date: Wed, 17 Apr 2019 07:15:04 +0000
Message-ID: <b7a54c3c-d3d1-2ed5-0ee2-bea2933d1876@bitdefender.com>
References: <20190416084531.5084-1-aisaila@bitdefender.com>
 <CABfawhncF-r0ZYwd-V9D4UkpmqA22+kca5YTeuMVHm2A4xSCOg@mail.gmail.com>
 <51aac97d-3773-f3df-204d-55912f5915db@citrix.com>
 <CABfawhmsbH_9zByK6XoZfVT2BCVf73Wv9PrXbHMm-eXUqKnjxA@mail.gmail.com>
 <d0f438e1-fe1e-dd44-bcdb-f77c5949c7de@citrix.com>
In-Reply-To: <d0f438e1-fe1e-dd44-bcdb-f77c5949c7de@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P193CA0039.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::16) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1b04903-5122-4719-e51d-08d6c30469f1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1SPR00MB249; 
x-ms-traffictypediagnostic: VI1SPR00MB249:|VI1SPR00MB249:
x-microsoft-antispam-prvs: <VI1SPR00MB2496427FC13374BECA7C31AAB250@VI1SPR00MB249.eurprd02.prod.outlook.com>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(376002)(396003)(199004)(189003)(6512007)(5660300002)(6486002)(6436002)(2616005)(97736004)(476003)(446003)(6246003)(11346002)(186003)(71190400001)(478600001)(31686004)(71200400001)(14454004)(102836004)(4326008)(53936002)(386003)(6506007)(53546011)(26005)(66066001)(486006)(229853002)(93886005)(31696002)(8936002)(106356001)(110136005)(2906002)(36756003)(316002)(76176011)(86362001)(99286004)(3846002)(68736007)(105586002)(52116002)(54906003)(14444005)(7736002)(256004)(8676002)(305945005)(6116002)(25786009)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1SPR00MB249;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C/nm1a5yFdcx/ImR7qB1xAjyVOhuNbBKrRykuIVztdox+hFXUBujocjx0j77oQNL2C9BTphcabRntXgbuQzA48tUTJ6IUhU3ThIjei0JqKjZsDffKZ9VmjjH3xr75+UU4IBqsf0QIfTYRqX5WHi9Rh2jgRL3Px+x1MDAtj4FZjyXT7ST/7EFwgZIvJblw4A+goIk70yGp+mFrV29t43hJBPDqZuC1Spj8LRB6JtlSamL2gZHl1+39eSqiFM8M2wzIgx5sDbwi9xdnAyqkTaEPdGTFmtk7C0TFrOTi44RnJtS+L2bs6Esx304Ln1qqvtuw+HAwr2qTfRCkBRex858Tj4D5Mq9H4iDD/d94h4wFglc7ygMx+eaGA5drnENzrue6EWbYafyXwPZfJknJHsZTCB7/tasyfnPun56cifNQAQ=
Content-ID: <D55DB2D33EFA5142A5A8FDE83328C6FF@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b04903-5122-4719-e51d-08d6c30469f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 07:15:04.9824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR00MB249
Subject: Re: [Xen-devel] [PATCH v5] x86/altp2m: Aggregate get entry and
 populate into common funcs
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
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417071504.x17zov1Iu_Rb5YIgL9IWtEScrlu8gymjNI3bwxsa5rc@z>

DQoNCk9uIDE2LjA0LjIwMTkgMTg6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDQvMTYv
MTkgMzoxOSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4gT24gVHVlLCBBcHIgMTYsIDIw
MTkgYXQgODowMiBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdy
b3RlOg0KPj4+DQo+Pj4gT24gNC8xNi8xOSAyOjQ0IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
DQo+Pj4+IE9uIFR1ZSwgQXByIDE2LCAyMDE5IGF0IDI6NDUgQU0gQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEENCj4+Pj4gPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+Pj4+DQo+Pj4+
PiBUaGUgY29kZSBmb3IgZ2V0dGluZyB0aGUgZW50cnkgYW5kIHRoZW4gcG9wdWxhdGluZyB3YXMg
cmVwZWF0ZWQgaW4NCj4+Pj4+IHAybV9jaGFuZ2VfYWx0cDJtX2dmbigpIGFuZCBpbiBwMm1fc2V0
X2FsdHAybV9tZW1fYWNjZXNzKCkuDQo+Pj4+Pg0KPj4+Pj4gVGhlIGNvZGUgaXMgbm93IGluIG9u
ZSBwbGFjZSB3aXRoIGEgYm9vbCBwYXJhbSB0aGF0IGxldHMgdGhlIGNhbGxlciBjaG9vc2UNCj4+
Pj4+IGlmIGl0IHBvcHVsYXRlcyBhZnRlciBnZXRfZW50cnkoKS4NCj4+Pj4+DQo+Pj4+PiBJZiBy
ZW1hcHBpbmcgaXMgYmVpbmcgZG9uZSB0aGVuIGJvdGggdGhlIG9sZCBhbmQgbmV3IGdmbidzIHNo
b3VsZCBiZQ0KPj4+Pj4gdW5zaGFyZWQgaW4gdGhlIGhvc3RwMm0gZm9yIGtlZXBpbmcgdGhpbmdz
IGNvbnNpc3RlbnQuIFRoZSBwYWdlIHR5cGUNCj4+Pj4+IG9mIG9sZF9nZm4gd2FzIGFscmVhZHkg
Y2hlY2tlZCB3aGV0aGVyIGl0J3MgcDJtX3JhbV9ydyBhbmQgYmFpbCBpZiBpdA0KPj4+Pj4gd2Fz
bid0IHNvIGZ1bmN0aW9uYWxpdHktd2lzZSB0aGlzIGp1c3Qgc2ltcGxpZmllcyB0aGluZ3MgYXMg
YSB1c2VyDQo+Pj4+PiBkb2Vzbid0IGhhdmUgdG8gcmVxdWVzdCB1bnNoYXJpbmcgbWFudWFsbHkg
YmVmb3JlIHJlbWFwcGluZy4NCj4+Pj4+IE5vdywgaWYgdGhlIG5ld19nZm4gaXMgaW52YWxpZCBp
dCBzaG91bGRuJ3QgcXVlcnkgdGhlIGhvc3RwMm0gYXMNCj4+Pj4+IHRoYXQgaXMgZWZmZWN0aXZl
bHkgYSByZXF1ZXN0IHRvIHJlbW92ZSB0aGUgZW50cnkgZnJvbSB0aGUgYWx0cDJtLg0KPj4+Pj4g
QnV0IHByb3ZpZGVkIHRoYXQgc2NlbmFyaW8gaXMgdXNlZCBvbmx5IHdoZW4gcmVtb3ZpbmcgZW50
cmllcyB0aGF0DQo+Pj4+PiB3ZXJlIHByZXZpb3VzbHkgcmVtYXBwZWQvY29waWVkIHRvIHRoZSBh
bHRwMm0sIHRob3NlIGVudHJpZXMgYWxyZWFkeQ0KPj4+Pj4gd2VudCB0aHJvdWdoIFAyTV9BTExP
QyB8IFAyTV9VTlNIQVJFIGJlZm9yZSwgc28gaXQgd29uJ3QgaGF2ZSBhbg0KPj4+Pj4gYWZmZWN0
IHNvIHRoZSBjb3JlIGZ1bmN0aW9uIGdldF9hbHRwMm1fZW50cnkoKSBpcyBjYWxsaW5nDQo+Pj4+
PiBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSB3aXRoIFAyTV9BTExPQyB8IFAyTV9VTlNIQVJFLg0K
Pj4+Pj4NCj4+Pj4+IGFsdHAybV9nZXRfZW50cnlfZGlyZWN0KCkgaXMgYWxzbyBjYWxsZWQgaW4g
cDJtX3NldF9zdXBwcmVzc192ZSgpDQo+Pj4+PiBiZWNhdXNlIG9uIGEgbmV3IGFsdHAybSB2aWV3
IHRoZSBmdW5jdGlvbiB3aWxsIGZhaWwgd2l0aCBpbnZhbGlkIG1mbiBpZg0KPj4+Pj4gcDJtLT5z
ZXRfZW50cnkoKSB3YXMgbm90IGNhbGxlZCBiZWZvcmUuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQo+
Pj4+PiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
Pg0KPj4+Pj4NCj4+Pj4+IC0tLQ0KPj4+Pj4gQ2hhbmdlcyBzaW5jZSBWNDoNCj4+Pj4+ICAgICAg
ICAgIC0gQWRkIGFsdHAybSB0byBwYXRjaCBuYW1lDQo+Pj4+PiAgICAgICAgICAtIENoYW5nZSBm
dW5jIG5hbWUgZnJvbSBnZXRfYWx0cDJtX2VudHJ5KCkgdG8NCj4+Pj4+IGFsdHAybV9nZXRfZW50
cnkoKS4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICB4ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIHwg
MzAgKystLS0tLS0tLS0tLQ0KPj4+Pj4gICB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgIHwg
ODQgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+Pj4+PiAgIHhlbi9pbmNs
dWRlL2FzbS14ODYvcDJtLmggICAgfCAxNyArKysrKysrKw0KPj4+Pj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDY2IGluc2VydGlvbnMoKyksIDY1IGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYw0KPj4+Pj4gaW5kZXggYTE0NGJiMGNlNC4uZGRmZTAxNjljMCAxMDA2NDQNCj4+
Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+Pj4+IEBAIC0yNjIsMzUgKzI2MiwxMSBAQCBpbnQg
cDJtX3NldF9hbHRwMm1fbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2Rv
bWFpbiAqaHAybSwNCj4+Pj4+ICAgICAgIG1mbl90IG1mbjsNCj4+Pj4+ICAgICAgIHAybV90eXBl
X3QgdDsNCj4+Pj4+ICAgICAgIHAybV9hY2Nlc3NfdCBvbGRfYTsNCj4+Pj4+IC0gICAgdW5zaWdu
ZWQgaW50IHBhZ2Vfb3JkZXI7DQo+Pj4+PiAtICAgIHVuc2lnbmVkIGxvbmcgZ2ZuX2wgPSBnZm5f
eChnZm4pOw0KPj4+Pj4gICAgICAgaW50IHJjOw0KPj4+Pj4NCj4+Pj4+IC0gICAgbWZuID0gYXAy
bS0+Z2V0X2VudHJ5KGFwMm0sIGdmbiwgJnQsICZvbGRfYSwgMCwgTlVMTCwgTlVMTCk7DQo+Pj4+
PiAtDQo+Pj4+PiAtICAgIC8qIENoZWNrIGhvc3QgcDJtIGlmIG5vIHZhbGlkIGVudHJ5IGluIGFs
dGVybmF0ZSAqLw0KPj4+Pj4gLSAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApDQo+Pj4+PiAtICAg
IHsNCj4+Pj4+IC0NCj4+Pj4+IC0gICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2Vzcyho
cDJtLCBnZm5fbCwgJnQsICZvbGRfYSwNCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOw0KPj4+
Pj4gLQ0KPj4+Pj4gLSAgICAgICAgcmMgPSAtRVNSQ0g7DQo+Pj4+PiAtICAgICAgICBpZiAoICFt
Zm5fdmFsaWQobWZuKSB8fCB0ICE9IHAybV9yYW1fcncgKQ0KPj4+Pj4gLSAgICAgICAgICAgIHJl
dHVybiByYzsNCj4+Pj4+IC0NCj4+Pj4+IC0gICAgICAgIC8qIElmIHRoaXMgaXMgYSBzdXBlcnBh
Z2UsIGNvcHkgdGhhdCBmaXJzdCAqLw0KPj4+Pj4gLSAgICAgICAgaWYgKCBwYWdlX29yZGVyICE9
IFBBR0VfT1JERVJfNEsgKQ0KPj4+Pj4gLSAgICAgICAgew0KPj4+Pj4gLSAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgbWFzayA9IH4oKDFVTCA8PCBwYWdlX29yZGVyKSAtIDEpOw0KPj4+Pj4gLSAg
ICAgICAgICAgIGdmbl90IGdmbjIgPSBfZ2ZuKGdmbl9sICYgbWFzayk7DQo+Pj4+PiAtICAgICAg
ICAgICAgbWZuX3QgbWZuMiA9IF9tZm4obWZuX3gobWZuKSAmIG1hc2spOw0KPj4+Pj4gLQ0KPj4+
Pj4gLSAgICAgICAgICAgIHJjID0gYXAybS0+c2V0X2VudHJ5KGFwMm0sIGdmbjIsIG1mbjIsIHBh
Z2Vfb3JkZXIsIHQsIG9sZF9hLCAxKTsNCj4+Pj4+IC0gICAgICAgICAgICBpZiAoIHJjICkNCj4+
Pj4+IC0gICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4gLSAgICAgICAgfQ0KPj4+Pj4g
LSAgICB9DQo+Pj4+PiArICAgIHJjID0gYWx0cDJtX2dldF9lbnRyeV9wcmVwb3B1bGF0ZShhcDJt
LCBnZm4sICZtZm4sICZ0LCAmb2xkX2EpOw0KPj4+Pj4gKyAgICBpZiAoIHJjICkNCj4+Pj4+ICsg
ICAgICAgIHJldHVybiByYzsNCj4+Pj4+DQo+Pj4+PiAgICAgICAvKg0KPj4+Pj4gICAgICAgICog
SW5oZXJpdCB0aGUgb2xkIHN1cHByZXNzICNWRSBiaXQgdmFsdWUgaWYgaXQgaXMgYWxyZWFkeSBz
ZXQsIG9yIHNldCBpdA0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPj4+Pj4gaW5kZXggOWU4MWEzMGNjNC4uN2JlZGZkNTkz
YiAxMDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPj4+Pj4gKysrIGIv
eGVuL2FyY2gveDg2L21tL3AybS5jDQo+Pj4+DQo+Pj4+IFdvdWxkbid0IGl0IG1ha2UgbW9yZSBz
ZW5zZSB0byBzdGFydCBhZGRpbmcgbmV3IGFsdHAybSBmdW5jdGlvbnMgdG8NCj4+Pj4gbW0vYWx0
cDJtLmMgaW5zdGVhZD8gUHJvYmFibHkgdGhlIGFsdHAybSBmdW5jdGlvbnMgZnJvbSBtbS9wMm0u
YyBjb3VsZA0KPj4+PiBhbHNvIGJlIHJlbG9jYXRlZCB0aGVyZSBhdCBzb21lIHBvaW50IGluIHRo
ZSBmdXR1cmUuDQo+Pj4+DQo+Pj4+PiBAQCAtNDc4LDYgKzQ3OCw0MyBAQCB2b2lkIHAybV91bmxv
Y2tfYW5kX3RsYl9mbHVzaChzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQ0KPj4+Pj4gICAgICAgICAg
IG1tX3dyaXRlX3VubG9jaygmcDJtLT5sb2NrKTsNCj4+Pj4+ICAgfQ0KPj4+Pj4NCj4+Pj4+ICtp
bnQgYWx0cDJtX2dldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwNCj4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgZ2ZuLCBtZm5fdCAqbWZuLCBwMm1fdHlwZV90
ICp0LA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fYWNjZXNzX3QgKmEs
IGJvb2wgcHJlcG9wdWxhdGUpDQo+Pj4+PiArew0KPj4+Pj4gKyAgICAqbWZuID0gYXAybS0+Z2V0
X2VudHJ5KGFwMm0sIGdmbiwgdCwgYSwgMCwgTlVMTCwgTlVMTCk7DQo+Pj4+PiArDQo+Pj4+PiAr
ICAgIC8qIENoZWNrIGhvc3QgcDJtIGlmIG5vIHZhbGlkIGVudHJ5IGluIGFsdGVybmF0ZSAqLw0K
Pj4+Pj4gKyAgICBpZiAoICFtZm5fdmFsaWQoKm1mbikgJiYgIXAybV9pc19ob3N0cDJtKGFwMm0p
ICkNCj4+Pj4+ICsgICAgew0KPj4+Pj4gKyAgICAgICAgc3RydWN0IHAybV9kb21haW4gKmhwMm0g
PSBwMm1fZ2V0X2hvc3RwMm0oYXAybS0+ZG9tYWluKTsNCj4+Pj4+ICsgICAgICAgIHVuc2lnbmVk
IGludCBwYWdlX29yZGVyOw0KPj4+Pj4gKyAgICAgICAgaW50IHJjOw0KPj4+Pj4gKw0KPj4+Pj4g
KyAgICAgICAgKm1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhocDJtLCBnZm5feChnZm4pLCB0
LCBhLA0KPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxM
T0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOw0KPj4+Pg0KPj4+PiBTbyBkZXNwaXRl
IHRoZSBuYW1lIGJlaW5nIGFsdHAybV9nZXRfZW50cnkgeW91IG5vdyByZXR1cm4gYW4gZW50cnkN
Cj4+Pj4gZnJvbSB0aGUgaG9zdHAybSwgZXZlbiBpZiBwcmVwb3B1bGF0ZSBpcyBmYWxzZS4gSWYg
dGhlIGNhbGxlciBrbm93cyBpdA0KPj4+PiBkb2Vzbid0IHdhbnQgdGhhdCBlbnRyeSB0byBiZSBj
b3BpZWQgaW50byB0aGUgYWx0cDJtLCB3aHkgbm90IGhhdmUgaXQNCj4+Pj4gY2FsbCBfX2dldF9n
Zm5fdHlwZV9hY2Nlc3MgaXRzZWxmIGZvciB0aGUgaG9zdHAybT8gSU1ITyB0aGlzIGlzIGp1c3QN
Cj4+Pj4gY29uZnVzaW5nIGFuZCBkb2Vzbid0IGhlbHAgcmVhZGFiaWxpdHkgb2YgdGhlIGFsdHAy
bSBjb2RlLg0KPj4+DQo+Pj4gWW91IHJldHVybiB0aGUgYXAybSBlbnRyeSBpZiBpdCdzIHByZXNl
bnQsIG9yIHRoZSBocDJtIGVudHJ5IGlmIGl0J3MNCj4+PiBub3QuICBJdCdzIG5vdCBhIGxvdCBv
ZiBkdXBsaWNhdGlvbiwgYnV0IGl0IG1ha2VzIHRoZSBsb2dpYyBjbGVhbmVyIEkNCj4+PiB0aGlu
azsgd2h5IG5vdCBkZWR1cGxpY2F0ZSBpdD8NCj4+DQo+PiBJIGhhdmUgbm8gcHJvYmxlbSB3aXRo
IG1ha2luZyB0aGUgY29kZSBtb3JlIHN0cmVhbWxpbmVkLiBUaGUgcHJvYmxlbSBJDQo+PiBoYXZl
IGlzIHRoYXQgdGhlIGZ1bmN0aW9uJ3MgbmFtZSBkb2Vzbid0IHN1Z2dlc3QgaXQgd291bGQgZ2V0
IHlvdQ0KPj4gYW55dGhpbmcgYnV0IHRoZSBlbnRyeSBmcm9tIHRoZSBzcGVjaWZpZWQgYWx0cDJt
LiBTbyB5b3UgY291bGQgYmUNCj4+IHJlYWRpbmcgdGhlIGNvZGUgYXNzdW1pbmcgeW91IGFyZSBk
ZWFsaW5nIHdpdGggYW4gZW50cnkgZnJvbSB0aGF0DQo+PiBzcGVjaWZpZWQgdGFibGUgd2hlbiBp
biBmYWN0IHlvdSBhcmUgbm90LiBUaGF0IGlzIG5vdCBhbiBleHBlY3RlZA0KPj4gYmVoYXZpb3Ig
YmFzZWQgb24ganVzdCB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24uIFRoaXMgaXMgZ29pbmcgdG8g
bWFrZQ0KPj4gcmVhZGluZyB0aGUgYWx0cDJtIGNvZGUgdGhhdCBtdWNoIGhhcmRlciBpbiB0aGUg
ZnV0dXJlLg0KPiANCj4gUmlnaHQgLS0gSSB3YXNuJ3QgYSBodWdlIGZhbiBvZiAnZGlyZWN0JyBl
aXRoZXI7IGl0IGRpZG4ndCByZWFsbHkgY29udmV5DQo+IHRvIG1lIDEwMCUgd2hhdCB0aGUgZnVu
Y3Rpb24gZGlkLiAgTXkgUG9DIGhhZCAic2VldGhyb3VnaCIsIGJ1dCB0aGF0DQo+IHdhc24ndCB0
aGF0IGdyZWF0IGVpdGhlci4gICJQZWVrIj8gIEFueSBvdGhlciBzdWdnZXN0aW9ucz8NCj4gDQo+
IE90aGVyIG9wdGlvbnM6DQo+IA0KPiAqIElmIHdlIGhhdmUgYSBzaW5nbGUgZnVuY3Rpb24gd2l0
aCBhICNkZWZpbmUsIHRoaXMgbWlnaHQgZ2V0IGEgYml0DQo+IGVhc2llcjsgIHdlIGNvdWxkIGhh
dmUgb25lIGJlIEFQMk1HRVRfZG9udF9wcmVwb3B1bGF0ZSBvciBzb21ldGhpbmcuDQo+IA0KPiAo
IFdlIGNvdWxkIGhhdmUgdGhlICJjb3JlIiBmdW5jdGlvbiBuYW1lZCBfYWx0cDJtX2dldF9lbnRy
eSwgYW5kIGhhdmUNCj4gYWx0cDJtX2dldF9lbnRyeSgpIGNhbGwgd2l0aCBwcmVwb3B1bGF0ZSA9
IGZhbHNlLCBhbmQNCj4gYWx0cDJtX2dldF9lbnRyeV9wcmVwb3B1bGF0ZSgpIGNhbGwgaXQgd2l0
aCBwcmVwb3B1bGF0ZSA9IHRydWUuDQoNClRoaXMgb3B0aW9uIHdpdGggbm8gZGVmaW5lcyBzZWVt
cyB0byBzb2x2ZSBtb3JlIG9mIHRoZSBuYW1pbmcgcHJvYmxlbXMgDQpidXQgaXQgd2lsbCBzdGls
bCBpbnRyb2R1Y2UgdGhlIHNwYWdoZXR0aSBjb2RlLiBJIHZvdGUgZm9yIHRoaXMgb25lIGFuZCAN
CmlmIFRhbWFzIGFncmVlcyBJIHdpbGwgaGF2ZSBpdCB0aGlzIHdheSBpbiB0aGUgbmV4dCB2ZXJz
aW9uLg0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
