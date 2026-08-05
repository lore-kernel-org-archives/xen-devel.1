Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641D2C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:04:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383467.1626741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbHV-0003W1-UQ; Wed, 05 Aug 2026 13:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383467.1626741; Wed, 05 Aug 2026 13:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbHV-0003Vu-Rq; Wed, 05 Aug 2026 13:03:37 +0000
Received: by outflank-mailman (input) for mailman id 1383467;
 Wed, 05 Aug 2026 13:03:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd205a597000e099@swg.vates.tech>)
 id 1wrbHU-0003Vk-RY
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:03:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrbHU-004exm-2c
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:03:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd205a597000e099@swg.vates.tech>)
 id 6a7334a4-2eae-0a2a0a5409dd-0a2a45038e3c-10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:03:35 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd205a597000e099@swg.vates.tech>)
 id 6a7334a6-fae8-0a2a45030019-b9ff1c12b033-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:03:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fd205a597000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 05 Aug 2026 13:03:33 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9855F83532;
 Wed,  5 Aug 2026 15:03:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ZF6WP7UgFAc2NwspHi2jmBKrhGZX12HLI7355rllVlY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bKzS3fH8fcTgmTMH919eLmqA0iiG7PfxBrOy255DtkOcUW1uXnC6Ry+HCDzkrXJsah6t/IX0D
 rviASMjk5sX5nt9PKWVBm/6/utqWiBwCWXxYcaqQ+LJc8n7iNUpbH8igGhuiMzLLJK5wsGN6A9i
 bFhh8uc96KAVJcAVOBLaP4j/7D1P3KPERe7jZbt/PMTn52r/Xgnam2ZwEK9yh6ItIFAAubAqJLk
 Iz117q1924YM7GfVKV62NshJEvpP0V3JYP2zGd+G+8VqW8x7srEJrdKGbMQ6c5xjKHgwL0LprCk
 atSyPFQc9++P8qw0jPSG9HlCjkhC2x7IWytaJcDcggpA==
X-Zone-Loop: 1aa6608b4569365f6f40efd511b4be805d3142dc85b3
x-campaign-type: default
x-transaction-id: 87f2a609-f5fe-4793-b9ca-dd303678cb73
x-swg-uid: 01-5f0b3d50-284b-4c41-9694-8db580106f0a
X-Mailer: Sweego
Message-ID:
 <1785935013.8631fc262581453bbf619ec5b2062170.19fd205a597000e099@vates.tech>
x-swg-bid: 1785935013.8631fc262581453bbf619ec5b2062170.19fd205a597000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 5 Aug 2026 15:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/5] vtd: Ensure root entry is updated consistently
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319678.8631fc262581453bbf619ec5b2062170.19fad586037000e099@vates.tech>
 <a10f82fb-c4fa-493a-88cc-0b5d4c8db3ff@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <a10f82fb-c4fa-493a-88cc-0b5d4c8db3ff@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mBz3RI5Xho308WveCHZtQD4r"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785935012731
X-purgate-ID: tlsNG-33051d/1785935015-6E0D14E9-F747BA69/0/0
X-purgate-type: clean
X-purgate-size: 7999

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mBz3RI5Xho308WveCHZtQD4r
Content-Type: multipart/mixed; boundary="------------6W4b2IEA0qJW7DYa5oUm8d4W";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <60a9556b-4d2c-40ce-ada8-e20e7c28df43@vates.tech>
Subject: Re: [RESEND PATCH 1/5] vtd: Ensure root entry is updated consistently
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319678.8631fc262581453bbf619ec5b2062170.19fad586037000e099@vates.tech>
 <a10f82fb-c4fa-493a-88cc-0b5d4c8db3ff@suse.com>
In-Reply-To: <a10f82fb-c4fa-493a-88cc-0b5d4c8db3ff@suse.com>

--------------6W4b2IEA0qJW7DYa5oUm8d4W
Content-Type: multipart/mixed; boundary="------------BXis0eJJqRvCkaDxo25jEDMC"

