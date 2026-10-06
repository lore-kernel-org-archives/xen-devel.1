Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF451CA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 08:30:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441286.1658857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE0Z2-0000G7-Fi; Tue, 06 Oct 2026 08:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441286.1658857; Tue, 06 Oct 2026 08:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE0Z2-0000Fz-BZ; Tue, 06 Oct 2026 08:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1441286;
 Tue, 06 Oct 2026 08:30:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xE0Z0-0000Ft-LC
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 08:30:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE0Z0-0041Dy-20
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:30:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ac4b193-bab6-0a2a0a5309dd-0a2a450be962-34
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 10:30:17 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ac4b199-b7e8-0a2a450b0019-d1558036a922-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 10:30:17 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-49e73611928so2597385e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 01:30:17 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1787e7792sm53561025e9.0.2026.10.06.01.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 01:30:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1791275417; x=1791880217; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ng7gvqS9bLC1jpGuf8no+ogtM6aWKSMOCcwS42u/RdY=;
        b=NqfqVPfGkUzYp4xdJIOoiI1sTWv09JDSMCB3g3sQLzw1QZ8eaZGVz9epbFVmYfTU1M
         BvYKjyWLCy8IgkxDRLII5HJz4fpKjNZWFD3DwzH4xAlomgSDkUOqu5ux2BTyg/ji8UVr
         bEllYR2vUs6eROBpQEJDCHY6i2jxDTnS1fMElSKnIEr8+yBYfVDelbgTZeJMysXIXD/i
         mvdPk7wfcsJpubUGWsUKbv5xQlU8SFtU3cO1EQlJnwFoX6A9K5O0ehzYThXdvJTGXQW+
         xjT+xdIzOq+Yz1/mxN/oGcXFO5sLbQf3sagb8Zgp5kcvXsEx3NU5ecNNfMUt9JMR4s/9
         UEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275417; x=1791880217;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ng7gvqS9bLC1jpGuf8no+ogtM6aWKSMOCcwS42u/RdY=;
        b=lBys98sLdha9kYCvZckn56MQlNs/suMfZWMzRXAiODOV37rkN+3V3AfiNqhnRj+s5I
         ueL2cp84xogbm7JmfZsYhyOMuKqV2fF3eIm30MMb6+p7S1tP2TAd1Hea+JEkF7ZG+AKl
         s1UM6khJFUBRjZ0SDtgDLcN4YGmp9NPn+BFvDBxRBppFIwuLV8BJQYZUqFhjLC1t4KkB
         Dilyl0/Dlvyb6TYUW3kxMuDs5WLUOmNOIGQ2hFE0gXJ4zvsCZwNCQxcxy6SOUj/7aB1V
         esEh/1e+8kolzW05bYuK3zqH3uVP2Ve7eknb+rMukYi9d5FePm3k2RxDzmXUpAECwIGQ
         1ivQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQYy6RnviUb2913De3kME30smuA5E+rKa5KjqJchEC6swauA5XnLl8tIfgC117a5JMyhnr0u2dcrY=@lists.xenproject.org
X-Gm-Message-State: AFuF++ncslKprFcml72WqesEdjwpKvzcgB9HPrGTFwUzJjKI66anf8zC
	m+9j57R9XakNAb/Nq/RdhdgntiNsqxn584wMIgtMZWLps9lx3/aNWweMXwzz2MfML54=
