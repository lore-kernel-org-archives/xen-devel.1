Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E158C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 09:15:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5122183E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 09:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=epam.com header.i=@epam.com header.b="K6iViRBU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F5122183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=epam.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH38M-0005sD-74; Thu, 18 Apr 2019 09:15:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jZS7=SU=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1hH38L-0005s5-Gh
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 09:15:05 +0000
X-Inumbo-ID: 726ca18c-61ba-11e9-92d7-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::61b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 726ca18c-61ba-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqL2MG9SBIEyJY2p5n8MPAI/c4PeBlTO8FNYOOPbKzw=;
 b=K6iViRBUwmsH7nkPjmRQAxz8wPLyqJhJiGHYhwF+zluWrvYuWPwL6eowTLONSOoLX6acxqudguV+bwUINvkFCyYS+5yEviiEbWvQBgXYo8mPab1WhBffp0vKJ5Ktt3LjB4BkS1bQm889I/D22Ol7fzzpwUTMVNkV7pZM8CAdHa4oF9j7543K2CXe8MRf/P9Kip27h8fSgyfCxXWVVPQqX6ik0LXF0DHwf0RNR93UAAp4UBfgLFpAInOVAb7vc1WNVhnjFUgKYemflOQ5Ma1Ut0Wwq5r8Ptt04WEP4TI49EZ3dWK/o0Pu5q6OZDWTMcQ4mrrvvJnMlMSJItM0JxHULA==
