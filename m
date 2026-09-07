Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2C1C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 13:57:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410881.1641684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Zq9-0005oU-Vo; Mon, 07 Sep 2026 13:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410881.1641684; Mon, 07 Sep 2026 13:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Zq9-0005oN-Si; Mon, 07 Sep 2026 13:56:53 +0000
Received: by outflank-mailman (input) for mailman id 1410881;
 Mon, 07 Sep 2026 13:56:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3@swg.vates.tech>)
 id 1x3Zq7-0005oH-Os
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 13:56:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3Zq7-009wzU-5S
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:56:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3@swg.vates.tech>)
 id 6a9ec291-e002-0a2a0a5209dd-0a2a4508c720-42
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 15:56:51 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3@swg.vates.tech>)
 id 6a9ec2a2-f659-0a2a45080019-b9ff1c22a899-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 15:56:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a07c283b48000c4f3.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 07 Sep 2026 13:56:46 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id EFAE183FF2;
 Mon,  7 Sep 2026 15:56:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ei0/Uha+qMA4uzVKshxVNrw/Y68MyUmSLd1HlfXsqts=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ewAGVebrBHz8wdbZvRRAPWVEAGH1/vraOlJL4jOXtfV50M3kLhnXHz8h4fSEXdIyAd0u6K8fk
 Qye5h7tfOvDpthmkeuHXitBK4jUuxh1nxVuDjOgMwt6XdBULXfXYKJVLMvEH/1QwUgXaLdCkEyw
 N9H+668/g1cI0UGsYUa5eGY+PYpRn0RIE6/NeuFY1H4Trca586PFGKVDx0N0RfuOgSZLwKqak/q
 wffsKC5P2JOmc0pJ4oHuMUWPRPPrrOR1dUCkRJU2EjA1MqQRYOaXj1wSSJEyxtlrjAKzpA/HSCC
 7JMlT4IcMbXMvYO6ZSKoi6BTC83nIi0FZ1DHaIhWssjg==
X-Zone-Loop: ad078b0bcefa1c1ee2c1c87affc6a9a8e4449e6e6512
x-campaign-type: default
x-transaction-id: af5ff466-d346-46ae-82c9-0b04a8519f83
x-swg-uid: 01-81c76782-6454-49ed-9a0c-8ffc3233692b
X-Mailer: Sweego
Message-ID:
 <1788789406.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3@vates.tech>
x-swg-bid: 1788789406.8631fc262581453bbf619ec5b2062170.1a07c283b48000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 7 Sep 2026 15:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@vates.tech>
 <94e4e14c-11bb-48cf-aced-7ed6be8ad34a@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <94e4e14c-11bb-48cf-aced-7ed6be8ad34a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gOp6nqs3tDMkMuzK2WTbbtAK"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788789405173
X-purgate-ID: tlsNG-c1860d/1788789411-D735D87B-361784E7/0/0
X-purgate-type: clean
X-purgate-size: 9111

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gOp6nqs3tDMkMuzK2WTbbtAK
Content-Type: multipart/mixed; boundary="------------Tnc0yrZyUtSmLFLhedM6G4RJ";
 protected-headers="v1"; hp="clear"
Message-ID: <f2c220f5-edb0-4c29-902f-9e969f419cb1@vates.tech>
Date: Mon, 7 Sep 2026 15:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@vates.tech>
 <94e4e14c-11bb-48cf-aced-7ed6be8ad34a@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <94e4e14c-11bb-48cf-aced-7ed6be8ad34a@suse.com>

