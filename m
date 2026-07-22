Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10859C44539
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 08:49:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368228.1617676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmSde-0007cd-AM; Wed, 22 Jul 2026 08:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368228.1617676; Wed, 22 Jul 2026 08:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmSde-0007cV-5j; Wed, 22 Jul 2026 08:49:14 +0000
Received: by outflank-mailman (input) for mailman id 1368228;
 Wed, 22 Jul 2026 08:49:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wmSdd-0007cP-2c
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 08:49:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmSdc-00HSbC-1i
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 10:49:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a6083fb-5cb7-0a2a0a5109dd-0a2a4505d752-46
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 10:49:11 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a608407-4cb1-0a2a45050019-d155da34ad85-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 10:49:11 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c15ba3a2b4bso1504399066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 01:49:11 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32ebc828sm72130466b.43.2026.07.22.01.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 01:49:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784710151; x=1785314951; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guiugp4CU4mXkNvqK6NGHYrsjl7iGfUW4L76kWssV4w=;
        b=OnJ4+fblYLzJPpJWXIohnbInC+IvuaVjsOfs455hcDVP1y/dBM1l5U3acsfWsPqpRc
         W4u2nq2zWuivzjHXh2LenBjwr/3iModWKUBat06sbHQi/oLfiYybI5oVwJjax3EozzGV
         7REyWqS1xmhAMnQXKdIaJkYuMUNGEl65s8dqnxUyT1qp/sFHTIhnvHCucuC/yCmeAl3S
         X0Ur5eJuSkmINs82vscCznwCfzYAK8VGZrvSC5/k11Xn9eWNLIP210rnH/l6jYBSrOV3
         1Sy0qCrjJl0gSn/XjKUzBXbSMOFr6J3uyIwV7Xg0tG1GjI+moEovUMzFsR9G4u4NWqyL
         4juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710151; x=1785314951;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guiugp4CU4mXkNvqK6NGHYrsjl7iGfUW4L76kWssV4w=;
        b=cnmmSDmDWy4Gwno/hczXHsn78pbT9EAUzqqW6SKzWOsxfNpC0rE8IajloBYv84cyFn
         TFuULiFoa2eM2NMzd0BAI2JHHpgY0TFn7JjooSqc2gA5d3xSSVNikUvWUnUJTRBUtAYg
         FZaBfAb3dhQR3GSd5G1OPKt0lGPqIojsstBC5p2wTnduoBcokcrrreR8oIkNHHb0c+JA
         mnlmrqM/E8EaGavoU8havBXvAxmUaN43bn2i9HFF77YRn8rd3mMbDmCVckMOeHlkGvk1
         rT1E9uERN+Bjzm0hyEsTbx/B7+C0XpjybCz0sauQUBJqL2yrvCu+2ZZB4dYW7L2t6Hqo
         h3Rw==
X-Forwarded-Encrypted: i=1; AHgh+RqLgeA8yv7Bwg1cTvQJaCmVKmwDYaSy2F6wNjNH1jipwonMs05wE8rcfgcYP/lfxwovgQNOX5Dp7MA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn0ShN64+jopztSpCQ0im1k6hYUz709xCYHvqxtmHI5sc7ixll
	Owhr9RMu3qLDZqGL5CoRdFzBUx6pSl1SLAmFafXiAS5tdKa7w3gr/FrTXnbZNiAZaLo=
X-Gm-Gg: AR+sD13So7jtQRWAajYIno6p6vR1cES6jNqdlt4k+yqzwbEeq2CVHzGI4TNLAnAkcZC
	+rN6Yp/63oeVxLYb91G1Ftkatvb0PKjlOF+3Gdm2kvDev+Ve4DMqKo5M5EOE1MHs7K0XMHxl/Qk
	wz51EsVzICu6BONGhkpx5EiIFm/hkTmLJ39K1Uc19rZ8P3YEEOLYANXgmptILdwA0bRRNgwPFcb
	unUCpU2JjTi3qBQQD3qXFnsTlttdKbg2NpsDtmzDQ1Ig8+WAs4zW1vDtDtCIUFmk+Y++SfyKd2O
	A0JfluARU6S+LzkM6wYXJrk5CHkoXveOOj8dP8BDz+B+n4UipL/KSwBO4rRUYJRFhRrcwKcha9W
	jRykYDCuD5wyAh6vqg2PHGtGvedsdVFoBoZCqVkjd+7pT7kdDC/PEAz9lJYIpGc4b6/ZHr8bwO3
	JP8Prw0qGP0miix9+nra3s+xuCL1sEyCir7h8LVpK88A+1DbnhLK0HVRQ/P0pv2h3T8tcwcKdRs
	R0y3wq0e9W9amoljVXEdLk6kf5S1DFX
