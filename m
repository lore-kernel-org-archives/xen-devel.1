Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F77C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:59:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67EF2171F
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 10:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="zyQBnB+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67EF2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEttv-000312-TL; Fri, 12 Apr 2019 10:59:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HSnE=SO=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hEttu-00030x-Iz
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 10:59:18 +0000
X-Inumbo-ID: 03e1aed0-5d12-11e9-92d7-bc764e045a96
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::708])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03e1aed0-5d12-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75x/0WZm9Nwhd2kUCr8mu6nXfItX+7JjIb1YnzRfCQY=;
 b=zyQBnB+r5jfGQ3c5q7tHV4je+uyrNYw56j+2KWGpaxB0xUSGUx1liC2H7lGNpGhL+DMn+ReR2PziQCdhh4M3nMHuN5O2MWn4Xi6NonVQF863El5tGXUaLL7KbTx5sh3K+ccvv6LDM0N9QozRnfNuhuiNtrTmuwFFLborxPe2qEo=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3277.eurprd02.prod.outlook.com (52.134.14.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Fri, 12 Apr 2019 10:59:14 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Fri, 12 Apr 2019
 10:59:14 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, George Dunlap
 <george.dunlap@citrix.com>
Thread-Topic: [PATCH v3 1/3] x86/mm: Introduce altp2m_get_gfn_type_access
Thread-Index: AQHU7sxOthwR4rIdkUC4dpiYJsWlRqY1kCIAgAGFnAD//9buAIAACoKAgAFovAA=
Date: Fri, 12 Apr 2019 10:59:13 +0000
Message-ID: <19db8a43-5e2f-72f6-2ffb-d98d03b762c6@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
 <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
 <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
 <CABfawhkn-uSRtNWpSJKxoz0dFcxmDupVhOg1FxYWca9eRx1wTA@mail.gmail.com>
In-Reply-To: <CABfawhkn-uSRtNWpSJKxoz0dFcxmDupVhOg1FxYWca9eRx1wTA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::15) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5892e56-6626-4ac9-ef2f-08d6bf35e5fc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3277; 
x-ms-traffictypediagnostic: VI1PR0202MB3277:|VI1PR0202MB3277:
x-microsoft-antispam-prvs: <VI1PR0202MB327764BBAD06BB1D01DE2311AB280@VI1PR0202MB3277.eurprd02.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(396003)(366004)(346002)(136003)(54534003)(199004)(189003)(52116002)(76176011)(6436002)(71190400001)(31686004)(54906003)(229853002)(6486002)(14454004)(53546011)(102836004)(99286004)(110136005)(316002)(386003)(6506007)(305945005)(81156014)(81166006)(14444005)(256004)(7736002)(31696002)(71200400001)(8676002)(8936002)(2906002)(86362001)(93886005)(97736004)(5024004)(25786009)(26005)(66066001)(6512007)(53936002)(186003)(11346002)(446003)(486006)(476003)(2616005)(4326008)(36756003)(3846002)(6116002)(68736007)(478600001)(106356001)(105586002)(5660300002)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3277;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7JSMTyM9wDUlQsbL1EDVtchG8h3zuheapp4HvCdGAeHLdT8nXAlnFadpZht/MKgWUrf1BvGOqEAnaVe+YDRs6DobndZr9I8hBx0qE6VUDdBo8e0Z/fGnZ8oPrbqubk21AZMBxlzMRLZCyoDybEpp2bNWx96kmzUH1l1500c/xrNwch68J1WI5J/A5jtp1VH+XLnsKqj5PUzEhQJwKO7aRIdGfZ2glgB4d2QblOxoJFMiDY6NlWJVjfBFh09M29quncGKA0tNRPT3HgZwG/+ZOypM9wdZj4xxw3dRrFBh+27zOGXDQbn8Z2M0WE3V/NwCBKEU2mWMz1L3mlMFnOy9mZbpeKNMsUV6RDKffGVLk4lxPTkEPEwlWe0ed8UE6GfXoQyT0S3191XTECtgpbweO3feJvDDkII30eAm7mLxV1g=
Content-ID: <2659D18AB3744443B3F742CBA0AEC7EA@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5892e56-6626-4ac9-ef2f-08d6bf35e5fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 10:59:13.9690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3277
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/mm: Introduce
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
Message-ID: <20190412105913.kr3D8MOGT-ooicFzELrvB4DnJFs3tonZU_wFhVd3J6g@z>

