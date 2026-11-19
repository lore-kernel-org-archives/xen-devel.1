Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AC60A260B
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AL9DBnat
Received: from list by lists.xenproject.org with outflank-mailman.1496573.1695059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU4AE-0000yo-KO; Thu, 19 Nov 2026 15:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496573.1695059; Thu, 19 Nov 2026 15:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU4AE-0000yh-H1; Thu, 19 Nov 2026 15:35:06 +0000
Received: by outflank-mailman (input) for mailman id 1496573;
 Thu, 19 Nov 2026 15:35:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xU4AD-0000yC-Kb
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:35:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU4AC-002UCd-Vg
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:35:05 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aff1728-bab6-0a2a0a5309dd-0a2a450bc98a-0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:35:04 +0100
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aff1728-b7e8-0a2a450b0019-d155da2cb883-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:35:04 +0100
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-c5133831027so88198466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:35:04 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1?
 (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de.
 [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513b030ed9sm5773366b.86.2026.11.19.07.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 07:35:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795102504; x=1795707304; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2fraaeZZuCrhIVUAx9Trfdkb2PBtBgevRLUOrK5tZ0=;
        b=AL9DBnat6Djj59WuLxcTpLaodNPUQesPSeMLmrQJnVUFpzRkUElqGKQP/FdGe4zaXj
         BwlFUekZEGbLTsSPxsYviWyiroM6MQkOK0vFmayOZoFxTmaowW4Heif9GA3ehOZJiAlZ
         VvAjnRFpMBHqHiqg0JzhB+hB8fXWgSWeNzfayJgsfK9y6op2zV35ozDfLr9/gve0iueH
         rqFTNR5CIk05JLrbc7z9KIZ5vVQ9fqwW1vjWx6DtwvFcxos8ehF2fP2gQnn9ip/iXp5I
         TrWKANGX4Co4u69FZWimv9Wc/f/C0O4Y5hBgWOABLWdeDwe+YI5kNRzJKesks22yJ+NS
         tGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102504; x=1795707304;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2fraaeZZuCrhIVUAx9Trfdkb2PBtBgevRLUOrK5tZ0=;
        b=KPSmBrUoMGqT1taxpy7PiBTNUMovRnufYbTWEI03ExP50R34KaFdRfbv5T7j9yaEju
         qWWZ4LlOYL6mSipUsK8t01xhkiDJCHPfPcEuO/aXGBDFGjXoSX9LybJnuOnGaeQ9yjtV
         phmsY0eJPL4mgLKdFYtoDfS3wZWT8w/6XGe0dk8+B/yFetwr6sfmh6BrLnG7yRAzDRAe
         8e7myoX7wK8SliMo8s2tQfTGk5n/eNGPaTed9xQasKq0z7mF+jNCUy3z1icI1fnI37nw
         kdf0wWG3NLXA0k3oy6tVVRRZW/byXmVqCQhzEX45CRNKn6gNkBePJoiYKCbUo+jOigrl
         dsEA==
X-Forwarded-Encrypted: i=1; AL+hErEk3YjFHN1hqX0teFTdtJBquPu1FAOB847lBi3d2hGZbcU2OWS9ncMVPnChqXBoNhDxzeOjgwiWTNI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z//NxHa4S0512bDI8jdiu2t8p6XKRyTYj8YaxbkTTQyhDp+FGId
	6q49nrzvwopjxWuwYEInOt7FTNNt32HdIDxYkflU3NK980+kB9OvlL3EDpEb4Xix6QQ=
X-Gm-Gg: AYBFou0sREjGfxTcs7P4SMpmfRqzEeoUqjBVx6TX2MtDZlJYn/ljBWahbwMn7IuG+dq
	XQkiUj16qY72Zm7hLkmJkg2CM7Zwe+JiKvARCrpaXS0+/Qj35i++XvoHo5pFVaSanj3R80aOi8t
	ref/5rX+PAcvjEKegq0vl9XmTT4Qrulz8g2GU34ulem2Z37QL9CEb9b7Ou2tBHoR2z3RKo/9vrW
	ziwp6jIlRLlOpoc2neVyocZ7pXNj13l304lr9PH7i7607ktqAw9xF5nZGUbhqETq2hAPQnFV5FN
	Lo4t3tOYN6x09QPWdZITEnwRy0458VUuBOeRRiTbChurUWT/0YR+qlG4ywl0+c5lGAM8rnZ0JPa
	RGdYJfHodCECnlAjLQF9Ci4vEiEqsEfX8TB7EDtMYqGcF6MwwZ78pvX9HdjIRc7YE6mUqVaWvh6
	Gt79WNwG1XVluYBybv1Y+WyLLf4ghmn1GNb0byjjixO0pE4QPFtbFHk6xpI653CHhbdKLRM1eHP
	D4eZSgjp/onbqm1rxjTRiCzOZVDAVCb3u/JCPzK/y94/oEN+A31uAOyvVEBwNNKdZPr5TMYLXB1
	YQ1jm4EiiJeARCRiavJczzqhGzz5p+S0Y/GKDhgrV4FEOTeVxd5kKzaUV9WC44I07ARkTw6rRCS
	ufWNbHhZDX75lQYZgARTqN07avmCjhcX7IrIWxBKzwvlzWB6bjCo=
X-Received: by 2002:a17:907:fd15:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c513aade153mr24375566b.48.1795102503812;
        Thu, 19 Nov 2026 07:35:03 -0800 (PST)
Message-ID: <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
Date: Thu, 19 Nov 2026 16:35:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>, shyckless@gmail.com
Cc: jgg@ziepe.ca, linux-kernel@vger.kernel.org, sstabellini@kernel.org,
 linux-integrity@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org>
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
In-Reply-To: <av8Tr2jTQaOBOEid@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fDlGYcNdJOxk4nbdRiWMkwtx"
X-purgate-ID: tlsNG-42698a/1795102504-1ACDF9EA-8436EBB8/35/110847
X-purgate-type: clean
X-purgate-size: 6857
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fDlGYcNdJOxk4nbdRiWMkwtx
Content-Type: multipart/mixed; boundary="------------YQWrW0Sgy6gdJch8qIvr0Lmp";
 protected-headers="v1"; hp="clear"
Message-ID: <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
Date: Thu, 19 Nov 2026 16:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in
 backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>, shyckless@gmail.com
Cc: jgg@ziepe.ca, linux-kernel@vger.kernel.org, sstabellini@kernel.org,
 linux-integrity@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org>
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
In-Reply-To: <av8Tr2jTQaOBOEid@kernel.org>

--------------YQWrW0Sgy6gdJch8qIvr0Lmp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjYgMTY6MjAsIEphcmtrbyBTYWtraW5lbiB3cm90ZToNCj4gT24gVGh1LCBO
b3YgMTksIDIwMjYgYXQgMTE6MjA6MzNBTSArMDAwMCwgU3V5dWFuIFdhbmcgdmlhIEI0IFJl
bGF5IHdyb3RlOg0KPj4gRnJvbTogU3V5dWFuIFdhbmcgPHN0ZXZld29uZ0BodXN0LmVkdS5j
bj4NCj4+DQo+PiBXaGVuIHRoZSBiYWNrZW5kIG1vdmVzIHRvIENsb3Npbmcgb3IgQ2xvc2Vk
LCBiYWNrZW5kX2NoYW5nZWQoKQ0KPj4gdW5yZWdpc3RlcnMgdGhlIGRldmljZSBhbmQgdGhl
biBrZWVwcyB1c2luZyBpdDoNCj4+DQo+PiAJZGV2aWNlX3VucmVnaXN0ZXIoJmRldi0+ZGV2
KTsNCj4+IAl4ZW5idXNfZnJvbnRlbmRfY2xvc2VkKGRldik7DQo+Pg0KPj4gVGhlIHhlbmJ1
cyB3YXRjaCBjYWxsYmFjayB0aGF0IGNhbGxzIGJhY2tlbmRfY2hhbmdlZCgpIGRvZXMgbm90
IGhvbGQgYQ0KPj4gcmVmZXJlbmNlIHRvIHRoZSBkZXZpY2UuIFRoZSB0cG1fY2hpcCByZWdp
c3RlcmVkIGJ5IHhlbi10cG1mcm9udCBoYXMgZGV2DQo+PiBhcyBpdHMgcGFyZW50IGFuZCBo
b2xkcyBhIHJlZmVyZW5jZSB0byBpdCwgYnV0IHRwbWZyb250X3JlbW92ZSgpIGRyb3BzDQo+
PiB0aGF0IHJlZmVyZW5jZSB3aGVuIGl0IHVucmVnaXN0ZXJzIHRoZSBjaGlwLiBTbyBkZXZp
Y2VfdW5yZWdpc3RlcigpIGNhbg0KPj4gcmVsZWFzZSB0aGUgbGFzdCByZWZlcmVuY2UgYW5k
IGZyZWUgdGhlIHhlbmJ1c19kZXZpY2UsIGFuZA0KPj4geGVuYnVzX2Zyb250ZW5kX2Nsb3Nl
ZChkZXYpIHRoZW4gYWNjZXNzZXMgZnJlZWQgbWVtb3J5Lg0KPj4NCj4+IFRha2UgYSB0ZW1w
b3JhcnkgcmVmZXJlbmNlIGJlZm9yZSB1bnJlZ2lzdGVyaW5nIGFuZCBkcm9wIGl0IGFmdGVy
DQo+PiB4ZW5idXNfZnJvbnRlbmRfY2xvc2VkKCkuIFRoaXMga2VlcHMgZGV2IGFsaXZlIGZv
ciB0aGUgbGFzdCBhY2Nlc3MgYW5kDQo+PiBrZWVwcyB0aGUgZXhpc3Rpbmcgb3JkZXIsIGlu
IHdoaWNoIFRQTSBvcGVyYXRpb25zIGFyZSBzdG9wcGVkIGJlZm9yZQ0KPj4gdGhlIGZyb250
ZW5kIGlzIG1hcmtlZCBDbG9zZWQuDQo+Pg0KPj4gRm91bmQgd2l0aCBhIHN0YXRpYyBhbmFs
eXNpcyB0b29sIGFuZCBjaGVja2VkIGJ5IGhhbmQuDQo+Pg0KPj4gRml4ZXM6IGUyNjgzOTU3
ZmIyNiAoImRyaXZlcnMvdHBtOiBhZGQgeGVuIHRwbWZyb250IGludGVyZmFjZSIpDQo+PiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBLYWl4dWFu
IExpIDxrYWl4dWFuLmxpQG50dS5lZHUuc2c+DQo+PiBTaWduZWQtb2ZmLWJ5OiBLYWl4dWFu
IExpIDxrYWl4dWFuLmxpQG50dS5lZHUuc2c+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdXl1YW4g
V2FuZyA8c3RldmV3b25nQGh1c3QuZWR1LmNuPg0KPj4gLS0tDQo+PiBDb21waWxlIHRlc3Rl
ZCBvbiB4ODZfNjQgKFc9MSwgbm8gbmV3IHdhcm5pbmdzKS4gTm90IHJ1biB3aXRoIGEgWGVu
IHZUUE0NCj4+IGJhY2tlbmQuDQo+PiAtLS0NCj4+ICAgZHJpdmVycy9jaGFyL3RwbS94ZW4t
dHBtZnJvbnQuYyB8IDMgKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL3RwbS94ZW4tdHBtZnJvbnQu
YyBiL2RyaXZlcnMvY2hhci90cG0veGVuLXRwbWZyb250LmMNCj4+IGluZGV4IDNjMGNjZTU3
YzRhZS4uMWJlOTI1Y2NhNTM1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9jaGFyL3RwbS94
ZW4tdHBtZnJvbnQuYw0KPj4gKysrIGIvZHJpdmVycy9jaGFyL3RwbS94ZW4tdHBtZnJvbnQu
Yw0KPj4gQEAgLTM5Nyw4ICszOTcsMTEgQEAgc3RhdGljIHZvaWQgYmFja2VuZF9jaGFuZ2Vk
KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsDQo+PiAgIA0KPj4gICAJY2FzZSBYZW5idXNT
dGF0ZUNsb3Npbmc6DQo+PiAgIAljYXNlIFhlbmJ1c1N0YXRlQ2xvc2VkOg0KPj4gKwkJLyog
ZGV2aWNlX3VucmVnaXN0ZXIoKSBjYW4gZHJvcCB0aGUgbGFzdCByZWZlcmVuY2UgdG8gZGV2
ICovDQo+PiArCQlnZXRfZGV2aWNlKCZkZXYtPmRldik7DQo+PiAgIAkJZGV2aWNlX3VucmVn
aXN0ZXIoJmRldi0+ZGV2KTsNCj4+ICAgCQl4ZW5idXNfZnJvbnRlbmRfY2xvc2VkKGRldik7
DQo+PiArCQlwdXRfZGV2aWNlKCZkZXYtPmRldik7DQo+IA0KPiBOb3QgYSBOQUsgYnV0IG1h
a2VzIG1lIHdvbmRlciB3aHkgdGhpcyBoYXMgbm90IGhpdCB0aGUgd2FsbCBldmVyLg0KPiAN
Cj4gSS5lLiAiZmVlbGluZyBjb25mdXNlZCIuDQpJcyB0aGVyZSBhbnkgdnRwbSBiYWNrZW5k
IG90aGVyIHRoYW4gdGhlIHN0dWJkb20gYmFzZWQgb25lPw0KDQpJZiBub3QsIHRoZW4gaXQg
aXMgcXVpdGUgZWFzeTogdGhpcyBiYWNrZW5kIG5ldmVyIHN3aXRjaGVzIHN0YXRlIHRvDQpY
ZW5idXNTdGF0ZUNsb3Npbmcgb3IgWGVuYnVzU3RhdGVDbG9zZWQuDQoNCg0KSnVlcmdlbg0K


--------------YQWrW0Sgy6gdJch8qIvr0Lmp--

--------------fDlGYcNdJOxk4nbdRiWMkwtx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmr/FycFAwAAAAAACgkQsN6d1ii/Ey/f
6Af8D5ebzAoKT35KSzzN9fh+es2a/JQVWzRMxAM84ddWsaVaaOYBGuwvsVVxfs+tjms1UCytkb+m
3OHzZdciL0IajYaeJ7rpL79lVfAaSEKDGi6xveXXUIyPVugvtr81hF/h/Jp1ty8mqojq/pcQJTft
SJPY0H6q0m6fLyy0A+Z/BSj9BYCdNUq9xWOhzXt02SiNenmAcJh4mS7Oh7yoJnYM1pbA81G6IIGD
y7QmeVQWLPcKDvjPxzlvIxoijSdJsw5dBpqqdeIQ0tFowX4RIZnsErTB+iYlTHN7Q64UYhJccu4/
VfK1PDebVkqqzkZNLHGe1OH4X6iRFPREz1+0qO3vOA==
=j5Ao
-----END PGP SIGNATURE-----

--------------fDlGYcNdJOxk4nbdRiWMkwtx--

