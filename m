Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C772E606A31C
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 11:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=CRGXMEH7
Received: from list by lists.xenproject.org with outflank-mailman.1466697.1676504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN6x2-0000zQ-5j; Sat, 31 Oct 2026 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466697.1676504; Sat, 31 Oct 2026 11:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN6x2-0000zJ-1z; Sat, 31 Oct 2026 11:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1466697;
 Sat, 31 Oct 2026 11:08:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a191a5b6fb000403d@swg.vates.tech>)
 id 1xN6x1-0000zB-3H
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 11:08:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xN6x0-005NRH-9E
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 12:08:42 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a191a5b6fb000403d@swg.vates.tech>)
 id 6ae5cbfc-8faa-0a2a0a5109dd-0a2a4501e93e-12
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 12:08:42 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a191a5b6fb000403d@swg.vates.tech>)
 id 6ae5cc39-5984-0a2a45010019-b9ff1c238235-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 12:08:41 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a191a5b6fb000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Oct 2026 11:08:39 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id F11AD81EBC;
 Sat, 31 Oct 2026 12:08:37 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=YBi1NPq2OfyD4iRQHg7RAfi37SJsX6sq51DOy06Gmts=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CRGXMEH75Hhn46O+8+Tnlnu1iajuI42+uahamxdsmWl9S4dpQZ7icQrfS6q9uICCt75qH8p/F
 lkQs3+Wugz+/wXe4CBUoVtCFLeEdLH5266v/TzZUMavYg0+T0WXBwwqKGBOFes4oxQwmL800+ij
 y09J9NNuYoU8OYGalHYBSfHSHeaAsJKjq/3uGF+t3ldtfwtStpV/hP2q9XBPfI3HCm60BcLv9xj
 y962HR+zvn9gswhGOqJu+w3Zf5CiJPEKhPFdh7iTcAJPxRE+OXMtZR54tfB9tuPSrEF5J/172N0
 HKgvQhug1oOYCuhCOg+MYGKkVSW8Ert4FS1gxtHh1sTg==
X-Zone-Loop: 8b84299776f6467e62cb4af6058519646970554c0d2f
x-campaign-type: default
x-transaction-id: 12f09163-a535-44a8-82a8-8f0e3258c1b6
x-swg-uid: 01-833b630c-45de-46f0-8d58-79f978b0e8f4
X-Mailer: Sweego
Message-ID:
 <1793444919.8631fc262581453bbf619ec5b2062170.1a191a5b6fb000403d@vates.tech>
x-swg-bid: 1793444919.8631fc262581453bbf619ec5b2062170.1a191a5b6fb000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Sat, 31 Oct 2026 12:08:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/HVM: defer IOTLB flushes across a grant unmap
 batch
To: Luca Di Maio <luca@edera.dev>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20261030165031.2560020-1-luca@edera.dev>
 <20261030165031.2560020-3-luca@edera.dev>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261030165031.2560020-3-luca@edera.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GuqJ0Zo5xmqXCS6qtRw5Y923"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793444918201
X-purgate-ID: tlsNG-d62444/1793444921-1DA7E757-7445FC07/0/0
X-purgate-type: clean
X-purgate-size: 6785
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------GuqJ0Zo5xmqXCS6qtRw5Y923
Content-Type: multipart/mixed; boundary="------------p8x9OZyywWhSKql3KUk1f4fX";
 protected-headers="v1"; hp="clear"
Message-ID: <5653a1cd-5a96-408d-9895-41e45be1d4b3@vates.tech>
Date: Sat, 31 Oct 2026 12:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/HVM: defer IOTLB flushes across a grant unmap
 batch
To: Luca Di Maio <luca@edera.dev>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20261030165031.2560020-1-luca@edera.dev>
 <20261030165031.2560020-3-luca@edera.dev>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261030165031.2560020-3-luca@edera.dev>