X-Received: by 2002:a17:906:ef03:b0:c16:c65:56b5 with SMTP id a640c23a62f3a-c16b46e5059mr1004953566b.24.1784710151406;
        Wed, 22 Jul 2026 01:49:11 -0700 (PDT)
Message-ID: <acf12262-c1ee-4989-a702-d8fa7e8659ec@suse.com>
Date: Wed, 22 Jul 2026 10:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
To: Jan Beulich <jbeulich@suse.com>, Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
 <681d6703-6310-4ad0-a270-b5e677ee5811@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <681d6703-6310-4ad0-a270-b5e677ee5811@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5vQnBHwA5WlIS2UDTwBA4X2p"
X-purgate-ID: tlsNG-c201ff/1784710151-F60AA2A1-B9C56F02/0/0
X-purgate-type: clean
X-purgate-size: 10921

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5vQnBHwA5WlIS2UDTwBA4X2p
Content-Type: multipart/mixed; boundary="------------zBJG9eUZMNy1rcSm0mkbPhvd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <acf12262-c1ee-4989-a702-d8fa7e8659ec@suse.com>
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
 <681d6703-6310-4ad0-a270-b5e677ee5811@suse.com>
In-Reply-To: <681d6703-6310-4ad0-a270-b5e677ee5811@suse.com>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------zBJG9eUZMNy1rcSm0mkbPhvd
Content-Type: multipart/mixed; boundary="------------Q7ZtxvjGvkgCRji5bXI3iME0"

