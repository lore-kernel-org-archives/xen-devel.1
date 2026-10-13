Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7779CCC6B0F
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 06:58:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446689.1662783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGWSO-00089C-0E; Tue, 13 Oct 2026 06:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446689.1662783; Tue, 13 Oct 2026 06:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGWSN-000895-TW; Tue, 13 Oct 2026 06:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1446689;
 Tue, 13 Oct 2026 06:57:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGWSM-00087Y-DT
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 06:57:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGWSL-00EDWd-5b
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 08:57:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1340d8f0b0008d8d@swg.vates.tech>)
 id 6acdd66c-e002-0a2a0a5209dd-0a2a450b8d50-2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:57:49 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1340d8f0b0008d8d@swg.vates.tech>)
 id 6acdd66c-b7e8-0a2a450b0019-b9ff1c2397a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:57:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1340d8f0b0008d8d.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 13 Oct 2026 06:57:46 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 55DCD8296E;
 Tue, 13 Oct 2026 08:57:45 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=4fuGpePABOwGGJpKSCqm71VriePSuppL4vi1OeBS1bI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GSlysjZ1hWuucySAotMQ0vXTdewrlDoetOogiTY79FiJbkxXAk8AFGLdpPpTDbs0UqwR702s3
 ug3mpQJcZYwY5V2St0XHSJJdqWm2NMeRGCrJT6vCSftgdpzs3nXTt7j/evknht5FV3O9iyWE3ri
 bQEZAY9TRsXRqumRpFTXLsY2Jygt9qq++17oYCCl945Bywv0YtN0QjJ2CLiBOwLhGV1x4IkZ7NK
 iFBoechqzMGzuBMwInmAGbZueSDzGf0IFMP7g9r0MCsc2DNnc/Pz1TNuv+XQnzw9ViA3ijouBFJ
 TbhghGcAPCMVz3k4stWHP4NZg3763914EqulI0qJmigg==
X-Zone-Loop: 80553471785c33cb766605be71207cb4f049ff03d06c
x-campaign-type: default
x-transaction-id: 1d0b6fba-37f3-42f4-95c3-e0d080ab81f9
x-swg-uid: 01-2fad12ff-d8b1-4f0d-a154-7d680d89ed38
X-Mailer: Sweego
Message-ID:
 <1791874666.8631fc262581453bbf619ec5b2062170.1a1340d8f0b0008d8d@vates.tech>
x-swg-bid: 1791874666.8631fc262581453bbf619ec5b2062170.1a1340d8f0b0008d8d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 13 Oct 2026 08:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Hs2EcrPLcMbZOhxY0WD1eWMb"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791874665465
X-purgate-ID: tlsNG-42698a/1791874668-A90CD9EA-3A1A6707/10/78276251493
X-purgate-type: spam
X-purgate-size: 9941

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Hs2EcrPLcMbZOhxY0WD1eWMb
Content-Type: multipart/mixed; boundary="------------X31SnU5nEI9RxwotPhiFAi5l";
 protected-headers="v1"; hp="clear"
Message-ID: <c9ae297e-bd4c-4864-9409-1899d5b3cb72@vates.tech>
Date: Tue, 13 Oct 2026 08:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com>

