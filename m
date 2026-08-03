Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56357C55179
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 14:52:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381550.1625108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqu1d-0001mH-M3; Mon, 03 Aug 2026 14:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381550.1625108; Mon, 03 Aug 2026 14:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqu1d-0001mA-Iw; Mon, 03 Aug 2026 14:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1381550;
 Mon, 03 Aug 2026 14:52:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqu1c-0001kH-4b
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 14:52:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqu1b-00FD5N-5f
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:52:19 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a70ab1c-bab6-0a2a0a5309dd-0a2a4506e79a-10
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:52:19 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a70ab22-195a-0a2a45060019-d155da2fadae-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 16:52:19 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c15ba3a2b4bso416268466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:52:19 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd466271csm594663266b.60.2026.08.03.07.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 07:52:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1785768738; x=1786373538; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0qKWJoSCqTs9s/h/TtgzhU/DUhBV122CIkFwWPBNBUk=;
        b=LwjccAjQtHAZ8Zh414NvjqxLsqVx6vNReCA+vPZxFgtkIMaMDiK2TSCssTIYfl9qsL
         a/OPYH3M3rO2iVuu66FAbDeU8v93FRK0GQPwatktAshZAESevBzIuYui0I761XiRf/oJ
         rtFu0UfkeNdCFfoXgsR87u1qpx7s2w2kVTEjWEJ9YCwQKNHxn9yUWOBahLPlxv/JqNbW
         8CA37OZrW3x/tz4WOpgRs0PFrzMcTXVN+4r46A/mRdtUKsBL60h/FKfOK0RriEXCutTm
         ac+CbNlpdi3AMGCfoEfkCNe+QDkIFc+ZDrGcid2CvBVB8k8cXw5hItU70uPGBY3OMK4b
         94pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768738; x=1786373538;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qKWJoSCqTs9s/h/TtgzhU/DUhBV122CIkFwWPBNBUk=;
        b=tIpPifRccrh56eyICJ0hLPcoJ5T/bEOznNyynB5Jr9KfR2iMUTP63jv2qKB+goJKBw
         CLo+9Gdrs1EwWQtHmYKOp3T6qf0Bgv14+DfEIYBkQ3fpuLOmYTMXjh3MML3YKvfttd7m
         dAjmffDeqroWe1j0Zj/PO/rGTy2SHQRwfDaeooJ5Za6a5U+naWcsi7JKtXK/QDbrUM/z
         gNFEPYVv0ELPMyqSZ+JK/T+JQcKv5wF9wNKHXk9P7zXn7d6EfKh/pK+MPwkZ2H++TSew
         6VLcpnEKjnNR5TayLYFLi4rWKhoYnD2aBSh1LMR3DcuIukYCQT6snsyEKTQVsRxKNEz5
         5n/g==
X-Gm-Message-State: AOJu0YxV5TiGDLqBZmO92M9zpi6vCmGP9HAunSRClFk1mgbBPteCqwFa
	7N9oKbIcvnnzT2SXtO6cnB385vwl1qssF36ca1jloxw/6Pme6iZMZBOW8et3R5LjyBM=
X-Gm-Gg: AR+sD10qb8XRIOQhRmuZY+sGJqfVeaSLEWcBnWbnAKkTr9OIRfZTS/Ta4DjR8KCiDBK
	kHjUEKtmTJcAajKMA8eaIdpIM62eJFr6UqIooLLZ8F0cdXcX3BOhLl61R2+kmvTfE1EtsPTauPz
	KHPEF0AMO2GyBwI9Obqe078cptTMqFbblyW/HvrHEgNzQomify3Xm1qTbT5xlDIQGuVsoGt6ULy
	fvN86J5yBVzpfbbrBhFpgY+/uE+ijcc/wVjoyoTnfpABz5xeZFA0t19ZznT8sDXUZH5MzQ6lbVR
	iPDikeKhvZr8qE6939s/86VpnJ5bZzXHr1V3wp+vihrkTF4Pw7zbtVcyasrFBGHnwdufk+GvUdS
	TAFbORF/7yFZDIHxSGm8J9iaN6nWl3m94wVmFOk/cbbZushyeQg64WPPHqMV2LfYi3irOsanJgU
	c+Qt/vrsymlvFylsF0Ffw5qVucNqTq+yeDx48yDrae0DNCwCx2FNzmXCiTVbgOL1NuOnUCcb1QH
	lIEy4TO7PNpAjCvoMdRs6NI2A1coh0aIAf5hjuO4/LpfxMVTR4aQW2O2jGCPU/J3EJcvRv0PPCt
	on+AvV/y2SAzCaYUenMMH3L0MA==
