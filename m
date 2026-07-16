Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C2AC4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 09:51:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363702.1615252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkIk8-0007Jo-K5; Thu, 16 Jul 2026 09:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363702.1615252; Thu, 16 Jul 2026 09:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkIk8-0007Jh-Gl; Thu, 16 Jul 2026 09:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1363702;
 Thu, 16 Jul 2026 09:50:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@swg.vates.tech>)
 id 1wkIk6-0007Jb-Vo
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:50:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkIk5-005zBn-TK
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 11:50:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@swg.vates.tech>)
 id 6a58a97b-e002-0a2a0a5209dd-0a2a450caa3e-18
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:50:57 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@swg.vates.tech>)
 id 6a58a981-f479-0a2a450c0019-b9ff1c23a365-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 11:50:57 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6a5603fd000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 09:50:49 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 17E3380400;
 Thu, 16 Jul 2026 11:50:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=KKnjUxDShBINea+gSpdmtApV9OnigBYq7Xvw8V4Vs04=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KJs+r9aMgC8whR/fEc4Vckj2iMc+gjPjNkRHSjcPvRaAqMGzBhVIIUazenLGfbSLB1y/oTs+4
 6ACzpiuaGkRbC/3D73buj/d1miOSmmxtJraB13ov0/+hkSCUSLXfapSDseNgnwofLrFX3wooduJ
 vzlEFRjDCoY9tjTlpL+im/cyCqaz8NUjA98dayNhfPYoaUPoEE1Pegs5/YEPWuM/IiogzR50Ap4
 C739WbRkndXWZibZpTKf/yreVpMSbshSFwsVhEmNXlAfOnbo0lfRm84P0727Y7g60IpQrPsdvT7
 3RyKWWTg08mDo7aA0kVE9UNOrg0uqCHN/d0Ayd90CMyA==
X-Zone-Loop: 69e909a7e8686654c799a0ef48dd3c9de519b992607c
x-campaign-type: default
x-transaction-id: 4c73a522-11a1-4a8b-84a4-cdd2f6fcd33a
x-swg-uid: 01-d0096ee1-5740-4e42-a281-5f6e8ea1c458
X-Mailer: Sweego
Message-ID:
 <1784195449.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@vates.tech>
x-swg-bid: 1784195449.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 16 Jul 2026 11:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/console: correct leaky-bucket rate limiter
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-3-dmukhin@ford.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260715201902.2984407-3-dmukhin@ford.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hrZXQ0Xn5AqFAMTU8LIvDMaN"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784195449319
X-purgate-ID: tlsNG-d25034/1784195457-018C5A5B-295EEA62/0/0
X-purgate-type: clean
X-purgate-size: 8753

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hrZXQ0Xn5AqFAMTU8LIvDMaN
Content-Type: multipart/mixed; boundary="------------jGb0yb4EF79A0wwPmf2V941L";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org
Message-ID: <bbd3bdff-d509-42d4-98aa-cf60a2aa8e07@vates.tech>
Subject: Re: [PATCH v3 2/4] xen/console: correct leaky-bucket rate limiter
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-3-dmukhin@ford.com>
In-Reply-To: <20260715201902.2984407-3-dmukhin@ford.com>

--------------jGb0yb4EF79A0wwPmf2V941L
Content-Type: multipart/mixed; boundary="------------piSvKiHin4DS0DlTG9kPz2Ff"