--------------Q7ZtxvjGvkgCRji5bXI3iME0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDcuMjYgMDk6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wNi4yMDI2
IDExOjQ5LCBUdSBEaW5oIHdyb3RlOg0KPj4gSW4gdGhlIGd1ZXN0LXJlcG9ydGVkIElQIGFk
ZHJlc3MgaW4geGVuc3RvcmUsIGl0J3MgdXNlZnVsIHRvIGtub3cgd2hpY2gNCj4+IHN1Ym5l
dCBpdCBiZWxvbmdzIHRvLg0KPj4NCj4+IEFkZCBhIHNwZWNpZmljYXRpb24gZm9yIHRoZSBJ
UHY2IGhvc3QgYWRkcmVzcy9wcmVmaXggZm9ybWF0IHNwZWNpZmllZCBieQ0KPj4gUkZDIDQy
OTEuDQo+Pg0KPj4gRm9yIHRoZSBJUHY0IGFkZHJlc3MvcHJlZml4IG5vdGF0aW9uLCBhcyB0
aGVyZSBzZWVtcyB0byBiZSBubyBlcXVpdmFsZW50DQo+PiBSRkMgc3BlY2lmeWluZyB0aGUg
aG9zdCBhZGRyZXNzL3ByZWZpeCBmb3JtYXQsIHNwZWNpZnkgaXQgb3Vyc2VsdmVzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFR1IERpbmggPG5nb2MtdHUuZGluaEB2YXRlcy50ZWNoPg0K
PiANCj4gQnR3LCBldmVuIGlmIGdldF9tYWludGFpbmVyLnBsIGRvZXNuJ3Qgc2F5IHNvLCBp
dCB3b3VsZCBoZWxwIHRvIENjIHRoZQ0KPiBtYWludGFpbmVyIG9mIHRoZSBjb21wb25lbnQg
dGhlIGRvYyBmb3Igd2hpY2ggaXMgYmVpbmcgbW9kaWZpZWQuDQoNCkluZGVlZC4NCg0KSSdt
IHNoYXJpbmcgVGVkZHkncyBjb25jZXJucy4gV2UganVzdCBkb24ndCBrbm93IHdobyBhcmUg
cG90ZW50aWFsIGNvbnN1bWVycw0Kb2YgdGhvc2UgWGVuc3RvcmUgbm9kZXMuIEkga25vdyBv
ZiBhdCBsZWFzdCB0aHJlZSBsYXJnZSBTVVNFIGN1c3RvbWVycyB1c2luZw0KWGVuIGhhdmlu
ZyB3cml0dGVuIHRvb2xpbmcgYWNjZXNzaW5nIFhlbnN0b3JlLg0KDQpXaGF0IGFib3V0IGFk
ZGluZyBhbm90aGVyIG5vZGUgZm9yIHRoZSBwcmVmaXgsIGxpa2UNCg0KICAgfi9hdHRyL3Zp
Zi8kREVWSUQvaXB2NC8kSU5ERVgvcHJlZml4ID0gSU5URUdFUg0KDQoNCkp1ZXJnZW4NCg0K
PiANCj4gSmFuDQo+IA0KPj4gLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRv
Yw0KPj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRvYw0KPj4gQEAgLTc4
LDEyICs3OCwxMiBAQCBWQUxVRVMgYXJlIHN0cmluZ3MgYW5kIGNhbiB0YWtlIHRoZSBmb2xs
b3dpbmcgZm9ybXM6DQo+PiAgIA0KPj4gICAqIE1BQ19BRERSRVNTIC0tIDYgaW50ZWdlcnMs
IGluIGhleGFkZWNpbWFsIGZvcm0sIHNlcGFyYXRlZCBieSAnOicsDQo+PiAgICAgICAgICAg
ICAgICAgICAgc3BlY2lmeWluZyBhbiBJRUVFIDgwMi4zIGV0aGVybmV0IE1BQyBhZGRyZXNz
Lg0KPj4gLSogSVBWNF9BRERSRVNTIC0tIDQgaW50ZWdlcnMsIGluIGRlY2ltYWwgZm9ybSwg
c2VwYXJhdGVkIGJ5ICcuJywNCj4+IC0gICAgICAgICAgICAgICAgICBzcGVjaWZ5aW5nIGFu
IElQIHZlcnNpb24gNCBhZGRyZXNzIGFzIGRlc2NyaWJlZA0KPj4gLSAgICAgICAgICAgICAg
ICAgIElFVEYgUkZDIDc5MS4NCj4+IC0qIElQVjZfQUREUkVTUyAtLSBVcCB0byA4IGludGVn
ZXJzLCBpbiBoZXhhZGVjaW1hbCBmb3JtLCBzZXBhcmF0ZWQNCj4+IC0gICAgICAgICAgICAg
ICAgICBieSAnOicsIHNwZWNpZnlpbmcgYW4gSVAgdmVyc2lvbiA2IGFkZHJlc3MgYXMNCj4+
IC0gICAgICAgICAgICAgICAgICBkZXNjcmliZWQgaW4gSUVURiBSRkMgNDI5MS4NCj4+ICsq
IElQVjRfQUREUkVTUyAtLSBBbiBJUCB2ZXJzaW9uIDQgYWRkcmVzcyBhcyBzcGVjaWZpZWQg
YnkgSUVURiBSRkMgNzkxLA0KPj4gKyAgICAgICAgICAgICAgICAgIG9wdGlvbmFsbHkgYXBw
ZW5kZWQgd2l0aCBhICIvcHJlZml4IiB2YWx1ZSByZXByZXNlbnRpbmcgdGhlDQo+PiArICAg
ICAgICAgICAgICAgICAgcHJlZml4IGxlbmd0aCBvZiB0aGUgaG9zdCBhZGRyZXNzJ3Mgc3Vi
bmV0LCB3aXRoICJwcmVmaXgiDQo+PiArICAgICAgICAgICAgICAgICAgYmVpbmcgYSBkZWNp
bWFsIGludGVnZXIgaW4gdGhlIHJhbmdlIG9mIDAgdG8gMzIuDQo+PiArKiBJUFY2X0FERFJF
U1MgLS0gQW4gSVAgdmVyc2lvbiA2IGFkZHJlc3Mgb3IgYWJicmV2aWF0ZWQgImFkZHJlc3Mv
cHJlZml4Ig0KPj4gKyAgICAgICAgICAgICAgICAgIGNvbWJpbmF0aW9uIGFzIHNwZWNpZmll
ZCBieSBJRVRGIFJGQyA0MjkxIGFuZCBSRkMgNTk1Mi4NCj4+ICAgDQo+PiAgIEFkZGl0aW9u
YWwgVEFHUyBtYXkgZm9sbG93IGFzIGEgY29tbWEgc2VwYXJhdGVkIHNldCBvZiB0aGUgZm9s
bG93aW5nDQo+PiAgIHRhZ3MgZW5jbG9zZWQgaW4gc3F1YXJlIGJyYWNrZXRzLg0KPiANCg0K

--------------Q7ZtxvjGvkgCRji5bXI3iME0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Q7ZtxvjGvkgCRji5bXI3iME0--

--------------zBJG9eUZMNy1rcSm0mkbPhvd--

--------------5vQnBHwA5WlIS2UDTwBA4X2p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpghAUFAwAAAAAACgkQsN6d1ii/Ey9p
cAgAhKY5zmrYcfVErxzfqyNFGy58ekl6XW+LSgtpFvyhnMlUyDne09d1hZZ61FjcZOkotc9bIoUf
ogYEgJg5VSfERB/pPEn8tajRUqpz7fHkoZSgF2K/RcNGm2BPITmdlMvOkNwAEHlvmeD9QmmWTP5b
dpnMJWftVyxr89ADIhaomIAx7sdzDIkgV3Rkqv7rKFH//PHqlu/YfIrQg1G886XABsWEljddNfC0
0Imy45kP6d8w1l/DrnF4nuWgqPelMWVlaLLaIjwDtv+4uJ3kM9DW8xItESrvn/KhHa2FIzGzw7qs
Wgh/z65GQgqi7vUNLKB4d/aagiJsATuQUN60WU5E9w==
=BzwW
-----END PGP SIGNATURE-----

--------------5vQnBHwA5WlIS2UDTwBA4X2p--