--------------p8x9OZyywWhSKql3KUk1f4fX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMTAvMjAyNiDDoCAxNzo1MywgTHVjYSBEaSBNYWlvIGEgw6ljcml0wqA6DQo+IGdu
dHRhYl91bm1hcF9ncmFudF9yZWYoKSBmbHVzaGVzIHRoZSBUTEJzIG9mIGEgUFYgY2FsbGVy
IG9uY2UgcGVyIGdyb3VwDQo+IG9mIEdOVFRBQl9VTk1BUF9CQVRDSF9TSVpFIHVubWFwcy4g
QSB0cmFuc2xhdGVkIGNhbGxlciBpbnN0ZWFkIGdldHMgYW4NCj4gSU9UTEIgZmx1c2ggcGVy
IHBhZ2UgZnJvbSB0aGUgcDJtIGNvZGUsIHNvIG5ldGJhY2sgaW4gYSBQVkggZG9tMCBpc3N1
ZXMNCj4gb25lIGZvciBldmVyeSBwYWdlIGEgZG9tVSB0cmFuc21pdHMuDQo+IA0KPiBPcGVu
IGEgYmF0Y2ggZm9yIHRyYW5zbGF0ZWQgY2FsbGVycyBiZWZvcmUgZWFjaCBncm91cCwgYW5k
IGVuZCBpdCBuZXh0DQo+IHRvIGdudHRhYl9mbHVzaF90bGIoKSwgc28gYmVmb3JlIHVubWFw
X2NvbW1vbl9jb21wbGV0ZSgpIHJlbGVhc2VzIHRoZQ0KPiBwYWdlcy4gRW5kaW5nIHRoZSBi
YXRjaCBmbHVzaGVzIHRoZSBzbWFsbGVzdCBhbGlnbmVkIHBvd2VyLW9mLXR3byByYW5nZQ0K
PiBob2xkaW5nIGFsbCB0aGUgdW5tYXBwZWQgZ2ZucywgYXMgVlQtZCBmbHVzaGVzIGFueSBv
dGhlciByYW5nZSBhcyBhDQo+IHdob2xlIGRvbWFpbi4NCg0KVGhhdCBpcyBWVC1kIHNwZWNp
ZmljIGltcGxlbWVudGF0aW9uIHF1aXJrLg0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRl
ciBhZGRyZXNzZWQgaW50byBWVC1kIGNvZGUgZGlyZWN0bHkgKHNlZSANCnZ0ZC9pb21tdS5j
I2lvbW11X2ZsdXNoX2lvdGxiKS4NCg0KPiANCj4gVGhlIGJhdGNoIGxpdmVzIGluIHRoZSB2
Q1BVLCBhbmQgaW9tbXVfZG9udF9mbHVzaF9pb3RsYiBpc24ndCBoZWxkDQo+IGFjcm9zcyB0
aGUgZ3Vlc3QgY29waWVzIGJldHdlZW4gdGhlIHVubWFwcywgYXMgdGhvc2UgY2FuIHNsZWVw
IG9uIGENCj4gdm1fZXZlbnQgcmluZyBhbmQgY2hhbmdlIHRoZSBwMm0sIGUuZy4gYnkgdW5z
aGFyaW5nIGEgcGFnZS4gSWYgdGhlDQo+IGZsdXNoIGZhaWxzLCB0aGUgcGFnZXMgbWF5IHN0
aWxsIGJlIHJlYWNoYWJsZSB0aHJvdWdoIHRoZSBJT01NVSwgc28NCj4gdGhlIGdyb3VwIGlz
bid0IGNvbXBsZXRlZCBhbmQgaXRzIHBhZ2VzIGxlYWsuDQo+IA0KPiBQViBjYWxsZXJzLCBB
cm0sIGFuZCBvdGhlciBjYWxsZXJzIG9mIHJlcGxhY2VfZ3JhbnRfaG9zdF9tYXBwaW5nKCkg
YXJlDQo+IHVuY2hhbmdlZC4NCj4gDQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGUgQ29kZTpjbGF1
ZGUtb3B1cy01LTUNCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBEaSBNYWlvIDxsdWNhQGVkZXJh
LmRldj4NCj4gDQoNCldvdWxkIGl0IGJlIGJldHRlciBtb3ZlZCB0byBnZW5lcmljIElPTU1V
ICJpb21tdV9kb250X2ZsdXNoX2lvdGxiIiBsb2dpYyANCnN1Y2ggdGhhdCBpdCBpbnN0ZWFk
IHRyYWNrcyB3aGljaCByYW5nZSBnb3QgbW9kaWZpZWQgKGkuZSB3aGF0IHJhbmdlIHRvIA0K
Zmx1c2gpID8NCg0KVGVkZHkNCg==

--------------p8x9OZyywWhSKql3KUk1f4fX--

--------------GuqJ0Zo5xmqXCS6qtRw5Y923
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrlzDUFAwAAAAAACgkQZg+p0QLLz9Dr
+Av9F3EgjjJ+jpC2fJZTWTLLFv/D6a5ROsmFEXhusOZm5TJSioGjM/I7njXawLJ31KqxRIpxdddc
6FXtHk1eL70YpNCnMUQ1QmY2SzqNJFZ7Gezcw6yvhL4qLxRW6xYVQ7Epso6ba+G9mgvaO0F/HiCL
2rmbhYKECk1GKcL+yTeLA9BRuRCbXXexbaTKaJ4NqgIjsfKlf0cXLT1+MU6zQLA/IToKEEwjrEv3
I3ildYiIUDVViOE7ABxNtE/tkdeUGVoFNDZs/M2xBh3VyW891m32mZVQvcLoIJFCcDUDx2RP/aS5
VdzTNRq8xdEJm7WKVFuv869AY5WBZqIT99K4LIYlVkP74auDcxqA7aDun/lyHakNjLEZ/T6z9erd
CMtXUwVtJYHeWVb809Evpbd8lNCdIJRmUjgOX3KBF77h4owMGT/DN5ehEE88szJLSAQQYBKJXCgG
sePRpBgFR5UQwl/yYqwbK73i3SmPnoyj1mWJOqFlW8+tN4753KratMvYJQUf
=Q3kR
-----END PGP SIGNATURE-----

--------------GuqJ0Zo5xmqXCS6qtRw5Y923--