--------------BXis0eJJqRvCkaDxo25jEDMC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDQvMDgvMjAyNiDDoCAxODowMCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjkuMDcuMjAyNiAxMjowNSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMNCj4+IEBAIC0yODEsMTMgKzI4MSwxMyBAQCB2b2lkIGZy
ZWVfcGd0YWJsZV9tYWRkcih1NjQgbWFkZHIpDQo+PiAgIC8qIGNvbnRleHQgZW50cnkgaGFu
ZGxpbmcgKi8NCj4+ICAgc3RhdGljIHU2NCBidXNfdG9fY29udGV4dF9tYWRkcihzdHJ1Y3Qg
dnRkX2lvbW11ICppb21tdSwgdTggYnVzKQ0KPj4gICB7DQo+PiAtICAgIHN0cnVjdCByb290
X2VudHJ5ICpyb290LCAqcm9vdF9lbnRyaWVzOw0KPj4gKyAgICBzdHJ1Y3Qgcm9vdF9lbnRy
eSByb290LCAqcm9vdF9lbnRyaWVzOw0KPj4gICAgICAgdTY0IG1hZGRyOw0KPj4gICANCj4+
ICAgICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZCgmaW9tbXUtPmxvY2spKTsNCj4+ICAgICAg
IHJvb3RfZW50cmllcyA9IChzdHJ1Y3Qgcm9vdF9lbnRyeSAqKW1hcF92dGRfZG9tYWluX3Bh
Z2UoaW9tbXUtPnJvb3RfbWFkZHIpOw0KPj4gLSAgICByb290ID0gJnJvb3RfZW50cmllc1ti
dXNdOw0KPj4gLSAgICBpZiAoICFyb290X3ByZXNlbnQoKnJvb3QpICkNCj4+ICsgICAgcm9v
dC52YWwgPSBBQ0NFU1NfT05DRShyb290X2VudHJpZXNbYnVzXS52YWwpOw0KPiANCj4gSSdt
IHByZXR0eSBjb25jZXJuZWQgYWJvdXQgdGhpczogWW91J3JlIHJlYWRpbmcgb25seSBoYWxm
IG9mIHRoZSBlbnRyeSBoZXJlLA0KPiBhbmQgeW91J3JlIHdyaXRpbmcgb25seSBoYWxmIG9m
IGl0IGZ1cnRoZXIgZG93bi4gVGhlIG90aGVyIGhhbGYgaXMgcmVzZXJ2ZWQNCj4gcmlnaHQg
bm93LCBidXQgdGhlcmUncyBub3QgZXZlbiBhIGNvbW1lbnQgYmVpbmcgYWRkZWQgdG8gdGhp
cyBlZmZlY3QuIChZZXQNCj4gZXZlbiB3aXRoIGEgY29tbWVudCwgSSdkIHN0aWxsIGJlIGNv
bmNlcm5lZCwganVzdCBub3QgYXMgbXVjaC4pDQo+IA0KDQpUaGUgaWRlYSBpcyB0byBtYXRj
aCB0aGUgb3JpZ2luYWwgbG9naWMgd2hpbGUgbWFraW5nIGl0IGFsd2F5cyBjb21waWxlIA0K
Y29ycmVjdGx5LiBBcyB3ZSBkb24ndCBpbnRlcmFjdCB3aXRoIHRoZSBvdGhlciBwYXJ0IG9m
IHRoZSByb290IGVudHJ5IA0KKHJlc2VydmVkLCBvciB1cHBlciBjb250ZXh0IHRhYmxlIHdp
dGggU2NhbGFibGUtTW9kZSkuDQoNCklkZWFsbHksIGl0IHNob3VsZCBiZSB3cml0dGVuIHVz
aW5nIGEgYml0ZmllbGQgc3RydWN0dXJlIGluc3RlYWQsIGJ1dCANCml0J3MgYSBtdWNoIGxh
cmdlciBjaGFuZ2UuDQoNCj4+IEBAIC0yOTUsMTEgKzI5NSwxMiBAQCBzdGF0aWMgdTY0IGJ1
c190b19jb250ZXh0X21hZGRyKHN0cnVjdCB2dGRfaW9tbXUgKmlvbW11LCB1OCBidXMpDQo+
PiAgICAgICAgICAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShyb290X2VudHJpZXMpOw0K
Pj4gICAgICAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgICAgICAgICB9DQo+PiAtICAgICAg
ICBzZXRfcm9vdF92YWx1ZSgqcm9vdCwgbWFkZHIpOw0KPj4gLSAgICAgICAgc2V0X3Jvb3Rf
cHJlc2VudCgqcm9vdCk7DQo+PiAtICAgICAgICBpb21tdV9zeW5jX2NhY2hlKHJvb3QsIHNp
emVvZihzdHJ1Y3Qgcm9vdF9lbnRyeSkpOw0KPj4gKyAgICAgICAgc2V0X3Jvb3RfdmFsdWUo
cm9vdCwgbWFkZHIpOw0KPj4gKyAgICAgICAgc2V0X3Jvb3RfcHJlc2VudChyb290KTsNCj4+
ICsgICAgICAgIEFDQ0VTU19PTkNFKHJvb3RfZW50cmllc1tidXNdLnZhbCkgPSByb290LnZh
bDsNCj4+ICsgICAgICAgIGlvbW11X3N5bmNfY2FjaGUoJnJvb3RfZW50cmllc1tidXNdLCBz
aXplb2Yoc3RydWN0IHJvb3RfZW50cnkpKTsNCj4gDQo+IHNpemVvZig8ZXhwcmVzc2lvbj4p
IHBsZWFzZSBpbiBmYXZvciBvZiBzaXplb2YoPHR5cGU+KSwgd2hlbmV2ZXIgcG9zc2libGUu
DQo+IA0KPj4gICAgICAgfQ0KPj4gLSAgICBtYWRkciA9ICh1NjQpIGdldF9jb250ZXh0X2Fk
ZHIoKnJvb3QpOw0KPj4gKyAgICBtYWRkciA9ICh1NjQpIGdldF9jb250ZXh0X2FkZHIocm9v
dCk7DQo+IA0KPiBXaGlsZSB0aGVyZSwgZHJvcCB0aGUgcG9pbnRsZXNzIGNhc3RzLCB0aHVz
IGdldHRpbmcgcmlkIG9mIHR3byBzdHlsZSBpc3N1ZXMNCj4gYXMgd2VsbD8NCj4gDQoNCkZp
eGVkIGxvY2FsbHkuDQoNCj4gSmFuDQo+IA0KDQpUZWRkeQ0K
--------------BXis0eJJqRvCkaDxo25jEDMC
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------BXis0eJJqRvCkaDxo25jEDMC--

