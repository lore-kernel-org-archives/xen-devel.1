Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4732BC79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 19:16:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409061.1641257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2ZOX-0007Ms-Ex; Fri, 04 Sep 2026 19:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409061.1641257; Fri, 04 Sep 2026 19:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2ZOX-0007Ml-C7; Fri, 04 Sep 2026 19:16:13 +0000
Received: by outflank-mailman (input) for mailman id 1409061;
 Fri, 04 Sep 2026 19:16:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06dd97b80000c4f3@swg.vates.tech>)
 id 1x2ZOW-0007Me-7O
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 19:16:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2ZOU-005oF4-Qb
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 21:16:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06dd97b80000c4f3@swg.vates.tech>)
 id 6a9b18bf-bab6-0a2a0a5309dd-0a2a4504c00c-38
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 21:16:10 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06dd97b80000c4f3@swg.vates.tech>)
 id 6a9b18fa-b57f-0a2a45040019-b9ff1c12b209-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 21:16:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06dd97b80000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 19:16:04 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id C0BD581F87;
 Fri,  4 Sep 2026 21:16:03 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5WJN/PtIxGMmN69Dw8Jmca+4P3NFGLx9nwRCcVfgtPg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bsDjWv8GFM46/MCtlBlF0pHrBuUk1UqNehLv8GdWfk49RhcUUd906j16E0QekzdLqupBXEmvN
 bbeUhd254twHxmYGYMc3FlkKIrouKESAX2r2CwSjktVSH+Qg1/CrPAhTdBo7U55jU6FY2uBZowc
 a5r4SNmM8FWuUvOsWXz1uYrfju5UhvS3CudsgbSf0N6vcO60T7mnOlT6EL7ZeapDT9KQoQWtBfh
 6KiuOypkX48SlmGBQlOnypRROm7+PVTewxsmGsrNNmwAowTwvluqtEkswiKLQPjJkpbhVbV10hY
 sTPVbETiy87Qq7yPDv74fMhRzPWjMIooC/bhVzAR0h/g==
X-Zone-Loop: 9cbdbaadd00b8baf91ab25ea69e57b2702abe656f479
x-campaign-type: default
x-transaction-id: 6fc5a7ef-ac18-470a-ba8d-3ca3cabace9c
x-swg-uid: 01-d8bbcaa1-0e32-4c9e-bc62-c482862d8f09
X-Mailer: Sweego
Message-ID:
 <1788549364.8631fc262581453bbf619ec5b2062170.1a06dd97b80000c4f3@vates.tech>
x-swg-bid: 1788549364.8631fc262581453bbf619ec5b2062170.1a06dd97b80000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 4 Sep 2026 21:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 jbeulich@suse.com
References: <1787565706.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@vates.tech>
 <20260904151014.3113677-1-abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260904151014.3113677-1-abdelkareem.abdelsaamad@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p8bZ6tlnaIzb8JdfFKFuI3Zr"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788549363953
X-purgate-ID: tlsNG-ebf023/1788549370-C2CCFB50-C1718A3A/0/0
X-purgate-type: clean
X-purgate-size: 6745

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p8bZ6tlnaIzb8JdfFKFuI3Zr
Content-Type: multipart/mixed; boundary="------------Y0ECcbAZ9iQ8wuLK9fkHk0h5";
 protected-headers="v1"; hp="clear"
Message-ID: <401e44b6-0284-487d-8d90-3918b85e5e86@vates.tech>
Date: Fri, 4 Sep 2026 21:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 jbeulich@suse.com
References: <1787565706.8631fc262581453bbf619ec5b2062170.1a033380dce000c4f3@vates.tech>
 <20260904151014.3113677-1-abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260904151014.3113677-1-abdelkareem.abdelsaamad@citrix.com>