--------------piSvKiHin4DS0DlTG9kPz2Ff
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTUvMDcvMjAyNiDDoCAyMjoyNCwgZG11a2hpbkBmb3JkLmNvbSBhIMOpY3JpdMKgOg0K
PiBGcm9tOiBEZW5pcyBNdWtoaW4gPGRtdWtoaW5AZm9yZC5jb20+DQo+IA0KPiBVc2UgZXhp
c3RpbmcgcHJpbnRrX3JhdGVsaW1pdF9tcyBhbmQgcHJpbnRrX3JhdGVsaW1pdF9idXJzdCB2
YXJpYWJsZXMgaW4NCj4gZG9fcHJpbnRrX3JhdGVsaW1pdCgpIGluc3RlYWQgb2YgaGFyZGNv
ZGVkIHZhbHVlcyA1MDAwIGFuZCAxMCByZXNwZWN0aXZlbHkuDQo+IA0KPiBFbnN1cmUgcmF0
ZSBsaW1pdGVyIGlzIGRpc2FibGVkIGlmIGVpdGhlciBwcmludGtfcmF0ZWxpbWl0X21zIG9y
DQo+IHByaW50a19yYXRlbGltaXRfYnVyc3QgaXMgMC4gTWFrZSBzdXJlIG5vIHVubmVjZXNz
YXJ5IGluaXRpYWxpemF0aW9uIGlzIGRvbmUNCj4gaW4gdGhlIGNvcm5lciBjYXNlLg0KPiAN
Cj4gQWxzbywgc2ltcGxpZnkgdGhlIGxpbWl0ZXIgY29kZSBieSB1c2luZyBtaW4oKS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IERlbmlzIE11a2hpbiA8ZG11a2hpbkBmb3JkLmNvbT4NCj4g
LS0tDQo+IENoYW5nZXMgc2luY2UgdjI6DQo+IC0gZml4ZWQgdHlwaW5nIGFuZCAzMi1iaXQg
aW50ZWdlciBvdmVyZmxvdyBwcm9ibGVtDQo+IC0tLQ0KPiAgIHhlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jIHwgMjEgKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNv
bGUuYw0KPiBpbmRleCA1ZDM5NWY4ODJlMDguLmRlOWYyNDMyNDQ1ZCAxMDA2NDQNCj4gLS0t
IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMNCj4gKysrIGIveGVuL2RyaXZlcnMvY2hh
ci9jb25zb2xlLmMNCj4gQEAgLTEyNzQsMjEgKzEyNzQsMjYgQEAgYm9vbCBfX3ByaW50a19y
YXRlbGltaXQodW5zaWduZWQgaW50IHJhdGVsaW1pdF9tcywNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmF0ZWxpbWl0X2J1cnN0KQ0KPiAgIHsNCj4gICAg
ICAgc3RhdGljIERFRklORV9TUElOTE9DSyhyYXRlbGltaXRfbG9jayk7DQo+IC0gICAgc3Rh
dGljIHVuc2lnbmVkIGxvbmcgdG9rcyA9IDEwICogNSAqIDEwMDA7DQo+IC0gICAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcgbGFzdF9tc2c7DQo+ICsgICAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
bG9uZyB0b2tzLCBsYXN0X21zZzsNCj4gICAgICAgc3RhdGljIHVuc2lnbmVkIGludCBtaXNz
ZWQ7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBsb25nIG5vdywgbGltaXQ7DQo+ICAgICAgIHVu
c2lnbmVkIGxvbmcgZmxhZ3M7DQo+IC0gICAgdW5zaWduZWQgbG9uZyBsb25nIG5vdyA9IE5P
VygpOyAvKiBucyAqLw0KPiAtICAgIHVuc2lnbmVkIGxvbmcgbXM7DQo+ICsgICAgc190aW1l
X3QgbXM7DQo+ICAgDQo+IC0gICAgZG9fZGl2KG5vdywgMTAwMDAwMCk7DQo+IC0gICAgbXMg
PSAodW5zaWduZWQgbG9uZylub3c7DQo+ICsgICAgaWYgKCAhcmF0ZWxpbWl0X2J1cnN0IHx8
ICFyYXRlbGltaXRfYnVyc3QgKQ0KDQpEbyB5b3UgaW50ZW5kIGhlcmUgKCAhcmF0ZWxpbWl0
X21zIHx8ICFyYXRlbGltaXRfYnVyc3QgKSA/DQoNCj4gKyAgICAgICAgcmV0dXJuIHRydWU7
DQo+ICsNCj4gKyAgICBsaW1pdCA9IG1pbihyYXRlbGltaXRfYnVyc3QgKiByYXRlbGltaXRf
bXMsIFVJTlRfTUFYKTsNCg0KVGhhdCBsb29rcyBuby1vcCAoYXQgbGVhc3QgYXQgZmlyc3Qg
c3RhbmNlKSwgYXMgVUlOVF9NQVggaXMgdGhlIGxhcmdlc3QgDQp1bnNpZ25lZCBpbnQgdmFs
dWU7IGhlbmNlIGByYXRlbGltaXRfYnVyc3QgKiByYXRlbGltaXRfbXNgIChib3RoIA0KdW5z
aWduZWQgaW50KSBjYW4ndCBiZSBsYXJnZXIgdGhhbiBpdDsgZXZlbiBpZiBpdCBvdmVyZmxv
d3MuDQoNCkkgdGhpbmsgd2UgbmVlZCB0byBjYXN0IGJvdGggcmF0ZWxpbWl0X21zIGFuZCBy
YXRlbGltaXRfYnVyc3QgdG8gDQp1bnNpZ25lZCBsb25nIGxvbmcgYmVmb3JlIGRvaW5nIHRo
ZSBtdWx0aXBseSwgc28gdGhhdCB0aGUgbXVsdGlwbHkgY2FuJ3QgDQpvdmVyZmxvdyAobm90
IHN1cmUgZXhhY3RseSBob3cgdG8gd3JpdGUgaXQgd2l0aG91dCBiZWluZyB0b28gdmVyYm9z
ZSANCnRob3VnaCkuDQoNCmh0dHBzOi8vZ29kYm9sdC5vcmcvei9zeFdhUE0zY3INCg0KPiAr
ICAgIGlmICggIXRva3MgKQ0KPiArICAgICAgICB0b2tzID0gbGltaXQ7DQo+ICsNCj4gKyAg
ICBub3cgPSBOT1coKTsgLyogbnMgKi8NCj4gKyAgICBtcyA9IGRvX2Rpdihub3csIE1JTExJ
U0VDUygxKSk7DQo+ICAgDQo+ICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZyYXRlbGltaXRf
bG9jaywgZmxhZ3MpOw0KPiAgICAgICB0b2tzICs9IG1zIC0gbGFzdF9tc2c7DQo+ICAgICAg
IGxhc3RfbXNnID0gbXM7DQo+IC0gICAgaWYgKCB0b2tzID4gKHJhdGVsaW1pdF9idXJzdCAq
IHJhdGVsaW1pdF9tcykpDQo+IC0gICAgICAgIHRva3MgPSByYXRlbGltaXRfYnVyc3QgKiBy
YXRlbGltaXRfbXM7DQo+ICsgICAgdG9rcyA9IG1pbih0b2tzLCBsaW1pdCk7DQo+ICAgICAg
IGlmICggdG9rcyA+PSByYXRlbGltaXRfbXMgKQ0KPiAgICAgICB7DQo+ICAgICAgICAgICB1
bnNpZ25lZCBpbnQgbG9zdCA9IG1pc3NlZDsNCg0KV2l0aCB0aGUgaWYgcGFydCBmaXhlZCBh
bmQgdGhlIGFkanVzdG1lbnRzIGluIHRoZSBsaW1pdCBjb21wdXRhdGlvbiANCihjYXN0IHRv
IHVuc2lnbmVkIGxvbmcgbG9uZyBiZWZvcmUgdGhlIG11bHRpcGx5KSA6DQpSZXZpZXdlZC1i
eTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQoNClRlZGR5DQo=
--------------piSvKiHin4DS0DlTG9kPz2Ff
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------piSvKiHin4DS0DlTG9kPz2Ff--