--------------X31SnU5nEI9RxwotPhiFAi5l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTIvMTAvMjAyNiDDoCAxMDoyMywgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gcHZo
X3BvcHVsYXRlX3AybSgpIG5lZWRzIHRvIHBvcHVsYXRlIFJBTSBhY2NvcmRpbmcgdG8gdGhl
IGluaXRpYWwgbWFwDQo+IGVzdGFibGlzaGVkLCBwcmlvciB0byBhbnkgc3RlYWxpbmcgYnkg
cHZoX3N0ZWFsX3JhbSgpLiBTdWJzZXF1ZW50bHkgdGhlDQo+IGludm9jYXRpb25zIG9mIHRo
b3NlIGZ1bmN0aW9ucyB3aWxsIChuZWVkIHRvKSBtb3ZlIGFoZWFkIG9mDQo+IHB2aF9wb3B1
bGF0ZV9wMm0oKSwgc28gd2hhdCB0byBhY3Qgb24gaXMgbm8gbG9uZ2VyIERvbTAncyBtZW1v
cnkgbWFwIGF0DQo+IHRoZSB0aW1lIG9mIGludm9jYXRpb24uDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0KPiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2Rv
bTBfYnVpbGQuYw0KPiBAQCAtMTMsNiArMTMsNyBAQA0KPiAgICNpbmNsdWRlIDx4ZW4vbXVs
dGlib290Lmg+DQo+ICAgI2luY2x1ZGUgPHhlbi9wY2kuaD4NCj4gICAjaW5jbHVkZSA8eGVu
L3NvZnRpcnEuaD4NCj4gKyNpbmNsdWRlIDx4ZW4veHZtYWxsb2MuaD4NCj4gICANCj4gICAj
aW5jbHVkZSA8YWNwaS9hY3RhYmxlcy5oPg0KPiAgIA0KPiBAQCAtNDEzLDcgKzQxNCwxMCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgcHZoX2luaXRfcDJtKHN0cnVjdCBkDQo+ICAgICAgIH0g
d2hpbGUgKCBwcmVlbXB0ZWQgKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW50IF9faW5p
dCBwdmhfcG9wdWxhdGVfcDJtKHN0cnVjdCBkb21haW4gKmQpDQo+ICtzdGF0aWMgaW50IF9f
aW5pdCBwdmhfcG9wdWxhdGVfcDJtKA0KPiArICAgIHN0cnVjdCBkb21haW4gKmQsDQo+ICsg
ICAgY29uc3Qgc3RydWN0IGU4MjBlbnRyeSAqZTgyMCwNCj4gKyAgICB1bnNpZ25lZCBpbnQg
bnJfZTgyMCkNCj4gICB7DQo+ICAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gZC0+dmNwdVswXTsN
Cj4gICAgICAgdW5zaWduZWQgaW50IGk7DQo+IEBAIC00MjEsMTUgKzQyNSwxNSBAQCBzdGF0
aWMgaW50IF9faW5pdCBwdmhfcG9wdWxhdGVfcDJtKHN0cnVjDQo+ICAgI2RlZmluZSBNQjFf
UEFHRVMgUEZOX0RPV04oTUIoMSkpDQo+ICAgDQo+ICAgICAgIC8qIFBvcHVsYXRlIG1lbW9y
eSBtYXAuICovDQo+IC0gICAgZm9yICggaSA9IDA7IGkgPCBkLT5hcmNoLm5yX2U4MjA7IGkr
KyApDQo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBucl9lODIwOyBpKysgKQ0KPiAgICAgICB7
DQo+ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIHNpemU7DQo+ICAgDQo+IC0gICAg
ICAgIGlmICggZC0+YXJjaC5lODIwW2ldLnR5cGUgIT0gRTgyMF9SQU0gKQ0KPiArICAgICAg
ICBpZiAoIGU4MjBbaV0udHlwZSAhPSBFODIwX1JBTSApDQo+ICAgICAgICAgICAgICAgY29u
dGludWU7DQo+ICAgDQo+IC0gICAgICAgIGFkZHIgPSBQRk5fRE9XTihkLT5hcmNoLmU4MjBb
aV0uYWRkcik7DQo+IC0gICAgICAgIHNpemUgPSBQRk5fRE9XTihkLT5hcmNoLmU4MjBbaV0u
c2l6ZSk7DQo+ICsgICAgICAgIGFkZHIgPSBQRk5fRE9XTihlODIwW2ldLmFkZHIpOw0KPiAr
ICAgICAgICBzaXplID0gUEZOX0RPV04oZTgyMFtpXS5zaXplKTsNCj4gICANCj4gICAgICAg
ICAgIHJjID0gcHZoX3BvcHVsYXRlX21lbW9yeV9yYW5nZShkLCBhZGRyLCBzaXplKTsNCj4g
ICAgICAgICAgIGlmICggcmMgKQ0KPiBAQCAtNDM4LDExICs0NDIsMTEgQEAgc3RhdGljIGlu
dCBfX2luaXQgcHZoX3BvcHVsYXRlX3AybShzdHJ1Yw0KPiAgICAgICAgICAgaWYgKCBhZGRy
IDwgTUIxX1BBR0VTICkNCj4gICAgICAgICAgIHsNCj4gICAgICAgICAgICAgICB1aW50NjRf
dCBlbmQgPSBtaW5fdCh1aW50NjRfdCwgTUIoMSksDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBkLT5hcmNoLmU4MjBbaV0uYWRkciArIGQtPmFyY2guZTgyMFtpXS5z
aXplKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGU4MjBbaV0uYWRk
ciArIGU4MjBbaV0uc2l6ZSk7DQo+ICAgICAgICAgICAgICAgZW51bSBodm1fdHJhbnNsYXRp
b25fcmVzdWx0IHJlcyA9DQo+ICAgICAgICAgICAgICAgICAgICBodm1fY29weV90b19ndWVz
dF9waHlzKG1mbl90b19tYWRkcihfbWZuKGFkZHIpKSwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX3ZpcnQoYWRkciksDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5kIC0gZC0+YXJjaC5lODIwW2ld
LmFkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW5k
IC0gZTgyMFtpXS5hZGRyLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2KTsNCj4gICANCj4gICAgICAgICAgICAgICBpZiAoIHJlcyAhPSBIVk1UUkFO
U19va2F5ICkNCj4gQEAgLTEzNTIsNiArMTM1Niw4IEBAIGludCBfX2luaXQgZG9tMF9jb25z
dHJ1Y3RfcHZoKGNvbnN0IHN0cnUNCj4gICAgICAgcGFkZHJfdCBlbnRyeSwgc3RhcnRfaW5m
bzsNCj4gICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGJkLT5kOw0KPiAgICAgICBzdHJ1Y3Qg
ZWxmX2JpbmFyeSBlbGY7DQo+ICsgICAgc3RydWN0IGU4MjBlbnRyeSAqb3JpZ19lODIwOw0K
PiArICAgIHVuc2lnbmVkIGludCBucl9vcmlnX2U4MjA7DQo+ICAgICAgIGludCByYzsNCj4g
ICANCj4gICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICIqKiogQnVpbGRpbmcgYSBQVkggRG9t
JWQgKioqXG4iLCBkLT5kb21haW5faWQpOw0KPiBAQCAtMTM4OSw2ICsxMzk1LDE1IEBAIGlu
dCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHZoKGNvbnN0IHN0cnUNCj4gICANCj4gICAgICAg
aW9tbXVfaHdkb21faW5pdChkKTsNCj4gICANCj4gKyAgICBucl9vcmlnX2U4MjAgPSBkLT5h
cmNoLm5yX2U4MjA7DQo+ICsgICAgb3JpZ19lODIwID0geHZtYWxsb2NfYXJyYXkoc3RydWN0
IGU4MjBlbnRyeSwgbnJfb3JpZ19lODIwKTsNCj4gKyAgICBpZiAoICFvcmlnX2U4MjAgKQ0K
PiArICAgIHsNCj4gKyAgICAgICAgcHJpbnRrKCJObyBtZW1vcnkgZm9yIGNvcHkgb2YgRTgy
MCBtYXAgKCV1IGVudHJpZXMpXG4iLCBucl9vcmlnX2U4MjApOw0KPiArICAgICAgICByZXR1
cm4gLUVOT01FTTsNCj4gKyAgICB9DQo+ICsgICAgbWVtY3B5KG9yaWdfZTgyMCwgZC0+YXJj
aC5lODIwLCBucl9vcmlnX2U4MjAgKiBzaXplb2YoKm9yaWdfZTgyMCkpOw0KPiArDQoNCkkg
ZG9uJ3Qga25vdyBpZiB0aGF0IG1hdHRlcnMgbXVjaCwgYnV0IGlmIGFueXRoaW5nIGFmdGVy
IA0KKHB2aF9wbGFjZV9rZXJuZWwsIHB2aF9wbGFjZV9hY3BpLCAuLi4pIGZhaWxzLCB3ZSBs
ZWFrIG9yaWdfZTgyMC4NCg0KPiAgICAgICByYyA9IHB2aF9wbGFjZV9rZXJuZWwoYmQsICZl
bGYsICZlbnRyeSk7DQo+ICAgICAgIGlmICggcmMgKQ0KPiAgICAgICB7DQo+IEBAIC0xMzk2
LDEzICsxNDExLDE1IEBAIGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHZoKGNvbnN0IHN0
cnUNCj4gICAgICAgICAgIHJldHVybiByYzsNCj4gICAgICAgfQ0KPiAgIA0KPiAtICAgIHJj
ID0gcHZoX3BvcHVsYXRlX3AybShkKTsNCj4gKyAgICByYyA9IHB2aF9wb3B1bGF0ZV9wMm0o
ZCwgb3JpZ19lODIwLCBucl9vcmlnX2U4MjApOw0KPiAgICAgICBpZiAoIHJjICkNCj4gICAg
ICAgew0KPiAgICAgICAgICAgcHJpbnRrKCJGYWlsZWQgdG8gc2V0dXAgRG9tMCBwaHlzaWNh
bCBtZW1vcnkgbWFwXG4iKTsNCj4gICAgICAgICAgIHJldHVybiByYzsNCj4gICAgICAgfQ0K
PiAgIA0KPiArICAgIHh2ZnJlZShvcmlnX2U4MjApOw0KPiArDQo+ICAgICAgIHJjID0gcHZo
X2xvYWRfa2VybmVsKGJkLCAmZWxmLCAmc3RhcnRfaW5mbyk7DQo+ICAgICAgIGlmICggcmMg
KQ0KPiAgICAgICB7DQoNCg==

