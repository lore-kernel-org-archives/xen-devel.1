Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1049CA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:57:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438119.1657004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCDX2-0003Yq-MC; Thu, 01 Oct 2026 09:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438119.1657004; Thu, 01 Oct 2026 09:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCDX2-0003Yj-JR; Thu, 01 Oct 2026 09:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1438119;
 Thu, 01 Oct 2026 09:56:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6e5295a0003f66@swg.vates.tech>)
 id 1xCDX0-0003Yd-Qr
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:56:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCDWz-00DwDv-Va
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:56:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6e5295a0003f66@swg.vates.tech>)
 id 6abe2e43-2eae-0a2a0a5409dd-0a2a4507875a-46
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:56:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f6e5295a0003f66@swg.vates.tech>)
 id 6abe2e61-b4ea-0a2a45070019-b9ff1c22a2c5-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:56:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f6e5295a0003f66.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 01 Oct 2026 09:56:48 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9551B829A3;
 Thu,  1 Oct 2026 11:56:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=UN4JVgQy2aXXU1eEkzbdYD4BaaRvS3bghOXt+D3e4cs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=cnHnsW8ukwXU3F2k3D1moH2fE2uWojTusEwfbWGpe2+Yt+jiUk3/5/4Abef0LBohwh1p8dEcX
 iZPQBU4XZOG/rjGnLddvkBWV37IimuPYAnSEgr8AyfdC7hUo5v0Aal1WqdBm33GK2Wctu1A2ash
 By9VT7S+2Wdl058Nyhx+wILHP7ZZAnmrY9I1mNJcMW8MNNC+xy1zR7I1pFocb/Ms4t3n8DWMKvS
 ZvKRHoUI2jCols1OFrPhUOHIlikDfh+z9CMCEl9tTNphqsr1jwHEWo6X1eYXRB802ed9eBAte2b
 F55EljpMpOPAsqBMt+ICjISUx8LmVwBW0cQEHyVyzR6Q==
X-Zone-Loop: d141315132cb4b60a9e835950a95d84fe73edf09db84
x-campaign-type: default
x-transaction-id: 41292387-da57-4c2b-be8b-ee69add188e1
x-swg-uid: 01-092db945-32bd-48cc-b0cd-c4974e26f224
X-Mailer: Sweego
Message-ID:
 <1790848608.8631fc262581453bbf619ec5b2062170.1a0f6e5295a0003f66@vates.tech>
x-swg-bid: 1790848608.8631fc262581453bbf619ec5b2062170.1a0f6e5295a0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 1 Oct 2026 11:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261001091921.94138-1-roger@xenproject.org>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261001091921.94138-1-roger@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xZKH7EXP8kjIIK4wAVKnfauy"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790848607776
X-purgate-ID: tlsNG-ef75cf/1790848609-A4AC8AE4-CE4DC037/0/0
X-purgate-type: clean
X-purgate-size: 7281

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xZKH7EXP8kjIIK4wAVKnfauy
Content-Type: multipart/mixed; boundary="------------y6m6bWfKa76eLfmrTTpWJpKl";
 protected-headers="v1"; hp="clear"
Message-ID: <c4b3fc15-bb46-45a0-8aea-b1f7e213d9f8@vates.tech>
Date: Thu, 1 Oct 2026 11:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261001091921.94138-1-roger@xenproject.org>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261001091921.94138-1-roger@xenproject.org>

