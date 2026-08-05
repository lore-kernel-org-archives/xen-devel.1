Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C029EC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:03:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383544.1626823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcDO-0008JH-Sx; Wed, 05 Aug 2026 14:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383544.1626823; Wed, 05 Aug 2026 14:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcDO-0008JA-QA; Wed, 05 Aug 2026 14:03:26 +0000
Received: by outflank-mailman (input) for mailman id 1383544;
 Wed, 05 Aug 2026 14:03:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrcDN-0008Iy-C6
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:03:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrcDM-00FEQe-LX
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:03:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a73429e-2eae-0a2a0a5409dd-0a2a4502b42e-40
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:03:24 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a7342ac-6ca4-0a2a45020019-d155da36f0e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:03:24 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c1fbe461f59so164280366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 07:03:24 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2036422825sm125182766b.43.2026.08.05.07.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 07:03:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1785938604; x=1786543404; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZELl0gN6/oR6iSAb1frKORNtawYItp/FeUnGx75S0aY=;
        b=BWbUxHQc0M+iRrkLJvu/Z70QAL+UhyXJ3dyL+OxDsdgIJJJ2Ji+1m4VbVYqnbiJQYN
         C+3RlKubmlUTqQw6ewtkEaAncPBkvIwTz2d0tGIjBzHT7etfZ0kiZ6zsoucmDAyRJClv
         rMU7VUTL9SR1+Pawj4q99ESxKF1jtizsZfpAWX3W2A8PX3BfaPiI8nF0J5apWPRiDvXW
         p3dqHP2U0Wvwftngdb4bzFmi2Zte5J9Xb4+8dpCCUaGPSjeys/9PAYUSSx0+RDJ/i7Gl
         OVYpm1oYuM2bXPIZU/Ms6IzgZ6UgbttT0uxTDn2VgvTqQA7a/N3EuxOZkjVDjt9srtsR
         BgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938604; x=1786543404;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZELl0gN6/oR6iSAb1frKORNtawYItp/FeUnGx75S0aY=;
        b=NpF/AxW4Tj3/OIE8IolFuulzKjsgreFhiHlUHffwpgGK8n6rI7E0xc0vSqAJ56Rzj4
         c03kb5VutiHm2/eL0RdRCypvleO5q+XMf697ksNf0wXefu/HDmkZuN4RFLKRW+l9gEhc
         2a5BjX0DjyNV6j7ZYtqCNv6MMA/50plbU/dikDcZ9insRA9tN9+rWXovvbmBERBAGoON
         4AjzAuC7/HtaHiiphVOl3gKUUKN/Gb4MEVrh67htennLf975dVJtRMCRTbq2JALHNWr1
         s5zGt50+1Q/LClYcPn+4u323Xf1tmRkUQvMM365Bg1OIG7QjVMLzzh9cWVv/SKTjcChm
         4sSA==
X-Gm-Message-State: AOJu0YxHEh3JJ1d24iHlubzWzgPe5FDaLRYIEJHUaHSgNCkSQ7D+3muU
	RYWb3L3jMVdiho6AFmtH5LDu+TJ7TwvBfY8vbJ9Fze+5WGy3G/3TvZPDwPBWnpJzpgw=
X-Gm-Gg: AR+sD112Wwp0cDKq4py6JvYcB/BSCQHhsPypqCkSOmuoNG9679bEio6pzLgoVKvwW/1
	pdIaZSMi7zSgzdKbUDaXql6bIFNVxTk/pDNzGJoyJpQxqZrk1itR4pLMYQ84K1Xm3J4tTHDFckC
	ONmc7AEp5vOzp2OgwcgbQ/eBjPXqzi/Pqk0T3YuoENmRO1Lv2+/XWU59qr2Ht9pX12XTsoe+MtM
	7dbV/4cWP+qGjGOkirLaQZUqiUAIxFffsXn1Y+i3nMl/0RIXdS4HWLengeVAzF/UJ65fBdiiKzv
	X7201AvG9s8vNbkdUp2r3bsIhwPLtO02Mzu8Vq2m312oJzeLk2/zxCnfivbqRpYtaYzs9ezlKZA
	8U9K9BJIG3RYZt2B6D1v32sbqV4Y+hBrVWRujUCctnGlAfvhBDhlkLmd56pkJlWdthGb95dp28d
	HLomw+nh00NGCcqxqvkpaPD4qXEjmgUcXR9Oj0/H5bKWwYX6Qn15l9wCgncpRy3r25UQZPeIyyg
	GT4x2CiV5k9wwacBqCdVXUHLq94mDBTAWAm4czTdN2lNqO974YX6tZE1+XdTvv1Fhte611mmnmy
	VJn3YoPSHE80g70=
X-Received: by 2002:a17:907:988:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c2039d1fb0emr364693266b.6.1785938603408;
        Wed, 05 Aug 2026 07:03:23 -0700 (PDT)