--------------jGb0yb4EF79A0wwPmf2V941L--

--------------hrZXQ0Xn5AqFAMTU8LIvDMaN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpYqXgFAwAAAAAACgkQZg+p0QLLz9A/
Ygv9EC0rt4Xy39x9KhR5UuW6l/GfZdhaT+HT6/ENXIRQVEKgxOjDMfoOW1VI9U7ffi5bkSszwVW0
GvZJ7dqZDmhelCx6aHIXmLZD0s9kb7GV2eMRB3alo0475CVKtb4jOsfBJa85kZMPjayK0RgvPM8e
E2av8nX9exv3D+qRss4xLWc/I9jWgE35NtnPgyiqWbrMBsZvjiGxHIcMH37Rofl1BsREjfig0g9L
Ry65mlFIZjN+QiMy4LrqNSS0BP+OpYs4w3nS6m3P2BmqaX5htukroLoTzpdt8AMRrhfRSO/D0npr
CiLV5IBHMtGlFpwOAO3wco+VzZQYLgaFwU23UTV6NeL8SPjSt4P5wKjTI4wDzC0/0bUVR4vMMP8U
oEACP1/rvqrA7XIJK+IuZ/C1A7MpFLsM1eXcI8RjXdT3llyIb6/cxE4XevUEgRxvbtenCEzC0409
PKxlNtN7hmNnOikLvG8mhnfUSeP7gxEgA+Tvak78QKgiCGNW3rgGGbwN6Lvm
=e1gF
-----END PGP SIGNATURE-----

--------------hrZXQ0Xn5AqFAMTU8LIvDMaN--

