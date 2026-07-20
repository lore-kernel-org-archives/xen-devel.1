Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F61C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:02:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366333.1616220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljtI-0002Ng-FE; Mon, 20 Jul 2026 09:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366333.1616220; Mon, 20 Jul 2026 09:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljtI-0002NZ-Ce; Mon, 20 Jul 2026 09:02:24 +0000
Received: by outflank-mailman (input) for mailman id 1366333;
 Mon, 20 Jul 2026 09:02:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7ec30930000edb5@swg.vates.tech>)
 id 1wljtG-0002NT-JF
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:02:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljtF-00FChm-V4
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:02:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7ec30930000edb5@swg.vates.tech>)
 id 6a5de413-e002-0a2a0a5209dd-0a2a450addec-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:02:21 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7ec30930000edb5@swg.vates.tech>)
 id 6a5de41d-f2d2-0a2a450a0019-b9ff1c22a9c3-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:02:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f7ec30930000edb5.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Jul 2026 09:02:18 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2E51182A71;
 Mon, 20 Jul 2026 11:02:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9Vo2cEaA4i3D8nMD06sBcRREZ5KnpnHpVYIMEm2IqMw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=hL47BP2/QnRZcQnFEidsf0CX/R7oYglSPueRtQVpzTshU8YI0o0z+uf3fO1a8udvfdTwWqRc0
 W9RqLPaORBwM8l+YWJJ2Zbh9vQl281rBfDpVZ/Yh8fL18UiFFK18P3J+6Q8gJpGlrJH7yQr+8Qn
 0k4eqvX35q5FQxzHZ9LfF4wpJZh+DkXcrAG9v2YzaBT/c4fOdK5VG8CljScGY+sDPkrVIBjdcv0
 MeoQhMt/JDSbL+VH4rYcZNt26/j2kHoDmYMaqedx24fVZ1Mrf5fEh7zjp5Qn0Mkr/amFyw5e9x1
 AtyJfFWWOcZZu8tM7AmJA/LFL7DaBY2Cqg2MGixaRYPA==
X-Zone-Loop: 888eead32ed25e21f08d6b64b88be5e45b9e336c9c11
x-campaign-type: default
x-transaction-id: 5e35224f-c2d1-4e25-80f9-1f3998c67214
x-swg-uid: 01-446e8f58-35df-4e21-8ddd-7e287a32d491
X-Mailer: Sweego
Message-ID:
 <1784538139.8631fc262581453bbf619ec5b2062170.19f7ec30930000edb5@vates.tech>
x-swg-bid: 1784538139.8631fc262581453bbf619ec5b2062170.19f7ec30930000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 20 Jul 2026 11:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------buGZHxVghXJj1aGtGoAqnZhD"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784538138316
X-purgate-ID: tlsNG-4011c0/1784538141-534D7CFC-F73FCA15/0/0
X-purgate-type: clean
X-purgate-size: 5851

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------buGZHxVghXJj1aGtGoAqnZhD
Content-Type: multipart/mixed; boundary="------------V0u006sfdWOas36jqGdUhZgU";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <d1238cdb-9a91-4ea0-abd3-e78f2f771e02@vates.tech>
Subject: Re: [PATCH] x86/domctl: restore all registers in
 arch_{get,set}_info_guest()
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>

--------------V0u006sfdWOas36jqGdUhZgU
Content-Type: multipart/mixed; boundary="------------HSJ0dz0yfqqPEGc2WEymeia3"

--------------HSJ0dz0yfqqPEGc2WEymeia3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDcvMjAyNiDDoCAwMjoxNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIGEg
w6ljcml0wqA6DQo+IENvbW1pdCA5Zjg5MmY4NGMyNzkgKCJ4ODYvZG9tY3RsOiBTdG9wIHVz
aW5nIFhMQVRfY3B1X3VzZXJfcmVncygpIikNCj4gY29udmVydGVkIG1lbWNweSgpIG9mIHRo
ZSBjcHVfdXNlcl9yZWdzIHN0cnVjdHVyZSB0byBleHBsaWNpdCBjb3B5IG9mDQo+IGl0cyBm
aWVsZHMuIEluIHRoZSBjb21wYXQgY2FzZSwgaXQgaW50ZW50aW9uYWxseSBtaXNzZWQgZmV3
IG9mIHRoZW0sDQo+IG5hbWVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gQnV0IHRoZSA2NGJp
dCBjYXNlIG1pc3NlZCBhbHNvIHI4LXIxNQ0KPiByZWdpc3RlcnMsIHdoaWNoIHdhcyBub3Qg
aW50ZW50aW9uYWwuIFRoaXMsIGF0IGxlYXN0LCBjYXVzZWQgTGludXgNCj4gNi4xOC54IGNy
YXNoIHdoZW4gcmVzdW1pbmcgUFZIIGRvbVUuDQo+IA0KPiBGaXggaXQgYnkgYWRkaW5nIG1p
c3NpbmcgYXNzaWdubWVudHMuDQo+IA0KPiBGaXhlczogOWY4OTJmODRjMjc5ICgieDg2L2Rv
bWN0bDogU3RvcCB1c2luZyBYTEFUX2NwdV91c2VyX3JlZ3MoKSIpDQo+IFNpZ25lZC1vZmYt
Ynk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2
YXRlcy50ZWNoPg0K
--------------HSJ0dz0yfqqPEGc2WEymeia3
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------HSJ0dz0yfqqPEGc2WEymeia3--

--------------V0u006sfdWOas36jqGdUhZgU--

--------------buGZHxVghXJj1aGtGoAqnZhD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpd5BgFAwAAAAAACgkQZg+p0QLLz9BJ
cgv/fTWKMTFv9gImDuEw9FC1kAOq0maTxrKOxyGmaxebnbjI5MjXuZ9+pWip6mxYfVRi+yX93F1i
gRCva9fhob0ojuKDJybVUCKzBlJOQ7C8RBd9HsR5kpbU/On0nGbaZEfGYda0+gpL2sJTzN2qsKJJ
zZdSwbFPz88qAitmjgpILnGM1jwNbR/pQdHRIjb4NCAYfQQei3SrDdTeaJs0+u9f93vp1qptudoi
5+/rKOZ0ohlMfpFnuONDT66SCkKZat++DAldyqQFSJtT4b2RPLhh8hH0RYhTQMvErKyTzVY0GunH
++hYmJr0l/mCZtpOiU2TYM8MdhjGNNs1pODgSoUKBXZAlBsphL7XkPX03b5PULLXR/nOMafRHGk9
mJVFP50zavhCBXQPYaJk1Z5OAorj0zPuxS0usPp2DEyP9TNGLmfB2V73J0F3UtZbb3u4A9ouhPFK
PL+kJak63fNxU1C0ag/Cim9retPAcKnuhwUtmxw4mZabVAjGLvRGiVW2bhtA
=iC+q
-----END PGP SIGNATURE-----

--------------buGZHxVghXJj1aGtGoAqnZhD--

