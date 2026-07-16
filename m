Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E97AC44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 08:38:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363537.1615119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkHbF-0005JJ-4H; Thu, 16 Jul 2026 08:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363537.1615119; Thu, 16 Jul 2026 08:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkHbF-0005JC-0z; Thu, 16 Jul 2026 08:37:45 +0000
Received: by outflank-mailman (input) for mailman id 1363537;
 Thu, 16 Jul 2026 08:37:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a12fab0000edb5@swg.vates.tech>)
 id 1wkHbD-0005J6-4T
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 08:37:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkHbC-005Y90-AG
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 10:37:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a12fab0000edb5@swg.vates.tech>)
 id 6a58984a-2eae-0a2a0a5409dd-0a2a45048d56-26
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 10:37:42 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6a12fab0000edb5@swg.vates.tech>)
 id 6a589855-b57f-0a2a45040019-b9ff1c238441-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 10:37:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6a12fab0000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 08:37:36 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id AF0DE80B2D;
 Thu, 16 Jul 2026 10:37:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=jNOPpcNDQODc2VOhJQjiLb4G2G6f/aHavyNw/UZtk18=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iCwzfZAoypnShAB8BcKpUGvgjJnoNXpCOXpsTsvQc6NlphdWaYvOGCQ+1OMcRLYT8AA0ELWeu
 xl2wwtP8J4ml1c/xIbTkugp6PeFBHA1oRkPlUs28vF59+c/XylrI72sKwUwfY3o48RV64KnTfkN
 XBc6uBGSwDn8gfts5/sXEl5fVg3w3MNbQ9D1WIZQrmlJ1iv5dzfLR1hywhm/EI1/+Y0sjsYziW3
 YFZhUnoWKzfxtJrtA+CfQLBygqkveXbbZXC4BCLJeHxfsPHAOsLddODCtDV5MstXD3PSqGrLHv4
 otYMCDM8WhjSiSi4TRAPiu1r/pn3ZYIwh2HptfoRPyBg==
X-Zone-Loop: ad9bdaf6b5619198fd45fcee95f95d508c197d933f8f
x-campaign-type: default
x-transaction-id: 94aa6d27-aac8-41df-ba0a-dab7115b063b
x-swg-uid: 01-6c8ac51b-a302-4f18-b969-0413e70ee19d
X-Mailer: Sweego
Message-ID:
 <1784191056.8631fc262581453bbf619ec5b2062170.19f6a12fab0000edb5@vates.tech>
x-swg-bid: 1784191056.8631fc262581453bbf619ec5b2062170.19f6a12fab0000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 16 Jul 2026 10:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 1/2] x86emul: drop wrapper C file
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
 <1784119334.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@vates.tech>
 <dcd70818-9e03-43e8-b6a2-eefacfc0b894@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <dcd70818-9e03-43e8-b6a2-eefacfc0b894@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CjgHENvyewL04ohUrFRBB83y"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784191055840
X-purgate-ID: tlsNG-ebf023/1784191062-C3AC0B50-042487F1/0/0
X-purgate-type: clean
X-purgate-size: 7062

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CjgHENvyewL04ohUrFRBB83y
Content-Type: multipart/mixed; boundary="------------DFCsEQ1hA0hkJwalh400lyiI";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <da970cee-4c70-4fd9-ad8e-3b060a44af7e@vates.tech>
Subject: Re: [PATCH v1.1 1/2] x86emul: drop wrapper C file
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
 <1784119334.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@vates.tech>
 <dcd70818-9e03-43e8-b6a2-eefacfc0b894@suse.com>
In-Reply-To: <dcd70818-9e03-43e8-b6a2-eefacfc0b894@suse.com>

--------------DFCsEQ1hA0hkJwalh400lyiI
Content-Type: multipart/mixed; boundary="------------CTEZVv0UdaDnepStEIh0u6VN"

