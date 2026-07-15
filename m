Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FFAC44501
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 12:43:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363059.1614897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjyxQ-00079C-Vr; Wed, 15 Jul 2026 12:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363059.1614897; Wed, 15 Jul 2026 12:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjyxQ-000795-Sm; Wed, 15 Jul 2026 12:43:24 +0000
Received: by outflank-mailman (input) for mailman id 1363059;
 Wed, 15 Jul 2026 12:43:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65cd991f000edb5@swg.vates.tech>)
 id 1wjyxP-00078x-Am
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 12:43:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjyxO-00Duhb-Nq
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 14:43:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65cd991f000edb5@swg.vates.tech>)
 id 6a578069-2eae-0a2a0a5409dd-0a2a4501b170-2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:43:22 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f65cd991f000edb5@swg.vates.tech>)
 id 6a57806a-5984-0a2a45010019-b9ff1c228c63-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 14:43:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f65cd991f000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 12:43:20 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 267BC8118B;
 Wed, 15 Jul 2026 14:43:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=5dxMK+YgW3HQIvPcNXSmva41mMtAplVJu5Ecxr1/7R4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=adKe2hVAUxoHoy531S9i+0TxOcMs+72JNqK/KJVlkb6vdOh7D60uO+S6XVZXWnhNLgF7V/5/e
 w61p3af+XvDfLTQjs9ebhuluYqG/9ifvoEopHtVILFJ2y9s7wGVdNIavIRF85xHJZb+/8vtmixw
 21zlIegsHXNqtFtabUMjZ+uImHRLot5W/Rl3TFhXuKp24K0huExpb1Ojp3FQgXbzfm3hZTF7k5o
 hGjpqXLmAEbbxT0VPHqQwF8VhBEXmtNaV/CsQiIzrj4QXwIKYMeHkeeD7MNeV+JliI5BRA1JoHA
 bEqEXR4mCsMS6Sgh8KpZw/CM5HJpHs/Cit3l1izZRI/g==
X-Zone-Loop: 7d4ed7e8283e1b0ddc854181765c5bbe0dd7b8880916
x-campaign-type: default
x-transaction-id: 7729a3bd-d137-4e45-8855-9a7901cb9a77
x-swg-uid: 01-e2314736-f6d5-4912-a360-4cded665a236
X-Mailer: Sweego
Message-ID:
 <1784119400.8631fc262581453bbf619ec5b2062170.19f65cd991f000edb5@vates.tech>
x-swg-bid: 1784119400.8631fc262581453bbf619ec5b2062170.19f65cd991f000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 15 Jul 2026 14:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: put x86_emulate/ early in $(obj-y)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <898091b0-0c73-4829-a3b4-c8da6026a40c@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <898091b0-0c73-4829-a3b4-c8da6026a40c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ttqtow8KSe3CHk5B6cO4lSms"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784119400257
X-purgate-ID: tlsNG-d62444/1784119402-C475B757-5CA8E507/0/0
X-purgate-type: clean
X-purgate-size: 5838

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ttqtow8KSe3CHk5B6cO4lSms
Content-Type: multipart/mixed; boundary="------------INRN0CwkcCjjtZGhuVhdjc30";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <b741a78c-88ac-41c6-adb6-d707a209b1e8@vates.tech>
Subject: Re: [PATCH 2/2] x86: put x86_emulate/ early in $(obj-y)
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <898091b0-0c73-4829-a3b4-c8da6026a40c@suse.com>
In-Reply-To: <898091b0-0c73-4829-a3b4-c8da6026a40c@suse.com>

--------------INRN0CwkcCjjtZGhuVhdjc30
Content-Type: multipart/mixed; boundary="------------09Hows03yfZ6nsJFTOaoWD9R"

--------------09Hows03yfZ6nsJFTOaoWD9R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDkvMDcvMjAyNiDDoCAxNDowMCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gLi4u
IHN1Y2ggdGhhdCBpbiBwYXJhbGxlbCBidWlsZHMgbWFrZSB3b3VsZCBzY2hlZHVsZSBpdCBl
YXJseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCj4gDQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQ0KPiArKysgYi94ZW4v
YXJjaC94ODYvTWFrZWZpbGUNCj4gQEAgLTEsMyArMSw3IEBADQo+ICsjIFB1dCB0aGlzIGFo
ZWFkIG9mIHRoZSBzb3J0ZWQgbGlzdCBiZWxvdywgYXMgaXQgdGFrZXMgbG9uZyB0byBidWls
ZCBhbmQgaGVuY2UNCj4gKyMgd2UnZCBsaWtlIHBhcmFsbGVsIG1ha2UgdG8gc2NoZWR1bGUg
aXRzIGJ1aWxkaW5nIGVhcmx5Lg0KPiArb2JqLXkgKz0geDg2X2VtdWxhdGUvDQo+ICsNCj4g
ICBvYmoteSArPSBhY3BpLw0KPiAgIG9iai15ICs9IGJvb3QvDQo+ICAgb2JqLXkgKz0gY3B1
Lw0KPiBAQCAtOSw3ICsxMyw2IEBAIG9iai15ICs9IGxpYi8NCj4gICBvYmoteSArPSBtbS8N
Cj4gICBvYmotJChDT05GSUdfUFYpICs9IHB2Lw0KPiAgIG9iai15ICs9IHg4Nl82NC8NCj4g
LW9iai15ICs9IHg4Nl9lbXVsYXRlLw0KPiAgIA0KPiAgIG9iai15ICs9IGFsdGVybmF0aXZl
Lm8NCj4gICBvYmoteSArPSBhcGljLm8NCj4gDQo+IA0KDQpSZXZpZXdlZC1ieTogVGVkZHkg
QXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo=
--------------09Hows03yfZ6nsJFTOaoWD9R
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------09Hows03yfZ6nsJFTOaoWD9R--

--------------INRN0CwkcCjjtZGhuVhdjc30--

--------------ttqtow8KSe3CHk5B6cO4lSms
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpXgGcFAwAAAAAACgkQZg+p0QLLz9DU
TAv/TsdvvASQ8Bc0pCLa0F8TvEVj2rFkqvAP+oV6DsBhBa5xZan/7zpBwdrOQ7MANcvbD8NVlOmT
p+gLQ1h0SUUe4iN9dS9kVuTC0VftIMWOPYf3G+vm2kiDYiXyPBdQco6Sac3D1/XqkaGm2PijK1o9
9GHHW+l9fZC1kkroi3XWtAx0IRarV6UZPrEbRLoPH5cThowjfRG8iIFn0oPmzutV2bXgCEc1Bghc
M2xoBQGXbVQRuHt118/WqslZbTvseKa7g4ufpBuFZhF9QyVg+0hkAcIWgg/g3RF7eSEV/2MrqpwQ
pzVg9q9q+d3jyVync+u08mQthuaFo9hZV53EHLf+eD7c92JLYJXyVxbSRV943evKt055J/CiXMhW
vXDdfYMZtV5xZb+hrGKP0gshy+GlPT7L6L+R5ztfLMSDscblmqFj/5tyMDidgmhu7Nk6nrwOLoDx
/8DQ7qLrHXzIqdspcoOe7d9LSjXOcqm3uxdW29XKnmyQloT10WaTnbJ4jNQ8
=ISeI
-----END PGP SIGNATURE-----

--------------ttqtow8KSe3CHk5B6cO4lSms--

