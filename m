Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BE1C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:11:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405775.1639225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jnw-0006Ir-0I; Wed, 02 Sep 2026 12:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405775.1639225; Wed, 02 Sep 2026 12:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jnv-0006Ik-TI; Wed, 02 Sep 2026 12:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1405775;
 Wed, 02 Sep 2026 12:10:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a062077462000c4f3@swg.vates.tech>)
 id 1x1jnu-0006Ic-CA
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:10:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jnt-00GYN6-P8
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:10:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a062077462000c4f3@swg.vates.tech>)
 id 6a981250-e002-0a2a0a5209dd-0a2a4509e156-12
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:10:57 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a062077462000c4f3@swg.vates.tech>)
 id 6a981251-be1a-0a2a45090019-b9ff1c129891-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:10:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a062077462000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 02 Sep 2026 12:10:50 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2E5E682170;
 Wed,  2 Sep 2026 14:10:50 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=mky7CnlEcJGsmWLEstzMKkivu1t2UVpUflBhPOhqKAc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=dWUKl/KKTwGOKNBCfBoDXf24NiE/n6yTnY7Pu8LjXAYpq1WG1oqjQKcRqofMV0ls8WzRcTKeW
 +ERvSY7zh6XM2ceR1N2cfJLp3x+AB2G+Pkxux/9ZTSlLLueFvAhzRg2QOp6+j4uWniA+5bQw1ut
 h/bJ4Z7kt3wlgbvvE8QPz4BM4t8pMw2bDyQJotp8VHSWw1rrkbm5DrpcEVzoBYzys+pwSAFmtyU
 5amHeLjrzf+hPbwDUZxQ59mH2z+eFv+Dj2LhIK96e044Hv1+XfndofUUqLTizfAYhQQbvpBy/Dk
 dwDCU9QjqIkgDR0LrahVSiP72B0rNayDuawCJ5RG+PjQ==
X-Zone-Loop: bab569b70d2e938e159b954a7e2b568bf4a77fbecb9e
x-campaign-type: default
x-transaction-id: 7cd076b0-2348-4e72-bdd5-c267aaee86fb
x-swg-uid: 01-ed3be001-20c6-4963-9c15-574537ad9738
X-Mailer: Sweego
Message-ID:
 <1788351050.8631fc262581453bbf619ec5b2062170.1a062077462000c4f3@vates.tech>
x-swg-bid: 1788351050.8631fc262581453bbf619ec5b2062170.1a062077462000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 2 Sep 2026 14:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/bitops: Remove CONST_ADDR
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260902114339.62043-3-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------q8kNZoFsIjgt90DRv92X0UpL"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788351050385
X-purgate-ID: tlsNG-bad1c0/1788351057-FC212034-5E538B3F/0/0
X-purgate-type: clean
X-purgate-size: 6942

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------q8kNZoFsIjgt90DRv92X0UpL
Content-Type: multipart/mixed; boundary="------------6qvz7YUD6xpoRybqB3xtVs0t";
 protected-headers="v1"; hp="clear"
Message-ID: <d6893834-b31a-4df3-bd97-779d65c8d6cb@vates.tech>
Date: Wed, 2 Sep 2026 14:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/bitops: Remove CONST_ADDR
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260902114339.62043-1-andrew.cooper3@citrix.com>
 <20260902114339.62043-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260902114339.62043-3-andrew.cooper3@citrix.com>