--------------Tnc0yrZyUtSmLFLhedM6G4RJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjQvMDgvMjAyNiDDoCAxNDoxMywgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjQuMDguMjAyNiAxMTozMSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBIWVBFUlZJU09SX21t
dV91cGRhdGUgcGFzc2VzIGEgc2V0IG9mIHJlcXVlc3QsIHdoZXJlIGVhY2ggcmVxdWVzdCBo
YXMgYSBwb2ludGVyDQo+PiB0byB0aGUgUFRFIGFsb25nIHdpdGggYSBzdWItY29tbWFuZC4N
Cj4+DQo+PiBUaGUgUFRFIGFsaWdubWVudCBwYWRkaW5nIGlzIHVzZWQgdG8gdHJhbnNwb3J0
IHRoZSBzdWItY29tbWFuZCB3aGlsZSB0aGUgcmVzdA0KPiANCj4gVGhlcmUncyBubyAiYWxp
Z25tZW50IHBhZGRpbmciIGhlcmUuIEl0J3MgdGhlIGxvdyBiaXRzIG9mIGEgbmVjZXNzYXJp
bHktYWxpZ25lZA0KPiBQVEUgd2hpY2ggYXJlIHVzZWQuDQo+IA0KPj4gaXMgdXNlZCBhcyBh
biBhZGRyZXNzIHRvIGEgUFRFIGVudHJ5LiBUaGUgY3VycmVudCBkb2N1bWVudGF0aW9uIHN0
YXRlIHRoYXQgdGhlDQo+IA0KPiBOaXQ6IHN0YXRlcw0KPiANCj4+IDIgZmlyc3QgYml0cyBh
cmUgdXNlZCBmb3Igc3ViLWNvbW1hbmQsIGhlbmNlIHRoZSBvdGhlciBvbmVzIGZvciBQVEUg
d2hpY2gNCj4gDQo+IEJldHRlciAiMiBsb3cgaXRzIiwgYXMgImZpcnN0IiBpcyBhbWJpZ3Vv
dXMuDQo+IA0KPj4gaW1wbHkgaGVyZSBhIDQtYnl0ZXMgYWxpZ25tZW50IG9uIFBURXMuDQo+
IA0KPiBUaGUgcGFydCBhZnRlciB0aGUgY29tbWEgSSdtIGhhdmluZyB0cm91YmxlIHBhcnNp
bmcuIENhbiB0aGlzIHBsZWFzZSBiZSByZS0NCj4gd3JpdHRlbiBzb21lPw0KPiANCg0KSSBh
Z3JlZSwgdGhlIHdvcmRpbmcgaXMgYSBiaXQgd2VpcmQuIFRob3VnaCB0aGUgbmFtZSBvZiB0
aGUgZmllbGRzIG1ha2VzIA0KaXQgYSBiaXQgb2RkIHRvIHdvcmsgd2l0aC4NCg0KV2UgaGF2
ZSBpbiBzdHJ1Y3QgbW11X3VwZGF0ZQ0KDQogIHVpbnQ2NF90IHB0cjsgICAgICAgLyogTWFj
aGluZSBhZGRyZXNzIG9mIFBURS4gKi8NCg0KeWV0LCBwdHIgaXMgYWN0dWFsbHkgc29tZXRo
aW5nIGxpa2UgKHB0ZV9hZGRyIHwgc3ViX2NvbW1hbmQpLg0KDQpTbyB3ZSBwcm9iYWJseSB3
YW50IHRvIHNheSB0aGF0IGl0J3MgYSBudW1iZXIgY29tcG9zZWQgb2YgYSA4LWJ5dGUgDQph
bGlnbmVkIFBURSBhZGRyZXNzIGNvbWJpbmVkIHdpdGggMyBsb3cgYml0cyBsYXJnZSBzdWIt
Y29tbWFuZCA/DQoNCj4+IE9uIFBWNjQgYW5kIFBWMzItUEFFIGd1ZXN0cywgYWxsIHBhZ2V0
YWJsZSBQVEVzIGFyZSA4LWJ5dGVzIGFsaWduZWQsIGhlbmNlDQo+PiBvZmYtYnktNCBQVEVz
IGFkZHJlc3NlcyBhcmUgYWx3YXlzIGluY29ycmVjdC4gTm9uLVBBRSBQVjMyIGd1ZXN0cyB1
c2VkDQo+PiAibGVnYWN5IHBhZ2V0YWJsZXMiIHdoaWNoIGhhZCA0LWJ5dGUgYWxpZ25lZCBQ
VEVzLiBIb3dldmVyLCBzdXBwb3J0IGhhZA0KPj4gYmVlbiBjb21wbGV0ZWx5IHJlbW92ZWQg
c2luY2UgWGVuIDQuMCwgYW5kIHdhcyBvbmx5IGF2YWlsYWJsZSB3aGVuIFhlbiB3YXMNCj4+
IGJ1aWx0IGluIDMyLWJpdHMgbm9uLVBBRSBtb2RlIFsxXS4NCj4+DQo+PiBDdXJyZW50IFhl
biBsb2dpYyBiZWhhdmVzIGFzIGlmIDMgYml0cyBhcmUgdXNlZCBhcyBzdWItY29tbWFuZCwg
dGh1cyBhbGwNCj4+IG9mZi1ieS00IFBURXMgYXJlIGFjdHVhbGx5IHJlamVjdGVkIGFzIGJl
aW5nIHVua25vd24gc3ViLWNvbW1hbmRzLg0KPj4NCj4+IEFkanVzdCB0aGUgZG9jdW1lbnRh
dGlvbiB0byBtYXRjaCB0aGUgY3VycmVudCBsb2dpYyBpbXBsZW1lbnRlZCBpbiBYZW4sDQo+
PiBhbHNvIGV4cGFuZGluZyB0aGUgZG9jdW1lbnRlZCBzdWItY29tbWFuZCBwYXJhbWV0ZXIg
dG8gMyBiaXRzLg0KPj4NCj4+IFsxXSA4NGQ1NGQ1ZDhiMzEgKCJpMzg2OiBSZW1vdmUgbm9u
LVBBRSBoeXBlcnZpc29yIGJ1aWxkIHRhcmdldC4iKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEZyZWRpYW5vIFppZ2xpbyA8ZnJlZGlhbm8uemlnbGlvQGNpdHJpeC5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCj4gDQo+
IERpZCB5b3UgZm9yZ2V0IHRvIGFsc28gYWRkIGEgRnJvbTogdGFnPw0KPiANCj4+IEBAIC0y
NjAsMjEgKzI2MCwyNiBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fdWxvbmdfdCk7
DQo+PiAgICAqIGh5cGVyY2FsbC4gQWxzbyBpZiBzbyBkZXNpcmVkIHRoZSBPUyBjYW4gYWxz
byB0cnkgdG8gd3JpdGUgdG8gdGhlIFBURQ0KPj4gICAgKiBhbmQgYmUgdHJhcHBlZCBieSB0
aGUgaHlwZXJ2aXNvciAoYXMgdGhlIFBURSBlbnRyeSBpcyBSTykuDQo+PiAgICAqDQo+PiAr
ICogTm90ZTogSGlzdG9yaWNhbGx5LCBYZW4gaGFkIHN1cHBvcnQgZm9yIG5vbi1QQUUgUFYg
Z3Vlc3RzIHdpdGggNC1ieXRlcyB3aWRlDQo+PiArICogICAgICAgUFRFcyAoaWYgWGVuIHdh
cyBidWlsdCBpbiBub24tUEFFIG1vZGUpOyB3aGljaCBzdXBwb3J0IGdvdCByZW1vdmVkIGlu
DQo+IA0KPiBBIG5hdGl2ZSBzcGVha2VyIG1heSBjb3JyZWN0IG1lLCBidXQgIndoaWNoIHN1
cHBvcnQiIHJlYWRzIG9kZCB0byBtZS4gSW1vIGVpdGhlcg0KPiAidGhhdCBzdXBwb3J0IiBv
ciAic3VwcG9ydCBmb3Igd2hpY2giIChhbmQgdGhlbiBwZXJoYXBzIHdpdGggYSBjb21tYSBp
biBwbGFjZSBvZg0KPiB0aGUgc2VtaWNvbG9uKS4NCj4gDQoNCk1heWJlIGl0IGNhbiBiZSBy
ZXdvcmRlZCBhcw0KDQpYZW4gaGFkIHN1cHBvcnQgZm9yIG5vbi1QQUUgUFYgZ3Vlc3RzIHdp
dGggNC1ieXRlcyB3aWRlIFBURXMgKGlmIFhlbiB3YXMgDQpidWlsdCBpbiBub24tUEFFIG1v
ZGUpIHVudGlsIFhlbiA0LjAuDQoNCj4+ICsgKiAgICAgICBYZW4gNC4wLiBBcyBhIHJlc3Vs
dCwgaW4gY3VycmVudCBYZW4sLCBhbGwgUFRFIGFyZSBub3cgYWx3YXlzIDgtYnl0ZQ0KPiAN
Cj4gTml0OiBEb3VibGUgY29tbWEgKHdoZW4gcGVyaGFwcyBub25lIGlzIG5lZWRlZCBhdCBh
bGwgaW4gdGhhdCBwbGFjZSkuDQo+IA0KPj4gKyAqICAgICAgIGFsaWduZWQgd2hpY2ggYWxs
b3dzIGV4cGFuZGluZyBzdWItY29tbWFuZHMgcGFydCAobm93IDMtYml0cyB3aWRlKS4NCj4g
DQo+IFdoZXRoZXIgdGhlIHBhcnQgZnJvbSAid2hpY2giIG9ud2FyZHMgaXMgcmVhbGx5IHJl
bGV2YW50IGhlcmUgSSdtIG5vdCBxdWl0ZSBzdXJlLg0KPiANCj4gSmFuDQoNClRlZGR5DQo=


