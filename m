Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81C0C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:19:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716A220679
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="P3mgjdyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716A220679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJx15-0003Om-OT; Fri, 26 Apr 2019 09:19:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJx14-0003Oh-MS
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:19:34 +0000
X-Inumbo-ID: 665f0911-6804-11e9-843c-bc764e045a96
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::601])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 665f0911-6804-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 09:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39RDDjWaw2272Jl6K/5ZrEFFAYuEHtGQcAgkm8WhS+s=;
 b=P3mgjdyFELIKAFF5MZv4OhMMMerUDAKaL/zsTCrV08oVXGyIENllKAwGrbMcGjRv8GnYQaVKwp1xL+XeB3mkHD0Z3H5cY328YlMqKCtdLmVvwx/geQGzd/v2OQW4vynWJSsXYUBGvYcXUqnQA4BuJjq9WU8zuSdvRM7D+vEuvXA=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3041.eurprd08.prod.outlook.com (52.134.93.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Fri, 26 Apr 2019 09:19:30 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1835.010; Fri, 26 Apr 2019
 09:19:30 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Thread-Topic: [PATCH] xen/arm: skip first page when RAM starts at 0x0
Thread-Index: AQHU+4+V8sBdh/eMtkuHR7Gc/qAr9KZNdRwAgAC0LgCAAAHiAA==
Date: Fri, 26 Apr 2019 09:19:30 +0000
Message-ID: <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
In-Reply-To: <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::22) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9098a86f-866a-48da-0b45-08d6ca2849c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3041; 
x-ms-traffictypediagnostic: AM0PR08MB3041:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3041A8CE322483EBD5AEB7DC803E0@AM0PR08MB3041.eurprd08.prod.outlook.com>
x-forefront-prvs: 001968DD50
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(366004)(376002)(346002)(43544003)(189003)(199004)(68736007)(44832011)(66066001)(6512007)(2616005)(6246003)(6486002)(476003)(508600001)(446003)(2906002)(11346002)(72206003)(486006)(110136005)(316002)(54906003)(14454004)(229853002)(31686004)(102836004)(386003)(6506007)(53546011)(186003)(26005)(71200400001)(71190400001)(5660300002)(97736004)(36756003)(6116002)(256004)(25786009)(81156014)(8676002)(3846002)(76176011)(99286004)(81166006)(4326008)(31696002)(86362001)(52116002)(64756008)(66446008)(66476007)(66556008)(8936002)(53936002)(66946007)(73956011)(305945005)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3041;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xdn4ObOPgScOyLzlQ1s84I+k8pMU/PWlE/2t7Qo73PZfh+fb/Y074xngmauwNRFjoT3LQLJ7hbiKJLKpYG5At8aRFuylys2af/cyIHsfpkx8iPC2KMRMZ0xuwpgQm9ZBFzWdn6VlmoOFTkFVx2tUkuhWPRlfPxnrDIGt5evYi5vg7tSIutFzgYAUmXPRESPGNNwUzbogZJxdhsjEetiAONiglyLpZXuIoFcstHDATiXAYzDTlx9VuXXgreNq9UUtGxxUDz5GCb7ALL8kTMJspVf58hdOBsP4j2zO/XOXG3Pqbo1WUa/kxQWY3QdQcy39yxzAELikxPCFmQyEDpKNv/6PVZ/gaAMbhO9FBAMkXrWT9S/zoyDb1ly+GvvsG0nUVBIdKjb7O5GQAHr2dnQ7pSXEn6RyIkQJ6C8G6Os+IlY=
Content-ID: <F101BB9F90D4A54C8937BAE7CCE6A1EB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9098a86f-866a-48da-0b45-08d6ca2849c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2019 09:19:30.7173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3041
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefanos@xilinx.com>, nd <nd@arm.com>,
 "206497@studenti.unimore.it" <206497@studenti.unimore.it>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426091930.mzzF6rpsBsk0RKseu46wfwDuYHeBH7eKM6n0maa8a6g@z>

