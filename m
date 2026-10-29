Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF9606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ew9TRJYz
Received: from list by lists.xenproject.org with outflank-mailman.1464436.1675135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNyr-00033s-6h; Thu, 29 Oct 2026 11:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464436.1675135; Thu, 29 Oct 2026 11:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNyr-00033l-3G; Thu, 29 Oct 2026 11:07:37 +0000
Received: by outflank-mailman (input) for mailman id 1464436;
 Thu, 29 Oct 2026 11:07:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18757e9d0000f79f@swg.vates.tech>)
 id 1xMNyp-00033C-8d
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 11:07:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMNyo-005OxU-5d
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 12:07:34 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18757e9d0000f79f@swg.vates.tech>)
 id 6ae328ef-e002-0a2a0a5209dd-0a2a4504e5e2-18
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 12:07:33 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a18757e9d0000f79f@swg.vates.tech>)
 id 6ae328f5-b57f-0a2a45040019-b9ff1c228277-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 12:07:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a18757e9d0000f79f.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 11:07:28 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2126282159;
 Thu, 29 Oct 2026 12:07:27 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=cjMzGO01G3hOFMmT9X5LdO+DnHW9oHX6RTdHSYMWhNA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ew9TRJYzkqRGKgUyy95kNQHJqjttx5Ya8i+QORweJUowjnDTd/sFZDk8SSU3oMpm7ei9GOQk2
 zoHHBBP1LX0zayuo+pWCgQk0weDoxze6OYIVkZtK9Uj0ykkERQ47Y1dL0sMnQoXypm4tp0ABrP0
 SX1L+PyrVjRxqwZw/+jRKJWrYpjwV9L5OKTtnigkeBXwYdXi/nc4O2AC3sLAQR+0HESL0+FSGn/
 /OziFNMUpDIc2YoU1DBv5UndDKmHLQ5K8c1OMJYiErZcwtM4L2CzIriFqp1kMPjISbrhITvfFVH
 K5nPWmloxshBj4UE9gJlTrOC5IajudqZCyVKgOQaZeyg==
X-Zone-Loop: 57114da202241c6487c154364158802d17c5920653a6
x-campaign-type: default
x-transaction-id: f9b1dac3-b34c-4e62-ac82-5eefdee38539
x-swg-uid: 01-bbdf37e0-82bd-4cef-af07-e4b6f28eb90e
X-Mailer: Sweego
Message-ID:
 <1793272048.8631fc262581453bbf619ec5b2062170.1a18757e9d0000f79f@vates.tech>
x-swg-bid: 1793272048.8631fc262581453bbf619ec5b2062170.1a18757e9d0000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 29 Oct 2026 12:07:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] tools/libs/guest: add XCFLAGS_COMPRESS_LZ4 to
 request LZ4 compression
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
 <20261020200238.1815766-7-marcus.granado@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020200238.1815766-7-marcus.granado@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k9qiSCKGyvxPnYWYuW09oQ57"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793272047286
X-purgate-ID: tlsNG-ebf023/1793272053-512DCB50-B5098AA7/0/0
X-purgate-type: clean
X-purgate-size: 8276
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k9qiSCKGyvxPnYWYuW09oQ57
Content-Type: multipart/mixed; boundary="------------wTsRs3hVkkBSpEXKKVHtwKIf";
 protected-headers="v1"; hp="clear"
Message-ID: <9eaf727c-50b2-4b0e-b9b4-290272287d85@vates.tech>
Date: Thu, 29 Oct 2026 12:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] tools/libs/guest: add XCFLAGS_COMPRESS_LZ4 to
 request LZ4 compression
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
 <20261020200238.1815766-7-marcus.granado@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020200238.1815766-7-marcus.granado@citrix.com>

