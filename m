Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABC6C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 21:28:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16D120675
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 21:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="dp/cl5Wk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16D120675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJluR-0006ZM-1J; Thu, 25 Apr 2019 21:27:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJluP-0006ZH-SX
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 21:27:57 +0000
X-Inumbo-ID: fcdc11b5-67a0-11e9-843c-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::624])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fcdc11b5-67a0-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 21:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq+IJZlW3TtXuQC1L5vqpaoFQ7SrnZpI/hupMUJUL4w=;
 b=dp/cl5WkhdxkCtpzorzN6okRar5EUq3L0LagpFvppF1qIvX+rCOqJMGOm+Y87ZKXiUWIvWKHgCOBi2VA6U5drb1YlPCuDgiAsoeoWNyfyFqg9GCrHuSn22Kk9ZDGYb1jbUUMCSDtykCdqrJKRwcd6+EWYRWDPmG9DMq4pC/YfRc=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3121.eurprd08.prod.outlook.com (52.134.95.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Thu, 25 Apr 2019 21:27:52 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 21:27:52 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] xen/arm: skip first page when RAM starts at 0x0
Thread-Index: AQHU+4+V8sBdh/eMtkuHR7Gc/qAr9KZNZFgA
Date: Thu, 25 Apr 2019 21:27:52 +0000
Message-ID: <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
In-Reply-To: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::18) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7f58168-c098-4caa-1fe4-08d6c9c4dfbe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3121; 
x-ms-traffictypediagnostic: AM0PR08MB3121:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB3121D9C1B6900AE2C40A311E803D0@AM0PR08MB3121.eurprd08.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(39860400002)(366004)(346002)(199004)(189003)(8676002)(25786009)(486006)(6116002)(3846002)(2906002)(53936002)(6512007)(86362001)(4326008)(68736007)(305945005)(6246003)(31696002)(97736004)(7736002)(2501003)(31686004)(66066001)(8936002)(81156014)(81166006)(5660300002)(186003)(110136005)(54906003)(316002)(256004)(14454004)(6506007)(53546011)(386003)(6436002)(26005)(44832011)(229853002)(6486002)(71200400001)(71190400001)(72206003)(99286004)(36756003)(508600001)(2616005)(76176011)(66946007)(66476007)(52116002)(66556008)(64756008)(66446008)(11346002)(446003)(73956011)(476003)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3121;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wthzjOuFSOmLWlQvEhSlvhh24gtyu/LMrgnnfUf8m57Zcj9IDlXF7Ec8AphwxmrggNEXL5HqLSEtKzNR5fmWMDLNIJRzS+l5AG6zuy4BSsiUJRYV/f8cv2kc+3B04TBavSisTsd6yTz6RLhj6DeekoZL0lelMSsUgXjT48tvnZzEyXQmUwFEozz2FeqRvKAxWq2D3W0R91MMwozAqOyMoeWs7Hf6DB0EVxfJXyIvVFXgYlxoqbaWa0g1oABEK2tMu+lngDwxwvJ+z/D4zUHcBc1bwEnYXkDHw4whPY/1nXcD/cNSzipcH2gyeACYdNUS/rDPnOtdSGWJ/MuxGocmuMQ4MvEoR+f1IRZrj8PhMy+89A7/NvRLaEzBjeVJsfPd2p7O96XNwoBQQc4I95tCgZ80Dklxv1ZH+iddfnKkzNk=
Content-ID: <149A4335A8EBDD41849612D7328B85B2@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f58168-c098-4caa-1fe4-08d6c9c4dfbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 21:27:52.6637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3121
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, nd <nd@arm.com>,
 "206497@studenti.unimore.it" <206497@studenti.unimore.it>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425212752.tATTCQCehzLKkzfFKkQcTHitNnjmrP1VEDiU9Ode_c0@z>

