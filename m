Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B155606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=rwfEOOop
Received: from list by lists.xenproject.org with outflank-mailman.1468037.1677079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNoYX-0002z7-2D; Mon, 02 Nov 2026 09:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468037.1677079; Mon, 02 Nov 2026 09:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNoYW-0002z0-Vq; Mon, 02 Nov 2026 09:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1468037;
 Mon, 02 Nov 2026 09:42:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a19ba356aa000403d@swg.vates.tech>)
 id 1xNoYV-0002yr-US
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 09:42:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNoYU-00ABJP-WB
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:42:19 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a19ba356aa000403d@swg.vates.tech>)
 id 6ae85af7-bab6-0a2a0a5309dd-0a2a4502ed30-16
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:42:18 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a19ba356aa000403d@swg.vates.tech>)
 id 6ae85afa-6ca4-0a2a45020019-b9ff1c238f1d-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:42:18 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a19ba356aa000403d.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Nov 2026 09:42:15 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id A58CF82DC0;
 Mon,  2 Nov 2026 10:42:14 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=fgGbXtGv+qWKErLDr2OuZWLGn8/IbrxpJyk81GH6YNI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rwfEOOopn+PA01DflYIrinljGkg1W8FZ2z7zC9gho7b09A9jhS5aEkK2XV0nJg3PDUWAE68ZK
 IIY+hPIqIac3hz4iquUNXdvk5jK/yFnAgRfLW2BwOqGnrzfHgU7P8CwuWiW7V37bMzlvRkG+77z
 Ox/x8ySsg5wHNFsOvADPRmQgkt6WJHj/YPWoPNrjiu4EBz/NOZZd+TCfm757UBuiqVpI9t9Oihp
 +1A/P9iFG7eTE1O+AHF+CR+w6YjCpZIzPON9d1JRhWpfiENW3UwYf9jWN8wTJIuSssGS69f7OMB
 MViFueKNIqFvURLkFYnJCw5t1VryPIdY2O5IxObHxjVw==
X-Zone-Loop: 68b9befdfa89492c2f50c365aba40da1aedd2925962f
x-campaign-type: default
x-transaction-id: 0d0dc643-18f7-4d42-8ba6-4a5c28dbbf48
x-swg-uid: 01-fbb435a9-e611-49fe-a74d-bc77cd4e1744
X-Mailer: Sweego
Message-ID:
 <1793612535.8631fc262581453bbf619ec5b2062170.1a19ba356aa000403d@vates.tech>
x-swg-bid: 1793612535.8631fc262581453bbf619ec5b2062170.1a19ba356aa000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 2 Nov 2026 10:42:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/cpu: keep cached TSC_AUX state coherent with
 hardware
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20261030132419.84264-1-roger@xenproject.org>
 <20261030132419.84264-2-roger@xenproject.org>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261030132419.84264-2-roger@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------APUZFX7juZjxwdqLuuLRblE0"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793612534769
X-purgate-ID: tlsNG-720697/1793612538-30DC12AC-0622CD11/0/0
X-purgate-type: clean
X-purgate-size: 6706
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------APUZFX7juZjxwdqLuuLRblE0
Content-Type: multipart/mixed; boundary="------------Wysme1sO6ew5ZCAPzcJWxu1B";
 protected-headers="v1"; hp="clear"
Message-ID: <507ee181-bc4b-4a6a-9f4a-1706ba261ff1@vates.tech>
Date: Mon, 2 Nov 2026 10:42:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/cpu: keep cached TSC_AUX state coherent with
 hardware
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20261030132419.84264-1-roger@xenproject.org>
 <20261030132419.84264-2-roger@xenproject.org>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261030132419.84264-2-roger@xenproject.org>

