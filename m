Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFB1C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:42:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5719C20656
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="JQ63CvWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5719C20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJlCB-0003QG-9r; Thu, 25 Apr 2019 20:42:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJlC9-0003QB-K2
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:42:13 +0000
X-Inumbo-ID: 99b88566-679a-11e9-843c-bc764e045a96
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::623])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99b88566-679a-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cpgrI7aF6iijLNzYt2tu9qBpAa83J2kaiv0cdAVRPY=;
 b=JQ63CvWhY7dKPq46VffxOxxqpY2wG4pI40b3pYfrYNijeNyUry45+swXNiSAiM/QxmWjubsyyKQGO6pydqXNVUzkKlyF0GxgNmwLpkehh4f/VVr6Hu43HXfX9CTcjJkfTJd5K3czj8iwgE8hzm8UsJD/GJBuSdY843EyIYR9CXo=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB5138.eurprd08.prod.outlook.com (10.255.30.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Thu, 25 Apr 2019 20:42:00 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 20:42:00 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
Thread-Index: AQHU9UcrY67mUn6tjkq07/tYW0b8g6ZNNz4AgAAs2gA=
Date: Thu, 25 Apr 2019 20:42:00 +0000
Message-ID: <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
In-Reply-To: <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41afced9-d2a3-4036-c200-08d6c9be7708
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5138; 
x-ms-traffictypediagnostic: AM0PR08MB5138:
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB51385B5E5BB239638FDB2CDB803D0@AM0PR08MB5138.eurprd08.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(52314003)(44832011)(5660300002)(31696002)(86362001)(71200400001)(71190400001)(14454004)(11346002)(446003)(476003)(2616005)(486006)(256004)(14444005)(97736004)(2501003)(26005)(186003)(76176011)(386003)(6506007)(53546011)(102836004)(7736002)(8936002)(81156014)(81166006)(99286004)(6486002)(25786009)(6436002)(305945005)(2906002)(316002)(36756003)(52116002)(66946007)(72206003)(73956011)(508600001)(66476007)(66556008)(64756008)(66446008)(6116002)(31686004)(53936002)(229853002)(3846002)(54906003)(6246003)(110136005)(6512007)(4326008)(66066001)(68736007)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5138;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S4AokiYy6Z/qUcqDEQAf7/qNZmA9LqSSsI1pns8Hmm2naawvjh0zJspZn19PTosNZJsKN2NqopMPzPW/2SiR+VTVVyztHp4HnTYOF4w9LDT14GsXE8XByBlkno8Maa+YEPghzzJpOynqvzLQLcjwTBSHlU75WilpPvIAnRhxBOjhkEDseHFjKEsb+RVYbgtb6aAcjvfSDQbqhGpInKc5BMOJAVLk8FnqImBiQyg93CjPpKdhW9z/okAjeZ1yn+hOJ6+QDzs2LHil80F4TYs6hfH7JFtGIoEvbxmLVD/8tr1OudkwiBbbUaEOcshYfVqNtWIaGVksp5LKqwatzy8nrcOketTLO3oqjmQtCwHPLGc5d32teLl+01AfKm5k6MOfUM+WjqpXlT/lkAuiApA3DvNvwRxQSZjxmRnis6ndgR8=
Content-ID: <895CF2AEE5BE7143981A1EA3AD331F9F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41afced9-d2a3-4036-c200-08d6c9be7708
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 20:42:00.0377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5138
Subject: Re: [Xen-devel] [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
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
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425204200.FJsbjUjxN6sp3-b0U6Xw3gblIjPieZ5vIEIcPLYKZqU@z>

DQoNCk9uIDI1LzA0LzIwMTkgMTk6MDEsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IA0KPiANCj4g
T24gMTcuMDQuMTkgMjA6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEFsbCB0aGUgVExCcyBo
ZWxwZXJzIGludmFsaWRhdGUgYWxsIHRoZSBUTEIgZW50cmllcyBhcmUgdXNpbmcgdGhlIHNhbWUN
Cj4+IHBhdHRlcm46DQo+PiDCoMKgwqDCoCBEU0IgU1kNCj4+IMKgwqDCoMKgIFRMQkkgLi4uDQo+
PiDCoMKgwqDCoCBEU0IgU1kNCj4+IMKgwqDCoMKgIElTQg0KPj4NCj4+IFRoaXMgcGF0dGVybiBp
cyBmb2xsb3dpbmcgcGF0dGVybiByZWNvbW1lbmRlZCBieSB0aGUgQXJtIEFybSB0byBlbnN1cmUN
Cj4+IHZpc2liaWxpdHkgb2YgdXBkYXRlcyB0byB0cmFuc2xhdGlvbiB0YWJsZXMgKHNlZSBLMTAt
NTYxMCBpbiBBUk0gRERJDQo+PiAwNDg3LkEuaykuDQo+IA0KPiBJIGNhbid0IGZpbmQgMDQ4Ny5B
LmssIG9ubHkgYWogWzFdLCBuZXh0IG9uZSBpcyBiLg0KPiBJIGd1ZXNzIHlvdSBhcmUgcmVmZXJy
aW5nIGBFbnN1cmluZyB0aGUgdmlzaWJpbGl0eSBvZiB1cGRhdGVzIHRvIA0KPiB0cmFuc2xhdGlv
biB0YWJsZXMgZm9yIGEgbXVsdGlwcm9jZXNzb3JgPw0KDQpPaCwgSSB2YWd1ZWx5IHJlbWVtYmVy
IGEgdmVyc2lvbiBvZiB0aGUgQXJtIEFybSBiZWVuIHJlLWlzc3VlZCBiZWNhdXNlIA0Kb2YgdGhl
IG1pc3Rha2VzIGR1cmluZyB0aGUgcmVsZWFzZS4gVGhpcyBtaWdodCB3ZWxsIGhhdmUgYmVlbiBB
LmsuDQoNCkkgYW0gbm90IHN1cmUgd2h5IEkgdXNlIEEuayBiZWNhdXNlIHRoaXMgaXMgYSBwcmV0
dHkgb2xkIHNwZWMuIEkgc2hvdWxkIA0KaGF2ZSB1c2VkIHRoZSBsYXN0IG9uZSAoaS5lIEQuYSku
DQoNCkFueXdheSwgSSBhbSBpbmRlZWQgcmVmZXJyaW5nIHRvIGBFbnN1cmluZyB0aGUgdmlzaWJp
bGl0eSBvZiB1cGRhdGVzIHRvIA0KdHJhbnNsYXRpb24gdGFibGVzIGZvciBhIG11bHRpcHJvY2Vz
c29yYC4gSSB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClsuLi5dDQoNCj4gDQo+
IFdpdGggbWlub3Igbm90ZXMsDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5k
cmlpX2FuaXNvdkBlcGFtLmNvbT4NCg0KVGhhbmsgeW91IQ0KDQpDaGVlcnMsDQoNCi0tIA0KSnVs
aWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