--------------Y0ECcbAZ9iQ8wuLK9fkHk0h5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDQvMDkvMjAyNiDDoCAxNzoxNywgQWJkZWxrYXJlZW0gQWJkZWxzYWFtYWQgYSDDqWNy
aXTCoDoNCj4gT24gMjQuMDguMjAyNiAxMjoxMiwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBP
biAwNi4wOC4yMDI2IDE5OjI2LCBBYmRlbGthcmVlbSBBYmRlbHNhYW1hZCB3cm90ZToNCj4+
PiBPbiB0aGUgQU1EIHBsYXRmb3JtcywgYWxsb3dpbmcgYSBWTVJVTiBpbnN0cnVjdGlvbiB3
aXRoIGEgbWFsZm9ybWVkIFZNQ0IgaGFzDQo+Pj4gZGVidWdnaW5nIGNvbXBsaWNhdGlvbnMs
IHNlY3VyaXR5IGFuZCBwZXJmb3JtYW5jZSBpbXBsaWNhdGlvbnMuIFRoZSBBUE0NCj4+PiB2
b2x1bWUgIzIgMTUuMjAgKDQwMzMyLVJldi4gNC4xMC1KdWx5IDIwMjYpIHN0YXRlcyB0aGUg
dHdvIHBvc3NpYmlsaXRpZXMgdGhhdA0KPj4+IHJlc3VsdCBpbiBhIFZNUlVOIGV4aXQgd2l0
aCBWTUVYSVRfSU5WQUxJRCBkdWUgdG8gdGhlIGluamVjdGVkIGV2ZW50LiBUaGVzZSBhcmUN
Cj4+PiDigKIgUmVzZXJ2ZWQgdmFsdWVzIG9mIFRZUEUgaGF2ZSBiZWVuIHNwZWNpZmllZC4N
Cj4+PiDigKIgVFlQRSA9IDMgKGV4Y2VwdGlvbikgaGFzIGJlZW4gc3BlY2lmaWVkIHdpdGgg
YSB2ZWN0b3IgdGhhdCBkb2VzIG5vdA0KPj4+ICAgICBjb3JyZXNwb25kIHRvIGFuIGV4Y2Vw
dGlvbiAodGhpcyBpbmNsdWRlcyB2ZWN0b3IgMiwgd2hpY2ggaXMgYW4gTk1JLCBub3QNCj4+
PiAgICAgYW4gZXhjZXB0aW9uKS4NCj4+Pg0KDQooLi4uKQ0KDQo+Pg0KPj4+IGh0dHBzOi8v
Z2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYWFiZGVsc2EveGVuLy0vcGlwZWxpbmVz
LzI3MzQyODM3ODgNCj4+PiAtLS0NCj4+PiAgICB4ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNi
LmMgfCA1MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gICAg
MSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykNCj4+Pg0KPj4NCj4+IEkgd291bGQg
YWRkIHRoaXMgbmV3bHkgaW50cm9kdWNlZCBmdW5jdGlvbiBpbiBzdm1fdm1leGl0X2hhbmRs
ZXIoKSwgd2hlbg0KPj4gZW5jb3VudGVyaW5nIFZNRVhJVF9JTlZBTElEIHRvIGF0dGVtcHQg
Z2l2aW5nIG1vcmUgaW5mb3JtYXRpb24gb2YgdGhlDQo+PiBwcm9ibGVtIChub2JvZHkgbGlr
ZXMgdG8gZGVidWcgVk1FWElUX0lOVkFMSUQpLg0KPiBCeSB0aGlzLCBkbyB5b3UgbWVhbiBj
YWxsaW5nIHRoZSBzdm1fdm1jYl9pc3ZhbGlkIGZyb20gc3ZtX3ZtZXhpdF9oYW5kbGVyIG9y
DQo+IGNhbGxpbmcgb25seSBpc192YWxpZF9zdm1fdm1jYl9pbmplY3RlZF9leGNlcHRpb25f
dmVjdG9yPyBJIHNlZSB0aGF0DQo+IFZNRVhJVF9JTlZBTElEIGFscmVhZHkgZHVtcHMgdGhl
IFZNQ0IuDQo+Pg0KDQpJdCdzIGFib3V0IGFkZGluZyB0aGlzIHRvIHN2bV92bWV4aXRfaGFu
ZGxlcigpIGluIHRoZSBpZiAoZXhpdF9yZWFzb24gPT0gDQpWTUVYSVRfSU5WQUxJRCkuIEhh
dmluZyB0aGUgVk1DQiBkdW1wZWQgaXMgdXNlZnVsLCBidXQgYWxzbyBoYXZpbmcgDQpzb21l
dGhpbmcgdGVsbGluZyB1cyBpZiBpdCBkZXRlY3RlZCBzb21ldGhpbmcgd3JvbmcgKGFuZCB3
aGF0KSB3b3VsZCANCmhlbHAgYXMgd2VsbC4NCg0KVGVkZHkNCg==

--------------Y0ECcbAZ9iQ8wuLK9fkHk0h5--

--------------p8bZ6tlnaIzb8JdfFKFuI3Zr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqbGPMFAwAAAAAACgkQZg+p0QLLz9Ae
Vgv/V86nl9DFiDr8uKysRJ3a9PRz5NBaGFPcOUzUXBK3M+3Kyxp8X7qtQzhxOtIWWYYhbMjbVmzZ
zOBjl+Bq/qQn2sd9FNsZZPA8qRi9B+/xMrZ6x/TmXGzIGoADypbGFJNy4JLg4DGY7h/GdItMJgcf
h/uh/TXEyMnfL5GmII6M9IrAzNYGV307PI0xP49ysOb52DX/2pMKoJrhOAd9pYHQTvK7nA3UpNK5
1+9+QEmQULbzPQIC+HkPdYumrWTVrWHJjvKNa3a57lAT8Y82PamkW6eKddL5fqmyh7eSwkqMdloV
BlpjncraM0KwAaVnA9h52fXMK/JqUcuZ+ywbMm9j7txnPbMGIZIc4kcei50pZ0l/M5NPOoiixQ+H
eGgTYSk5q3dxiYzRTACXXf58WMYKkR/WSPNk37ZFZ2J2/FlOPacXBgPzzDdUXvRhwmVQoyuywtrX
ae+z1+csQSUw+HGj7SzxWU31N8DeFC0buzdzBjeRmpAWtr+KOVlBpQnUzx91
=pmZm
-----END PGP SIGNATURE-----

--------------p8bZ6tlnaIzb8JdfFKFuI3Zr--