--------------Tnc0yrZyUtSmLFLhedM6G4RJ--

--------------gOp6nqs3tDMkMuzK2WTbbtAK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqewpwFAwAAAAAACgkQZg+p0QLLz9Bm
agv9F1B0l5cmOYaU2aZPUoDobJzjKme/qHixmKfKfbXVxLfRs+maXvy16IRK1j4oH2ojIZeD+gNI
EKpVRfDZq/O1fmNLMHEBN+O+DCtHif8l6OpFcnZJdnZESQU1YR3OnhcNCWmfAKJWTOSNlOsYchHt
LrhsM9xeXxfRv4u+uW35O4pa5qyn2CnIRWBcvhvEZ0rTndKsmK4pNg2LhaBJ9BVutXd/PSIDi2n9
UNUdx1LQOM6aB04Udrn0NhvVY4jIkm3LOYyjVHajTWygSy7qKzN9A89Mjg38eAwjuoubcz6EpPni
bbxAM+5wogU+QzppCIw5utu4s1C9sn/fJY7+e9Bl6sdPuEPtL0Vt8430JUXvsEAvN4g5urwkpRUS
IN9l4QRzV4An8ibOQ23zgEkDIUCfH2a8jmzx6+xVHgNgOIce5KzPzOJ5Orzs8A9/hSi8IUoCBQGD
3J4DgENICBAnVODySY897oz6xzPm/KJ2lXwBOui6iH+l+xjguVI3+Bwxc6aR
=tnmJ
-----END PGP SIGNATURE-----

--------------gOp6nqs3tDMkMuzK2WTbbtAK--

