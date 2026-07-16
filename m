Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C186C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 10:00:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363718.1615261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkIsb-0008Ou-Ch; Thu, 16 Jul 2026 09:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363718.1615261; Thu, 16 Jul 2026 09:59:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkIsb-0008On-9h; Thu, 16 Jul 2026 09:59:45 +0000
Received: by outflank-mailman (input) for mailman id 1363718;
 Thu, 16 Jul 2026 09:59:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@swg.vates.tech>)
 id 1wkIsZ-0008Oh-Nx
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:59:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkIsY-007Jay-TZ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:59:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@swg.vates.tech>)
 id 6a58ab88-e002-0a2a0a5209dd-0a2a4506e962-6
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:59:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@swg.vates.tech>)
 id 6a58ab8e-195a-0a2a45060019-b9ff1c22b701-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:59:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6a5e0923000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 09:59:35 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id A5E7280B12;
 Thu, 16 Jul 2026 11:59:34 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=WvzgV0nfrh28eEQyEQl9W1Offk/A0iw09ROmAPqrh3c=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QEyIIu/uVOEorlUpuDnQ7BHOYf/48jA70mU1fqxks8E0cVmgUjrVb1EDF3gc/GA48NUsebCJP
 sDOe/vo7ZF0QuM+1xheoB6IybSsS1KZZdxmdx4a7HLq5UT5NVm8v6N598nvpmj2oJzq3r6532Bl
 Tkfs0PA+IuEHtH1a3BRCVviH27NVtzc9va2pBRJ7cvJwCthCzL+ZKChsuvObh+tXEz8m7q6XfiZ
 RnUw08gqwyGD295wfT8gNoOPRdSHEIhIvVkICdHW6edsHlISHbHJFcuiNB4Ind0G/3qtCqVGoXa
 4cunIyw66waOJAkuDwhYFnUXL14aYOe4IwWoPAvsfa4A==
X-Zone-Loop: 44d0352c147ece33c6ffa3ba8790cd893f0edf758894
x-campaign-type: default
x-transaction-id: 1bf51064-6a22-4a25-a1ac-e8e14c3c97d6
x-swg-uid: 01-b7a8771c-09dd-4d22-bd41-9fa1e7b6190b
X-Mailer: Sweego
Message-ID:
 <1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5@vates.tech>
x-swg-bid: 1784195975.8631fc262581453bbf619ec5b2062170.19f6a5e0923000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 16 Jul 2026 11:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen/console: add build-time rate-limiting controls
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-4-dmukhin@ford.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260715201902.2984407-4-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jcFj5vz51uBZ489HcyvhyZRe"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784195974872
X-purgate-ID: tlsNG-16d1c6/1784195982-F5C0F77B-895B3B7B/0/0
X-purgate-type: clean
X-purgate-size: 8301

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jcFj5vz51uBZ489HcyvhyZRe
Content-Type: multipart/mixed; boundary="------------z2sl2V2KOujVkXsgWqDh00BU";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
Message-ID: <09f6fedf-a0f9-4f59-b7a6-1c0e57c49615@vates.tech>
Subject: Re: [PATCH v3 3/4] xen/console: add build-time rate-limiting controls
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-4-dmukhin@ford.com>
In-Reply-To: <20260715201902.2984407-4-dmukhin@ford.com>

--------------z2sl2V2KOujVkXsgWqDh00BU
Content-Type: multipart/mixed; boundary="------------NSU2K1UzpAzQoL5CpDK0Dy8G"

