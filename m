Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39336C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:43:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383377.1626633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraxW-0003ef-Om; Wed, 05 Aug 2026 12:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383377.1626633; Wed, 05 Aug 2026 12:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraxW-0003eY-LT; Wed, 05 Aug 2026 12:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1383377;
 Wed, 05 Aug 2026 12:42:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd1f2bc52000e099@swg.vates.tech>)
 id 1wraxU-0003eP-It
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:42:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wraxT-00CG6T-FM
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:42:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd1f2bc52000e099@swg.vates.tech>)
 id 6a732fc6-5cb7-0a2a0a5109dd-0a2a4507c282-10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:42:55 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd1f2bc52000e099@swg.vates.tech>)
 id 6a732fce-b4ea-0a2a45070019-b9ff1c12ad2d-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:42:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fd1f2bc52000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 05 Aug 2026 12:42:53 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1DC4481FD3;
 Wed,  5 Aug 2026 14:42:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=gfMf2inEG6pdNO/k2iXwdhSdR+/CUahmyCFr9YdPWmo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sQQuJ+h2yWOqkFcO6QIYQiqoWBUOaH1wXsIcn1xeYOG8/qJXXEsct90dT/VHoxQgRxqmETXqc
 2rapoTuDZjXMAAi+mA7jXhB+ir8ID31e0uQBEYlvKrRcwAt5rsrHu4k/IwULXMw4/BwQR+AYp2+
 Gd7KFARXvb4chnUIcQHEli9SmIhG7N698+LM+aLixWYuvjB+XiM7PUXCjGtr+ePxMFIxSoL+B5D
 Jmn8maLXgixPshRs5izAv4ZhW/N8uKHodODgUPxQOjs1LX1JLVD08SLzS2M3OJ7va0oa22Gockj
 jZ9HmDC4NuKOSjWrCIvOVWrSARttnTXEqH6QeshXdW7A==
X-Zone-Loop: 36e1f8791f1a1bf331bd4481293e85525dec21758348
x-campaign-type: default
x-transaction-id: b89f5a5f-a33e-4a3d-b693-31f403d88185
x-swg-uid: 01-116444aa-9e67-4a48-979c-fff7f6abd1e3
X-Mailer: Sweego
Message-ID:
 <1785933773.8631fc262581453bbf619ec5b2062170.19fd1f2bc52000e099@vates.tech>
x-swg-bid: 1785933773.8631fc262581453bbf619ec5b2062170.19fd1f2bc52000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 5 Aug 2026 14:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] vtd: Move intremap table to xenheap
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org, George Dunlap <gwd@xenproject.org>
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@vates.tech>
 <451978a5-7dfd-4b91-a241-eb13caf6d394@suse.com>
 <59d0de8f-2d97-4f65-af16-876be20398fa@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <59d0de8f-2d97-4f65-af16-876be20398fa@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GTmS6zkj5FCxYf87Yo944WNQ"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785933773255
X-purgate-ID: tlsNG-ef75cf/1785933775-372DCAE4-531C9AC0/0/0
X-purgate-type: clean
X-purgate-size: 7403

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GTmS6zkj5FCxYf87Yo944WNQ
Content-Type: multipart/mixed; boundary="------------kRpbAI5tISuh33WXwkRqz3Cm";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org, George Dunlap <gwd@xenproject.org>
Message-ID: <e7f67cf6-f6a9-4619-b7d5-639618ff5f56@vates.tech>
Subject: Re: [PATCH 5/5] vtd: Move intremap table to xenheap
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@vates.tech>
 <451978a5-7dfd-4b91-a241-eb13caf6d394@suse.com>
 <59d0de8f-2d97-4f65-af16-876be20398fa@citrix.com>
In-Reply-To: <59d0de8f-2d97-4f65-af16-876be20398fa@citrix.com>

--------------kRpbAI5tISuh33WXwkRqz3Cm
Content-Type: multipart/mixed; boundary="------------8GEWshzGg3W6GDgYK8rnW80B"

