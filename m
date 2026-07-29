Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19732C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:22:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376037.1623002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5AL-0007MZ-Hs; Wed, 29 Jul 2026 14:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376037.1623002; Wed, 29 Jul 2026 14:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp5AL-0007MS-FJ; Wed, 29 Jul 2026 14:21:49 +0000
Received: by outflank-mailman (input) for mailman id 1376037;
 Wed, 29 Jul 2026 14:21:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp5AJ-0007MM-94
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:21:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp5AI-000ETF-M0
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:21:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fae40a900000e099@swg.vates.tech>)
 id 6a6a0c71-e002-0a2a0a5209dd-0a2a4507c6aa-28
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:21:46 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fae40a900000e099@swg.vates.tech>)
 id 6a6a0c79-b4ea-0a2a45070019-b9ff1c22b6fd-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:21:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fae40a900000e099.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 14:21:40 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2D94C81C1D;
 Wed, 29 Jul 2026 16:21:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=oq7+l4UxWcyMbFULAg6Ak2HLe75d3PW1dyViCebHpxw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=BSmi/XawpVYJW2YnUT/oGsPNBhOfFgs0dypWBB9YRkw3YTnqswCRA0oH/lmAbY7GpCXVsB7d6
 WjKH2ftvD2H/RP2riWkG13ZgSoj6YO9PIqdAEpdfugVTTUAL7mF6wShHEY3e1id4ItEqEmIkgeU
 VlWqIzIMhTNwIB6aOuA9YzFiHiOO2jy11Z6aIIc5VI85X+tRX4dWZTQL0mPVrZ93snatfjnQvAb
 AWs2QKx/J+syWMneTQMXguhqglEG8o4a6yOQ3yt3QF3X0WK5UYEjCqY0ajWkJv7rZD1d7nkMzWH
 9I7tmxjPsT5lNeU+ukLDOmxAWLabc6bZKyzd6qchKhqw==
X-Zone-Loop: a8683482a2da3466937d058eb4bba5398fc007132a49
x-campaign-type: default
x-transaction-id: d4d2196a-48de-4e95-9965-571cba2910d3
x-swg-uid: 01-402ee8c3-139a-410b-8140-2874dd88a783
X-Mailer: Sweego
Message-ID:
 <1785334901.8631fc262581453bbf619ec5b2062170.19fae40a900000e099@vates.tech>
x-swg-bid: 1785334901.8631fc262581453bbf619ec5b2062170.19fae40a900000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 29 Jul 2026 16:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.22] x86/cpu-policy: set up host policy earlier
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gDIsH353XH9uw7xyuYf0R3gs"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785334900369
X-purgate-ID: tlsNG-ef75cf/1785334906-A7AD0AE4-70CEDE54/10/73395122804
X-purgate-type: spam
X-purgate-size: 6558

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gDIsH353XH9uw7xyuYf0R3gs
Content-Type: multipart/mixed; boundary="------------vusaB2Lq4I2SOGCjfzhrSbtS";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-ID: <3cadf821-118e-4cc3-b933-384b0c68b8c0@vates.tech>
Subject: Re: [PATCH v3 for-4.22] x86/cpu-policy: set up host policy earlier
References: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>
In-Reply-To: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>

--------------vusaB2Lq4I2SOGCjfzhrSbtS
Content-Type: multipart/mixed; boundary="------------UWj05hT0Ru4UqnoA0ExkkVV9"

