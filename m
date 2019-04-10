Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002BEC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:23:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C130D20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:23:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="qZ04er3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C130D20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEE7j-00061a-OJ; Wed, 10 Apr 2019 14:22:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+r/1=SM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hEE7i-00061S-MB
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:22:46 +0000
X-Inumbo-ID: 1b9f27de-5b9c-11e9-92d7-bc764e045a96
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.93]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1b9f27de-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG+Mx5bD/u/vsoYXa8cweCp5WvJdTwcWMLXtIcbm6k4=;
 b=qZ04er3gdB2hTnWSVDW2shcAZd2N+/xMz4cWdt4hyfqiIWy8By6NgQU6xP+SOVe4idr4CpW1OCUYFzeA+fPFGhouUPDVffW4IH7T0xgvWV5HoIizCnZm+REtw3l6InhxiTHlxdMFDpln5kpTG++Hu5Ig7dGM0JHYJnXH6mX6T+s=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3390.eurprd02.prod.outlook.com (52.134.16.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Wed, 10 Apr 2019 14:22:42 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 14:22:42 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 2/3] x86/mm: Introduce altp2m_set_entry_by_page_order
Thread-Index: AQHU7sxQ+KX9XNKHYECIICmH90QLYKY1cuCAgAABPAA=
Date: Wed, 10 Apr 2019 14:22:42 +0000
Message-ID: <97e8f5be-cdf6-01d8-0713-c83dd638ac28@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <20190409120324.13940-2-aisaila@bitdefender.com>
 <0ed3bfad-8c35-2143-0c1d-047492a00f31@citrix.com>
In-Reply-To: <0ed3bfad-8c35-2143-0c1d-047492a00f31@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR0402CA0018.eurprd04.prod.outlook.com
 (2603:10a6:209::31) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 484e20d1-1740-4971-6a7d-08d6bdbffe51
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3390; 
x-ms-traffictypediagnostic: VI1PR0202MB3390:|VI1PR0202MB3390:
x-microsoft-antispam-prvs: <VI1PR0202MB33907994C6AEA44C32F8BE1CAB2E0@VI1PR0202MB3390.eurprd02.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(39860400002)(376002)(346002)(199004)(189003)(5660300002)(486006)(2616005)(476003)(106356001)(6486002)(11346002)(229853002)(105586002)(446003)(2501003)(6436002)(52116002)(8936002)(76176011)(8676002)(86362001)(36756003)(66066001)(2906002)(81166006)(71200400001)(81156014)(68736007)(71190400001)(31696002)(3846002)(53936002)(14454004)(6116002)(6506007)(386003)(97736004)(99286004)(6512007)(6246003)(478600001)(53546011)(102836004)(4326008)(256004)(186003)(305945005)(7736002)(110136005)(14444005)(26005)(316002)(25786009)(54906003)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3390;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tBfaUvcB3hwLwjmmRDQmNvNv6u70vF+LcPNiir2rbrm/dpraTV90qU9e88gfqnb2r2tKDEwkx3tgWceiq+9xj5pcXhDYvTvd7JWx3ZycB/YhZ5Kmd30d+O2fn2rBmhn9Doxcn7sSlGtXYENUAtObeb0/7jNctVWBHY9y0cmEwmGNG7KBflqXCwzYhkAfUcxXQAquq2vR1/RzI4Nclt/HSkosfUSfgFzD0vADTTARldS5EN4xuS+9XEWTeCxe1ta1cu/HumFQE2iQeavKk5gB5nyTl4sgEucqbUm+HMdHoORFUw8uRCI7YJsitB039jHoI6sNne1/Vztt3KfCIM4vr7jr/8Lgn/qy588In/LqWrF3VHEiqFOhpFlPYCCEAQ+vdvKkHKWH5RaMgw2Sqcr4Lndm8mHApFOki/duw9Az3KE=
Content-ID: <AC5EE50A13B0FB4FBF521274A5770AB5@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484e20d1-1740-4971-6a7d-08d6bdbffe51
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 14:22:42.6678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3390
Subject: Re: [Xen-devel] [PATCH v3 2/3] x86/mm: Introduce
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
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142242.6x6K3j-bz-0l6u0FkY5FG2xSBD0zupXXEbIVznjd9zk@z>

DQoNCk9uIDEwLjA0LjIwMTkgMTc6MTgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDQvOS8x
OSAxOjAzIFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IFRoaXMgcGF0Y2gg
bW92ZXMgY29tbW9uIGNvZGUgZnJvbSBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKCkgYW5kDQo+
PiBwMm1fY2hhbmdlX2FsdHAybV9nZm4oKSBpbnRvIG9uZSBmdW5jdGlvbg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPj4g
LS0tDQo+PiAgIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCAgMiArLQ0KPj4gICB4ZW4v
aW5jbHVkZS9hc20teDg2L3AybS5oICAgIHwgMTEgKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2Fj
Y2Vzcy5jDQo+PiBpbmRleCBiZjY3ZGRiMTVhLi42YTIyNTEyNTU1IDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYw0KPj4gQEAgLTI3OSw3ICsyNzksNyBAQCBpbnQgcDJtX3NldF9hbHRwMm1fbWVt
X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSwNCj4+ICAg
ICAgICAgICBnZm5fdCBnZm4yID0gX2dmbihnZm5fbCAmIG1hc2spOw0KPj4gICAgICAgICAgIG1m
bl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsNCj4+ICAgDQo+PiAtICAgICAgICAv
KiBOb3RlOiBjdXJyZW50bHkgaXQgaXMgbm90IHNhZmUgdG8gcmVtYXAgdG8gYSBzaGFyZWQgZW50
cnkgKi8NCj4+ICsJLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRv
IGEgc2hhcmVkIGVudHJ5ICovDQo+PiAgICAgICAgICAgaWYgKCB0ICE9IHAybV9yYW1fcncgKQ0K
Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVTUkNIOw0KPj4gICANCj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaA0KPj4g
aW5kZXggNmRlMTU0NmQ3Ni4uOTBhNmMxMzVhNyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvcDJtLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4+IEBA
IC00NjcsNiArNDY3LDE3IEBAIHN0YXRpYyBpbmxpbmUgbWZuX3QgYWx0cDJtX2dldF9nZm5fdHlw
ZV9hY2Nlc3MoDQo+PiAgICAgICByZXR1cm4gbWZuOw0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRp
YyBpbmxpbmUgaW50IGFsdHAybV9zZXRfZW50cnlfYnlfcGFnZV9vcmRlcigNCj4+ICsgICAgc3Ry
dWN0IHAybV9kb21haW4gKmFwMm0sIHVuc2lnbmVkIGxvbmcgZ2ZuLCAgbWZuX3QgbWZuLA0KPj4g
KyAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwgcDJtX3R5cGVfdCB0LCBwMm1fYWNjZXNzX3Qg
YSkNCj4gDQo+IFRoaXMgZnVuY3Rpb24gZG9lc24ndCBzZWVtIHRvIGJlIGNhbGxlZCBhbnl3aGVy
ZSBpbiB0aGlzIHNlcmllcy4NCg0KWWVzIEkgc2F3IHRoYXQgeWVzdGVyZGF5IGFmdGVyIHNlbmRp
bmcgdGhlIHBhdGNoLiBUaGUgY2FsbCBnb3QgbG9zdCBpbiANCnRoZSAgcmUtYmFzZS9tZXJnZSBw
cm9jZXNzLiBTb3JyeSBhYm91dCB0aGF0LCBpdCB3aWxsIGdvIG9uIGFnYWluIGluIHY0DQoNCkFs
ZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