X-Received: by 2002:a17:907:da15:b0:c15:cac2:1ec4 with SMTP id a640c23a62f3a-c1fe7ecaf45mr867318666b.1.1785768738422;
        Mon, 03 Aug 2026 07:52:18 -0700 (PDT)
Message-ID: <2f1348d8-c175-42e5-9b33-bdca19bde734@suse.com>
Date: Mon, 3 Aug 2026 16:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Linux v6 16/16] xen/privcmd: Add new ABI to allow copying
 foreign memory
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-17-frediano.ziglio@citrix.com>
 <439c2740-fb84-42cb-b001-cb290684a583@suse.com>
 <CAHt6W4dMZtyvMuAfFVG36z53b=a5m6P5gQ4HONGO3WzOBUJ-qw@mail.gmail.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <CAHt6W4dMZtyvMuAfFVG36z53b=a5m6P5gQ4HONGO3WzOBUJ-qw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pU6AunD4X9CW20zewjSsZ2ob"
X-purgate-ID: tlsNG-16d1c6/1785768739-F7ACA77B-DB8132FD/0/0
X-purgate-type: clean
X-purgate-size: 11849

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pU6AunD4X9CW20zewjSsZ2ob
Content-Type: multipart/mixed; boundary="------------lQhl9a0UTJFXvMiSh6rfC5yO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <2f1348d8-c175-42e5-9b33-bdca19bde734@suse.com>
Subject: Re: [PATCH Linux v6 16/16] xen/privcmd: Add new ABI to allow copying
 foreign memory
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-17-frediano.ziglio@citrix.com>
 <439c2740-fb84-42cb-b001-cb290684a583@suse.com>
 <CAHt6W4dMZtyvMuAfFVG36z53b=a5m6P5gQ4HONGO3WzOBUJ-qw@mail.gmail.com>
In-Reply-To: <CAHt6W4dMZtyvMuAfFVG36z53b=a5m6P5gQ4HONGO3WzOBUJ-qw@mail.gmail.com>
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

--------------lQhl9a0UTJFXvMiSh6rfC5yO
Content-Type: multipart/mixed; boundary="------------I41cUVayIIqMBA0WgqbDouAc"