X-Gm-Gg: AYBFou2d0Pp6a8lG21DLxRAt6z3/ywWAMPkQA9+gkc2UhimFXcwPof0t6bw4Z3nQxrE
	qH2LoonUeQLkd1kegdvSjpB6OG9NTb1B18hylz+7+ODkaEU9x93g4FpmI0Vnx9pjseHWyojwvRy
	egJWi1BDqmUThvDgr98BhiTOnVkhvhUOEhmvLHAaRKpzyhfT2G+/+sQysBZfHPWBAmt2BkkF6sL
	Nys6CqIdC3LTz7lPnQxIOJrEYaARWRns4vGOwoCh6d2yy/ajKriIUdV6NTI1tgYT9hbSRFJhzHu
	yEcT7G02pjXisR0ovUHoxHdJoBBqPK/KGQ38zxAWO40xK+pLbYiNU51V1xmlvi2WeVyG4klq2eP
	0RW/bUBQSF1+exMBaDvaHiomeafz4v0onKwcV1vWuYTyLLXtwOsV63pkjInRq6Jw8yNhiQWCkKu
	oqvWPhxXOoMLkXTkc8FJMZKuZa2f4emrKY5ivJraxNsjqTgb/R4LC2tRzDMzATUivIa2w3+Vx64
	tHxfIJb1XZoRgGTDPXXgkHxAIMzz1EJ4LyO/Dv7gk6duUBhufk91iL6onKWQrJgctfUOzRX3fm9
	1Jb9MTCVfQ==
X-Received: by 2002:a05:600c:a08:b0:4a1:6d2d:d8bb with SMTP id 5b1f17b1804b1-4a17b542787mr13743965e9.12.1791275414617;
        Tue, 06 Oct 2026 01:30:14 -0700 (PDT)
Message-ID: <df3af801-bd44-4e90-8463-ac7838d6b1c5@suse.com>
Date: Tue, 6 Oct 2026 10:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
 <f9699fcd-3348-41db-b81b-d0d7cba3ca4b@suse.com>
 <4a0b9a82-c142-4c12-81df-4e0ab2191721@suse.com>
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
In-Reply-To: <4a0b9a82-c142-4c12-81df-4e0ab2191721@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M8ZlGvQc27y80QLSuze0cSGQ"
X-purgate-ID: tlsNG-42698a/1791275417-A8ECE9EA-9C6D5308/35/110847
X-purgate-type: clean
X-purgate-size: 11155

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M8ZlGvQc27y80QLSuze0cSGQ
Content-Type: multipart/mixed; boundary="------------LpALfOBwhbKEu9FfmtCKf6IO";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <df3af801-bd44-4e90-8463-ac7838d6b1c5@suse.com>
Subject: Re: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
References: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
 <f9699fcd-3348-41db-b81b-d0d7cba3ca4b@suse.com>
 <4a0b9a82-c142-4c12-81df-4e0ab2191721@suse.com>
In-Reply-To: <4a0b9a82-c142-4c12-81df-4e0ab2191721@suse.com>
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

--------------LpALfOBwhbKEu9FfmtCKf6IO
Content-Type: multipart/mixed; boundary="------------Q0jLntdxmoI5JFt6v4gIJZkX"