--------------wTsRs3hVkkBSpEXKKVHtwKIf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMTAvMjAyNiDDoCAyMjowNSwgTWFyY3VzIEdyYW5hZG8gYSDDqWNyaXTCoDoNCj4g
Tm90aGluZyBzZXRzIGN0eC0+c2F2ZS5jb21wcmVzc2lvbiB0byBYQ19TUl9DT01QUkVTU19M
WjQsIHNvIHRoZSBMWjQNCj4gcGF0aCBpbiB3cml0ZV9iYXRjaCgpIGlzIHVucmVhY2hhYmxl
IGFuZCBhIGNhbGxlciBvZiB4Y19kb21haW5fc2F2ZSgpDQo+IGhhcyBubyB3YXkgdG8gYXNr
IGZvciBjb21wcmVzc2VkIFBBR0VfREFUQSByZWNvcmRzLg0KPiANCj4gQWRkIFhDRkxBR1Nf
Q09NUFJFU1NfTFo0IGFuZCBzZWxlY3QgTFo0IHdoZW4gaXQgaXMgc2V0LiAgQSBjYWxsZXIg
d2hpY2gNCj4gZG9lcyBub3Qgc2V0IGl0IHNlZXMgbm8gY2hhbmdlOyBvbmUgd2hpY2ggZG9l
cyBuZWVkcyBhIHJlY2VpdmVyIGFibGUgdG8NCj4gZGVjb21wcmVzcyBMWjQuDQo+IA0KPiBB
IGxpYnhlbmd1ZXN0IGJ1aWx0IHdpdGhvdXQgYSBzdXBwb3J0ZWQgbGlibHo0IGNhbm5vdCBo
b25vdXIgdGhlIGZsYWcsDQo+IHNvIGZhaWwgdXAgZnJvbnQgd2l0aCBFT1BOT1RTVVBQIHJh
dGhlciB0aGFuIHNpbGVudGx5IHNlbmQgdW5jb21wcmVzc2VkDQo+IHJlY29yZHMuDQo+IA0K
PiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQ0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXJjdXMgR3JhbmFkbyA8bWFyY3VzLmdyYW5hZG9AY2l0cml4LmNvbT4NCj4gLS0tDQo+
IA0KPiBOb3RlczoNCj4gICAgICBDaGFuZ2VzIGluIHYyOg0KPiAgICAgIC0gV2FzIHYxIDUv
Ni4NCj4gICAgICAtIFNldCBjdHgtPnNhdmUuY29tcHJlc3Npb247IHRoZSBmaWVsZCBtb3Zl
ZCBpbnRvIHRoZSBzYXZlIGNvbnRleHQuDQo+ICAgICAgDQo+ICAgICAgQml0IDIgd2FzIFhD
RkxBR1NfSFZNIHVudGlsIGNvbW1pdCAyMDA0ZGIzY2VkMTggKCJ0b29scy9zYXZlOiBEcm9w
DQo+ICAgICAgdW51c2VkIHBhcmFtZXRlcnMgZnJvbSB4Y19kb21haW5fc2F2ZSgpIikgcmVt
b3ZlZCBpdCBpbiA0LjE0Lg0KPiANCj4gICB0b29scy9pbmNsdWRlL3hlbmd1ZXN0LmggICAg
ICB8ICA1ICsrKy0tDQo+ICAgdG9vbHMvbGlicy9ndWVzdC94Z19zcl9zYXZlLmMgfCAxMSAr
KysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL3hlbmd1ZXN0
LmggYi90b29scy9pbmNsdWRlL3hlbmd1ZXN0LmgNCj4gaW5kZXggMmEyNzdjYjdjZC4uNzAz
MDFjMmY0OCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaW5jbHVkZS94ZW5ndWVzdC5oDQo+ICsr
KyBiL3Rvb2xzL2luY2x1ZGUveGVuZ3Vlc3QuaA0KPiBAQCAtMjQsOCArMjQsOSBAQA0KPiAg
IA0KPiAgICNkZWZpbmUgWENfTlVNQV9OT19OT0RFICAgKH4wVSkNCj4gICANCj4gLSNkZWZp
bmUgWENGTEFHU19MSVZFICAgICAgKDEgPDwgMCkNCj4gLSNkZWZpbmUgWENGTEFHU19ERUJV
RyAgICAgKDEgPDwgMSkNCj4gKyNkZWZpbmUgWENGTEFHU19MSVZFICAgICAgICAgKDEgPDwg
MCkNCj4gKyNkZWZpbmUgWENGTEFHU19ERUJVRyAgICAgICAgKDEgPDwgMSkNCj4gKyNkZWZp
bmUgWENGTEFHU19DT01QUkVTU19MWjQgKDEgPDwgMikgLyogTFo0IG9uIHNhdmU7IHJlc3Rv
cmVyIG5lZWRzIExaNCAqLw0KPiAgIA0KPiAgICNkZWZpbmUgWDg2XzY0X0JfU0laRSAgIDY0
DQo+ICAgI2RlZmluZSBYODZfMzJfQl9TSVpFICAgMzINCj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnMvZ3Vlc3QveGdfc3Jfc2F2ZS5jIGIvdG9vbHMvbGlicy9ndWVzdC94Z19zcl9zYXZl
LmMNCj4gaW5kZXggNGZhMWQyMjg1OS4uZmUzZDc4YmRkNiAxMDA2NDQNCj4gLS0tIGEvdG9v
bHMvbGlicy9ndWVzdC94Z19zcl9zYXZlLmMNCj4gKysrIGIvdG9vbHMvbGlicy9ndWVzdC94
Z19zcl9zYXZlLmMNCj4gQEAgLTExNjYsNiArMTE2NiwxNyBAQCBpbnQgeGNfZG9tYWluX3Nh
dmUoeGNfaW50ZXJmYWNlICp4Y2gsIGludCBpb19mZCwgdWludDMyX3QgZG9tLA0KPiAgICAg
ICBjdHguc2F2ZS5kZWJ1ZyA9ICEhKGZsYWdzICYgWENGTEFHU19ERUJVRyk7DQo+ICAgICAg
IGN0eC5zYXZlLnJlY3ZfZmQgPSByZWN2X2ZkOw0KPiAgIA0KPiArICAgIGlmICggZmxhZ3Mg
JiBYQ0ZMQUdTX0NPTVBSRVNTX0xaNCApDQo+ICsgICAgew0KPiArI2lmIGRlZmluZWQoWEdf
U1JfTFo0KQ0KPiArICAgICAgICBjdHguc2F2ZS5jb21wcmVzc2lvbiA9IFhDX1NSX0NPTVBS
RVNTX0xaNDsNCj4gKyNlbHNlDQo+ICsgICAgICAgIEVSUk9SKCJYQ0ZMQUdTX0NPTVBSRVNT
X0xaNCByZXF1ZXN0ZWQgYnV0IGxpYnhlbmd1ZXN0IHdhcyBidWlsdCB3aXRob3V0IGEgc3Vw
cG9ydGVkIGxpYmx6NCIpOw0KPiArICAgICAgICBlcnJubyA9IEVPUE5PVFNVUFA7DQo+ICsg
ICAgICAgIHJldHVybiAtMTsNCj4gKyNlbmRpZg0KPiArICAgIH0NCj4gKw0KPiAgICAgICBp
ZiAoIHhjX2RvbWFpbl9nZXRpbmZvX3NpbmdsZSh4Y2gsIGRvbSwgJmN0eC5kb21pbmZvKSA8
IDAgKQ0KPiAgICAgICB7DQo+ICAgICAgICAgICBQRVJST1IoIkZhaWxlZCB0byBnZXQgZG9t
YWluIGluZm8iKTsNCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2
YXRlcy50ZWNoPg0KDQpUZWRkeQ0K

