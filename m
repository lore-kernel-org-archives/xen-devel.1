Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBED9C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 07:28:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECD220675
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 07:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="SABdVFhF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECD220675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGIVn-00017z-5E; Tue, 16 Apr 2019 07:28:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IVQq=SS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hGIVl-00017u-VQ
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 07:28:10 +0000
X-Inumbo-ID: 2dd82302-6019-11e9-92d7-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.135]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2dd82302-6019-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwlmfHRB47SHE5ukK0Qv4LTsu0fp9Qyt5PAcxlRDoyI=;
 b=SABdVFhFcDZtyzQyKQDrdphxfD2oxpyRoJcoTfNV8t6sheVhCthjo/m9zrUhtw3BcMVxwPtVkm7btR6OiL0wPnw+boUOel3RbmG2srB3Ly6GUB/6/XnqFJBSbte/deXKkhXU5p1/QLF9BZh/QIgawkiZlLE3gOdW5LAxd0R/lHI=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB2687.eurprd02.prod.outlook.com (10.173.81.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Tue, 16 Apr 2019 07:27:51 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::8957:73b5:ea4e:f726]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::8957:73b5:ea4e:f726%10]) with mapi id 15.20.1792.018; Tue, 16 Apr
 2019 07:27:51 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v4] x86/mm: Aggregate get entry and populate into common
 funcs
Thread-Index: AQHU82zR4ynsAcd8f0GUNAhaQDNEbKY9W2GAgAEJjIA=
Date: Tue, 16 Apr 2019 07:27:50 +0000
Message-ID: <0afeb362-03df-9c38-8540-2e35835c30ff@bitdefender.com>
References: <20190415092243.3349-1-aisaila@bitdefender.com>
 <5CB4A5310200007800155529@prv1-mh.provo.novell.com>
In-Reply-To: <5CB4A5310200007800155529@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0602CA0003.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::13) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0018fde-6c73-45d6-600c-08d6c23d079e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2687; 
x-ms-traffictypediagnostic: VI1PR0202MB2687:|VI1PR0202MB2687:
x-microsoft-antispam-prvs: <VI1PR0202MB2687D811DC5102793B6E318EAB240@VI1PR0202MB2687.eurprd02.prod.outlook.com>
x-forefront-prvs: 000947967F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(396003)(136003)(346002)(199004)(189003)(105586002)(6512007)(6916009)(106356001)(2906002)(8676002)(305945005)(81166006)(31686004)(3846002)(8936002)(71200400001)(81156014)(478600001)(14454004)(36756003)(25786009)(4326008)(7736002)(6116002)(52116002)(6246003)(71190400001)(76176011)(31696002)(229853002)(102836004)(54906003)(14444005)(316002)(86362001)(5660300002)(6506007)(53936002)(186003)(26005)(68736007)(97736004)(256004)(99286004)(4744005)(446003)(53546011)(6436002)(386003)(486006)(11346002)(66066001)(2616005)(476003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2687;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WTu6tg4KP/u2JEtxKy//zdTf++lq36qU6d4mfXCdlPSCqGMgWZkdb6i1+ha9VsSP6z4siz8/BfM97RpBSESiznkjsttVxIo+ITcYdfL8CAPaQGbzYuE46TLGx6fpxlLPm1tEuXuoWDxjltHNFl+cEYJeY3f+XasnWUOMXpPSYcmy3JbSo2dEMKDuqjhoe9KTcoVVFAhmG6fKflYQyEe29HhHyXJV/BVfRD39bTEeljnnxgvcTuVaxgt5sn0l6pFD55KIJ4TW4boGGE3XW6JUl9gk8IWJeF7EtP0C+0tsgnC4lC/wj5wgPxoT/w1rdEnPUXixFHA1thqIVw+nK6ociDKAg9X5gZBKNYslA4E4HGVmJ/NvVcAw9r4oENgI/hgw3MHNLR7EUyW1tFA25CCGRMgCVbq4thMhh+8LRO1n76o=
Content-ID: <D933EACFBF88224F8A4D0BC0947BBF0A@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0018fde-6c73-45d6-600c-08d6c23d079e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2019 07:27:50.7526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2687
Subject: Re: [Xen-devel] [PATCH v4] x86/mm: Aggregate get entry and populate
 into common funcs
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
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416072750.reQzZB4tMgr6HO8FBEBJgXFCI_l9-6D4i_-mgrb4OXQ@z>

DQoNCk9uIDE1LjA0LjIwMTkgMTg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBBbGV4YW5k
cnUgU3RlZmFuIElTQUlMQSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IDA0LzE1LzE5IDExOjIz
IEFNID4+Pg0KPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaA0KPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wMm0uaA0KPj4gQEAgLTUxNCw2ICs1MTQsMjMgQEAgc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZu
KQ0KPiAgICAgICAgICAgPnJldHVybiBtZm5feChtZm4pOw0KPj4gfQ0KPiAgID4NCj4+ICtpbnQg
Z2V0X2FsdHAybV9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgZ2ZuX3QgZ2ZuLCBtZm5f
dCAqbWZuLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nl
c3NfdCAqYSwgYm9vbCBwcmVwb3B1bGF0ZSk7DQo+PiArDQo+PiArc3RhdGljIGlubGluZSBpbnQg
YWx0cDJtX2dldF9lbnRyeV9kaXJlY3Qoc3RydWN0IHAybV9kb21haW4gKmFwMm0sDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZu
X3QgKm1mbiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcDJtX3R5cGVfdCAqdCwgcDJtX2FjY2Vzc190ICphKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJu
IGdldF9hbHRwMm1fZW50cnkoYXAybSwgZ2ZuLCBtZm4sIHQsIGEsIGZhbHNlKTsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIGlubGluZSBpbnQgYWx0cDJtX2dldF9lbnRyeV9wcmVwb3B1bGF0ZShz
dHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9h
Y2Nlc3NfdCAqYSkNCj4+ICt7DQo+PiArICAgIHJldHVybiBnZXRfYWx0cDJtX2VudHJ5KGFwMm0s
IGdmbiwgbWZuLCB0LCBhLCB0cnVlKTsNCj4+ICt9DQo+IA0KPiBUaGUgd29ya2VyIGZ1bmN0aW9u
IG5hbWUgd291bGQgaW1vIGJldHRlciBiZSBhbHRwMm1fZ2V0X2VudHJ5KCksIHRoZW4gaW4gbGlu
ZQ0KPiB3aXRoIGl0cyB0d28gd3JhcHBlcnMuDQo+IA0KDQpPayBpdCB3aWxsIGJlIGNoYW5nZWQg
aW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