--------------6qvz7YUD6xpoRybqB3xtVs0t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDIvMDkvMjAyNiDDoCAxMzo0MywgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBB
bGwgdGhpcyBkb2VzIGlzIG9iZnVzY2F0ZSB0aGUgdXNhZ2Ugc2l0ZXMuDQo+IA0KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXJAeGVu
cHJvamVjdC5vcmc+DQo+IENDOiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVj
aD4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4N
Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENDOiBCZXJ0cmFuZCBN
YXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IENDOiBNaWNoYWwgT3J6ZWwg
PG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiBDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiAtLS0NCj4gICB4ZW4vYXJjaC94ODYvaW5jbHVk
ZS9hc20vYml0b3BzLmggfCA1ICsrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaW5jbHVkZS9hc20vYml0b3BzLmggYi94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vYml0
b3BzLmgNCj4gaW5kZXggNjlmZmVkNTEwYzBhLi5mYmNhYjMyZmQyMzkgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9iaXRvcHMuaA0KPiArKysgYi94ZW4vYXJj
aC94ODYvaW5jbHVkZS9hc20vYml0b3BzLmgNCj4gQEAgLTE4LDcgKzE4LDYgQEANCj4gICAg
Ki8NCj4gICANCj4gICAjZGVmaW5lIEFERFIgKCoodm9sYXRpbGUgaW50ICopIGFkZHIpDQo+
IC0jZGVmaW5lIENPTlNUX0FERFIgKCooY29uc3Qgdm9sYXRpbGUgaW50ICopIGFkZHIpDQo+
ICAgDQo+ICAgLyoqDQo+ICAgICogc2V0X2JpdCAtIEF0b21pY2FsbHkgc2V0IGEgYml0IGlu
IG1lbW9yeQ0KPiBAQCAtMjg1LDcgKzI4NCw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IHZhcmlh
YmxlX3Rlc3RfYml0KGludCBuciwgY29uc3Qgdm9sYXRpbGUgdm9pZCAqYWRkcikNCj4gICAg
ICAgYXNtIHZvbGF0aWxlICggImJ0bCAlW25yXSwgJVthZGRyXVxuXHQiDQo+ICAgICAgICAg
ICAgICAgICAgICAgIEFTTV9GTEFHX09VVCgsICJzYmJsICVbb2xkXSwgJVtvbGRdXG5cdCIp
DQo+ICAgICAgICAgICAgICAgICAgICAgIDogW29sZF0gQVNNX0ZMQUdfT1VUKCI9QGNjYyIs
ICI9ciIpIChvbGRiaXQpDQo+IC0gICAgICAgICAgICAgICAgICAgOiBbYWRkcl0gIm0iIChD
T05TVF9BRERSKSwgW25yXSAiSXIiIChucikgOiAibWVtb3J5IiApOw0KPiArICAgICAgICAg
ICAgICAgICAgIDogW2FkZHJdICJtIiAoKihjb25zdCB2b2xhdGlsZSBpbnQgKilhZGRyKSwN
Cj4gKwkJICAgICBbbnJdICJJciIgKG5yKQ0KPiArCQkgICA6ICJtZW1vcnkiICk7DQo+ICAg
DQo+ICAgICAgIHJldHVybiBvbGRiaXQ7DQo+ICAgfQ0KDQpSZXZpZXdlZC1ieTogVGVkZHkg
QXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo=

--------------6qvz7YUD6xpoRybqB3xtVs0t--

--------------q8kNZoFsIjgt90DRv92X0UpL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqYEkkFAwAAAAAACgkQZg+p0QLLz9AR
vwwAjVCXqVuu/7GdT3mg3SZCX8C3qlNp2zF6oyEXJnQCcjOCjA7nkNrG0gSWlCvtO40S4cDT57nM
bWEktprRSTy937Xy7SBGMoiV8T3fkcfpHKym3RGflIr3shT/uvypVS/UKLWILLHY+xd73oloPaxF
+ckSlFplhsk2BeQ98qDc+GE1SV6qRY7BG4PC7q9kDBNx0z3u0H1gwDW1a/arJrmrVZTQZp9SbawV
yo9EA8dirmIIVpJeiCk11GRD1nyy0iJXarTFzC8h7m87ALL3oJYBpP2zkT7p5uqJGq4kOxAD/Pe9
IVTi8MQIq3GV3s1W1DDDZqDQs9UITy6fXxckP+Y0REPPC6d+AiZX5TY0tGA/OsLUuyR1aPZLN/PD
/7sedsIe7MOkRNJQqPWOtUD+l+ffYeBy3Gk2PGFvbpq3Z1ZV6pYzmWrKbeoysdbBdWlDghiBbN29
fiPhalzz2UKvAGNbG4ajZ+EtRiT1ut99ybAo+q1uuo4g8MHkOfky6c08GELZ
=Xyvi
-----END PGP SIGNATURE-----

--------------q8kNZoFsIjgt90DRv92X0UpL--