--------------8GEWshzGg3W6GDgYK8rnW80B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDUvMDgvMjAyNiDDoCAxMjowOSwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAwNS8wOC8yMDI2IDEwOjQ0IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDI5LjA3
LjIwMjYgMTE6NTksIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4+IEludGVycnVwdCByZW1hcHBp
bmcgZW50cmllcyBvZnRlbiBuZWVkcyB0byBiZSBhY2Nlc3NlZCwgYW5kIHdlJ3JlIGNyZWF0
aW5nDQo+Pj4gcG9pbnRlcnMgdG8gaXQgb24gZGVtYW5kLCB3aGljaCBicmluZ3MgYSBsb3Qg
b2YgY29tcGxleGl0eSAoZS5nDQo+Pj4gR0VUX0lSRU1BUF9FTlRSWSgpIG1hY3JvKSwgbW92
ZSBpdCB0byB4ZW5oZWFwIHN1Y2ggdGhhdCBpdCdzIHBlcnNpc3RlbnRseQ0KPj4+IG1hcHBl
ZCBhbmQgd2Ugd29uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBtYXBwaW5nIGFuZCB1bm1hcHBp
bmcgaW5kaXZpZHVhbA0KPj4+IGludHJlbWFwIHRhYmxlIHBhZ2VzLg0KPj4gQWZhaWM6IE5v
IG1vdmVtZW50IGZyb20gZG9taGVhcCB0byB4ZW5oZWFwIGV4Y2VwdCBmb3IgX3ZlcnlfIGdv
b2QgcmVhc29ucy4NCj4+IEZvciB0aGUgY2FzZSBoZXJlIHRoYXQgaXMgLSBtYXliZSBlc3Rh
Ymxpc2ggYSBwZXJtYW5lbnQgbWFwcGluZyB1c2luZw0KPj4gdm1hcCgpLCBidXQgbm8gY2hh
bmdlIGluIHdoZXJlIHRoZSBtZW1vcnkgaXMgdG8gY29tZSBmcm9tLiBXaGV0aGVyIHN1Y2gg
YQ0KPj4gcGVybWFuZW50IG1hcHBpbmcgaXMgcmVhbGx5IHdvcnRod2hpbGUgbWF5IGFsc28g
d2FudCBzdXBwb3J0aW5nIGJ5IG51bWJlcnMuDQo+PiBZb3Ugc2F5ICJvZnRlbiIsIGJ1dCB5
b3UgZG9uJ3QgcXVhbGlmeSAvIHF1YW50aWZ5IHRoaXMgYW55IGZ1cnRoZXIuDQo+IA0KDQpJ
IHRoaW5rIHRoZSByZWR1Y3Rpb24gdGhlIGNvbXBsZXhpdHkgb2YgdGhlIGxvZ2ljIGlzIGEg
Z29vZCByZWFzb24gaW50byANCnVzaW5nIGEgcGVyc2lzdGVudCBtYXBwaW5nIGhlcmUgKGVz
cGVjaWFsbHkgc2luY2UgaXQncyBub3QgYSANCnBhcnRpY3VsYXJseSBsYXJnZSBvbmUpLg0K
DQo+IFRvIGV4cGFuZCBvbiB0aGUgIndoeSIgYSBiaXQgbW9yZS4NCj4gDQo+IEZvciBzeXN0
ZW1zIHdpdGggYWxsIFJBTSBiZWxvdyB0aGUgNFQgYm91bmRhcnksIGRvbWhlYXAgYW5kIHhl
bmhlYXAgYXJlDQo+IGVxdWl2YWxlbnQuwqAgV2UgaGF2ZSA1VCBvZiBkaXJlY3RtYXAsIGJ1
dCB4ZW5oZWFwIGFsbG9jYXRpb25zIGhhdmUgYQ0KPiB3aWR0aCByZXN0cmljdGlvbiB3aGlj
aCBpcyBhIHBvd2VyLW9mLTIuDQo+IA0KPiBGb3Igc3lzdGVtcyB3aXRoIGFueSBSQU0gYWJv
dmUgdGhlIDRUIGJvdW5kYXJ5LCB5b3UgY2FuJ3QgaGF2ZSB4ZW5oZWFwDQo+IGFsbG9jYXRp
b25zIGJlIE5VTUEtbG9jYWwgZm9yIGFsbCBOVU1BIG5vZGVzLg0KPiANCj4gDQo+IEFzIGZv
ciAib2Z0ZW4iLCB0aGUgSVJURXMgYXJlIG1vZGlmaWVkIGV2ZXJ5IHRpbWUgYSB2Q1BVIG1v
dmVzIHRvIGENCj4gZGlmZmVyZW50IFBDUFUsIGJlY2F1c2UgdGhlIHRhcmdldCBhZGRyZXNz
ZXMgbmVlZCB1cGRhdGluZy7CoCBXaGlsZSBpdA0KPiBwcm9iYWJseSBkb2Vzbid0IG1hdHRl
ciBtdWNoIHRvZGF5LCBpbiB0aGUgY29udGV4dCBvZiBBU0kgaXQncyBzb21ldGhpbmcNCj4g
d2hpY2ggd291bGQgd2FudCBtYXBwaW5nIHBlcm1hbmVudGx5LCByYXRoZXIgdGhhbiBvbi1k
ZW1hbmQuDQo+IA0KDQpPaywgc28gZG9taGVhcCB3aXRoIHZtYXAgd291bGQgYmUgcHJlZmVy
YWJsZSBoZXJlLg0KDQo+IH5BbmRyZXc+DQoNClRlZGR5DQo=
--------------8GEWshzGg3W6GDgYK8rnW80B
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------8GEWshzGg3W6GDgYK8rnW80B--

--------------kRpbAI5tISuh33WXwkRqz3Cm--

--------------GTmS6zkj5FCxYf87Yo944WNQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpzL8wFAwAAAAAACgkQZg+p0QLLz9DA
6gv7BltTaonVluo9LKHT9I/blqHpaofr38z4HkJzHm8CWcqWysnFLsdtJdZqedLwF3TcAkx8NCKm
wasH4fZX1xMRiMULsFnrgntiUMJZz2v8IEfK44XKxo1Eb6s5bzUSRINraQ7LXo0wK2ukHbkd4JT6
zWHMmhg5kz9AdIPF2Rtoiq6X1qUrZjPvDKg4EILopPjbzzQC7Kvvi5Hgk8SYQYFylJ/8ybf3BFI7
IJ5D6Z0PzGsOPWtRbcMgnD6f4uoe5K5WJ8P/g+qPCXhkuULkhosqkqK2gmsdBWgPuGZ++AiR9fnQ
ucUtYz3yMb86gFzrsreRhmJDqrXYCYBc1uQEBf54SQ8tJF1Nf8Xu0fHAGiCFZ+M0c3bR/hODQ38i
LUVUPeb71H7p3EdmZl/z4CqJGZAJNmIoIeUQEwpsasCrpthkIz1YxtTFffsFjYDc1Pmm48J+7ypc
SEaRaMo+pQSt2E2pS3kdh0gWSZZ4QIL2Vo9ZA3y6WWuP/UiL+Q1fT/n2vZca
=U8KH
-----END PGP SIGNATURE-----

--------------GTmS6zkj5FCxYf87Yo944WNQ--

