Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32684C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:08:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427393.1650090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8coU-0003VF-M7; Mon, 21 Sep 2026 12:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427393.1650090; Mon, 21 Sep 2026 12:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8coU-0003V8-JS; Mon, 21 Sep 2026 12:08:02 +0000
Received: by outflank-mailman (input) for mailman id 1427393;
 Mon, 21 Sep 2026 12:08:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c3dda3d100072c4@swg.vates.tech>)
 id 1x8coT-0003V2-Dc
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:08:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8coS-00H2q9-6i
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:08:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c3dda3d100072c4@swg.vates.tech>)
 id 6ab11e12-8faa-0a2a0a5109dd-0a2a45098916-46
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:07:59 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c3dda3d100072c4@swg.vates.tech>)
 id 6ab11e1f-be1a-0a2a45090019-b9ff1c238c49-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:07:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c3dda3d100072c4.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 21 Sep 2026 12:07:57 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D352D81038;
 Mon, 21 Sep 2026 14:07:56 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=O65EXIF7HisMV2bCmSIZewpYY3sknTxvXnrdk1UNrrc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lQCRPvv1tCZkibBd0s0kgAJTFV0rMpiSMnUhmM5e8fupxqHykc7ai8NtFHJpa1pqzQfpzc6pt
 LzfYbYVtZGDbZTwq5K6RPNR7ZdHEUTLLByyvVpDSLBP5vbPgN0Uy4CJ12uFch6ZnrqOIjO+scSl
 CXqrrc8cWuecVNfPXsogbKrXaYuJAR2XlkolutNdIXhKXbRN1Q0p/4t5rrBeq43qdN2cIhM/bEj
 5uEClGleaVkBTWhwun2osqlfHHZq8IgEn8DSa2S3eMWcURAJhS2J6kT5XTtuiwaNtkRBB87k3GD
 x9ravqfo10hnJAiV+pb8urc4sfcfJxelFHdnMH0TGd/A==
X-Zone-Loop: d39fb3a66c6bf88412421e552e8b24a99b571269b2b6
x-campaign-type: default
x-transaction-id: 92310eea-b395-422a-9ee1-91af3eb16236
x-swg-uid: 01-7d4da256-67c7-4dea-b167-f878d7e8dc3d
X-Mailer: Sweego
Message-ID:
 <1789992477.8631fc262581453bbf619ec5b2062170.1a0c3dda3d100072c4@vates.tech>
x-swg-bid: 1789992477.8631fc262581453bbf619ec5b2062170.1a0c3dda3d100072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 21 Sep 2026 14:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vmx: Handle TDX instruction exit reasons
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
 <f385481b-1137-4918-b2a4-6a086887a367@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <f385481b-1137-4918-b2a4-6a086887a367@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tTLUA3GxVoj75Je0Tsp040XN"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789992476978
X-purgate-ID: tlsNG-bad1c0/1789992479-3A0C5034-1F831EA1/0/0
X-purgate-type: clean
X-purgate-size: 6364

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tTLUA3GxVoj75Je0Tsp040XN
Content-Type: multipart/mixed; boundary="------------hnikHOMjpaNb9fu0hZyBU03P";
 protected-headers="v1"; hp="clear"
Message-ID: <3cfd39cf-a235-41ce-bae8-7898e3265dcf@vates.tech>
Date: Mon, 21 Sep 2026 14:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vmx: Handle TDX instruction exit reasons
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1789049962.8631fc262581453bbf619ec5b2062170.1a08bb0014d000c4f3@vates.tech>
 <f385481b-1137-4918-b2a4-6a086887a367@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <f385481b-1137-4918-b2a4-6a086887a367@suse.com>

