Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DB4C982D2
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 06:17:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424708.1648960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7RuW-0007Cl-Dv; Fri, 18 Sep 2026 06:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424708.1648960; Fri, 18 Sep 2026 06:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7RuW-0007Ce-B3; Fri, 18 Sep 2026 06:17:24 +0000
Received: by outflank-mailman (input) for mailman id 1424708;
 Fri, 18 Sep 2026 06:17:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x7RuU-0007CX-S3
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 06:17:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7RuT-00BBBL-J9
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 08:17:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aacd766-bab6-0a2a0a5309dd-0a2a4503b36e-42
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:17:21 +0200
Received: from [74.125.225.105] (helo=mail-wr2-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aacd771-fae8-0a2a45030019-4a7de16980be-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:17:21 +0200
Received: by mail-wr2-f41.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so131669f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 23:17:21 -0700 (PDT)
Received: from [172.18.88.57] (195-200-20-130.mclarenap.oninferno.net.
 [195.200.20.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720072501sm1401896f8f.22.2026.09.17.23.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Sep 2026 23:17:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1789712241; x=1790317041; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vNWdM4gBld9jUsn7+mJExiBKESMp/3Gv72wCXlMEQs0=;
        b=EHLWrT1ewhF9pJIJUUeYHzxQgL1KXbFlMYCwWNw/sBt5hsyHrUPsiYwo/Zkm9nM449
         K1QMZxLLZU0m/hsx1XeHDx0A6QGxw4jUnI9NsuIHKLPwJ2zan4jca292LJJWqfyYNPaw
         ZK8/cKOky0/aN5AEUPQI4gSkXh+TN7B4iU+0PkMizEYhzX9LK7hTXoIrJSpJyz5RYaew
         rlbtWUx6jbU/AlEQDTdg/aWjS0be/QOqig30AlwI1vHl4gmWfiONQLd8GTBcwd33hvYW
         ZxVN+irdCDh4IQLGbMheOvhcvxQhXJao5VGYiZLVAl71BpciCGMrnWStxs+W/Dipjj5u
         TFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712241; x=1790317041;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNWdM4gBld9jUsn7+mJExiBKESMp/3Gv72wCXlMEQs0=;
        b=NwTuaKgQh5lOrHCVO1mOwg44XwzULdd/TVfvfaMzHLx/gECePbBFGLyRZtVcbKXcka
         uDd5pJzsfRuAZDWaTLNs6X7rlTz4wgjVujw/qP78hpWyMkBDCaXaMOy6EB0G3cEiwwnD
         5twMabuFHRtKhFA2VbiGLsccOQgOcOyLqOLNfpvOXZE1RUqvk3PRcb6Wm1EXzZJ+aO7q
         cq2RSf/zD6z0mTNVdOWCdn2MdRenuxSmD7jDY5N6Msh0TPCOQROk6W/xNEnhMdmHpqlm
         0kLA0AKviyMvtvRf76gnVPxq3DLLHLXtpcjYqiCplIlYLPX7b1IPLCAyEaREhhipYwz1
         G6DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTcJDro3uWi1YaXxPXVpVE31GammqiDjHKaI/YQN3cUbbKmdxskIyHocgXdynn2jGEI9p74k2VXUg=@lists.xenproject.org
X-Gm-Message-State: AFuF++lzDbYt4qOP8iiBu1PdgWrBz0NfF8puujqpNFSccHUsGJvzPaL0
	V7fW3BV+pjjWRz0K176u+hHNUAsDHAY2yE9Y3sNj2XonvmU6OJ7zsh9yid6K1QXqaZ4=
X-Gm-Gg: AYBFou3GGzDznD9miGISmc0P/Md8fvR//eRv+nUkdqtAn4ixRF1UpieuxnbFYqG0d9d
	mp6mWDDK+FzmWJRd8kFMLsmzAm4Sq+KAAk/O3ZTPuf0Hk+bM8m6nyCyJDhnmSCdKzIx5/FwaXnR
	SOBxeNSYVWoeClZ/APZnKMYYDufO1AMoLLr7mT0+/hPDOFGVqdl+eVScxOQ3KeGPENqKD2jQ7m1
	nQnntQpKBBofrUHjOAlcpEPQnEAUDViZ+SlHG6VvNySKLEOKIkPhS+oT8jlja53yutPiN1c433p
	XgwWulHtZSG6nw58VbVhsdRRtGLOLekkaL+2KEl+kd1qs9kc9lSaqccvvKg88iCa4LVb5BoYEo5
	3p/j81RmMAbKfVTj83wT+y72dtD2+4S+EV0Wku+0Hh190isTU3xoklqqH7J25geXgYIBf4OcTp+
	gymNZGfujvofcBzmDa9dgPivXvh5nQd2JRjQEMESDwv57R5Gzh2ay05VEzlNtjxjNWwC6ZA/yW0
	JpVCKOxSURypWX+rSa8fJ0Q/A2UrpfEo4F4F2M=
X-Received: by 2002:a5d:5d86:0:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-4871e371d94mr3149169f8f.27.1789712240940;
        Thu, 17 Sep 2026 23:17:20 -0700 (PDT)
Message-ID: <9e6b2d03-7523-4d7a-a523-041c3183dd52@suse.com>
Date: Fri, 18 Sep 2026 08:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xen/rcu: rework the RCU logic
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260904171121.65300-1-roger@xenproject.org>
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
In-Reply-To: <20260904171121.65300-1-roger@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fJq0MczReU3Y2rx94wJ40gC0"
X-purgate-ID: tlsNG-33051d/1789712241-7428D4E9-29FB76EB/35/110847
X-purgate-type: clean
X-purgate-size: 9403

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fJq0MczReU3Y2rx94wJ40gC0
Content-Type: multipart/mixed; boundary="------------NU5FmJL239Ur2G2IqaniYlbO";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <9e6b2d03-7523-4d7a-a523-041c3183dd52@suse.com>
Subject: Re: [PATCH 0/5] xen/rcu: rework the RCU logic
References: <20260904171121.65300-1-roger@xenproject.org>
In-Reply-To: <20260904171121.65300-1-roger@xenproject.org>
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

--------------NU5FmJL239Ur2G2IqaniYlbO
Content-Type: multipart/mixed; boundary="------------NMUNF0guQWM0xzN0uLShdZUf"

--------------NMUNF0guQWM0xzN0uLShdZUf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDkuMjYgMTk6MTEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gSGVsbG8sDQo+
IA0KPiBGb2xsb3dpbmcgc2VyaWVzIGFpbXMgdG8gc29sdmUgdHdvIHByb2JsZW1zIHdlIGhh
dmUgb2JzZXJ2ZWQgd2l0aCB0aGUNCj4gUkNVIHN1YnN5c3RlbSwgY29tcGxldGUgZGV0YWls
cyBvbiBwYXRjaCA0Lg0KPiANCj4gVGhlIHNlcmllcyBpcyBiYXNpY2FsbHkgYSByZS13cml0
ZSAoYW5kIElNTyBzaW1wbGlmaWNhdGlvbikgb2YgdGhlIFJDVQ0KPiBsb2dpYywgcGF0Y2gg
NCBjb250YWluaW5nIG1vc3Qgb2YgdGhlIG5ld2x5IGludHJvZHVjZWQgbG9naWMuDQo+IA0K
PiBJdCdzIGJlZW4gKHNsaWdodGx5KSB0ZXN0ZWQgbG9jYWxseSBhbmQgb24gdGhlIHNhZmV0
eSBDSS4gIE1heWJlIEknbQ0KPiBiZWluZyBuYWl2ZSwgYnV0IHRoaXMgbG9va3MgbXVjaCBl
YXNpZXIgdG8gcmVhc29uIGFib3V0IGFuZCBtYWludGFpbg0KPiB0aGFuIHRoZSBjdXJyZW50
IGxvZ2ljLg0KPiANCj4gVGhpcyAic2ltcGxpZmljYXRpb24iIGlzIG9ubHkgcG9zc2libGUg
YWZ0ZXIgdGhlIGludHJvZHVjdGlvbiBvZg0KPiByY3VfcmVhZF97bG9jayx1bmxvY2t9KCkg
aGVscGVycyB0aGF0IGlkZW50aWZ5IFJDVSBjcml0aWNhbCBzZWN0aW9ucy4NCj4gDQo+IFRo
YW5rcywgUm9nZXIuDQo+IA0KPiBSb2dlciBQYXUgTW9ubmUgKDUpOg0KPiAgICB4ZW4vcmN1
OiBmaXggdHlwZXMNCj4gICAgeGVuL3JjdTogc29ydCBpbmNsdWRlcw0KPiAgICB4ZW4vcmN1
OiBpbnRyb2R1Y2UgdGhlIGNvbmNlcHQgb2YgUkNVIGVwb2NoDQo+ICAgIHhlbi9yY3U6IHNp
bXBsaWZ5IFJDVSBpbXBsZW1lbnRhdGlvbg0KPiAgICB4ZW4vcmN1OiByZW1vdmUgcmN1X25l
ZWRzX2NwdSgpDQo+IA0KPiAgIHhlbi9jb21tb24vcmN1cGRhdGUuYyAgICAgIHwgNTAyICsr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICB4ZW4vaW5jbHVkZS94
ZW4vcmN1cGRhdGUuaCB8ICA0NSArKy0tDQo+ICAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
ICAgfCAgIDIgKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE1MyBpbnNlcnRpb25zKCspLCAz
OTYgZGVsZXRpb25zKC0pDQo+IA0KDQpJIGhhdmUgbG9va2VkIGF0IHRoZSBzZXJpZXMgd2l0
aCBmb2N1cyBvbiB0aGUgZ2VuZXJhbCBhcHByb2FjaCwgYW5kIEkgYWdyZWUgaXQNCmxvb2tz
IGNvcnJlY3QuIEkgd2lsbCBsb29rIGludG8gdGhlIGRpZmZlcmVudCBwYXRjaGVzIGluIG1v
cmUgZGV0YWlsIG5leHQuDQoNCg0KSnVlcmdlbg0K
--------------NMUNF0guQWM0xzN0uLShdZUf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NMUNF0guQWM0xzN0uLShdZUf--

--------------NU5FmJL239Ur2G2IqaniYlbO--

--------------fJq0MczReU3Y2rx94wJ40gC0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqs120FAwAAAAAACgkQsN6d1ii/Ey9V
Rwf+LaF3q23Tzhl3iuCOiDnTQGknNmuem6ZrwGMn9YBs+dJWg9m/0QGU6q92e7CfcuNTpnB+JaYs
D8ekFclQeI8UnrGZRv2T2rUGnDZcwd8mvtdulQYtJRJf8/ae4Rhr0GHqgv36UozPq6xsHhtKYClP
IDY7GNZk89HpslvoAytsH/f0vLhZrx9VbPhDdxIW+UzdydoevvmlzIsZjmbYNv4rabpCUOTd8GDF
s3J/kTYtD4iSKbEBHWh4HeeqH2TINAQwYvgoQm4/yNjv6y+knLfMOxvX2oPYgyfMlM+/E/2K3yz8
FRhLvp9FFlT8OcNBluHIYJVK3TfvaTekhnrmzOhJ2Q==
=m5l7
-----END PGP SIGNATURE-----

--------------fJq0MczReU3Y2rx94wJ40gC0--