--------------UWj05hT0Ru4UqnoA0ExkkVV9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDcvMjAyNiDDoCAxNjo1NSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gSW4g
b3JkZXIgdG8gdXNlIGNwdV9oYXNfKiBleHBhbmRpbmcgdG8gaG9zdF9jcHVfcG9saWN5Lios
IHRoZSBob3N0IHBvbGljeQ0KPiBuZWVkcyBzZXR0aW5nIHVwIGFsb25nc2lkZSBib290X2Nw
dV9kYXRhLng4Nl9jYXBhYmlsaXR5W10uIEFycmFuZ2UgZm9yDQo+IHRoYXQgdG93YXJkcyB0
aGUgZW5kIG9mIGlkZW50aWZ5X2NwdSgpLiBUaGVuIG1ha2Ugc3VyZSAueDg2X2NhcGFiaWxp
dHlbXQ0KPiBhbmQgaG9zdCBwb2xpY3kgcmVtYWluIGluIHN5bmMgd2hlbiBzZXR1cF97Zm9y
Y2UsY2xlYXJ9X2NwdV9jYXAoKSBhcmUNCj4gdXNlZC4NCj4gDQo+IFJlbmFtZSB0aGUgZnVu
Y3Rpb24gbm93IGl0J3Mgbm8gbG9uZ2VyIHN0YXRpYy4NCj4gDQo+IEZpeGVzOiA4OTRiZDc2
MTc5MjQgKCJ4ODYvSW50ZWw6IHVzZSBob3N0IENQVSBwb2xpY3kgZm9yIEFSQVQgY2hlY2tp
bmciKQ0KPiBSZXBvcnRlZC1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFJlbGVhc2UtQWNrZWQtYnk6IE9sZWtzaWkg
S3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KPiAtLS0NCg0KUmV2aWV3
ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KDQo+IFRoaXMg
cmVhbGx5IHdhcyBwYXJ0IG9mIG9uZSBvZiB0aGUgWFNUQVRFIGNsZWFudXAgcGF0Y2hlcyBh
dCB0aGUgaGVhZCBvZg0KPiB0aGUgQU1YIHNlcmllcy4gVGhpcyBleHBsYWlucyB0aGUgc3Bl
Y2lmaWMgcGxhY2VtZW50IGFoZWFkIG9mIHRoZSBjYWxsIHRvDQo+IHhzdGF0ZV9pbml0KCkp
LiBMaWtlbHkgYW55dGhpbmcgZnJvbSB0aGVyZSBkb3dud2FyZHMgc2hvdWxkbid0IHJlYWxs
eQ0KPiBsaXZlIGluIGlkZW50aWZ5X2NwdSgpIGFueXdheS4NCj4gLS0tDQo+IHYzOiBNYWtl
IGNhbGwgZnJvbSBzZXR1cF9mb3JjZV9jcHVfY2FwKCkgY29uZGl0aW9uYWwuDQo+IHYyOiBD
YWxsIGNhbGN1bGF0ZV9ob3N0X2NwdV9wb2xpY3koKSBmcm9tIHNldHVwX3tmb3JjZSxjbGVh
cn1fY3B1X2NhcCgpDQo+ICAgICAgaW5zdGVhZCBvZiBmcm9tIGluaXRfZ3Vlc3RfY3B1X3Bv
bGljaWVzKCkuDQoNCg0KVGVkZHkNCg==
--------------UWj05hT0Ru4UqnoA0ExkkVV9
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------UWj05hT0Ru4UqnoA0ExkkVV9--

--------------vusaB2Lq4I2SOGCjfzhrSbtS--

--------------gDIsH353XH9uw7xyuYf0R3gs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpqDHMFAwAAAAAACgkQZg+p0QLLz9D6
sgv+KDJ1IsYTvQSAWCQidWKYmL6uTleH5YUfAOsA4cX1dk63cQ7UldZuZRgQQ4x7WNFdLbUO4KEm
Wts2uZsYSM913QhrzV0Z/YUvqdKINem8t6HNTUGRxr44X4oeXzmol/GSgi24O/SoWzeKRhc2A3F/
odadLDOoAaAae+p+zjuXXHZl0jcv9xnn6hr2gJV5kJJ7bHKl/xf1KgBrYsZ8oEFq5J30as9ho7cP
ZYBPs4vATMAp4UqQpWHF74/2XHfr7wVk8ugjIThwiCiSjxxsowxchzXYJYV9QpXBiNspzu8u43dq
dzhEjnlO6cs26UE0DwfSif0qo0WROsLcIY7umxsMFrkAKcR1+vFNWnIc+UzsB2Z+DRzIl99Gu1Dj
9AFrieT9xqBhGN33tJ0XeZUg1a8A5qh5+qdLRZTwNrXL6rayY489aDvk4n2s6fJwqD8nXGd91shO
IwWvfV0yeEk/qhkHk0V6NZasGs+OjM8AaZgHN9Q27AXNUe59RWN8bEXBmzeK
=XJMP
-----END PGP SIGNATURE-----

--------------gDIsH353XH9uw7xyuYf0R3gs--