SGksDQoNCk9uIDI2LzA0LzIwMTkgMTA6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAy
NS4wNC4xOSBhdCAyMzoyNywgPEp1bGllbi5HcmFsbEBhcm0uY29tPiB3cm90ZToNCj4+IE9uIDI1
LzA0LzIwMTkgMTg6NTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBYZW4gYXNzdW1l
cyB0aGF0IFJBTSBzdGFydHMgYXQgYWRkcmVzc2VzIGdyZWF0ZXIgdGhhbiAweDAgaW4gYSBmZXcN
Cj4+PiBwbGFjZXMuIFRoZSBQRFggY29kZSBpcyBvbmUgb2YgdGhlbSBidXQgdGhlcmUgYXJlIG1v
cmUuDQo+Pg0KPj4gQSBiaXQgbW9yZSBjb250ZXh0IGluIHRoZSBjb21taXQgbWVzc2FnZSB3b3Vs
ZCBoYXZlIGJlZW4gdXNlZnVsLiBJbWFnaW5lDQo+PiBpZiB3ZSBoYXZlIHRvIGxvb2sgYXQgdGhl
IGNvbW1pdCBtZXNzYWdlIGl0IGluIDIgeWVhcnMgdGltZS4NCj4+DQo+Pj4NCj4+PiBGb3Igbm93
LCBza2lwIHRoZSBmaXJzdCBwYWdlIGluIG1lbW9yeSB3aGVuIHRoZSBzdGFydCBhZGRlc3MgaXMg
MHgwLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5v
c0B4aWxpbnguY29tPg0KPiANCj4gSXNuJ3QgdGhpcyBpbiByZXNwb25zZSB0byBhIGJ1ZyByZXBv
cnQgLyBjb21wbGV0ZWx5IGRpZmZlcmVudA0KPiBjb2RlIGNoYW5nZSBmcm9tIHNvbWVvbmUgYXQg
RG9ybmVyV29ya3M/IEluIHdoaWNoIGNhc2UNCj4gc2hvdWxkbid0IHRoZXJlIGJlIGEgUmVwb3J0
ZWQtYnk/DQoNClRoZXJlIGFyZSB0d28gYnVncy4gT25lIGluIHRoZSBidWRkeSBhbGxvY2F0b3Ig
KHJlcG9ydGVkIGJ5IGRvcm5lcndvcmtzKSANCmFuZCBvbmUgaW4gdGhlIFBEWC4NCg0KPiANCj4+
IEZvciBhIGZpcnN0IHdlIG5lZWQgdG8gZ2F0aGVyIGZlZWRiYWNrIGZyb20gY29udHJpYnV0b3Jz
IHRoYXQga25vdyBhIGJpdA0KPj4gbW9yZSBvZiB0aGUgY29kZSB0aGF0IG1heSBiZSBhZmZlY3Rl
ZC4gQUZBSUNULCB0aGVyZSBhcmUgb25seSB0d28gcGllY2VzDQo+PiB3aGVyZSB3ZSBoYW5kIG92
ZXIgbWVtb3J5IHRvIGNvbW1vbiBjb2RlOg0KPj4gICAgICAgLSBQRFg6IFRoZSBwcm9ibGVtIGlz
IHBhc3NpbmcgMCB0byBwZHhfaW5pdF9tYXNrKCkgd2lsbCByZXN1bHQgdG8gYQ0KPj4gfjAgbWFz
ayBkZWZlYXRpbmcgdGhlIGNvbXByZXNzaW9uIGxhdGVyIG9uLg0KPiANCj4gT24geDg2IHRoZSBm
dW5jdGlvbiBnZXRzIGNhbGxlZCBvbmx5IGZvciBtZW1vcnkgYmxvY2tzIGFib3ZlIDRHYi4NCj4g
UXVlc3Rpb24gaXMgd2hldGhlciBvbiBBcm0geW91IGFsc28gaGF2ZSBzb21lIGFkIGhvYyBib3Vu
ZGFyeQ0KPiBiZWxvdyB3aGljaCB0aGVyZSdzIG5vIHBvaW50IHRvIGxvb2sgZm9yIGJpdHMgdG8g
Y29tcGFjdC4gSWYgbm90IEkNCj4gd29uZGVyIHdoeSB5b3UgY2FsbCB0aGUgZnVuY3Rpb24gYXQg
YWxsOyBhdCB0aGUgdmVyeSBsZWFzdCAoYXMgeW91DQo+IHNlZW0gdG8gaW1wbHkpIGl0IHNob3Vs
ZG4ndCBiZSBjYWxsZWQgd2hlbg0KPiBib290aW5mby5tZW0uYmFua1swXS5zdGFydCBpcyB6ZXJv
Lg0KDQpTbyBob3cgZG9lcyB0aGUgUERYIHdvcmsgZm9yIG1lbW9yeSBiZWxvdyA0R0I/IERvIHlv
dSBzdGlsbCBjYWxsIA0KcGZuX3RvX3BkeCBvciB0aG9zZSBwYWdlcz8NCg0KPiANCj4+ICAgICAg
IC0gQnVkZHkgYWxsb2NhdG9yOiBKYW4gaGFzIGJlZW4gc3VnZ2VzdGluZyB0byBzdGljayBhIGNo
ZWNrIGluDQo+PiBpbml0X3hlbmhlYXBfcGFnZXMoKS4gVGhpcyB3b3VsZCBnbyB0aGUgb3RoZXIg
dWdsaW5lc3MgZXhpc3RpbmcgdG8gZGVhbA0KPj4gd2l0aCB0aGUgYnVkZHkgYWxsb2NhdG9yLg0K
PiANCj4gQW5kIHRoaXMgd291bGQgdGhlbiBhbHNvIHRha2UgY2FyZSBvZiBmdXR1cmUgYXJjaGl0
ZWN0dXJlcyBYZW4gbWF5DQo+IGdldCBwb3J0ZWQgdG8uIChObyBpZGVhIHdoYXQgb3RoZXIgdWds
aW5lc3MgeW91IHJlZmVyIHRvLikNCg0KU2VlOg0KDQovKg0KICAqIFl1ayEgRW5zdXJlIHRoZXJl
IGlzIGEgb25lLXBhZ2UgYnVmZmVyIGJldHdlZW4gWGVuIGFuZCBEb20gem9uZXMsIHRvDQogICog
cHJldmVudCBtZXJnaW5nIG9mIHBvd2VyLW9mLXR3byBibG9ja3MgYWNyb3NzIHRoZSB6b25lIGJv
dW5kYXJ5Lg0KICAqLw0KDQpBbmQgdGhlIDAgaXMgeWV0IGFub3RoZXIgaGFjayBmb3IgdGhlIGJ1
ZGR5IGFsbG9jYXRvci4NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