Received: from AM6PR03MB5973.eurprd03.prod.outlook.com (10.255.120.207) by
 AM6SPR01MB0047.eurprd03.prod.outlook.com (20.178.87.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 18 Apr 2019 09:15:00 +0000
Received: from AM6PR03MB5973.eurprd03.prod.outlook.com
 ([fe80::29cf:161c:4338:a96f]) by AM6PR03MB5973.eurprd03.prod.outlook.com
 ([fe80::29cf:161c:4338:a96f%4]) with mapi id 15.20.1813.013; Thu, 18 Apr 2019
 09:15:00 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com"
 <julien.grall@arm.com>
Thread-Topic: [PATCH 00/12] xen/arm: Add support to build with clang
Thread-Index: AQHU5M1JOMPdtELhVUe6/vVXmu7jXKYg6LsAgAF9wACAHRusAIAAuAUAgAGKnYA=
Date: Thu, 18 Apr 2019 09:15:00 +0000
Message-ID: <92811c0c44411ab28eefce1aa7028bf0c426ea80.camel@epam.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <970b4dcfb4e3c04bc9502c7656caa61d2f8c0677.camel@epam.com>
 <8210e96d-c7cd-384e-3277-21fdbfc32105@arm.com>
 <alpine.DEB.2.10.1904161543460.1370@sstabellini-ThinkPad-X260>
 <34d8cf3f-e262-e3ab-b9e3-3c0dcbd75e37@arm.com>
In-Reply-To: <34d8cf3f-e262-e3ab-b9e3-3c0dcbd75e37@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7ce6d9a-7537-4ad0-6fc5-08d6c3de55b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM6SPR01MB0047; 
x-ms-traffictypediagnostic: AM6SPR01MB0047:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM6SPR01MB00471884FC2BD897C6E667C1F4260@AM6SPR01MB0047.eurprd03.prod.outlook.com>
x-forefront-prvs: 0011612A55
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(346002)(366004)(396003)(39860400002)(54094003)(189003)(199004)(53754006)(71190400001)(80792005)(97736004)(966005)(93886005)(72206003)(2501003)(71200400001)(6436002)(14454004)(66574012)(68736007)(6486002)(14444005)(256004)(5660300002)(229853002)(478600001)(91966014)(53936002)(76176011)(4326008)(6506007)(26005)(53546011)(102836004)(118296001)(86362001)(2906002)(305945005)(7736002)(7416002)(2616005)(6512007)(476003)(66066001)(54906003)(6306002)(486006)(110136005)(36756003)(3846002)(446003)(81166006)(6116002)(25786009)(11346002)(316002)(99286004)(81156014)(186003)(8936002)(55236004)(6246003)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6SPR01MB0047;
 H:AM6PR03MB5973.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zKIYOVYCctGu7t8PHKAAmLG5BmjlsekOLkNBBcmcb8fYFKPpJCGNgzUlhX2ICOZUKZQ9YfpYjxxVUK0BuNo8g4xabGOgc5ztSytvkL8RPOxIqnDbF1WP9dX8pdcmb91UFzjJAmr9ZxlecWMqGJ+OdEU05dsWgtwubE7JafMRHsF2bg238OQuUb6O5fHOKPrm8U/4Jub8OAo7zIGLSENV/N+K53IZLKh1i5tjfVs7lR46OPLl+U5rYMwOuE5csErSV8qS+S4g2/F9FZyKFYxvG7bvJHk3xLJ/2TTCbgXHcNbInj/RTH9dB81K7RU+3pdBfSQJD5SgAYTRpJxk9e5jMWa57rLU5gMlQAspm3GBHoBrvPwjTHXm0Uq0akCo2yn5MmzkQTQwPnK5scTdofiLpKlCegI/RCcfxiMj1lNxQN8=
Content-ID: <9F14235FC349704D8E939671B25A0B9E@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ce6d9a-7537-4ad0-6fc5-08d6c3de55b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2019 09:15:00.5806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB0047
Subject: Re: [Xen-devel] [PATCH 00/12] xen/arm: Add support to build with
 clang
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
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "tim@xen.org" <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418091500.VAgplmiMEdi0R8E-Of_pOslZD0wzfrltUeaNlMI-uEs@z>

SGVsbG8gSnVsaWVuLCBTdGVmYW5vDQoNCk9uIFdlZCwgMjAxOS0wNC0xNyBhdCAxMDo0MiArMDEw
MCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIDE2LzA0LzIwMTkgMjM6NDMs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPiBPbiBGcmksIDI5IE1hciAyMDE5LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6DQo+ID4gPiBPbiAyOC8wMy8yMDE5IDExOjI3LCBBcnRlbSBNeWdhaWV2
IHdyb3RlOg0KPiA+ID4gPiBIaSBKdWxpZW4sDQo+ID4gPiANCj4gPiA+IEhpIEFydGVtLA0KPiA+
ID4gDQo+ID4gPiA+IE9uIFdlZCwgMjAxOS0wMy0yNyBhdCAxODo0NSArMDAwMCwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPiA+ID4gPiA+IEhpIGFsbCwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUaGlz
IHNlcmllcyBhZGRzIHN1cHBvcnQgdG8gYnVpbGQgWGVuIEFybSB3aXRoIGNsYW5nLiBUaGlzIHNl
cmllcyB3YXMNCj4gPiA+ID4gPiB0ZXN0ZWQNCj4gPiA+ID4gPiB3aXRoIGNsYW5nIDguMC4NCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBOb3RlIHRoYXQgSSBvbmx5IGRpZCBidWlsZCBmb3IgYXJtNjQu
IEkgc3RpbGwgbmVlZCB0byBsb29rIGF0IHRoZSBhcm0zMg0KPiA+ID4gPiA+IGJ1aWxkLg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gSSB3b25kZXIgaWYgeW91IGhhdmUgdGltZSB0byB0
cnkgdGhlIHNlcmllcyB3aXRoIEFybSBDb21waWxlciA2PyBJIGFtDQo+ID4gPiA+IGFza2luZyBi
ZWNhdXNlIEFGQUlLIGl0IGlzIGJhc2VkIG9uIGNsYW5nL2xsdm0gWzFdIGFuZCB0aGVyZSdzIGEN
Cj4gPiA+ID4gc2FmZXR5LWNvbXBsaWFudCB2ZXJzaW9uIG9mIGl0IGNlcnRpZmllZCBieSBUVVYg
WzJdLiBJIGRvbid0IGhhdmUgYQ0KPiA+ID4gPiBsaWNlbnNlIHlldCBzbyBjYW5ub3QgdHJ5IGl0
IG15c2VsZiBidXQgbWF5YmUgeW91IGhhdmUgYWNjZXNzLg0KPiA+ID4gSSBnYXZlIGEgcXVpY2sg
dHJ5IHRvIHRoZSBBcm0gQ29tcGlsZXIuIEkgaGFkIHRvIGhhY2sgYSBiaXQgY29uZmlnL1N0ZEdO
VS5taw0KPiA+ID4gdG8gcGFzcyBhcm1jbGFuZyBhbmQgdGhlIGFwcHJvcHJpYXRlIHRhcmdldCBv
cHRpb24uDQo+ID4gPiANCj4gPiA+IEkgYWxzbyBoYWQgYSBsaW5raW5nIGlzc3VlIGF0IHRoZSBl
bmQgd2hlcmUgX18yc25wcmludGYgd2FzIG5vdCBmb3VuZC4gSXQNCj4gPiA+IHNlZW1zIHRoZSBj
b21waWxlciByZXBsYWNlIHNucHJpbnRmIHdpdGggX18yc25wcmludGYsIEkgaGF2ZW4ndCBmaWd1
cmVkIG91dA0KPiA+ID4gd2h5IHlldC4NCj4gPiANCj4gPiBCdXQgYWZ0ZXIgdGhlc2UgY2hhbmdl
cywgZG9lcyBpdCB3b3JrPw0KPiANCj4gSSBoYXZlbid0IHRyaWVkIHRvIGZpeCB0aGUgbGlua2lu
ZyBpc3N1ZXMuIEkgb25seSBnYXZlIGEgcXVpY2sgdHJ5IGJlY2F1c2UgQXJ0ZW0gDQo+IGFza2Vk
LiBJIGhhdmUgbm8gcGxhbiBhdCB0aGUgbW9tZW50IHRvIGdvIGZ1cnRoZXIgdGhhbiB0aGF0IGZv
ciBub3cuDQo+IA0KPiBQYXRjaGVzIGFyZSB3ZWxjb21lZCB0byBhZGQgc3VwcG9ydCBmb3IgYXJt
Y2xhbmcuDQo+IA0KDQpJIGhhdmUgaW1wbGVtZW50ZWQgYSBidW5jaCBvZiBIQUNLcyBbMV0gc28g
Y2FuIGJ1aWxkIFhlbiBtYXN0ZXIgd2l0aA0KYXJtY2xhbmcgNi4xMi4gTm90IGV2ZW4gInNtb2tl
Ii10ZXN0ZWQsIGp1c3QgdHJ5aW5nIHRvIGlkZW50aWZ5IG1pc3NpbmcNCnBhcmFtZXRlcnMgYW5k
IHByb3BlciBsaW5rZXIgY29uZmlndXJhdGlvbi4NCg0KTm90IHlldCBmaXhlZCBzZWN0aW9uIHBs
YWNlbWVudCwgbG90cyBvZiB3YXJuaW5ncyBmcm9tIGxpbmtlciBsaWtlOg0KV2FybmluZzogTDYx
NzBXOiBNYXBwaW5nIHN5bWJvbCAjNDAgJyR4LjIwJyBpbg0KLmFsdGluc3RyX3JlcGxhY2VtZW50
KG5zMTY1NTAubzo0MikgaWRlbnRpZmllcyBjb2RlLCBidXQgaXMgaW4gYQ0Kc2VjdGlvbiBub3Qg
bWFya2VkIGFzIGV4ZWN1dGFibGUuDQoNCkFsc28gYXJtbGluayBzb21ldGltZXMgZmFpbHMgd2l0
aCBJbnRlcm5hbCBmYXVsdDogWzB4ZTgxYTVhOjYxMjAwMDFdDQoNCg0KWzFdIERpZmYgYmVsb3cg
anVzdCBmb3IgcmVmZXJlbmNlIHdpdGggeGVuIG1hc3RlciArIEp1bGllbidzIGNsYW5nDQpwYXRj
aCBzZXJpZXMgYXBwbGllZA0KLS0tDQoNCmRpZmYgLS1naXQgYS9Db25maWcubWsgYi9Db25maWcu
bWsNCmluZGV4IDQxNzAzOWQ3ZjYuLjBmYzg0MjkzZjkgMTAwNjQ0DQotLS0gYS9Db25maWcubWsN
CisrKyBiL0NvbmZpZy5taw0KQEAgLTIyMSw3ICsyMjEsOSBAQCBDRkxBR1MgKz0gLVdhbGwgLVdz
dHJpY3QtcHJvdG90eXBlcw0KIA0KICQoY2FsbCBjYy1vcHRpb24tYWRkLEhPU1RDRkxBR1MsSE9T
VENDLC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50KQ0KICQoY2FsbCBjYy1vcHRpb24tYWRk
LENGTEFHUyxDQywtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCkNCitpZm5lcSAoJChhcm1k
cykseSkNCiAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVduby11bnVzZWQtYnV0LXNl
dC12YXJpYWJsZSkNCitlbmRpZg0KICQoY2FsbCBjYy1vcHRpb24tYWRkLENGTEFHUyxDQywtV25v
LXVudXNlZC1sb2NhbC10eXBlZGVmcykNCiANCiBMREZMQUdTICs9ICQoZm9yZWFjaCBpLCAkKEVY
VFJBX0xJQiksIC1MJChpKSkgDQpAQCAtMjM0LDkgKzIzNiwxNSBAQCBlbmRpZg0KIEFQUEVORF9M
REZMQUdTICs9ICQoZm9yZWFjaCBpLCAkKEFQUEVORF9MSUIpLCAtTCQoaSkpDQogQVBQRU5EX0NG
TEFHUyArPSAkKGZvcmVhY2ggaSwgJChBUFBFTkRfSU5DTFVERVMpLCAtSSQoaSkpDQogDQotRU1C
RURERURfRVhUUkFfQ0ZMQUdTIDo9IC1ub3BpZSAtZm5vLXN0YWNrLXByb3RlY3RvciAtZm5vLXN0
YWNrLQ0KcHJvdGVjdG9yLWFsbA0KK0VNQkVEREVEX0VYVFJBX0NGTEFHUyA6PSAtZm5vLXN0YWNr
LXByb3RlY3RvciAtZm5vLXN0YWNrLXByb3RlY3Rvci1hbGwNCiBFTUJFRERFRF9FWFRSQV9DRkxB
R1MgKz0gLWZuby1leGNlcHRpb25zDQogDQoraWZlcSAoJChhcm1kcykseSkNCitFTUJFRERFRF9F
WFRSQV9DRkxBR1MgKz0gLWZuby1yb3BpIC1mbm8tcndwaQ0KK2Vsc2UNCitFTUJFRERFRF9FWFRS
QV9DRkxBR1MgKz0gLW5vcGllDQorZW5kaWYNCisNCiBYRU5fRVhURklMRVNfVVJMID89IGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcveGVuLWV4dGZpbGVzDQogIyBBbGwgdGhlIGZpbGVzIGF0IHRoYXQg
bG9jYXRpb24gd2VyZSBkb3dubG9hZGVkIGZyb20gZWxzZXdoZXJlIG9uDQogIyB0aGUgaW50ZXJu
ZXQuICBUaGUgb3JpZ2luYWwgZG93bmxvYWQgVVJMIGlzIHByZXNlcnZlZCBhcyBhIGNvbW1lbnQN
CmRpZmYgLS1naXQgYS9jb25maWcvU3RkR05VLm1rIGIvY29uZmlnL1N0ZEdOVS5taw0KaW5kZXgg
NDhjNTBiNWFkNy4uNTg1ZDA3NmQ0ZiAxMDA2NDQNCi0tLSBhL2NvbmZpZy9TdGRHTlUubWsNCisr
KyBiL2NvbmZpZy9TdGRHTlUubWsNCkBAIC0xLDYgKzEsMTUgQEANCiBBUyAgICAgICAgID0gJChD
Uk9TU19DT01QSUxFKWFzDQorQVIgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcg0KIExEICAg
ICAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQNCiBpZmVxICgkKGNsYW5nKSx5KQ0KK2lmZXEgKCQo
YXJtZHMpLHkpDQorQ0MgICAgICAgICA9IGFybWNsYW5nDQorQ1hYICAgICAgICA9IGFybWNsYW5n
DQorTERfTFRPICAgICA9IGFybWxpbmsNCitMRCAgICAgICAgID0gYXJtbGluayAtdg0KK0FTICAg
ICAgICAgPSBhcm1hc20NCitBUiAgICAgICAgID0gYXJtYXINCitlbHNlDQogaWZuZXEgKCQoQ1JP
U1NfQ09NUElMRSksKQ0KIENDICAgICAgICAgPSBjbGFuZyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElM
RTotPSkNCiBDWFggICAgICAgID0gY2xhbmcrKyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElMRTotPSkN
CkBAIC05LDEzICsxOCwxMyBAQCBDQyAgICAgICAgID0gY2xhbmcNCiBDWFggICAgICAgID0gY2xh
bmcrKw0KIGVuZGlmDQogTERfTFRPICAgICA9ICQoQ1JPU1NfQ09NUElMRSlsbHZtLWxkDQorZW5k
aWYNCiBlbHNlDQogQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSlnY2MNCiBDWFggICAgICAg
ID0gJChDUk9TU19DT01QSUxFKWcrKw0KIExEX0xUTyAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQN
CiBlbmRpZg0KIENQUCAgICAgICAgPSAkKENDKSAtRQ0KLUFSICAgICAgICAgPSAkKENST1NTX0NP
TVBJTEUpYXINCiBSQU5MSUIgICAgID0gJChDUk9TU19DT01QSUxFKXJhbmxpYg0KIE5NICAgICAg
ICAgPSAkKENST1NTX0NPTVBJTEUpbm0NCiBTVFJJUCAgICAgID0gJChDUk9TU19DT01QSUxFKXN0
cmlwDQpkaWZmIC0tZ2l0IGEvY29uZmlnL2FybTMyLm1rIGIvY29uZmlnL2FybTMyLm1rDQppbmRl
eCBmOTUyMjhlM2MwLi41YWZlZDA3MzU3IDEwMDY0NA0KLS0tIGEvY29uZmlnL2FybTMyLm1rDQor
KysgYi9jb25maWcvYXJtMzIubWsNCkBAIC00LDEyICs0LDE0IEBAIENPTkZJR19BUk1fJChYRU5f
T1MpIDo9IHkNCiANCiBDT05GSUdfWEVOX0lOU1RBTExfU1VGRklYIDo9DQogDQotIyAtbWFyY2g9
IC1tY3B1PQ0KLQ0KICMgRXhwbGljaXRseSBzcGVjaWZpeSAzMi1iaXQgQVJNIElTQSBzaW5jZSB0
b29sY2hhaW4gZGVmYXVsdCBjYW4gYmUNCi1tdGh1bWI6DQotQ0ZMQUdTICs9IC1tYXJtDQotDQor
aWZlcSAoJChhcm1kcykseSkNCisjIFZFIG5lZWRlZA0KK0NGTEFHUyArPSAtLXRhcmdldD1hcm0t
YXJtLW5vbmUtZWFiaSAtbWFyY2g9YXJtdjctYQ0KK2Vsc2UNCitDRkxBR1MgKz0gLW1hcm0gIyAt
bWFyY2g9IC1tY3B1PQ0KICMgVXNlIG9ubHkgaWYgY2FsbGluZyAkKExEKSBkaXJlY3RseS4NCiBM
REZMQUdTX0RJUkVDVCArPSAtRUwNCitlbmRpZg0KIA0KIElPRU1VX0NQVV9BUkNIID89IGFybQ0K
ZGlmZiAtLWdpdCBhL2NvbmZpZy9hcm02NC5tayBiL2NvbmZpZy9hcm02NC5taw0KaW5kZXggYWE0
NTc3MmI2MS4uNDZiMjAzZDM4NCAxMDA2NDQNCi0tLSBhL2NvbmZpZy9hcm02NC5taw0KKysrIGIv
Y29uZmlnL2FybTY0Lm1rDQpAQCAtNCwxMCArNCwxNCBAQCBDT05GSUdfQVJNXyQoWEVOX09TKSA6
PSB5DQogDQogQ09ORklHX1hFTl9JTlNUQUxMX1NVRkZJWCA6PQ0KIA0KK2lmZXEgKCQoYXJtZHMp
LHkpDQorIyBWRSBuZWVkZWQNCitDRkxBR1MgKz0gLS10YXJnZXQ9YWFyY2g2NC1hcm0tbm9uZS1l
YWJpIC1tYXJjaD1hcm12OC4xLWErbm9mcCtub3NpbWQNCitlbHNlDQogQ0ZMQUdTICs9ICMtbWFy
bSAtbWFyY2g9IC1tY3B1PSBldGMNCi0NCiAjIFVzZSBvbmx5IGlmIGNhbGxpbmcgJChMRCkgZGly
ZWN0bHkuDQogTERGTEFHU19ESVJFQ1QgKz0gLUVMDQorZW5kaWYNCiANCiBJT0VNVV9DUFVfQVJD
SCA/PSBhYXJjaDY0DQogDQpkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIveGVuL1J1bGVzLm1r
DQppbmRleCBhMTUxYjNmNjI1Li43MmIzNDQ1MWQyIDEwMDY0NA0KLS0tIGEveGVuL1J1bGVzLm1r
DQorKysgYi94ZW4vUnVsZXMubWsNCkBAIC03Niw5ICs3NiwxMSBAQCBBRkxBR1MteSAgICAgICAg
ICAgICAgICArPSAtRF9fQVNTRU1CTFlfXw0KICMgT2xkZXIgY2xhbmcncyBidWlsdC1pbiBhc3Nl
bWJsZXIgZG9lc24ndCB1bmRlcnN0YW5kIC5za2lwIHdpdGgNCmxhYmVsczoNCiAjIGh0dHBzOi8v
YnVncy5sbHZtLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjczNjkNCiBpZmVxICgkKGNsYW5nKSx5KQ0K
K2lmbmVxICgkKGFybWRzKSx5KQ0KICQoY2FsbCBhcy1vcHRpb24tYWRkLENGTEFHUyxDQywiLkww
OlxuLkwxOlxuLnNraXAgKC5MMSAtIC5MMCkiLCxcDQogICAgICAgICAgICAgICAgICAgICAgLW5v
LWludGVncmF0ZWQtYXMpDQogZW5kaWYNCitlbmRpZg0KIA0KIEFMTF9PQkpTIDo9ICQoQUxMX09C
SlMteSkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