--------------6W4b2IEA0qJW7DYa5oUm8d4W--

--------------mBz3RI5Xho308WveCHZtQD4r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpzNKQFAwAAAAAACgkQZg+p0QLLz9Cg
ZAv8CejTcvdc2zq4YcBR1xmNNBKPx4ZBBe7qz5WPnbS+cOuKUWm5yxrbxwtWmItg9/L14Uho73Ws
tKxdYHYanu0UzZ8gcGwtQ4nkhA+hKnDGlAJNp51msQCtYcfwWjw99y2crXOj4D5yE+v7nBSHHiM3
6HB6+Iv2k150B9Xwcerzj6AkWpYqzXDr3BEt7LDs1k+1jxvdsd87cuPDEMIgfkcSyQz1mpkXEagK
g29wlRJ1CuXKtVzRGz6UydHevv3rQhDpCSS9/yf9us/B4JB1ondSTYOYEqjoJcOjy0lABKe61FT7
GM2D4TzkFqLe3JIUkdZ40/5GCsaBhN67EgCLhzu9Rewh0Y1U7WhInzZb2N4rdWrxLYvKRoQinu3u
fRT5FbkZbuTK2CpTGfynmnf5IwSeUEVSeCaXak3yVT2JftFQEdvAQ1sTyskHBQNak8P70Jizi6zj
JFME/W7nwPkf3m3z3v02CZJ+wWR/tEmTsYmBfEGHHPKyek5z6Absm8XjCacZ
=emah
-----END PGP SIGNATURE-----

--------------mBz3RI5Xho308WveCHZtQD4r--