--------------y6m6bWfKa76eLfmrTTpWJpKl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDEvMTAvMjAyNiDDoCAxMToyMSwgUm9nZXIgUGF1IE1vbm5lIGEgw6ljcml0wqA6DQo+
IFhFTkZFQVRfcGFlX3BnZGlyX2Fib3ZlXzRnYiBpcyBvbmx5IHVzZWQgYnkgMzJiaXQgUFYg
Z3Vlc3RzLCBoZW5jZSBsaW1pdA0KPiBpdHMgc2V0dGluZyBpbiBYRU5WRVJfZ2V0X2ZlYXR1
cmVzIHRvIHRoZSBpc19wdl9kb21haW4oKSBndWFyZGVkIHNlY3Rpb24sDQo+IHdpdGggdGhl
IHJlc3Qgb2YgdGhlIFBWIHNwZWNpZmljIGZlYXR1cmVzLg0KPiANCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlckB4ZW5wcm9qZWN0Lm9yZz4NCj4gLS0tDQo+IENoYW5nZXMgc2luY2UgdjE6
DQo+ICAgLSBKdXN0IG1vdmUgdGhlIGNvbmRpdGlvbmFsIGJ1dCBkb24ndCBtZXJnZSBpdC4N
Cj4gLS0tDQo+ICAgeGVuL2NvbW1vbi9rZXJuZWwuYyB8IDYgKysrKy0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL2tlcm5lbC5jIGIveGVuL2NvbW1vbi9rZXJuZWwuYw0KPiBp
bmRleCBmNGJiZDg4MThmYTguLjY4MTE1OTlmOTVmZCAxMDA2NDQNCj4gLS0tIGEveGVuL2Nv
bW1vbi9rZXJuZWwuYw0KPiArKysgYi94ZW4vY29tbW9uL2tlcm5lbC5jDQo+IEBAIC02Nzcs
OCArNjc3LDYgQEAgbG9uZyBkb194ZW5fdmVyc2lvbihpbnQgY21kLCBYRU5fR1VFU1RfSEFO
RExFX1BBUkFNKHZvaWQpIGFyZykNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUg
PDwgWEVORkVBVF92Y3B1X3RpbWVfcGh5c19hcmVhKSB8DQo+ICAgI2VuZGlmDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgKDFVIDw8IFhFTkZFQVRfcnVuc3RhdGVfcGh5c19hcmVh
KTsNCj4gLSAgICAgICAgICAgIGlmICggVk1fQVNTSVNUKGQsIHBhZV9leHRlbmRlZF9jcjMp
ICkNCj4gLSAgICAgICAgICAgICAgICBmaS5zdWJtYXAgfD0gKDFVIDw8IFhFTkZFQVRfcGFl
X3BnZGlyX2Fib3ZlXzRnYik7DQo+ICAgICAgICAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV90
cmFuc2xhdGUoZCkgKQ0KPiAgICAgICAgICAgICAgICAgICBmaS5zdWJtYXAgfD0NCj4gICAg
ICAgICAgICAgICAgICAgICAgICgxVSA8PCBYRU5GRUFUX3dyaXRhYmxlX3BhZ2VfdGFibGVz
KSB8DQo+IEBAIC02OTAsOSArNjg4LDEzIEBAIGxvbmcgZG9feGVuX3ZlcnNpb24oaW50IGNt
ZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+ICAgI2VuZGlmDQo+ICAg
I2lmZGVmIENPTkZJR19YODYNCj4gICAgICAgICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihk
KSApDQo+ICsgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICAgIGZpLnN1Ym1hcCB8
PSAoMVUgPDwgWEVORkVBVF9tbXVfcHRfdXBkYXRlX3ByZXNlcnZlX2FkKSB8DQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVORkVBVF9oaWdobWVtX2Fzc2lz
dCkgfA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDFVIDw8IFhFTkZFQVRf
Z250dGFiX21hcF9hdmFpbF9iaXRzKTsNCj4gKyAgICAgICAgICAgICAgICBpZiAoIFZNX0FT
U0lTVChkLCBwYWVfZXh0ZW5kZWRfY3IzKSApDQo+ICsgICAgICAgICAgICAgICAgICAgIGZp
LnN1Ym1hcCB8PSAoMVUgPDwgWEVORkVBVF9wYWVfcGdkaXJfYWJvdmVfNGdiKTsNCj4gKyAg
ICAgICAgICAgIH0NCj4gICAgICAgICAgICAgICBlbHNlDQo+ICAgICAgICAgICAgICAgICAg
IGZpLnN1Ym1hcCB8PSAoMVUgPDwgWEVORkVBVF9odm1fc2FmZV9wdmNsb2NrKSB8DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVORkVBVF9odm1fY2FsbGJh
Y2tfdmVjdG9yKSB8DQoNClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVA
dmF0ZXMudGVjaD4NCg0KVGVkZHkNCg==

--------------y6m6bWfKa76eLfmrTTpWJpKl--

--------------xZKH7EXP8kjIIK4wAVKnfauy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmq+Ll8FAwAAAAAACgkQZg+p0QLLz9Dz
3AwAhBYtuA3NQSuElrOTQ00cN7A5vR1fleJKL65Fao6PlojYdDf3nzessSZXebK/L6Kd5w+gQkn0
JGr94guRlSKld/35ExG0Ib9xGnHjbSw9ki+UwvqEQZ7vanjBprp7/0SrZAkX69MonV3/rrQe13i+
j5a40ZZ3/N9nRSJjP1xcK0iRQa0AXeBPAuhAruVQrHQp7GHgk/C7Lby9JFw8z3h1JpHvB0aJLyYY
nqn/cEGmP/r6RTHxfUEqwqRIoKoM9s2kjb53ETEimeY2Lxw3KnUUEQGH+INBtEQT0mvBJusDInop
Hl2GCG4PfXM57PlUQfELqpERcxdWXpfOG4/aVlXY9Omxurxu324a0TwMMpoU5BkhPSGe6ylH7f+Y
rJzNsRAWBAh5SrmjvFIOQIZRKHOudEQHnnk8fzNBye5hlF9P84QDA/eJQKajKx3S279xcRiec2Rs
pA7ivtaPHZMKHZ0k7GFrQIs/I8Dj4WKuCbvY0y3lLIaP9pm9m0jkSXvZdwTo
=+g7Q
-----END PGP SIGNATURE-----

--------------xZKH7EXP8kjIIK4wAVKnfauy--

