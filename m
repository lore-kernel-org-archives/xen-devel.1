Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84432C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 08:26:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412650.1643033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4DdN-00051Q-JU; Wed, 09 Sep 2026 08:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412650.1643033; Wed, 09 Sep 2026 08:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4DdN-00051I-GK; Wed, 09 Sep 2026 08:26:21 +0000
Received: by outflank-mailman (input) for mailman id 1412650;
 Wed, 09 Sep 2026 08:26:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085465762000c4f3@swg.vates.tech>)
 id 1x4DdL-00051C-LU
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:26:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4DdK-001Tz4-6i
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:26:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085465762000c4f3@swg.vates.tech>)
 id 6aa1181f-e002-0a2a0a5209dd-0a2a450bec8a-26
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:26:17 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a085465762000c4f3@swg.vates.tech>)
 id 6aa11829-b7e8-0a2a450b0019-b9ff1c12a133-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:26:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a085465762000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Sep 2026 08:26:14 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0C7CF8032F;
 Wed,  9 Sep 2026 10:26:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=rDsp81kQ5Ukn1shiHUXJQUWHJKFM7Z5doiSivEQ6fDA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KggpzwGp2mojiSwKwBnvWseaKYVXp923/dZJLP4Xr4DsoZiFHoB8qagxl6Cw7WCjrK9z8pyqo
 88IPbYUBaof1UQwoRTVnmWjzWx0VAC6M/Xi3O1l0eITRVQQGWi8rYiKVz3g7x9ct+g7uGLCJTe4
 mWOwZPFG/gjOI1NMq1Bfjnjrw5cU7k5o8/6Ojqca2GXzA8Ny8ZaV1AtluucmrzNf5V3SFa/xnOy
 QnRoqYfOmnd4ICPMeqLDucyquUNxEELF+kIHDXBTyYtgoi+JV930cb7mU0sR3LwS/yk5DtFja4H
 Ff2NCb3EVtIC/C0/sSdzwniRwnOBayQz/gevSyJW6bhQ==
X-Zone-Loop: c5c3c8e62e6044932e9067935122743e54444a14020c
x-campaign-type: default
x-transaction-id: ad88ef2d-05da-44cc-bc20-8ac3d7ceca31
x-swg-uid: 01-276f61d5-df59-443f-8616-44a77f824306
X-Mailer: Sweego
Message-ID:
 <1788942374.8631fc262581453bbf619ec5b2062170.1a085465762000c4f3@vates.tech>
x-swg-bid: 1788942374.8631fc262581453bbf619ec5b2062170.1a085465762000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 9 Sep 2026 10:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86: Fixes for not-quite-XSA in
 pci_conf_write_intercept()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oJGUQlzPbZJyZQDCU88A3H2y"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788942374168
X-purgate-ID: tlsNG-42698a/1788942377-A8AC89EA-43FE9D94/0/0
X-purgate-type: clean
X-purgate-size: 5788

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oJGUQlzPbZJyZQDCU88A3H2y
Content-Type: multipart/mixed; boundary="------------AETanEuFm6aVWvPpFJJRCMs8";
 protected-headers="v1"; hp="clear"
Message-ID: <53824df0-e1f3-4cf7-894f-f932eb27b980@vates.tech>
Date: Wed, 9 Sep 2026 10:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86: Fixes for not-quite-XSA in
 pci_conf_write_intercept()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260908215721.3346842-1-andrew.cooper3@citrix.com>

--------------AETanEuFm6aVWvPpFJJRCMs8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDkvMjAyNiDDoCAyMzo1NywgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBQ
bHVtYiBwY2lfc2JkZl90IHVwIGFuZCBkb3duIHRoZSBjYWxsY2hhaW4gdG8gc2ltcGxpZnkg
cGFyYW1ldGVyIHBhc3NpbmcgYW5kDQo+IG1ha2UgaXQgaGFyZGVyIHRvIGZvcmdldCB0aGUg
c2VnbWVudC4NCj4gDQo+IEFuZHJldyBDb29wZXIgKDMpOg0KPiAgICB4ODYvcHY6IENvbnZl
cnQgc3RydWN0IG1taW9fcm9fZW11bGF0ZV9jdHh0IHRvIHVzZSBwY2lfc2JkZl90DQo+ICAg
IHg4Ni9wY2k6IENvbnZlcnQgcGNpX21tY2ZnX3tyZWFkLHdyaXRlfSgpIHRvIHVzZSBwY2lf
c2JkZl90DQo+ICAgIHg4Ni9wY2k6IFVwZGF0ZSBwY2lfY29uZl93cml0ZV9pbnRlcmNlcHQo
KSB0byB1c2UgcGNpX3NiZGZfdA0KPiANCj4gICB4ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20v
cGNpLmggICAgfCAgNSArKy0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9wY2kuYyAgICAgICAgICAg
ICAgICB8ICA2ICsrLS0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYyAg
ICB8IDEwICsrKysrLS0tLS0NCj4gICB4ZW4vYXJjaC94ODYvcHYvcm8tcGFnZS1mYXVsdC5j
ICAgfCAxOCArKysrKysrKysrLS0tLS0tLS0NCj4gICB4ZW4vYXJjaC94ODYveDg2XzY0L21t
Y29uZmlnXzY0LmMgfCAxOCArKysrKysrKy0tLS0tLS0tLS0NCj4gICB4ZW4vYXJjaC94ODYv
eDg2XzY0L3BjaS5jICAgICAgICAgfCAxMiArKysrKystLS0tLS0NCj4gICB4ZW4vaW5jbHVk
ZS94ZW4vcGNpLmggICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgIDcgZmlsZXMgY2hh
bmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFz
ZS1jb21taXQ6IGEyY2E0ZjhiOTg5MDg5OWNhODlkNjExNjAwMmU3YTljNTk1N2Q4YzYNCg0K
UmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0K

--------------AETanEuFm6aVWvPpFJJRCMs8--

--------------oJGUQlzPbZJyZQDCU88A3H2y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqhGCUFAwAAAAAACgkQZg+p0QLLz9BZ
Xgv+MBUPjvcxyq2HJ/YwZCq737x2zWf9WvGPX5GVqjtmTFiISLfhJ+tXbeKiMlZZSe9LcTL/q8B4
i7naC626blgtRjVHI1MkkVWgNxfhSJ0cUJBoYx7WhV5aZKKQvz2vNKBIwGd0bNRijRcJ5GdOUld8
s9vPa7P7Gn0krAipE+Et7QdTIgImGF4anc0+LbZu8FGVwbccvfHyUkI6p50zirl2Ml2mJ1nz50bw
HKRdxW8u7S5+RZ5wrjJfyQD38nVuZQ/pMG5QnUFnCJWrr7iOlK2uR94Iup5uJsi8bfR4fO21y2hg
rH/6u0+T8pCmoA92gAGMiEKc+m8mkR5IseiLnJh06/o0+Rlwi1XQuRZ2lgOeu+mm2yp4+XgjrrML
JYhaInB1tL14tUbJfVS5r3tnoqIMekNCSKpbZ+1xvQL/NVe1DM98yFu0RB/OE/SKhebXhN/Z0ljy
aw4Vhj3RYNfhyQdIKT0RTVrbEaeeZvLSoiKOhpPvnbV5+FGZZO/eidPEceBR
=GFkH
-----END PGP SIGNATURE-----

--------------oJGUQlzPbZJyZQDCU88A3H2y--