SGkgU3RlZmFubywNCg0KT24gMjUvMDQvMjAxOSAxODo1MSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiBYZW4gYXNzdW1lcyB0aGF0IFJBTSBzdGFydHMgYXQgYWRkcmVzc2VzIGdyZWF0ZXIg
dGhhbiAweDAgaW4gYSBmZXcNCj4gcGxhY2VzLiBUaGUgUERYIGNvZGUgaXMgb25lIG9mIHRoZW0g
YnV0IHRoZXJlIGFyZSBtb3JlLg0KDQpBIGJpdCBtb3JlIGNvbnRleHQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIHdvdWxkIGhhdmUgYmVlbiB1c2VmdWwuIEltYWdpbmUgDQppZiB3ZSBoYXZlIHRvIGxv
b2sgYXQgdGhlIGNvbW1pdCBtZXNzYWdlIGl0IGluIDIgeWVhcnMgdGltZS4NCg0KPiANCj4gRm9y
IG5vdywgc2tpcCB0aGUgZmlyc3QgcGFnZSBpbiBtZW1vcnkgd2hlbiB0aGUgc3RhcnQgYWRkZXNz
IGlzIDB4MC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFu
b3NAeGlsaW54LmNvbT4NCj4gLS0tDQo+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDcgKysr
KysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiBp
bmRleCA4OTFiNGI2Li4yYWU0MjM4IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZk
dC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMNCj4gQEAgLTE1Nyw2ICsxNTcsMTMg
QEAgc3RhdGljIHZvaWQgX19pbml0IHByb2Nlc3NfbWVtb3J5X25vZGUoY29uc3Qgdm9pZCAqZmR0
LCBpbnQgbm9kZSwNCj4gICAgICAgICAgIGRldmljZV90cmVlX2dldF9yZWcoJmNlbGwsIGFkZHJl
c3NfY2VsbHMsIHNpemVfY2VsbHMsICZzdGFydCwgJnNpemUpOw0KPiAgICAgICAgICAgaWYgKCAh
c2l6ZSApDQo+ICAgICAgICAgICAgICAgY29udGludWU7DQo+ICsNCj4gKyAgICAgICAgLyoNCj4g
KyAgICAgICAgICogWGVuIGNhbm5vdCBkZWFsIHdpdGggbWVtb3J5IHN0YXJ0aW5nIGF0IDB4MC4g
QnVybiB0aGUgZmlyc3QNCj4gKyAgICAgICAgICogcGFnZS4NCj4gKyAgICAgICAgICovDQo+ICsg
ICAgICAgIGlmICggc3RhcnQgPT0gMCApDQo+ICsgICAgICAgICAgICBzdGFydCArPSBQQUdFX1NJ
WkU7DQoNCkkgYW0gYWZyYWlkIHRoaXMgaXMgbm90IGVub3VnaC4gVGhpcyBkb2VzIG5vdCBjb3Zl
ciB0aGUgY2FzZSB3aGVyZSBYZW4gDQppcyBib290aW5nIHVzaW5nIFVFRkkgKGVpdGhlciBEVCBv
ciBBQ1BJKS4gVGhlIGJhbmtzIHdpbGwgYmUgY3JlYXRlZCANCmZyb20gdGhlIFVFRkkgbWVtb3J5
IG1hcCAoc2VlIGVmaV9wcm9jZXNzX21lbW9yeV9tYXBfYm9vdGluZm8oKSkuDQoNCkkgYWxzbyB3
YW50IHRvIGF2b2lkIG1peGluZyBwb3B1bGF0aW5nIGJvb3RpbmZvLm1lbS5iYW5rIGFuZCB0cnlp
bmcgdG8gDQp3b3JrYXJvdW5kIFhlbiBhbGxvY2F0b3IvUERYLg0KDQpGb3IgYSBmaXJzdCB3ZSBu
ZWVkIHRvIGdhdGhlciBmZWVkYmFjayBmcm9tIGNvbnRyaWJ1dG9ycyB0aGF0IGtub3cgYSBiaXQg
DQptb3JlIG9mIHRoZSBjb2RlIHRoYXQgbWF5IGJlIGFmZmVjdGVkLiBBRkFJQ1QsIHRoZXJlIGFy
ZSBvbmx5IHR3byBwaWVjZXMgDQp3aGVyZSB3ZSBoYW5kIG92ZXIgbWVtb3J5IHRvIGNvbW1vbiBj
b2RlOg0KICAgICAtIFBEWDogVGhlIHByb2JsZW0gaXMgcGFzc2luZyAwIHRvIHBkeF9pbml0X21h
c2soKSB3aWxsIHJlc3VsdCB0byBhIA0KfjAgbWFzayBkZWZlYXRpbmcgdGhlIGNvbXByZXNzaW9u
IGxhdGVyIG9uLg0KICAgICAtIEJ1ZGR5IGFsbG9jYXRvcjogSmFuIGhhcyBiZWVuIHN1Z2dlc3Rp
bmcgdG8gc3RpY2sgYSBjaGVjayBpbiANCmluaXRfeGVuaGVhcF9wYWdlcygpLiBUaGlzIHdvdWxk
IGdvIHRoZSBvdGhlciB1Z2xpbmVzcyBleGlzdGluZyB0byBkZWFsIA0Kd2l0aCB0aGUgYnVkZHkg
YWxsb2NhdG9yLg0KDQpJZiB3ZSBmaXggaW4gdGhvc2UgdHdvIHBsYWNlcywgdGhlbiBJIHRoaW5r
IHdlIGNvdmVyIGFsbCB0aGUgaXNzdWVzIGluIA0KY29tbW9uIGNvZGUgYW5kIG1ha2UgZWFzaWVy
IHRvIHBvcnQgWGVuIHRvIGEgbmV3IGFyY2guDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3Jh
bGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