--------------CTEZVv0UdaDnepStEIh0u6VN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMDcvMjAyNiDDoCAwOToxNiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MTUuMDcuMjAyNiAxNDo0MiwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBMZSAxNC8wNy8yMDI2
IMOgIDE2OjAwLCBKYW4gQmV1bGljaCBhIMOpY3JpdMKgOg0KPj4+IE1vdmUgdGhlIGxpdHRs
ZSBiaXQgdGhhdCdzIHN0aWxsIGxlZnQgaW4geDg2L3g4Nl9lbXVsYXRlLmMgaW50byBhIF9f
WEVOX18NCj4+PiBjb25kaXRpb25hbCBpbiB4ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUu
Yy4gTW92ZSB3aGF0IGFyZSByb3VnaGx5IHRoZQ0KPj4+IHRlc3QvZnV6emluZyBoYXJuZXNz
IGNvdW50ZXJwYXJ0cyBmcm9tIHRoZXJlIGludG8gdGhlIGNvcnJlc3BvbmRpbmcgI2Vsc2Uu
DQo+Pj4NCj4+PiBJbnRlcmVzdGluZ2x5IG1vcmUgcmVjZW50IGdjYyB0YWtlcyBpc3N1ZSB3
aXRoIHRocmVlIHN0YXRpYyBjb25zdCBhcnJheXMNCj4+PiB3aGljaCBhcmUgdW51c2VkIHdo
ZW4gSFZNPW4gKG5vdGljZWFibGUgaW4gcGFydGljdWxlIGluIHRoZSBzaGltIGJ1aWxkKS4N
Cj4+PiBBcHBhcmVudGx5IHN1Y2ggYXJlIGRpYWdub3NlZCBvbmx5IHdoZW4gcHJlc2VudCBp
biB0aGUgdG9wLWxldmVsIGZpbGUsIGJ1dA0KPj4+IG5vdCB3aGVuIGxpdmluZyBpbiBhbiAj
aW5jbHVkZS1kIG9uZS4NCj4+Pg0KPj4+IFJlcXVlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4gLS0tDQo+Pj4gdjEuMTogQWRkcmVz
cyBIVk09biBidWlsZCBpc3N1ZXMuIFNlZQ0KPj4+ICAgICAgICAgaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L2hhcmR3YXJlL3hlbi1zdGFnaW5nLy0vcGlwZWxpbmVzLzI2NzQ5
ODU5OTIuDQo+Pj4NCg0KLi4uDQoNCj4+Pg0KPj4NCj4+IFJldmlld2VkLWJ5OiBUZWRkeSBB
c3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCj4gDQo+IFRoYW5rcy4gTWF5IEkgYXNr
LCB0aG91Z2gsIHRoYXQgeW91IHJlZHVjZSByZXBseSBjb250ZXh0IGluIHN1Y2ggY2FzZXM/
IEV2ZXJ5DQo+IHJlYWRlciBuZWVkcyB0byBzY3JvbGwgdGhyb3VnaCB0aGUgZW50aXJlIG9y
aWdpbmFsIG1haWwganVzdCB0byBmaW5kIHRoZSBzaW5nbGUNCj4gbGluZSBhdCB0aGUgYm90
dG9tLiBTZWUgaG93IG90aGVycyBkbyB0aGlzLCBlLmcuDQo+IGh0dHBzOi8vbGlzdHMueGVu
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDI2LTA3L21zZzAwMTM5Lmh0bWwNCj4g
aHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjYtMDYv
bXNnMDE1OTUuaHRtbA0KPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAyNi0wNi9tc2cwMTQ5My5odG1sDQo+IA0KPiBUaGFua3MsIEphbg0KPiAN
Cg0KT2ssIHdpbGwgZG8uDQoNClRlZGR5DQo=
--------------CTEZVv0UdaDnepStEIh0u6VN
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------CTEZVv0UdaDnepStEIh0u6VN--

--------------DFCsEQ1hA0hkJwalh400lyiI--

--------------CjgHENvyewL04ohUrFRBB83y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpYmE4FAwAAAAAACgkQZg+p0QLLz9CJ
lAv+Icq5o8PvLw6hzYU2W1oN5xx0k3ZLMJt89+ri6nqVm9r5U3CfedYI4ptIsTyqgvCVVUN1g00u
leV3NbiufH/gH34OGOhDzZ2eaHSnQhwbVfjAI0Fnrow53WSKg0C5k5avM+Hu34zczwupe2C8ACda
+nevqmwvP04qmZaqapQSeWW+WmZfINmFG51E7Rrt3z4uOtkVl8orZ0U26+yBxuqO15hJa1BbyVLH
xGiw1rGIf8mjXee256U71oIznANx8TN7HmSfDYmJoSnVJ3QfQMo326GjU24edJXJVKc9OfuJGMxj
609Dx+rWC/uDenAzxlco/wkGeuuwGVvtieF1knirOGrNAgMHzqbB4MeVVHeFlPMHbXSWDVpCWvhP
/8s2TNy9+WwoXlSdB5vTuNa5QZyrE8USuY8DV9TvBI6wHPSvnVLUFV8LcEqjTj6z52pnsSPR7KgN
fg0vXGvxYF4dTGrlRrUyffM9CxzUcfzX4V/rzOmsXOx1Lyji/yqjxx7An1eP
=Lp4h
-----END PGP SIGNATURE-----

--------------CjgHENvyewL04ohUrFRBB83y--