--------------hnikHOMjpaNb9fu0hZyBU03P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjEvMDkvMjAyNiDDoCAxMzowNywgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MTAuMDkuMjAyNiAxNjoxNywgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBPbiBoYXJkd2FyZSB0
aGF0IHN1cHBvcnRzIFREWCwgZ3Vlc3RzIGNhbiBjYXVzZSBWTUVYSVQgcmVsYXRlZCB0bw0K
Pj4gVERYIGluc3RydWN0aW9ucyAoU0VBTUNBTEwgYW5kIFREQ0FMTCkgcmVnYXJkbGVzcyBv
ZiBWTUNTIGNvbmZpZ3VyYXRpb24uDQo+IA0KPiBDYW4gdGhleT8gU0VBTUNBTEwgcHNldWRv
Y29kZSBoYXMNCj4gDQo+IEVMU0lGIElBMzJfU0VBTVJSX01BU0suVkFMSUQgPSAwIG9yIGV2
ZW50cyBibG9ja2VkIGJ5IE1PViBTUw0KPiBUSEVOICNHUCgwKTsNCj4gRUxTSUYgU0VBTSBp
cyBnbG9iYWxseSBkaXNhYmxlZA0KPiBUSEVOIFZNRmFpbEludmFsaWQ7DQo+IA0KDQpFYXJs
aWVyIGluIHRoZSBpZiBjaGFpbiwgdGhlcmUgaXMNCg0KRUxTSUYgaW4gVk1YIG5vbi1yb290
IG9wZXJhdGlvbg0KVEhFTiBWTSBleGl0Ow0KDQpXaGVuIHJ1bm5pbmcgaW5zaWRlIHRoZSBn
dWVzdCwgd2UncmUgZWZmZWN0aXZlbHkgaW4gVk1YIG5vbi1yb290IG1vZGUsIA0Kd2hpY2gg
d291bGQgdHJpZ2dlciB0aGUgVk1FWElULg0KDQpUaGlzIGlzc3VlIGlzIGRvY3VtZW50ZWQg
aW4gYSBkZWRpY2F0ZWQgSW50ZWwgYWR2aXNvcnkgWzFdICh0aGVyZSBpcyANCmFsc28gbWlj
cm9jb2RlIGJ1ZyBDVkUtMjAyNC0yMjM3NCB3aGljaCBtYWtlcyBpdCB0cmlnZ2VyYWJsZSBm
cm9tIGd1ZXN0IA0KdXNlcmxhbmQpLg0KDQpbMV0gDQpodHRwczovL3d3dy5pbnRlbC5jb20v
Y29udGVudC9kYW0vd3d3L3B1YmxpYy91cy9lbi9zZWN1cml0eS1hZHZpc29yeS9kb2N1bWVu
dHMvaW50ZWxfdGR4X2pvaW50X3NlY3VyaXR5X3Jldmlld193aXRoX21pY3Jvc29mdC5wZGYg
DQooVnVsbmVyYWJpbGl0eSA2KQ0KDQo+IEZvciBURENBTEwgSSBzZWUNCj4gDQo+IElGIG5v
dCBpbiBTRUFNIG5vbi1yb290IG9wZXJhdGlvbiBhbmQgbm90IGluIFZNWCBub24tcm9vdCBv
cGVyYXRpb24NCj4gVEhFTiAjVUQ7DQo+IA0KPiB3aGljaCBtYXkgaW5kZWVkIG5vdCBiZSBz
dWZmaWNpZW50LCBidXQgdGhlIFNFQU1DQUxMIGNvbmRpdGlvbnMgc2hvdWxkbid0DQo+IGJl
IG1ldCB1bmRlciBwcmVzZW50IFhlbj8NCj4gDQoNClREQ0FMTCBwcm9iYWJseSBkb24ndCBu
ZWVkIGl0LCBidXQgSSBkb24ndCB0aGluayB0aGlzIGlzIHdyb25nIHRvIHRyZWF0IA0KaXQg
c2ltaWxhcmx5IChsaWtlIEtWTSBkb2VzIFsyXSkuDQoNCj4gSmFuDQoNClsyXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTEwMTYxODIxNDguNjkwODUtMi1zZWFuamNAZ29v
Z2xlLmNvbS8NCg==

--------------hnikHOMjpaNb9fu0hZyBU03P--

--------------tTLUA3GxVoj75Je0Tsp040XN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqxHhwFAwAAAAAACgkQZg+p0QLLz9Bs
2Qv9G89HFbMUeqjbIsnl+YvyYIfVbx5nReqSaEx9+MxedLu4I3/0ruYJxJn38NxRxZ0kPn9BxQzN
OOWvYfLPYk7NB7BJBXGK3qm7p2/CEDB7QuEEugp7am9C4FqAYBhhap2FHoEK5y0au+LToYKFQvOU
bpNaWEepAlVkEU1/DfNaH8Jmt3pkcP+j1BfCte+MHkJa1Jd/BsiWQylnoivuIC1SzS5FFSDaGCiU
+9VJlOIR9piE7ovWLV9Y4vsSr5gDaxDT/Vfh5nY6xm8ThaeqSTZ2B8f3485MWr0s5p4A8n5ly2CI
rgglila4glNHjhATGNBKQkzKitL+T4Q3Jcq8LWluv9iAyNZ23RmwOq9C4ATCJvAd+176ZktF5+8C
qx70yJNk9JQaJLsBpwgS/k0magshaCZ04Jkg5Fie5ddaERxwnVWM9yRwA+MGG9+x6aVG6ruodBpZ
GN26yeeH7nTw8dmxR3FcQx3WrhfkwB7hCmyhr9L8DOqL3JRitsiTk1G5uxeL
=i3Hc
-----END PGP SIGNATURE-----

--------------tTLUA3GxVoj75Je0Tsp040XN--