--------------X31SnU5nEI9RxwotPhiFAi5l--

--------------Hs2EcrPLcMbZOhxY0WD1eWMb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrN1mkFAwAAAAAACgkQZg+p0QLLz9A7
lwv+PrU33hKzJ9R+5YCBiHJTe4KIGkppG1ESmNnB7l3DUyKRbTMAme2qafcjx1jmckCS37JDVkXR
FYBLZPpmUxh8TQ/P9B3JAExqf1v6u4mA9HVpHlWiYA/UAGgKpLtvY1GIxeehBhb3AgE/hUq4svBU
iKUuaIho3CvQL+r+ejE7UlC5U6uiFEeEAECO//iwdMCj3Ay017NCbbKrr7AkbTFc0UmtDNKyo4dP
13nb2Vv9PUJTj2IBsL6acxCYaoLDLtFLyEwkC936wk7NHNr16Dv4w+KogNMPwjVNObz46JlIca2k
r3U2IbLnTKXWA7pu1SpKg5eJYLB/mgtfDV+DalNjZrHYdAZD1bdmFK9UdXcOvZYDJ3ZBTdz52/Bm
P7aL+Tn0Tsj96X7IIO67cVbG6E+xN9dPNNDjeI0K8FZoY3PdnekMLThSvN9ZTdUL8jwRYniYe5XW
fseN5Q2t54gXtGmW6UH2n6kacpRaN3n/uMXpUt93B9+7d3Pb1t91cCt4pTHj
=M6Ku
-----END PGP SIGNATURE-----

--------------Hs2EcrPLcMbZOhxY0WD1eWMb--