--------------NSU2K1UzpAzQoL5CpDK0Dy8G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTUvMDcvMjAyNiDDoCAyMjoyNCwgZG11a2hpbkBmb3JkLmNvbSBhIMOpY3JpdMKgOg0K
PiBGcm9tOiBEZW5pcyBNdWtoaW4gPGRtdWtoaW5AZm9yZC5jb20+DQo+IA0KPiBJbnRyb2R1
Y2UgQ09ORklHX1BSSU5US19SQVRFTElNSVRfTVMgYW5kIENPTkZJR19QUklOVEtfUkFURUxJ
TUlUX0JVUlNUDQo+IGZvciBjb25maWd1cmluZyByYXRlLWxpbWl0aW5nIHBvbGljeSBhdCB0
aGUgY29tcGlsZSB0aW1lLg0KPiANCj4gVXNlIHN5bWJvbHMgZm9yIGdsb2JhbCByYXRlLWxp
bWl0aW5nIGluaXRpYWxpemF0aW9uIGluIHRoZSBjb25zb2xlIGRyaXZlci4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IERlbmlzIE11a2hpbiA8ZG11a2hpbkBmb3JkLmNvbT4NCj4gLS0tDQo+
IENoYW5nZXMgc2luY2UgdjI6DQo+IC0gbW92ZWQgcmF0ZS1saW1pdGluZyBjb250cm9scyB0
byBjb21tb24vS2NvbmZpZw0KPiAtLS0NCj4gICB4ZW4vY29tbW9uL0tjb25maWcgICAgICAg
ICB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgeGVuL2RyaXZlcnMv
Y2hhci9jb25zb2xlLmMgfCAgNiArKysrLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+IGluZGV4IGRhODBmZGJhODQ2
OS4uZmQyMjgwNjg4NGUwIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4g
KysrIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+IEBAIC02NzIsNCArNjcyLDMzIEBAIGNvbmZp
ZyBQTV9TVEFUUw0KPiAgIAkgIEVuYWJsZSBjb2xsZWN0aW9uIG9mIHBlcmZvcm1hbmNlIG1h
bmFnZW1lbnQgc3RhdGlzdGljcyB0byBhaWQgaW4NCj4gICAJICBhbmFseXppbmcgYW5kIHR1
bmluZyBwb3dlci9wZXJmb3JtYW5jZSBjaGFyYWN0ZXJpc3RpY3Mgb2YgdGhlIHN5c3RlbQ0K
PiAgIA0KPiArbWVudSAiQ29uc29sZSByYXRlLWxpbWl0aW5nIg0KPiArDQo+ICtjb25maWcg
UFJJTlRLX1JBVEVMSU1JVF9NUw0KPiArCWludCAicHJpbnRrIHJhdGUtbGltaXRpbmcgdGlt
ZSB3aW5kb3cgKG1pbGxpc2Vjb25kcykiDQo+ICsJZGVmYXVsdCA1MDAwDQo+ICsJaGVscA0K
PiArCSAgU3BlY2lmaWVzIHRoZSB0aW1lIHdpbmRvdywgaW4gbWlsbGlzZWNvbmRzLCBmb3Ig
cmF0ZS1saW1pdGVkIHByaW50aw0KPiArCSAgbWVzc2FnZXMuIE5vIG1vcmUgdGhhbiBgQ09O
RklHX1BSSU5US19SQVRFTElNSVRfQlVSU1RgIG1lc3NhZ2VzIHdpbGwgYmUNCj4gKwkgIHBy
aW50ZWQgd2l0aGluIHRoaXMgd2luZG93Lg0KPiArDQo+ICsJICBTZXR0aW5nIHRoaXMgdmFs
dWUgdG8gMCBkaXNhYmxlcyByYXRlLWxpbWl0aW5nIGVudGlyZWx5Lg0KPiArDQo+ICsJICBS
YXRlLWxpbWl0ZWQgbWVzc2FnZXMgYXJlIHRob3NlIGNvbnRyb2xsZWQgYnkgdGhlIGBsb2ds
dmxgIGFuZA0KPiArCSAgYGd1ZXN0X2xvZ2x2bGAgY29tbWFuZC1saW5lIHBhcmFtZXRlcnMu
DQo+ICsNCj4gK2NvbmZpZyBQUklOVEtfUkFURUxJTUlUX0JVUlNUDQo+ICsJaW50ICJwcmlu
dGsgcmF0ZS1saW1pdGVkIG1lc3NhZ2UgYnVyc3Qgc2l6ZSINCj4gKwlkZWZhdWx0IDEwDQo+
ICsJaGVscA0KPiArCSAgRGVmaW5lcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgcmF0ZS1saW1p
dGVkIHByaW50ayBtZXNzYWdlcyB0aGF0IG1heSBiZQ0KPiArCSAgcHJpbnRlZCB3aXRoaW4g
ZWFjaCBgQ09ORklHX1BSSU5US19SQVRFTElNSVRfTVNgIHRpbWUgd2luZG93Lg0KPiArDQo+
ICsJICBTZXR0aW5nIHRoaXMgdmFsdWUgdG8gMCBkaXNhYmxlcyByYXRlLWxpbWl0aW5nIGVu
dGlyZWx5Lg0KPiArDQo+ICsJICBSYXRlLWxpbWl0ZWQgbWVzc2FnZXMgYXJlIHRob3NlIGNv
bnRyb2xsZWQgYnkgdGhlIGBsb2dsdmxgIGFuZA0KPiArCSAgYGd1ZXN0X2xvZ2x2bGAgY29t
bWFuZC1saW5lIHBhcmFtZXRlcnMuDQo+ICsNCj4gK2VuZG1lbnUNCj4gKw0KPiAgIGVuZG1l
bnUNCg0KR2l2ZW4gdGhhdCBzZXR0aW5nIDAgdG8gZWl0aGVyIHdpbGwgZGlzYWJsZSByYXRl
IGxpbWl0aW5nLCB3b3VsZCBpdCBiZSANCnByZWZlcmFibGUgaW5zdGVhZCB0byBoYXZlIGEg
bW9yZSBnZW5lcmFsIFBSSU5US19SQVRFTElNSVQgdG9nZ2xlLCB3aGVyZSA6DQoNClNldHRp
bmcgaXQgdG8gdHJ1ZSB3b3VsZCBlbmFibGUgY29uZmlndXJhdGlvbiBvZiBtcyBhbmQgYnVy
c3QgKHJlamVjdGluZyANCjAgaWYgcG9zc2libGUpLg0KU2V0dGluZyBpdCB0byBmYWxzZSB3
b3VsZCBzZXQgYm90aCB0byAwIGhlbmNlIGRpc2FibGluZyByYXRlIGxpbWl0aW5nIGJ5IA0K
ZGVmYXVsdC4NCg0KQW5kIHdlIGRvIHNvbWV0aGluZyBsaWtlDQoNCnN0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgcHJpbnRrX3JhdGVsaW1pdF9tcyA9DQogICBJU19FTkFCTEVEKENPTkZJ
R19QUklOVEtfUkFURUxJTUlUKSA/IENPTkZJR19QUklOVEtfUkFURUxJTUlUX01TIDogMDsN
Cg0KKHNpbWlsYXJseSBmb3IgYnVyc3QpDQoNCj8NCg0KVGVkZHkNCg==
--------------NSU2K1UzpAzQoL5CpDK0Dy8G
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------NSU2K1UzpAzQoL5CpDK0Dy8G--

