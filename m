Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B91606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 15:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=NYpxDdJj
Received: from list by lists.xenproject.org with outflank-mailman.1455977.1669591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBLA-0002GQ-Sx; Tue, 20 Oct 2026 15:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455977.1669591; Tue, 20 Oct 2026 15:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJBLA-0002GJ-Pg; Tue, 20 Oct 2026 15:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1455977;
 Tue, 20 Oct 2026 15:01:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f@swg.vates.tech>)
 id 1xJBL8-0002G4-W6
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:01:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJBL7-00DcJA-GX
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 17:01:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f@swg.vates.tech>)
 id 6ad78234-8faa-0a2a0a5109dd-0a2a450b8a2a-38
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:01:21 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f@swg.vates.tech>)
 id 6ad78241-b7e8-0a2a450b0019-b9ff1c22a383-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 17:01:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a159d4bf40000f79f.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 15:01:17 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2D3B48207D;
 Tue, 20 Oct 2026 17:01:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=I3K40r4feh2Ix+Lr1O5N3VXWD6EDgoCurTQsjQkhbQs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=NYpxDdJjSCMX0xeeP5MpsVTWgJtS0F9cT2uLufiSWAfa/NibNIDkgZ+4dYxDlzkAXp1TgVXs2
 irywskaKOWSLxMpXVZGLIGCW/WPJt/LjUYdoKOMr6tTNZhCwlQ+M6nx8Pobwd8HKFTBtvtD8jT2
 vow/qd5Fvd26msAo0J7PftN1Qv9iREONiHolHw2f+vPUK6gPvxDxPlTdq2wK4h+lyQ/HDcrkC9/
 B9XgeDknRS8EY3NKxGZkpeZADC7nx2EXiR/KZYjh2BKPKUV2jpK6nvtejgIwiwb8Hb4vePzHU59
 zAfyQQ721sFGiQtEgZvzEfauNd/ndgQ5i/esi6iZ6zew==
X-Zone-Loop: fad66d375572e421a8f43c9ad98879340f361cea54c4
x-campaign-type: default
x-transaction-id: 2ed39b88-ff88-4548-9528-6bda47527036
x-swg-uid: 01-2fc052ab-b9ff-4cd6-aa42-bcdeb046b897
X-Mailer: Sweego
Message-ID:
 <1792508477.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f@vates.tech>
x-swg-bid: 1792508477.8631fc262581453bbf619ec5b2062170.1a159d4bf40000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 20 Oct 2026 17:01:10 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/nestedsvm: Require SpecCtrl
To: chunjie.zhu@citrix.com, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com, teddy.astie@vates.tsczsss
References: <20261020045758.321952-1-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020045758.321952-1-chunjie.zhu@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Io78WQajgCjbqwduUL4FFylZ"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792508471342
X-purgate-ID: tlsNG-42698a/1792508481-2C39B9EA-19765D48/0/0
X-purgate-type: clean
X-purgate-size: 8304
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Io78WQajgCjbqwduUL4FFylZ
Content-Type: multipart/mixed; boundary="------------tQ00g08ndIYtv0xl48kGl02G";
 protected-headers="v1"; hp="clear"
Message-ID: <a978bb20-28ff-4916-8d3e-2fd711113279@vates.tech>
Date: Tue, 20 Oct 2026 17:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/nestedsvm: Require SpecCtrl
To: chunjie.zhu@citrix.com, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com, teddy.astie@vates.tsczsss
References: <20261020045758.321952-1-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020045758.321952-1-chunjie.zhu@citrix.com>