Message-ID: <a9478ddd-247c-46f0-a18c-4bd3140df668@suse.com>
Date: Wed, 5 Aug 2026 16:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
 <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
 <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
 <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
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
In-Reply-To: <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tz3rseFSLpEZJ5KWjMvgU50I"
X-purgate-ID: tlsNG-720697/1785938604-303C42AC-6804DC65/0/0
X-purgate-type: clean
X-purgate-size: 9164

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tz3rseFSLpEZJ5KWjMvgU50I
Content-Type: multipart/mixed; boundary="------------qWmVQ8kIsdZu0Frl0vYDN0ec";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <gwd@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <a9478ddd-247c-46f0-a18c-4bd3140df668@suse.com>
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com>
 <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
 <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
 <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
In-Reply-To: <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
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

--------------qWmVQ8kIsdZu0Frl0vYDN0ec
Content-Type: multipart/mixed; boundary="------------f447bij2vWIY0iRtuYHiak0h"

--------------f447bij2vWIY0iRtuYHiak0h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTU6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOC4yMDI2
IDE0OjE1LCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gWW91J3JlIGFza2luZyBldmVyeSBw
ZXJzb24gd2hvIHNlbmRzIGFuIGVtYWlsIHRvIHhlbi1kZXZlbCB0byByZW1lbWJlciB0bw0K
Pj4gdGFrZSBhbiBhY3Rpb24gYmVmb3JlIHNlbmRpbmcgdGhlIG1haWwNCj4gDQo+IFlvdSdy
ZSBieSBmYXIgbm90IHRoZSBmaXJzdCBvbmUgdG8gYmUgYXNrZWQgdGhpczsgeW91J3JlIHRo
ZSBmaXJzdCBvbmUgdG8NCj4gaGF2ZSBhbiBpc3N1ZSB3aXRoIGJlaW5nIGFza2VkLCBiZXlv
bmQgc29tZSBjb21wYW5pZXMnIElUIGdldHRpbmcgaW4gdGhlDQo+IHdheS4NClRvIHB1dCBp
dCBkaWZmZXJlbnRseTogdGhlcmUgaXMgYSBzdGF0ZW1lbnQgb24gdGhlIFhlbiB3aWtpIGFz
a2luZyB0byBzZW5kDQpvbmx5IHRleHQgZW1haWxzIHRvIHhlbi1kZXZlbC4gSSdtIG5vdCB0
aGUgb25lIHRvIGFzayB0byByZWxheCB0aGF0IHJ1bGUuDQpJZiB5b3Ugd2FudCB0aGlzIHJ1
bGUgdG8gYmUgZHJvcHBlZCwgeW91IHByb2JhYmx5IHNob3VsZCByYWlzZSB0aGlzIHRvcGlj
DQpmb3IgZGlzY3Vzc2lvbi4NCg0KSU1ITyBpdCBpcyBmaW5lIHRvIHF1ZXN0aW9uIHN1Y2gg
Z3VpZGVsaW5lcywgYnV0IGp1c3Qgc2F5aW5nIHlvdSBkb24ndA0KYmVsaWV2ZSB0aGV5IG1h
a2Ugc2Vuc2UgYW5kIHRoZXJlZm9yIGlnbm9yaW5nIHRoZW0sIGVzcGVjaWFsbHkgYWZ0ZXIg
aGF2aW5nDQpiZWVuIGFza2VkIHRvIG9iZXkgdGhlbSwgaXMga2luZCBvZiBydWRlLg0KDQpU
aGlzIGlzIGp1c3QgbXkgb3BpbmlvbiBhbmQgSSBkb24ndCB3YW50IHRvIHdhc3RlIG15IHRp
bWUgZGlzY3Vzc2luZyB0aGlzDQphbnkgbG9uZ2VyLg0KDQoNCkp1ZXJnZW4NCg==
--------------f447bij2vWIY0iRtuYHiak0h
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------f447bij2vWIY0iRtuYHiak0h--

--------------qWmVQ8kIsdZu0Frl0vYDN0ec--

--------------Tz3rseFSLpEZJ5KWjMvgU50I
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpzQqoFAwAAAAAACgkQsN6d1ii/Ey+O
2wf9ErHqLOST1ON4ayiBv8FDliAxo/xCj2g91Q/mMQTkMhPCxRpfdIOmB38aOtHBKEX3XhF6YN9G
c5sXuOeyhVXVETK6nCI/efSts4GczH7ny68TdGQOH7nkc18OrXPLLZF9rLVE6IJFa1QEh3BqlTqK
YnK4TfWcjNkk40/13YEDqWijc2+aBsE7R1qiYCBV7vT2DtWuHMcF8OMNMnre+1yX/h7lzYyvRxVn
uAy6QsNq+7dEjOwCA9DPXbWooOK+cMPPVdVqIdQ2LP298Dte+pDATlq+jw4wfj5SdrQk+vJ85Fph
a+rgxKvjQ7xlVQvE605v2k0lypyx2GEJTgoQ1jjqSw==
=SKAW
-----END PGP SIGNATURE-----

--------------Tz3rseFSLpEZJ5KWjMvgU50I--