--------------wTsRs3hVkkBSpEXKKVHtwKIf--

--------------k9qiSCKGyvxPnYWYuW09oQ57
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrjKO4FAwAAAAAACgkQZg+p0QLLz9BK
0QwAoAxjgLJqXkEVW3PqhZaXQuXvKUB+0brXJviAYHZRmxyULAh4ohiQ9cF3a5jIaRhWZmoYMrAR
+qRmdoPCKNOJ221HxgAutnNh6IFd13+G4Mw4JfH5P2s+GuXx3WxXW2lxEe2I/Csy8WiTHFqyZcEa
//FXQZJ0oisv9VWULZLx0I6QcY6ZHe4Vy4IB0hX6I/cZ1a9pxyb5BI7Ard+p0cJwGwnKwxhCReq0
+oUc8mLfvqKO5vEfvw1hFBT1S78UBgSOBvU2EY3e6Q65mePlrLfoGAfI5lP8luTTQEvNb5gLVvMs
8Gk4HY4F3GbpQXqejIhkHsnIo5eKY+5pkhf8Ff9VoiXqFHAd1Q3F5MIIvaoEU9THc1P2QDDdZMCJ
SH5F/cehlPTAJZSIkRlyPk89dGX6hu8yjI6GMB8oGLhSe4Kexvqsl93lP+nrD7iQDZigEez86oRd
qZeI+IcJkhE+8EZ1cx4SgGvxKor6hBXvgTRE/hzGiDr22aeDqWut1zpK0tA4
=1HQ6
-----END PGP SIGNATURE-----

--------------k9qiSCKGyvxPnYWYuW09oQ57--