DQoNCk9uIDExLjA0LjIwMTkgMTY6MjgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gVGh1
LCBBcHIgMTEsIDIwMTkgYXQgNjo1MCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIDQvMTEvMTkgMToxNyBQTSwgQWxleGFuZHJ1IFN0
ZWZhbiBJU0FJTEEgd3JvdGU6DQo+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3Ay
bS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jDQo+Pj4+PiBpbmRleCBiOWJiYjhmNDg1Li5kMzhk
N2MyOWNhIDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+Pj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+Pj4+IEBAIC0yNjI2LDYgKzI2MjYsNyBAQCBp
bnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBp
ZHgsDQo+Pj4+PiAgICAgICAgbWZuX3QgbWZuOw0KPj4+Pj4gICAgICAgIHVuc2lnbmVkIGludCBw
YWdlX29yZGVyOw0KPj4+Pj4gICAgICAgIGludCByYyA9IC1FSU5WQUw7DQo+Pj4+PiArICAgIGJv
b2wgY29waWVkX2Zyb21faG9zdHAybTsNCj4+Pj4+DQo+Pj4+PiAgICAgICAgaWYgKCBpZHggPj0g
TUFYX0FMVFAyTSB8fCBkLT5hcmNoLmFsdHAybV9lcHRwW2lkeF0gPT0gbWZuX3goSU5WQUxJRF9N
Rk4pICkNCj4+Pj4+ICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4gQEAgLTI2MzYsNyArMjYz
Nyw3IEBAIGludCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGlkeCwNCj4+Pj4+ICAgICAgICBwMm1fbG9jayhocDJtKTsNCj4+Pj4+ICAgICAgICBw
Mm1fbG9jayhhcDJtKTsNCj4+Pj4+DQo+Pj4+PiAtICAgIG1mbiA9IGFwMm0tPmdldF9lbnRyeShh
cDJtLCBvbGRfZ2ZuLCAmdCwgJmEsIDAsIE5VTEwsIE5VTEwpOw0KPj4+Pj4gKyAgICBtZm4gPSBh
bHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcyhhcDJtLCBvbGRfZ2ZuLCAmdCwgJmEsICZwYWdlX29y
ZGVyLCAmY29waWVkX2Zyb21faG9zdHAybSk7DQo+Pj4+DQo+Pj4+IEJlZm9yZSwgaWYgbmV3X2dm
biB3YXMgSU5WQUxJRF9HRk4sIHRoZW4gdGhlIGhvc3QgcDJtIHdhc24ndCByZWFkIGF0DQo+Pj4+
IGFsbC4gIE5vdywgdGhlIGhvc3RwMm0gd2lsbCBoYXZlIF9fZ2V0X2dmbl90eXBlX2FjY2Vzcygp
IGNhbGxlZCB3aXRoDQo+Pj4+IFAyTV9BTExPQyB8IFAyTV9VTlNIQVJFLiAgSXMgdGhhdCBjaGFu
Z2UgaW50ZW50aW9uYWwsIGFuZCBpZiBzbywgd2h5Pw0KPj4+DQo+Pj4gVGhpcyBoYXMgYmVlbiBy
ZXF1ZXN0ZWQgYnkgVGFtYXMgaW4gdjIuDQo+Pg0KPj4gVGhhdCdzIG5pY2UsIGJ1dCAxKSB5b3Ug
c3RpbGwgaGF2ZW4ndCBhbnN3ZXJlZCB0aGUgcXVlc3Rpb24sIGFuZCAyKSBpdCdzDQo+PiBub3Qg
aW4gdGhlIGNoYW5nZWxvZy4NCj4gDQo+IFdoYXQgSSByZXF1ZXN0ZWQgd2FzIHRoYXQgaWYgcmVt
YXBwaW5nIGlzIGJlaW5nIGRvbmUgdGhlbiBib3RoIHRoZSBvbGQNCj4gYW5kIG5ldyBnZm4ncyBz
aG91bGQgYmUgdW5zaGFyZWQgaW4gdGhlIGhvc3RwMm0gZm9yIGtlZXBpbmcgdGhpbmdzDQo+IGNv
bnNpc3RlbnQuIFRoZSBwYWdlIHR5cGUgb2Ygb2xkX2dmbiB3YXMgYWxyZWFkeSBjaGVja2VkIHdo
ZXRoZXIgaXQncw0KPiBwMm1fcmFtX3J3IGFuZCBiYWlsIGlmIGl0IHdhc24ndCBzbyBmdW5jdGlv
bmFsaXR5LXdpc2UgdGhpcyBqdXN0DQo+IHNpbXBsaWZpZXMgdGhpbmdzIGFzIGEgdXNlciBkb24n
dCBoYXZlIHRvIHJlcXVlc3QgdW5zaGFyaW5nIG1hbnVhbGx5DQo+IGJlZm9yZSByZW1hcHBpbmcu
IE5vdywgaWYgdGhlIG5ld19nZm4gaXMgaW52YWxpZCBpdCBzaG91bGRuJ3QgcXVlcnkNCj4gdGhl
IGhvc3RwMm0gYXMgdGhhdCBpcyBlZmZlY3RpdmVseSBhIHJlcXVlc3QgdG8gcmVtb3ZlIHRoZSBl
bnRyeSBmcm9tDQo+IHRoZSBhbHRwMm0uIEJ1dCBwcm92aWRlZCB0aGF0IHNjZW5hcmlvIGlzIHVz
ZWQgb25seSB3aGVuIHJlbW92aW5nDQo+IGVudHJpZXMgdGhhdCB3ZXJlIHByZXZpb3VzbHkgcmVt
YXBwZWQvY29waWVkIHRvIHRoZSBhbHRwMm0sIHRob3NlDQo+IGVudHJpZXMgYWxyZWFkeSB3ZW50
IHRocm91Z2ggUDJNX0FMTE9DIHwgUDJNX1VOU0hBUkUgYmVmb3JlLCBzbyBpdA0KPiB3b24ndCBo
YXZlIGFuIGFmZmVjdC4gQnV0IGl0J3MgYWxzbyBwb2ludGxlc3MuDQo+IA0KDQpJZiB0aGlzIGhh
cyBiZWVuIGNsZWFyZWQgdGhlcmUgd2FzIG9uZSBtb3JlIHF1ZXN0aW9uLCB3aGVyZSBzaG91bGQg
dGhlIA0KImlmICggIW1mbl92YWxpZCgqbWZuKSB8fCAqdCAhPSBwMm1fcmFtX3J3ICkiIGNoZWNr
IGVuZCB1cCBpbiB0aGUgDQphdHRhY2hlZCBmb3JtIG9mIHRoZSBwYXRjaD8NCg0KVGhhbmtzLA0K
QWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