--------------tQ00g08ndIYtv0xl48kGl02G
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMTAvMjAyNiDDoCAwNzowMSwgY2h1bmppZS56aHVAY2l0cml4LmNvbSBhIMOpY3Jp
dMKgOg0KPiBGcm9tOiBDaHVuamllIFpodSA8Y2h1bmppZS56aHVAY2l0cml4LmNvbT4NCj4g
DQo+IFByZXZpb3VzbHkgTDAgZGlkIG5vdCBleHBvc2UgdGhpcyBiaXQsIGZvcmNpbmcgTDEg
dG8gaW50ZXJjZXB0IGFuZA0KPiBlbXVsYXRlIE1TUl9TUEVDX0NUUkwgYWNjZXNzZXMgZnJv
bSBMMiBpbiBzb2Z0d2FyZSwgd2hpY2ggaXMNCj4gZnVuY3Rpb25hbGx5IGNvcnJlY3QgYnV0
IHN1Ym9wdGltYWwuIFBlciBBUE0gdm9sLjIgcmV2IDMuNDQgIlNQRUNfQ1RSTA0KPiBWaXJ0
dWFsaXphdGlvbiIsIGhhcmR3YXJlIHN1cHBvcnRzIGNvbWJpbmluZyBob3N0IGFuZCBndWVz
dCBTUEVDX0NUUkwNCj4gdmFsdWVzIHZpYSBWTUNCLnNwZWNfY3RybCB3aXRoIGEgbG9naWNh
bCBPUiB3aGlsZSBhIGd1ZXN0IHJ1bnMsIGFuZA0KPiBzYXZlcyB0aGUgKHBvc3NpYmx5IGd1
ZXN0LW1vZGlmaWVkKSB2YWx1ZSBiYWNrIGludG8gVk1DQi5zcGVjX2N0cmwNCj4gb24gI1ZN
RVhJVC4NCj4gDQo+IFJlcXVpcmUgdGhlIFNWTSBTcGVjQ3RybCBmZWF0dXJlIGJlZm9yZSBy
dW5uaW5nIGFueSBuZXN0ZWQgdmlydA0KPiBndWVzdHMuDQo+IA0KPiBVcGRhdGUgZG9jcy9k
ZXNpZ25zL25lc3RlZC1zdm0tY3B1LWZlYXR1cmVzLm1kIHdpdGggdGhlIHJhdGlvbmFsZQ0K
PiBmb3IgcmVxdWlyaW5nIGFuZCBleHBvc2luZyBiaXQgMjAgKFNwZWNDdHJsKS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IENodW5qaWUgWmh1IDxjaHVuamllLnpodUBjaXRyaXguY29tPg0K
PiAtLS0NCj4gICBkb2NzL2Rlc2lnbnMvbmVzdGVkLXN2bS1jcHUtZmVhdHVyZXMubWQgfCAx
MyArKysrKysrKysrKysrDQo+ICAgeGVuL2FyY2gveDg2L2NwdS1wb2xpY3kuYyAgICAgICAg
ICAgICAgIHwgIDMgKystDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMg
ICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIDMgZmlsZXMgY2hh
bmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kb2NzL2Rlc2lnbnMvbmVzdGVkLXN2bS1jcHUtZmVhdHVyZXMubWQgYi9kb2NzL2Rl
c2lnbnMvbmVzdGVkLXN2bS1jcHUtZmVhdHVyZXMubWQNCj4gaW5kZXggY2UxNjhlNjhlMWIz
Li42OTk5ZmNmMWJiNzIgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvZGVzaWducy9uZXN0ZWQtc3Zt
LWNwdS1mZWF0dXJlcy5tZA0KPiArKysgYi9kb2NzL2Rlc2lnbnMvbmVzdGVkLXN2bS1jcHUt
ZmVhdHVyZXMubWQNCj4gQEAgLTEwOSwzICsxMDksMTYgQEAgbGVhZiA4MDAwMDAwQTplZHgN
Cj4gICAgIFVzaW5nIGl0IGluIEwwIHJlZHVjZXMgdGhlIGNoYW5jZSB0aGF0IHdlJ2xsIG1h
a2Ugc29tZSBzb3J0IG9mIGVycm9yDQo+ICAgICBpbiB0aGUgZGVjb2RlIHBhdGguICBBbmQg
aWYgaGFyZHdhcmUgc3VwcG9ydHMgaXQsIGl0J3MgZWFzeSBlbm91Z2gNCj4gICAgIHRvIHBy
b3ZpZGUgdG8gdGhlIEwxLg0KPiArDQo+ICstIDIwIGBTcGVjQ3RybGAgKk1TUl9TUEVDX0NU
UkwgdmlydHVhbGlzYXRpb24qOiBSZXF1aXJlIGZvciBMMCwgcHJvdmlkZSB0byBMMQ0KPiAr
DQo+ICsgIEwwIGFscmVhZHkgcmVsaWVzIG9uIHRoaXMgZmVhdHVyZSB0byB2aXJ0dWFsaXpl
IE1TUl9TUEVDX0NUUkwgZm9yIHRoZQ0KPiArICBMMSBoeXBlcnZpc29yIGl0c2VsZiAoc2Vl
IGBYODZfRkVBVFVSRV9TQ19NU1JfSFZNYCkuICBSZXF1aXJpbmcgaXQNCj4gKyAgYXMgYSBi
YXNlbGluZSBmb3IgbmVzdGVkIHZpcnQgKGZpcnN0IGF2YWlsYWJsZSBvbiBaZW4yKSBtZWFu
cyBMMSBjYW4NCj4gKyAgcmVseSBvbiB0aGUgc2FtZSBoYXJkd2FyZSB2aXJ0dWFsaXNhdGlv
biBmb3IgaXRzIG93biBMMiBndWVzdHMsDQo+ICsgIGluc3RlYWQgb2YgaGF2aW5nIEwwIHVu
Y29uZGl0aW9uYWxseSBpbnRlcmNlcHQgYW5kIHRyYXAvZW11bGF0ZQ0KPiArICBNU1JfU1BF
Q19DVFJMIGFjY2Vzc2VzIGNvbWluZyBmcm9tIEwyLiAgUHJvdmlkaW5nIGl0IHRvIEwxIGlz
DQo+ICsgIGJhc2ljYWxseSBmcmVlIG9uY2UgaXQncyByZXF1aXJlZCBvZiBMMCwgYW5kIGl0
IHJlbW92ZXMgYQ0KPiArICBzaWduaWZpY2FudCBhbW91bnQgb2YgIkNQVSB3aXRob3V0IHRo
ZSBmZWF0dXJlIiBmYWxsYmFjayBjb2RlIHRoYXQNCj4gKyAgd291bGQgb3RoZXJ3aXNlIG5l
ZWQgdG8gYmUgaW1wbGVtZW50ZWQgYW5kIG1haW50YWluZWQgZm9yIG5lc3RlZA0KPiArICB2
aXJ0Lg0KDQpJJ20gbm90IHN1cmUgd2UgYWN0dWFsbHkgbmVlZCB0aGlzIHJlcXVpcmVtZW50
Lg0KDQpBIGNvbW1lbnQgcmVnYXJkaW5nIE1TUl9TUEVDX0NUUkwgdmlydHVhbGl6YXRpb24g
c3VnZ2VzdCB0aGF0IA0KTVNSX1NQRUNfQ1RSTCB2aXJ0dWFsaXphdGlvbiBpcyBhcyBvbGQg
YXMgTVNSX1NQRUNfQ1RSTCBpdHNlbGYNCg0KID4gVmlydHVhbGlzaW5nIE1TUl9TUEVDX0NU
UkwgZm9yIGd1ZXN0cyBkZXBlbmRzIG9uIFNWTSBzdXBwb3J0LCB3aGljaA0KID4gb24gcmVh
bCBoYXJkd2FyZSBtYXRjaGVzIHRoZSBhdmFpbGFiaWxpdHkgb2YgTVNSX1NQRUNfQ1RSTCBp
biB0aGUNCiA+IGZpcnN0IHBsYWNlLg0KDQpTbyBpZiB0aGVyZSdzIG5vIE1TUl9TUEVDX0NU
UkwsIHRoZXJlIGlzIG5vdGhpbmcgc3BlY2lhbCB0byBkbyBmb3IgDQpuZXN0ZWQgdmlydC4N
Cg0KV2hhdCB3ZSBjYW4gZXZlbnR1YWxseSBzYXkgaXMgdGhhdCB3ZSBjYW4gcmVxdWlyZSBN
U1JfU1BFQ19DVFJMIA0KdmlydHVhbGl6YXRpb24gc3VwcG9ydCBpZmYgd2Ugd2FudCBob3N0
IE1TUl9TUEVDX0NUUkwuDQoNClRlZGR5DQo=