--------------Q0jLntdxmoI5JFt6v4gIJZkX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTAuMjYgMTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMC4yMDI2
IDEwOjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTYuMDIuMjYgMDk6NTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEJvdGggZGVjcmVhc2UtcmVzZXJ2YXRpb24gYW5kIHBv
cHVsYXRlLXBoeXNtYXAgY2FuIHN1Y2NlZWQgcGFydGlhbGx5LiBGb3INCj4+PiB0aGUgZm9y
bWVyIHRoaXMgbWF5IGJlIHByZXR0eSB1bmxpa2VseSwgYnV0IGNsZWFybHkgdGhlIGxhdHRl
ciBjYW4gaGl0DQo+Pj4gYm90aCBvdXQtb2YtbWVtb3J5IGNvbmRpdGlvbnMgaW4gdGhlIGh5
cGVydmlzb3Igb3IgZGVuaWFsIGJlY2F1c2Ugb2YgdGhlDQo+Pj4gYWxsb2NhdGlvbiBleGNl
ZWRpbmcgdGhlIGRvbWFpbidzIGFsbG93YW5jZSAodGhlcmUncyBubyBpbnRlcmFjdGlvbiB3
aXRoDQo+Pj4gdGhlIGJhbGxvb24gZHJpdmVyIGhlcmUgZWl0aGVyKS4NCj4+Pg0KPj4+IElu
IGdudHRhYl9kbWFfZnJlZV9wYWdlcygpIHdlIHNpbXBseSBjYW4ndCBnaXZlIGJhY2sgdG8g
dGhlIHN5c3RlbSB3aGF0DQo+Pj4gaGFzbid0IGJlZW4gcmUtZmlsbGVkIHdpdGggYmFja2lu
ZyBtZW1vcnkuIEZvciBnbnR0YWJfZG1hX2FsbG9jX3BhZ2VzKCkNCj4+PiBib3RoIHBhcnRz
IG9mIHRoZSBvdmVyYWxsIHJlZ2lvbiBuZWVkIGRlYWxpbmcgd2l0aCBkaWZmZXJlbnRseS4N
Cj4+Pg0KPj4+IFdoaWxlIG5vIHByZXNlbnQgY2FsbGVyIG9mIGdudHRhYl9kbWFfZnJlZV9w
YWdlcygpIGNoZWNrcyBpdHMgcmV0dXJuDQo+Pj4gdmFsdWUsIGFsc28gZG9uJ3QgdXNlIC1F
RkFVTFQgdGhlcmU6IEl0IHJlYWxseSBpcyBhbiBvdXQtb2YtbWVtb3J5DQo+Pj4gY29uZGl0
aW9uLiAoSW4gZ250dGFiX2RtYV9hbGxvY19wYWdlcygpIC1FRkFVTFQgZG9lc24ndCBsb29r
IHF1aXRlIHJpZ2h0DQo+Pj4gZWl0aGVyLCBidXQgSSBjb3VsZG4ndCB0aGluayBvZiBhIGNs
ZWFybHkgYmV0dGVyIGVycm9yIGNvZGUgdGhlcmUuKQ0KPj4+DQo+Pj4gRml4ZXM6IDliZGM3
MzA0ZjUzNiAoInhlbi9ncmFudC10YWJsZTogQWxsb3cgYWxsb2NhdGluZyBidWZmZXJzIHN1
aXRhYmxlIGZvciBETUEiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4+PiAtLS0NCj4+PiBJJ20gbGlrZWx5IHNjcmV3aW5nIHRoaW5n
cyB1cCwgYXMgSSBjYW4ndCB1bmRlcnN0YW5kIGhvdyB0aGlzIGlzIGludGVuZGVkDQo+Pj4g
dG8gd29yazogYXJncy0+ZGV2X2J1c19hZGRyIHNob3VsZG4ndCByZWFsbHkgYmUgaW4gcHNl
dWRvLXBoeXNpY2FsIGFkZHJlc3MNCj4+PiBzcGFjZSwgb3IgZWxzZSB0aGUgYWRkcmVzcyBp
c24ndCBzdWl0YWJsZSBmb3IgaGFuZGluZyB0byBhIGRldmljZSBpbiBvcmRlcg0KPj4+IHRv
IERNQSB0by9mcm9tIGl0LiBIZW5jZSB1c2luZyBfX3BoeXNfdG9fcGZuKCkgb24gaXQgdG8g
dGhlbiBoYW5kIHRoZQ0KPj4+IHJlc3VsdCB0byBwZm5fdG9fcGFnZSgpIGZlZWxzIGJvZ3Vz
LiBXYXMgYWxsIG9mIHRoaXMgcGVyaGFwcyBvbmx5IGV2ZXINCj4+PiBpbnRlbmRlZCBmb3Ig
KHRlc3RlZCB3aXRoKSB0cmFuc2xhdGVkIGRvbWFpbnM/IFdpdGggdGhlIHVzZXMgb2YNCj4+
PiB4ZW5tZW1fcmVzZXJ2YXRpb25fdmFfbWFwcGluZ18qKCkgb25seSBiZWluZyBtYXNxdWVy
YWRlPw0KPj4NCj4+IEkgZmluYWxseSBmb3JjZWQgbXlzZWxmIHRvIGxvb2sgaW50byB0aGlz
IG1hemUuDQo+IA0KPiBUaGFua3MgbXVjaC4NCj4gDQo+PiBnbnR0YWJfZG1hX2FsbG9jX3Bh
Z2VzKCkgd2lsbCBvbmx5IGJlIGNhbGxlZCB2aWENCj4+IGdudGRldl9pb2N0bF9kbWFidWZf
ZXhwX2Zyb21fcmVmcygpLCB3aGljaCBoYXM6DQo+Pg0KPj4gCWlmICh4ZW5fcHZfZG9tYWlu
KCkpIHsNCj4+IAkJcHJfZGVidWcoIkNhbm5vdCBwcm92aWRlIGRtYS1idWYgaW4gYSBQViBk
b21haW5cbiIpOw0KPj4gCQlyZXR1cm4gLUVJTlZBTDsNCj4+IAl9DQo+Pg0KPj4gYXQgaXRz
IHRvcC4NCj4gDQo+IFdlbGwsIGdudHRhYl9kbWFfYWxsb2NfcGFnZXMoKSBpcyBhbiBleHBv
cnRlZCBmdW5jdGlvbiwgc28gaXQgY2FuIGluDQo+IHByaW5jaXBsZSBiZSBjYWxsZWQgZnJv
bSBhbnl3aGVyZSwgaW5jbHVkaW5nIG91dC1vZi10cmVlIG1vZHVsZXMuDQoNClJpZ2h0LCB0
aGF0IGlzIHdoeSBJIHdhbnQgdG8gd3JpdGUgcGF0Y2ggcmVqZWN0aW5nIGFueSBjYWxscyBv
Zg0KZ250dGFiX2RtYV9hbGxvY19wYWdlcygpIGluIFBWIGd1ZXN0cy4NCg0KPiANCj4+IEkn
bGwgc2V0dXAgYSBwYXRjaCBtYWtpbmcgdGhpcyBjbGVhci4NCj4+DQo+PiBBcmUgeW91IGZp
bmUgd2l0aCBtZSB0YWtpbmcgeW91ciBwYXRjaCBhbmQgY2xlYW5pbmcgaXQgdXAgcmVnYXJk
aW5nIHRoZQ0KPj4gdXNlIG9mIHhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3VwZGF0
ZSgpPw0KPiANCj4gWWVzLCBzdXJlLg0KDQpUaGFua3MsDQoNCg0KSnVlcmdlbg0KDQo=
--------------Q0jLntdxmoI5JFt6v4gIJZkX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Q0jLntdxmoI5JFt6v4gIJZkX--

--------------LpALfOBwhbKEu9FfmtCKf6IO--

--------------M8ZlGvQc27y80QLSuze0cSGQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrEsZUFAwAAAAAACgkQsN6d1ii/Ey+H
BQf7BzUJizRfd+oYQLFYzyOF7evcy5IjSFciH7tRW77SFGRjMgeKwLGiH7RfD6iKAFamjB+sBLwo
zjUp/l5A014g5qY+L/mfSWa2arzIUB/67D5xRWpTV8sba9SbcDGV53pEsk5pN0aSmAwLAojiZd6W
m/01BNdIM/FN0p6+B8e1eiWUtgxBld4GDRWf6s9ijCFsI5ghTzr3PA1fXl6A3XDV9Yy2u1RTFCVZ
8WiSJUzPIGCRQROgqAPcreOZCWZo8bVeR9XrqdgaNffv+AQRbQPbODc5Y3KyVzCSU1s2Nbv409DN
K+eU/RsmF+kttMUPI9QQeWtGSE9eSz6Z2qTu3z0Vjw==
=+HqZ
-----END PGP SIGNATURE-----

--------------M8ZlGvQc27y80QLSuze0cSGQ--