--------------Wysme1sO6ew5ZCAPzcJWxu1B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMTAvMjAyNiDDoCAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIGEgw6ljcml0wqA6DQo+
IE9uIENQVSBicmluZ3VwIGRvbid0IGFzc3VtZSB0aGF0IFRTQ19BVVggaXMgMCwgd3JpdGUg
MCB0byBpdCB0byBlbnN1cmUgdGhlDQo+IHBlci1DUFUgY2FjaGVkIHN0YXRlIG1hdGNoZXMg
dGhlIGhhcmR3YXJlLiAgQWxzbyBwcm9wYWdhdGUgdGhlIGNhY2hlZCB2YWx1ZQ0KPiBvbiBy
ZXN1bWUgZnJvbSBzdXNwZW5kLCBpbiBjYXNlIHRoZSByZWdpc3RlciB2YWx1ZSBoYXMgYmVl
biByZXNldCBkdXJpbmcNCj4gc3VzcGVuc2lvbi4NCj4gDQo+IEZpeGVzOiBjYzBlNDVkYjI3
NzkgKCJ4ODYvcHY6IEF2b2lkIGxlYWtpbmcgb3RoZXIgZ3Vlc3RzJyBNU1JfVFNDX0FVWCB2
YWx1ZXMgaW50byBQViBjb250ZXh0IikNCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXJAeGVucHJvamVjdC5vcmc+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9h
Y3BpL3Bvd2VyLmMgfCAzICsrKw0KPiAgIHhlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgfCA1
ICsrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2Fj
cGkvcG93ZXIuYw0KPiBpbmRleCAzNDUyNjUwYTYxZDUuLjQ2NDg0NmU3MzcyNyAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYw0KPiArKysgYi94ZW4vYXJjaC94
ODYvYWNwaS9wb3dlci5jDQo+IEBAIC0yNzksNiArMjc5LDkgQEAgc3RhdGljIGludCBlbnRl
cl9zdGF0ZSh1MzIgc3RhdGUpDQo+ICAgICAgICAgICBjaS0+bGFzdF9zcGVjX2N0cmwgPSBk
ZWZhdWx0X3hlbl9zcGVjX2N0cmw7DQo+ICAgICAgIH0NCj4gICANCj4gKyAgICBpZiAoIGNw
dV9oYXNfbXNyX3RzY19hdXggKQ0KPiArICAgICAgICB3cm1zcm5zKE1TUl9UU0NfQVVYLCB0
aGlzX2NwdSh0c2NfYXV4KSk7DQo+ICsNCj4gICAgICAgdXBkYXRlX21jdV9vcHRfY3RybCgp
Ow0KPiAgICAgICB1cGRhdGVfcGJfb3B0X2N0cmwoKTsNCj4gICANCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5j
DQo+IGluZGV4IDQzNzg1ZDE5Y2M3My4uNWJlYWUwZTg3ZjQ5IDEwMDY0NA0KPiAtLS0gYS94
ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29t
bW9uLmMNCj4gQEAgLTkyNiw2ICs5MjYsMTEgQEAgdm9pZCBjcHVfaW5pdCh2b2lkKQ0KPiAg
IA0KPiAgIAkvKiBFbmFibGUgTk1Jcy4gIE91ciBsb2FkZXIgKGUuZy4gVGJvb3QpIG1heSBo
YXZlIGxlZnQgdGhlbSBkaXNhYmxlZC4gKi8NCj4gICAJZW5hYmxlX25taXMoKTsNCj4gKw0K
PiArCWlmIChjcHVfaGFzX21zcl90c2NfYXV4KSB7DQo+ICsJCXdybXNybnMoTVNSX1RTQ19B
VVgsIDApOw0KPiArCQl0aGlzX2NwdSh0c2NfYXV4KSA9IDA7DQo+ICsJfQ0KPiAgIH0NCj4g
ICANCj4gICB2b2lkIGNwdV91bmluaXQodW5zaWduZWQgaW50IGNwdSkNCg0KTG9va3MgZ29v
ZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRl
cy50ZWNoPg0KDQpUZWRkeQ0K

--------------Wysme1sO6ew5ZCAPzcJWxu1B--

--------------APUZFX7juZjxwdqLuuLRblE0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmroWvYFAwAAAAAACgkQZg+p0QLLz9AP
hAv/flAg1bO5TW37Y1QwbiwBuvFlCIt+L3znJZI8tknmCZqJDqhqMGngjnO8A43GbgHz0BpR715d
xPplvQdgHgMv8MZIWPxMlIGxbNKClP4Lag34XCWDvdI3WU9egvURGWUVnKcYcIhfAB6qw44jVvIc
BRAp0GTS457GA/hDpoTWhM8g48LS369tnWN4DTo7kdlBctxVx3SYVD3Hagsl/s4QnvLYgVhkKpN9
ntz2Zhm1y9dn3ov8FbH7Mb3q8dNA76acrIqYRKMNwkKa4u6PQ0OIymeJx4OJ51DhjRrEB6WYZhMQ
gjsa2qFVPu/6dTawzcagVBxvGBkNRBg8n1rZ/BC/aJRuRi9D33XVwU8QVxGG+f6bpftXdygs/tAU
elIhpDjlMiT62oplDGfHFxWLMByDe5o2xnc04XeQpscHnvMS78T+7Rv6EbrMDBNkafFJQfpPjEhc
9T7yOJlAmXaTQDkUDF3nr35mA20EC/3BKVMc0Vuv5xPaIyKdwKd5UL9yqO3N
=djKn
-----END PGP SIGNATURE-----

--------------APUZFX7juZjxwdqLuuLRblE0--

