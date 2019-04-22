Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CF4C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 17:43:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714602077C
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 17:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="KCoo+aDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 714602077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIcxh-0002kw-88; Mon, 22 Apr 2019 17:42:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIcxg-0002kr-2P
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 17:42:36 +0000
X-Inumbo-ID: 0240b6ba-6526-11e9-92d7-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::62e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0240b6ba-6526-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEi977RQxcGcM3wkRtsG5Ob6XjDISgnguOAZsNvT6Yc=;
 b=KCoo+aDGn1kbE68p56K8hlT0AOH/iMuEMzRmgfcIqRbST9I7v5uct+AJbLvfxmJQVPAfmsApMcBt+C5x5+vjhGNmQO0irimq0KWJ0syClsmC3mBRnsQvqA+eKmhxbGgAchkVsMWORAnxAaLwx+XFgcn1yPx6PFGUqwAj8osfkAM=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB4130.eurprd08.prod.outlook.com (20.178.202.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Mon, 22 Apr 2019 17:42:31 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1813.017; Mon, 22 Apr 2019
 17:42:31 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping to handle
 cacheability
Thread-Index: AQHU9wZz+HgZhgE19k2J6rhtdnM7bKZG7g4AgAGHAgCAAAJmgA==
Date: Mon, 22 Apr 2019 17:42:31 +0000
Message-ID: <f39ac80e-2074-35d8-aaa6-7135657ee226@arm.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <c3716c11-6d87-4f2d-25d7-3d83537a9ca7@arm.com>
 <alpine.DEB.2.10.1904191618390.1370@sstabellini-ThinkPad-X260>
 <aad78004-8aec-edc3-13b6-20baff39c9e5@arm.com>
 <alpine.DEB.2.10.1904221030440.1370@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1904221030440.1370@sstabellini-ThinkPad-X260>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:4:b7::26) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.100.41.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7df0501a-fea2-4b22-c40b-08d6c749e552
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB4130; 
x-ms-traffictypediagnostic: AM0PR08MB4130:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB413058DF31A371D38E32090580220@AM0PR08MB4130.eurprd08.prod.outlook.com>
x-forefront-prvs: 00159D1518
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(39860400002)(346002)(136003)(366004)(396003)(52314003)(189003)(199004)(476003)(186003)(53936002)(2616005)(6246003)(11346002)(3846002)(386003)(102836004)(25786009)(8676002)(53546011)(68736007)(446003)(6512007)(97736004)(6116002)(5660300002)(36756003)(486006)(81156014)(6506007)(6486002)(316002)(81166006)(66066001)(71190400001)(52116002)(86362001)(54906003)(71200400001)(64756008)(8936002)(31686004)(4326008)(66946007)(66446008)(66476007)(66556008)(99286004)(229853002)(6436002)(6916009)(73956011)(478600001)(72206003)(26005)(2906002)(93886005)(256004)(76176011)(44832011)(7736002)(31696002)(14454004)(305945005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4130;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CfK7gP0C2PqeUS9UrA9Rg/OQyxesW583UAD/InBaxF/9oyTvL8Dzh9MFOpvXNCCCwJBdqjQu1EcTg2H06ipy8lmuKH8ATVxmNVRiFvF9pWco+8levWkBX3S3g2zpBEpt+UDUpRvqu/Z16Kfm4zXu46Q8Hi0ABLOmkkI0FExvp42VQzQyW2fgdJW9R5R834qMAFC3QiWYj8oh/CpaARcCugFXHvfhgWXgHeIyG2eanTgyvfP7CCFaVFUQ4Eeuy+IRgYRQRBsSm6YXRnghmmAESmz7M6QhSI0ytVm4qtpNB4eYKi5ZbVQ2yp9w8u8YlVKUhXCYnBfP4iTqOkI7UydboYuMTGAgsEJzhqaK8rkQ9BA01Hsb94vGydVYK3sVGb7pZiTAu+lYT29ovHOITon5uWlV1aO58rrQziD+RQfUq78=
Content-ID: <37C6A1360626564991C3CA52882FA4DD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df0501a-fea2-4b22-c40b-08d6c749e552
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2019 17:42:31.6212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4130
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422174231.lHibX09mzPkxMq1kYhLEZhl-PhLAv4ygFQk15L2d4fU@z>

SGksDQoNCk9uIDIyLzA0LzIwMTkgMTg6MzMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gU3VuLCAyMSBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gSGkgU3RlZmFubywN
Cj4+DQo+PiBPbiA0LzIwLzE5IDEyOjIwIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+
Pj4gT24gV2VkLCAyNyBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPj4+Pj4gaW5k
ZXggMzBjZmIwMS4uNWI4ZmNjNSAxMDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0u
Yw0KPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3AybS5jDQo+Pj4+PiBAQCAtMTA2OCw5ICsxMDY4
LDI0IEBAIGludCB1bm1hcF9yZWdpb25zX3AybXQoc3RydWN0IGRvbWFpbiAqZCwNCj4+Pj4+ICAg
ICBpbnQgbWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGdmbl90IHN0YXJ0X2dmbiwNCj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIG5yLA0KPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIG1m
bl90IG1mbikNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4sDQo+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgY2FjaGVfcG9saWN5KQ0KPj4+Pg0KPj4+PiBS
YXRoZXIgdGhhbiBleHRlbmRpbmcgbWFwX21taW9fcmVnaW9ucywgSSB3b3VsZCBwcmVmZXIgaWYg
d2Uga2lsbCB0aGlzDQo+Pj4+IGZ1bmN0aW9uIChhbmQgdW5tYXBfbW1pb19tbWlvX3JlZ2lvbnMp
IGFuZCBpbnN0ZWFkIHVzZSBtYXBfcmVnaW9uc19wMm10Lg0KPj4+Pg0KPj4+PiBUaGlzIG1lYW5z
IHRoZSBjb252ZXJzYXRpb24gdG8gcDJtdCBzaG91bGQgYmUgZG9uZSBpbiB0aGUgRE9NQ1RMIGhh
bmRsaW5nLg0KPj4+DQo+Pj4gbWFwX3JlZ2lvbnNfcDJtdCBpcyBhbiBhcm0gc3BlY2lmaWMgZnVu
Y3Rpb24uIG1hcF9tbWlvX3JlZ2lvbnMgaXMgdGhlDQo+Pj4gY29tbW9uIGZ1bmN0aW9uIGFjcm9z
cyB4ODYgYW5kIGFybSwgY2FsbGVkIGZyb20gY29tbW9uIGNvZGUuDQo+Pg0KPj4gSSByZWFsbHkg
ZGlzbGlrZSB0aGUgaWRlYSB0byBoYXZlIHR3byBmdW5jdGlvbnMgZG9pbmcgZXhhY3RseSB0aGUg
c2FtZSBidXQNCj4+IGhhdmUgZGlmZmVyZW50IHBhcmFtZXRlcnMuDQo+IA0KPiBJbiBhbGwgZmFp
cm5lc3MsIGl0IHdhcyBhbHJlYWR5IHRoZSBjYXNlIGJlZm9yZSB0aGlzIHBhdGNoIHNlcmllczoN
Cg0KTm90IHJlYWxseS4uLg0KDQo+IA0KPiAgIGludCBtYXBfbW1pb19yZWdpb25zKHN0cnVjdCBk
b21haW4gKmQsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3Qgc3RhcnRfZ2ZuLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnIsDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgbWZuX3QgbWZuKTsNCg0KLi4uIHRoaXMgb25lIGFsd2F5cyBtYXAgd2l0aCBwMm1f
bW1pb19kZXYgLi4uDQoNCj4gICBpbnQgbWFwX3JlZ2lvbnNfcDJtdChzdHJ1Y3QgZG9tYWluICpk
LA0KPiAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIG5yLA0KPiAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90
IG1mbiwNCj4gICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQpOw0KDQouLi4g
dGhpcyBvbmUgYWxsb3cgeW91IHRvIGNvbmZpZ3VyZSB0aGUgcDJtIHR5cGUuDQoNCkFueXdheSwg
SSB3YXNuJ3QgYWxyZWFkeSBoYXBweSB3aXRoIHRoYXQuIE5vdywgeW91IGhhdmUgdHdvIGZ1bmN0
aW9ucyANCnRoYXQgd2lsbCBhbGxvdyB5b3UgdG8gY29uZmlndXJlIGl0LiBIb3cgZG9lcyBhIHVz
ZXIga25vdyB3aGljaCBvbmUgdG8gdXNlPw0KDQo+IA0KPj4gSWYgbWFwX3JlZ2lvbnNfcDJtdCBj
YW4ndCBiZSB1c2VkIGluIHRoZSBjb21tb24gY29kZSwgdGhlbiBJIHdvdWxkIGxpa2UgdGhhdA0K
Pj4gbWFwX21taW9fcmVnaW9ucyB0byBiZSByZW5hbWVkIHRvIGFyY2hfZG9tY3RsX21hcF9tbWlv
X3JlZ2lvbnMgKG9yIHNvbWV0aGluZw0KPj4gc2ltaWxhcikuIFNvIGl0IGlzIHByZXR0eSBjbGVh
ciBpdCBzaG91bGQgYmUgbm90IHVzZWQgaW4gb3RoZXIgcGxhY2VzLg0KPj4NCj4+IEFsbCB0aGUg
b3RoZXIgY2FsbGVycyBvZiBtYXBfbW1pb19yZWdpb25zIHNob3VsZCBiZSByZXBsYWNlZCB3aXRo
DQo+PiBtYXBfcmVnaW9uc19wMm10Lg0KPiANCj4gRWl0aGVyIHdheSB3b3JrcywgYnV0IEkgd291
bGQgbGlrZSBhbiBhZ3JlZW1lbnQgd2l0aCB0aGUgeDg2IG1haW50YWluZXJzDQo+IGJlZm9yZSBJ
IG1ha2UgYW55IGNoYW5nZXMgdG8gdGhlIGNvbW1vbiBpbnRlcmZhY2UuDQoNCkp1c3QgdG8gYmUg
Y2xlYXIsIHRoZSBzdWdnZXN0ZWQgaW50ZXJmYWNlIGFzIGl0IHN0YW5kcyBmb3IgQXJtIGlzIGEg
DQpuby1nby4gSSBkb24ndCB3YW50IHRvIHR1cm4gYSBiYWQgaW50ZXJmYWNlIHRvIG9uZSB0aGF0
IGlzIHdvcnN0IGFuZCANCm1vcmUgY29uZnVzaW5nLg0KDQpDaGVlcnMsDQoNCi0tIA0KSnVsaWVu
IEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