--------------I41cUVayIIqMBA0WgqbDouAc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjYgMTY6MjMsIEZyZWRpYW5vIFppZ2xpbyB3cm90ZToNCj4gT24gTW9uLCAz
IEF1ZyAyMDI2IGF0IDE1OjA1LCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdy
b3RlOg0KPj4NCj4+IE9uIDE5LjA2LjI2IDE1OjA1LCBGcmVkaWFubyBaaWdsaW8gd3JvdGU6
DQo+Pj4gVGhpcyBuZXcgQUJJIGFsbG93cyB0byBjb3B5IGZvcmVpZ24gZG9tYWluIG1lbW9y
eSB0by9mcm9tIGEgYnVmZmVyLg0KPj4+IFRoaXMgYXZvaWRzIGhhdmluZyB0byBtYXAvY29w
eS91bm1hcCBmb3JlaWduIG1lbW9yeSB3aGljaCBpcw0KPj4+IGV4cGVuc2l2ZS4NCj4+PiBU
aGlzIG9wZXJhdGlvbiBpcyBkb25lIHBhcnRpY3VsYXJseSB3aGVuIG1pZ3JhdGluZyBWTXMu
DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBGcmVkaWFubyBaaWdsaW8gPGZyZWRpYW5vLnpp
Z2xpb0BjaXRyaXguY29tPg0KPj4NCj4+IFdoaWxlIGRvaW5nIGEgdGVzdCBidWlsZCBJIGdv
dCB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmVzIGZvciAzMi1iaXQgYXJtOg0KPj4NCj4+
ICAgICBDQyAgICAgIGFyY2gvYXJtL3hlbi9lbmxpZ2h0ZW4ubw0KPj4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC9ob21lL2dyb3NzL2tvcmcvc3JjL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3hl
bi9pbnRlcmZhY2UuaDoxLA0KPj4gICAgICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvZ3Jv
c3Mva29yZy9zcmMvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL3hlbi5oOjEzLA0KPj4gICAgICAg
ICAgICAgICAgICAgIGZyb20gL2hvbWUvZ3Jvc3Mva29yZy9zcmMvaW5jbHVkZS94ZW4veGVu
Lmg6NTIsDQo+PiAgICAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9ncm9zcy9rb3JnL3Ny
Yy9hcmNoL2FybS94ZW4vZW5saWdodGVuLmM6MjoNCj4+IC9ob21lL2dyb3NzL2tvcmcvc3Jj
L2luY2x1ZGUveGVuL2FybS9pbnRlcmZhY2UuaDoyMjozNTogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lDQo+PiAnX19ndWVzdF9oYW5kbGVfdWludDhfdCcNCj4+ICAgICAgMjIgfCAjZGVm
aW5lIEdVRVNUX0hBTkRMRShuYW1lKSAgICAgICAgX19ndWVzdF9oYW5kbGVfICMjIG5hbWUN
Cj4+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+DQo+PiAvaG9tZS9ncm9zcy9rb3JnL3NyYy9pbmNsdWRlL3hlbi9pbnRlcmZh
Y2UvbWVtb3J5Lmg6MzYxOjU6IG5vdGU6IGluIGV4cGFuc2lvbiBvZg0KPj4gbWFjcm8gJ0dV
RVNUX0hBTkRMRScNCj4+ICAgICAzNjEgfCAgICAgR1VFU1RfSEFORExFKHVpbnQ4X3QpIGJ1
ZmZlcjsNCj4+ICAgICAgICAgfCAgICAgXn5+fn5+fn5+fn5+DQo+PiBtYWtlWzVdOiAqKiog
Wy9ob21lL2dyb3NzL2tvcmcvc3JjL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg5Og0KPj4g
YXJjaC9hcm0veGVuL2VubGlnaHRlbi5vXSBFcnJvciAxDQo+PiBtYWtlWzRdOiAqKiogWy9o
b21lL2dyb3NzL2tvcmcvc3JjL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTQ5OiBhcmNoL2Fy
bS94ZW5dIEVycm9yIDINCj4+IG1ha2VbM106ICoqKiBbL2hvbWUvZ3Jvc3Mva29yZy9zcmMv
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDo1NDk6IGFyY2gvYXJtXSBFcnJvciAyDQo+Pg0KPj4N
Cj4+IFBsZWFzZSBmaXggdGhvc2UuDQo+Pg0KPj4NCj4+IEp1ZXJnZW4NCj4gDQo+IE11bWJs
ZS4uLg0KPiANCj4gSSBzdXBwb3NlIHRoaXMgd291bGQgZml4IGl0DQo+IA0KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS94ZW4vYXJtL2ludGVyZmFjZS5oIGIvaW5jbHVkZS94ZW4vYXJtL2lu
dGVyZmFjZS5oDQo+IGluZGV4IGMzZWFkYTI2NDJhYS4uN2U3OTg1M2IxODhkIDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL3hlbi9hcm0vaW50ZXJmYWNlLmgNCj4gKysrIGIvaW5jbHVkZS94
ZW4vYXJtL2ludGVyZmFjZS5oDQo+IEBAIC01Myw2ICs1Myw3IEBAIERFRklORV9HVUVTVF9I
QU5ETEUoaW50KTsNCj4gICBERUZJTkVfR1VFU1RfSEFORExFKHZvaWQpOw0KPiAgIERFRklO
RV9HVUVTVF9IQU5ETEUodWludDY0X3QpOw0KPiAgIERFRklORV9HVUVTVF9IQU5ETEUodWlu
dDMyX3QpOw0KPiArREVGSU5FX0dVRVNUX0hBTkRMRSh1aW50OF90KTsNCj4gICBERUZJTkVf
R1VFU1RfSEFORExFKHhlbl9wZm5fdCk7DQo+ICAgREVGSU5FX0dVRVNUX0hBTkRMRSh4ZW5f
dWxvbmdfdCk7DQo+IA0KPiBGcmVkaWFubw0KPiANCg0KQW5kIG5vdyBhbm90aGVyIG9uZToN
Cg0KL2hvbWUvZ3Jvc3Mva29yZy9zcmMvZHJpdmVycy94ZW4vcHJpdmNtZC5jOiBJbiBmdW5j
dGlvbiAncHJpdmNtZF9pb2N0bF9mb3JlaWduY29weSc6DQovaG9tZS9ncm9zcy9rb3JnL3Ny
Yy9kcml2ZXJzL3hlbi9wcml2Y21kLmM6MTU5MToyOTogZXJyb3I6IGluY29tcGF0aWJsZSB0
eXBlcyANCndoZW4gYXNzaWduaW5nIHRvIHR5cGUgJ2NvbnN0IHhlbl9wZm5fdCAqJyB7YWth
ICdjb25zdCBsb25nIGxvbmcgdW5zaWduZWQgaW50IA0KKid9IGZyb20gdHlwZSAnX19ndWVz
dF9oYW5kbGVfeGVuX3Bmbl90Jw0KICAxNTkxIHwgICAgICAgICAgICAgICAgIGNvcHkucGZu
cyA9IHhjb3B5LmZyYW1lX2xpc3Q7DQogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn4NCi9ob21lL2dyb3NzL2tvcmcvc3JjL2RyaXZlcnMveGVuL3ByaXZjbWQu
YzoxNTkyOjMxOiBlcnJvcjogaW5jb21wYXRpYmxlIHR5cGVzIA0Kd2hlbiBhc3NpZ25pbmcg
dG8gdHlwZSAndm9pZCAqJyBmcm9tIHR5cGUgJ19fZ3Vlc3RfaGFuZGxlX3VpbnQ4X3QnDQog
IDE1OTIgfCAgICAgICAgICAgICAgICAgY29weS5idWZmZXIgPSB4Y29weS5idWZmZXI7DQog
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fg0KDQoNCkp1ZXJn
ZW4NCg==
--------------I41cUVayIIqMBA0WgqbDouAc
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------I41cUVayIIqMBA0WgqbDouAc--

--------------lQhl9a0UTJFXvMiSh6rfC5yO--

--------------pU6AunD4X9CW20zewjSsZ2ob
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpwqyEFAwAAAAAACgkQsN6d1ii/Ey+X
awf8DEKzTmCk+s5KRL6C70aTw6kpX+aMhkz2Mlnu1Hy2zzzb9abqos+57esHSIuvUCgJfhpbaKfI
NKkrfLpt63PBmUBUfpO6g2lLqKcpPwBnlyTkmkLM8RkQ4ZO6kcB9iuwMvDuAkgeeJC5eFRPf9PPj
zvkY/9nk1qjjLf/6GUqxspczKK5ti1CS5XtLHYPQwALl2Y4DGTMFggnQaEr41q3OlUvsqs5Pyno8
5d5IEwu9xGRRpmm3VaIV/NTsNdH8eQO3QN/nVMyCUB/R06mq1o3f84Oq2+IlAaUP1rPX+f2LZ3/K
A31Q/nSO0OPhail0y3iE3vvXcH59RnHfvp6DBg2YwA==
=h9ye
-----END PGP SIGNATURE-----

--------------pU6AunD4X9CW20zewjSsZ2ob--

