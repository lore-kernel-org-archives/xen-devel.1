Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D43C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:05:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394681.1633351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaML-0002Q0-60; Wed, 19 Aug 2026 07:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394681.1633351; Wed, 19 Aug 2026 07:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaML-0002Pt-3L; Wed, 19 Aug 2026 07:05:13 +0000
Received: by outflank-mailman (input) for mailman id 1394681;
 Wed, 19 Aug 2026 07:05:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wwaMJ-0002Pn-Cp
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:05:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaMI-008No9-6z
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:05:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a85559e-e002-0a2a0a5209dd-0a2a4503ca66-40
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:05:10 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a8555a5-fae8-0a2a45030019-d1558033c1a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:05:10 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-499a4d1d7f1so5128555e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:05:09 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499ab2a8b34sm40655715e9.8.2026.08.19.00.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:05:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787123109; x=1787727909; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=px2VSvtn3ucDS4hl04iQiAarE+9qcLC8U547OQfO20w=;
        b=eTXz5jp6viWam7BQQKhjvKcIxFGdlFpdzq8ii4vqSEDXzDC9rcE4KolvyJ7CYHsCRE
         FJy9qvkj3+WyQuUykgv/GuNXH0zLqYN5yuuVXaLZT0YdaJybHixX2pdwo1eHvR77S5MO
         usJVz70dTLHA7NWHBJNgVKk5VSx9ovMNKXNlIyAadQ+c77l9F79T3LsU7EiUEpu/UjUj
         Ro+O0FhR26C1o7SWd9Qc4bFgSOprth/MzEM5xd/S0gfHXg0BSi4T/scB+q4dZlqaWQid
         VDmByXuNT27XPLPbKEUZzW6Je2l2TOaA0Sm2N3d/jw0CEDUV1wFLCrwCn9+H6SRZX3zr
         i55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123109; x=1787727909;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px2VSvtn3ucDS4hl04iQiAarE+9qcLC8U547OQfO20w=;
        b=HDNQm8vzndQDG5+xORj3tsJgkB3+QEocAa9rS78kbeVsE/rQbCSYzcsu8sipkhxroB
         RzL+SME4RVzskmwhqc/1gHmFzkC6wwptKbT0+0SECSwKVrSd8s1AbxtfRQLuk6cbYXdm
         Ib4s0WErjzjDv5gWolRSVBsBwfmxIW9Ts0sUTFSAlopj1CAMVJz0eP076HMm0m+H5s8W
         L+Ydx4dGuZ9JVO751LRaq62Rlaap+G25CKnwKyH4W4iV5utZMdEl1p9iVCvLAGyMhFxO
         9WChTtbZ3bw8LI1su2/FLSX/9LDwzP+vOmZzNK4jWJRAxSeC+rELmWAEaM5GyNzha3bV
         ZOXw==
X-Forwarded-Encrypted: i=1; AHgh+RqdlB6EJRp2kU9U7eUSAxT3zGiTbdIZToeb9nq54p9/UXCt+WhaauItL2kKhY3GPUV2wfonDRXDjGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJ7BfQOjoF7JTXigZBA7Cq41dJsxGG5cGmDgRKzQ6PpylaimcZ
	KAISIOtpGEhB2UmI30l/qE6ng1SMmX1z4fi/XthUgPLLPIIhEvrkVZIdAcp3IpYXenc=