--------------z2sl2V2KOujVkXsgWqDh00BU--

--------------jcFj5vz51uBZ489HcyvhyZRe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpYq4YFAwAAAAAACgkQZg+p0QLLz9Cm
ugv/XO6Jd+WJkv6cZwvfcaIa72i3lAIXgBdQlY+D2blyATB8rwW2sLkxlRZipqoFrblx3cKsm6Uv
QaMUUi+QtcDAvAHkCelSxIEuLaj5J7i6O+vtlcJXu91BP/+2m9bzo9XP6EWwCeQgDeZDXf/v0xiI
gggb3wINP9zQA7xcLEdud9fXbrhdSCIbHjIub3fRc6RMZUZYo/CI1h0HxAJd3T8iHQhDuw2SNJE9
52W2VZisYIPzoVs99nbEkLBTY1WSzcAtooMhagroDBLGCugaN2meX3buCeP3WkIKwz3K+fy/NX35
nH/rLPClYF5+fkvXjQkAVovWoDGo3WCtTGFl9zV9tshGtdJK/vuVmE01dj9os3VTzu5y7MK2Qih1
Eq4Rl/K6yiWXUdtP4PBd6cOp8YkEM0TttCDo+Z3jD72GT8/7gGpHAXDqqLoxkcArxLtckkj74uHf
m8/EWgY3a7S/V1gigJj2aZAGd1Wmm2+v0C96BSt4qxjG1C0mnnif0N94vpHh
=lUII
-----END PGP SIGNATURE-----

--------------jcFj5vz51uBZ489HcyvhyZRe--