--------------tQ00g08ndIYtv0xl48kGl02G--

--------------Io78WQajgCjbqwduUL4FFylZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrXgjYFAwAAAAAACgkQZg+p0QLLz9Bx
jgwAn4nlLBevBneb9qFybLuKLNUpNWCKxHR2sYuQHzF5B2OjSxQGSkL4Ah2GzypeUYe8SSWcPIt9
ERBGHASG6MWZ2U+ndeCOdDW62Ha227K5rikr9wiW18+JHX38gINY0mrH8CGVEJunRtXtWr2m9+Z2
8mQpECjcZAP3pZzmvyqhfluKNQ7kfCH1r2q8JUDcf4S3beO9fkbBbxWJS0L0h5aVnU9QEs5bDC8w
nr9msc7PRxpCxI6DFqdRadYFK53fpe6B4SahJpByYsLxTb0krn0KkZWWuFMYbXDeY0ckL54fjN98
fb13VHl4QU3DmncVku6okWYMHD+lK4MR4fCfjQJtSsiLdJ9KOayF9uRAe2DITWgd/sdFuzaNJfoJ
2uBvLmwMnY2IKiNxLpg4ar1HxwrXaZPg5GoyDRAcXlASPHeuiAnbiksGZZsWXzRytNiJIyZbXaVe
ssk3tLLQI9Hz4hSDwd72TAav037SHTbzEk/RAJfEby4H8AK+Ygpyd9Xkt9jm
=1MXX
-----END PGP SIGNATURE-----

--------------Io78WQajgCjbqwduUL4FFylZ--