X-Gm-Gg: AR+sD12AhjvE5xI9py+wOWDfuXCYDMQmFbKCguXxHU/HGLlqyMF6Uo57uMRa/SwXUUZ
	J6fpzz5Lzy/n6uLjLqrQLK8BeK9Yj8tk6U+fA68TU3csTsLwayJRwO12eOfnTUeCjlQzDSniVLK
	KnrofKb7rnFRJALBgh+ew967np2yLIc32/WBY7zMnXX7ZfVSH5XDrR6rSPiKTaNrsjP15BaWZgw
	gRNqhUhrrLZfV+3XkkP3bC1DLYglwtpfn1Y1WJBGIgWW4/ZkwVJoff0A7BBISgRS7XoaCDntPG1
	qMLA29nmCP9TvQhobBTv2/rKS/h8i2LxkH4Glb88e2wskKgYTFj7gvQnnR6We3euL17AImDK4h8
	dL5pVFdGYfe0Uv+l10J3KLSrltkWLLwasgBVN7mRHGElS/G0sU6+RzFZ+matY6vAWhmMKW//mSv
	6DQoDvsH+m1Xoyeer/t+UanZ+M+Sqq9SgYEAPeWB/nKmQ88JzgjpdQdYbBdIYqOqXXmFzr6vfMH
	j5dfx8lIDAs0Hfv10W85N9iRWZ4RYXUb9w+/djWcMkt+KJOdB4ozLBTNIn/gT17bSxKfbg9fwPW
	HvhWmeUeM1zVAng/LiHvqihO8A==
X-Received: by 2002:a05:600c:64c8:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-499aa18014emr43786535e9.2.1787123109324;
        Wed, 19 Aug 2026 00:05:09 -0700 (PDT)
Message-ID: <cae0c369-1f88-40e2-9990-97dc5147bb71@suse.com>
Date: Wed, 19 Aug 2026 09:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
 <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com> <aoTRPKeD6__D7Qra@end>
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
In-Reply-To: <aoTRPKeD6__D7Qra@end>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------go8iON0vGr8tfxpQXeAcR7Oj"
X-purgate-ID: tlsNG-33051d/1787123110-6FCC34E9-C7568101/0/0
X-purgate-type: clean
X-purgate-size: 9558

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------go8iON0vGr8tfxpQXeAcR7Oj
Content-Type: multipart/mixed; boundary="------------9DSG636NSZ0eru91HRmCxZq4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
Message-ID: <cae0c369-1f88-40e2-9990-97dc5147bb71@suse.com>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
References: <20260817071843.114898-1-jgross@suse.com>
 <20260817071843.114898-3-jgross@suse.com> <aoK8zVAP0C0ksD_0@end>
 <2e8b1f56-6447-44c9-9555-4f1b3f0a00e8@suse.com> <aoM4ufGg8QO51XB9@end>
 <e47cf430-dc06-4e9d-9a3b-82ed8c081a70@suse.com> <aoTRPKeD6__D7Qra@end>
In-Reply-To: <aoTRPKeD6__D7Qra@end>
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

--------------9DSG636NSZ0eru91HRmCxZq4
Content-Type: multipart/mixed; boundary="------------rKjuY9pp0bfNP0qTOcVhAs0X"

--------------rKjuY9pp0bfNP0qTOcVhAs0X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDguMjYgMjM6NDAsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSmFuIEJldWxp
Y2gsIGxlIG1hci4gMTggYW/Du3QgMjAyNiAwODowMzo1MSArMDIwMCwgYSBlY3JpdDoNCj4+
IE9uIDE3LjA4LjIwMjYgMTg6MzcsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+PiBKdWVy
Z2VuIEdyb3NzLCBsZSBsdW4uIDE3IGFvw7t0IDIwMjYgMTA6MjQ6MDIgKzAyMDAsIGEgZWNy
aXQ6DQo+Pj4+IE9uIDE3LjA4LjI2IDA5OjQ4LCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6DQo+
Pj4+PiBKdWVyZ2VuIEdyb3NzLCBsZSBsdW4uIDE3IGFvw7t0IDIwMjYgMDk6MTg6NDEgKzAy
MDAsIGEgZWNyaXQ6DQo+Pj4+Pj4gVGhlcmUgaXMgbm8gdXNlciBvZiBsaWJwY2kgbGVmdCBp
biBzdHViZG9tcy4NCj4+Pj4+Pg0KPj4+Pj4+IFJlbW92ZSBsaWJwY2kgZnJvbSB0aGUgc3R1
YmRvbSBidWlsZCBzeXN0ZW0uDQo+Pj4+Pg0KPj4+Pj4gV291bGRuJ3QgaXQgYmUgdXNlZnVs
IHRvIGtlZXAgdGhpcyBmb3IgYW55Ym9keSB3aG8gd291bGQgd2FudCB0byBkcml2ZSBhDQo+
Pj4+PiBQQ0kgY2FyZCBmcm9tIGEgc3R1YmRvbWFpbj8NCj4+Pj4+DQo+Pj4+PiBJIG1lYW4s
IGluIHRoZSB6bGliIGNhc2UsIGl0J3MgcmVhbGx5IGEgbWVyZSBxdWVzdGlvbiBvZiBidWls
ZCAmIGxpbmssDQo+Pj4+PiBzbyB3ZSBkb24ndCBuZWVkIHRvIHNoaXAgaXQsIHBlb3BsZSBj
YW4gZG8gaXQgdGhlbXNlbHZlcyBlYXNpbHkgbGlrZSBmb3INCj4+Pj4+IGFueSBvdGhlciBs
aWJyYXJ5Lg0KPj4+Pj4NCj4+Pj4+IEJ1dCBoZXJlIHRoZXJlIGlzIGFjdHVhbCBwb3J0aW5n
IHdvcmssIHRoYXQgd2UnZCBiZXR0ZXIgbm90IGxvc2UgYnV0DQo+Pj4+PiBrZWVwIHNoaXBw
aW5nLg0KPj4+Pg0KPj4+PiBUaGlzIGlzIGFsbCBzdGlsbCBhdmFpbGFibGUgdmlhIGdpdC4N
Cj4+Pg0KPj4+IE5vLCBpdCBpcyBub3QgcmVhbGx5Lg0KPj4NCj4+IFF1ZXN0aW9uIGlzIC0g
ZG9lcyB0aGlzIG1hdHRlciBpbiB0aGUgZmlyc3QgcGxhY2U/IElmIHNvbWVvbmUgd2FudGVk
IHRvDQo+PiBkcml2ZSBlLmcuIGEgVVNCIGRldmljZSwgd291bGQgd2UgaW5jbHVkZSBVU0Ig
Y29kZT8NCj4gDQo+IFdoeSBub3Q/IEkgbWVhbiwgYmV0dGVyIGNlbnRyYWxpemUgdGhlIG1h
aW50ZW5hbmNlIG9mIHN1Y2ggY29kZSBpbnN0ZWFkDQo+IG9mIHBvc3NpYmx5IHNldmVyYWwg
cGVvcGxlIGhhdmluZyB0byBtYWludGFpbiB0aGVpciBvd24gVVNCIGxheWVyIGVhY2guDQoN
ClRoZXJlIGlzIFVOSUtSQUZUIChiYXNlZCBvbiBhIGZvcmsgb2YgTWluaS1PUyksIHdoaWNo
IGlzIHByb2JhYmx5IG11Y2ggYmV0dGVyDQpzdWl0ZWQgZm9yIHN1Y2ggZW5kZWF2b3JzLg0K
DQoNCkp1ZXJnZW4NCg==
--------------rKjuY9pp0bfNP0qTOcVhAs0X
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rKjuY9pp0bfNP0qTOcVhAs0X--

--------------9DSG636NSZ0eru91HRmCxZq4--

--------------go8iON0vGr8tfxpQXeAcR7Oj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqFVaQFAwAAAAAACgkQsN6d1ii/Ey+T
5wgAgeNnOmjblKPkILe0gEhi43gMsF8MgfiOAlFpLXF2oDqByLr6FNUBgsJPPIiAbKdWeY4ylnrv
KKleq0nL5MoL+bohJB5y1HimCctYfl4WI/pvNNcYBIDUG1s5AHoCGVMvdEGbIEyahg6K92eoXHe2
V8sECYH+qmqTxyNTpH/BwYRlpdk5LE33QPWGai+R/Bq9QWgY02fQghWYamQF5JqsYKOHfFLE1Xrs
j8orgzr2vfaSO7MsctfFTRF15P5s2XqdXIEYI3m/W0Jao4gfETZgPhf3rsf90Rg/6XqqTiZkVHpl
KzVcO7ow9/yy/5hdk0Txx5akGBSgQrhbumRhMo3iAQ==
=iqWS
-----END PGP SIGNATURE-----

--------------go8iON0vGr8tfxpQXeAcR7Oj--

