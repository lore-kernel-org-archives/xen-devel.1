Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A07C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:21:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428135.1650834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8tsQ-0007yx-RP; Tue, 22 Sep 2026 06:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428135.1650834; Tue, 22 Sep 2026 06:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8tsQ-0007yq-Ob; Tue, 22 Sep 2026 06:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1428135;
 Tue, 22 Sep 2026 06:21:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x8tsP-0007yk-T7
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:21:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8tsO-004QvI-W3
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:21:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ab21e48-bab6-0a2a0a5309dd-0a2a45049ccc-14
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:21:12 +0200
Received: from [74.125.228.145] (helo=mail-ej2-f17.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ab21e58-b57f-0a2a45040019-4a7de491802d-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:21:12 +0200
Received: by mail-ej2-f17.google.com with SMTP id
 a640c23a62f3a-c29d50b7cf9so557919766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:21:12 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2a9c62dc31sm34293066b.59.2026.09.21.23.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 23:21:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1790058072; x=1790662872; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6C7LIWiXbu4EQkQm8bd44AKIo0GAwrlrmy/9RmiMiWE=;
        b=DwEDeKqDPjTlObJHv12wJY2BqJgQRVPuwliBGwo6RqsSxarhbj5ulCPbJHaldzrkEs
         HyjkHSa0PiFQQKhDT2uncJSuaVDABlwFMHLcCHF14752WHNqcmwvhth4gJL/83xczZyz
         rgyziJzBbHeDS2aLB0HTRUaCiz/6XDfaL99dCeiGEDAnTmkkzDtfcctJ2NCcvQvp+sey
         tva3BYcNw+tJTZoMccTq861GQieOyET1CvpUSpV6VZ9L4X70s0OPizGKZ2bY0iMjV6n4
         8TBOTlAur/ymWPORRiJtTEprBPBpu1pBa4SYk6oDyGaAAaLTlIa+Us3POQ0KMudFVloY
         Cs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058072; x=1790662872;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6C7LIWiXbu4EQkQm8bd44AKIo0GAwrlrmy/9RmiMiWE=;
        b=CQsB4y9jIJlSBrvzM8MgWKT4UANbwzZFr6ucQtfduW6/F00FyKqngrOeiTRIboHDyk
         cBeW4WbqW1KqivYN4Az+RWFIyQzPRwF0Qgpl1f80u6vxgouEXvkc2qonSybKzx6yEHIM
         N1o8GC+MqL2TwkutoWzxvARU9Ewj6KyHcE4vAsAonjdygVjlfLHhI3AJRNoYTAgcGQL4
         6j48DLi29POvnHfyDwD7FMJYGQpYrkbzsi+DuPlSBLhncxzP18wjwE5+Qakw/Ot/FZrh
         bAu955XRuQGpcUdcJz07qJFbkdRlTbITYHbIbIugJl08Jbd/j7LYPN0Ef2Z7FTFSyqor
         mvUA==
X-Forwarded-Encrypted: i=1; AKwUvBySF9gpJAARvDfhdjd4dYdmCHpr7wgXUBB4VFtPg4d7HsvxpcSlM+SrFTCViS8/rFlwtai4TuPLv9I=@lists.xenproject.org
X-Gm-Message-State: AFuF++kNOtGXPtan0agE95kNKVWiLSUYynTxkb8GufW3yG8nieFtrL6x
	p6WrxKdxd8wZPVkL9CROujM9/t8jVRgcnSgGOT08UiRsjqLEIDdQFrQicyzRsa/HDt0=
X-Gm-Gg: AYBFou0zN2w5YrIcy912bJo/ibIg7MckbDWwJgMC5ECIiZEAENmVAcZ6x1/uiBx83zV
	vqm9OxMNYfM5GF4NejkpPXw1HpmRQSuiiYyStsZEcGtLj8F93V5WztX5kcqyimP+94s1OhBg7Ej
	FOfbFXnh2aSyQpZsjwdh5ADTFU9MTi8cTA/MM7rK8MLw1+oHif9tT8UfsCtCgH2jTMDAsyhomMV
	AIYa48grMa/7VOMlSMWWeiFe6JL95vza9RXU1T5x4iMByXc3SfbhkH0orEysH562eerXOE6oV0/
	XuKQoTrGQnwK4spRMyQjCwsRl3LnKr4M7MEiA3W+sm+UaEsn7hJYjQASTsDQ0YYRWiZQMpM51qT
	zUtX7A3JcaHuNkdoKPgjSi/eYyvHBG6ofO3p8HeG/k2HNfpAukg4UxPZea8tTTt5+oKNy8V6ph0
	da8Pf/q+6R+Gmxadd66updmL2yYkK256rb98hlXXlEQM+m1DFvnlc1kDLhGFYML8xukbvAJ5//j
	74geEWXZc0NszffRct2X/6ykkQ+OI60fwOjJWOJtqxcOLJoK3uXSVo/GD6BuVfPZC9xf5lzTrjd
	8AvbZ2O7kzyRCa0CEz4g931w
X-Received: by 2002:a17:907:6092:b0:c29:4b79:e417 with SMTP id a640c23a62f3a-c2a157fab34mr1084149866b.16.1790058072157;
        Mon, 21 Sep 2026 23:21:12 -0700 (PDT)
Message-ID: <624eb81f-9134-4181-9021-b315cf2fb10d@suse.com>
Date: Tue, 22 Sep 2026 08:21:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>
References: <aq6_Cebyee8IHN8p@end>
 <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com> <arIZEeYpAwSTUcrb@end>
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
In-Reply-To: <arIZEeYpAwSTUcrb@end>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xrhDtI5LTaLjWk0MmX4sWtQV"
X-purgate-ID: tlsNG-ebf023/1790058072-518D1B50-522A0190/35/110847
X-purgate-type: clean
X-purgate-size: 11289

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xrhDtI5LTaLjWk0MmX4sWtQV
Content-Type: multipart/mixed; boundary="------------btL7pXQBiFTagmflgxX0ZSjE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <624eb81f-9134-4181-9021-b315cf2fb10d@suse.com>
Subject: Re: [PATCH 2/4] stubdom: remove pciutils
References: <aq6_Cebyee8IHN8p@end>
 <1f814c72-6fa2-4177-8da0-e17e0406e473@suse.com> <arIZEeYpAwSTUcrb@end>
In-Reply-To: <arIZEeYpAwSTUcrb@end>
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

--------------btL7pXQBiFTagmflgxX0ZSjE
Content-Type: multipart/mixed; boundary="------------pyS0kHsSAoI1xImeFrSWoHlN"

--------------pyS0kHsSAoI1xImeFrSWoHlN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDkuMjYgMDc6NTgsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4gSsO8cmdlbiBH
cm/DnywgbGUgbHVuLiAyMSBzZXB0LiAyMDI2IDE1OjA3OjM2ICswMjAwLCBhIGVjcml0Og0K
Pj4gT24gMTkuMDkuMjYgMTg6NTcsIFNhbXVlbCBUaGliYXVsdCB3cm90ZToNCj4+PiBJIGhh
dmUgc3VibWl0dGVkIHRoZSBwY2l1dGlscyBNaW5pT1MgcG9ydCB0byB1cHN0cmVhbSAod2hp
Y2ggSSBzaG91bGQNCj4+PiBwcm9iYWJseSBoYXZlIGRvbmUgMTggeWVhcnMgYWdvIDopDQo+
Pj4NCj4+PiBodHRwczovL2dpdGh1Yi5jb20vcGNpdXRpbHMvcGNpdXRpbHMvcHVsbC8yMzUN
Cj4+PiBodHRwczovL2dpdGh1Yi5jb20vcGNpdXRpbHMvcGNpdXRpbHMvcHVsbC8yMzYNCj4+
Pg0KPj4+IEphbiBCZXVsaWNoLCBsZSBtZXIuIDE5IGFvw7t0IDIwMjYgMDg6NDA6MzcgKzAy
MDAsIGEgZWNyaXQ6DQo+Pj4+IE9uIDE4LjA4LjIwMjYgMjM6NDIsIFNhbXVlbCBUaGliYXVs
dCB3cm90ZToNCj4+Pj4+IErDvHJnZW4gR3Jvw58sIGxlIG1hci4gMTggYW/Du3QgMjAyNiAw
Nzo0MzozNCArMDIwMCwgYSBlY3JpdDoNCj4+Pj4+PiBPbiAxNy4wOC4yNiAxODozNywgU2Ft
dWVsIFRoaWJhdWx0IHdyb3RlOg0KPj4+Pj4+PiBKdWVyZ2VuIEdyb3NzLCBsZSBsdW4uIDE3
IGFvw7t0IDIwMjYgMTA6MjQ6MDIgKzAyMDAsIGEgZWNyaXQ6DQo+Pj4+Pj4gV2hhdCBhYm91
dCBhZGRpbmcgYSBjb21tZW50IHRvIHRoZSBzdHViZG9tIE1ha2VmaWxlIGluIGEgc2VwYXJh
dGUgcGF0Y2gsIGxpa2U6DQo+Pj4+Pj4NCj4+Pj4+PiAjIHBjaXV0aWxzIHN1cHBvcnQgaGFz
IGJlZW4gcmVtb3ZlZCB3aXRoIGNvbW1pdCA8Y29tbWl0LWlkPiwgcmV2ZXJ0IHRoYXQgcGF0
Y2gNCj4+Pj4+PiAjIGluIGNhc2UgaXQgaXMgbmVlZGVkIGFnYWluLg0KPj4+Pj4+DQo+Pj4+
Pj4gSSB0aGluayB0aGlzIHdvdWxkIGJlIHByZWZlcmFibGUgb3ZlciB1bnVzZWQgYW5kIHBy
b2JhYmx5IGJpdC1yb3R0ZW4gY29kZSBpbg0KPj4+Pj4+IHRoZSByZXBvc2l0b3J5Lg0KPj4+
DQo+Pj4gV2UgY2FuIHBvaW50IHBlb3BsZSB0byBwY2l1dGlscyB0aHJvdWdoIHN1Y2ggYSBj
b21tZW50Lg0KPj4+DQo+Pj4gSsO8cmdlbiBHcm/DnywgbGUgbWVyLiAxOSBhb8O7dCAyMDI2
IDA5OjEyOjAwICswMjAwLCBhIGVjcml0Og0KPj4+PiBPbiAxOC4wOC4yNiAyMzo0MiwgU2Ft
dWVsIFRoaWJhdWx0IHdyb3RlOg0KPj4+Pj4gSSBkb24ndCBzZWUgd2h5IGl0IHdvdWxkIGJl
IGJpdC1yb3R0ZW4sIHNpbmNlIHRoZSBwY2l1dGlscyB2ZXJzaW9uIGluDQo+Pj4+PiB1c2Vk
IGlzIGZpeGVkLCBpdCdzIGEgbGlicmFyeSB0aGF0IGhhcyBhIHF1aXRlIHN0YWJsZSBBUEks
IGFuZCB0aGUgcGNpDQo+Pj4+PiB4ZW4gaW50ZXJmYWNlIGlzIHN1cHBvc2VkIHRvIGtlZXAg
YmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCj4+Pj4NCj4+Pj4gVGhlbiBJJ2QgcmF0aGVyIGFk
ZCBpdCB0byBNaW5pLU9TIChwcm9iYWJseSBiZWhpbmQgYW5vdGhlciBDT05GSUcgb3B0aW9u
KSB0aGFuDQo+Pj4+IGhhdmluZyBpdCBpbiB0aGUgWGVuIHRyZWUuDQo+Pj4NCj4+PiBNbW0s
IGJ1dCBob3c/IFdlIGRvbid0IHJlYWxseSB3YW50IHRvIHB1bGwgdGhlIHdob2xlIHBjaXV0
aWxzIGJ1aWxkIGludG8NCj4+PiBtaW5pLW9zIDopDQo+Pg0KPj4gVEJILCBJIGRvbid0IHNl
ZSB3aHkgdGhlIHdob2xlIE1pbmktT1Mgc3BlY2lmaWMgc3R1YmRvbSBtYXplIHNob3VsZCBi
ZSBpbiB0aGUNCj4+IFhlbiByZXBvc2l0b3J5Lg0KPiANCj4gSXQgdXNlZCB0byBiZSBhdCBs
ZWFzdCBiZWNhdXNlIFhlbiBpdHNlbGYgd2FzIHVzaW5nIHN0dWJkb20gZm9yIGlvZW11Lg0K
DQpJdCB1c2VkIHRvIGJlIHRoYXQgd2F5IGJlY2F1c2UgTWluaS1PUyB3YXMgaW5pdGlhbGx5
IGEgcGFydCBvZiB0aGUgWGVuDQpyZXBvc2l0b3J5Lg0KDQpUaGlzIGlzIG5vIGxvbmdlciB0
aGUgY2FzZS4NCg0KPiBOb3dhZGF5cyBzdHViZG9tLWlvZW11IGlzIGF3YXksIGJ1dCBzdHVi
ZG9tLyBzdGlsbCBidWlsZHMgeGVuc3RvcmUsDQo+IHNvIGl0IG1ha2VzIHNlbnNlIHRoYXQg
aXQncyB4ZW4gdGhhdCBidWlsZHMgaXQgYWxvbmcgYnVpbGRpbmcgdGhlDQo+IG5vbi1zdHVi
ZG9tIHZlcnNpb24uDQoNCkkgYWdyZWUgaXQgbWFrZXMgc2Vuc2UgdGhhdCB4ZW4gaXMgdHJp
Z2dlcmluZyB0aGUgYnVpbGQsIGxpa2UgaXQgaXMgZG9pbmcNCml0IGZvciBlLmcuIHFlbXUu
IFFlbXUgaXMgYSBnb29kIGV4YW1wbGUgaG93IGl0IHNob3VsZCBiZTogYSBjb25maWd1cmUg
Y2FsbA0KYW5kIHRoZW4gYSBtYWtlIGNhbGwsIGJvdGggdXNpbmcgdGhlIHFlbXUgYnVpbGQg
bWVjaGFuaXNtcy4NCg0KQnV0IGhhdmluZyB0aGUgbm9uLVhlbiBsaWJyYXJpZXMgcmVsYXRl
ZCB0byBNaW5pLU9TIGFuZCB0aGUgcmVsYXRlZCBwYXRjaGVzDQp0byBiZSBhYmxlIHRvIHVz
ZSB0aGVtIHdpdGggTWluaS1PUyBpbiB0aGUgWGVuIHRyZWUgaXMgbWFraW5nIHRoaW5ncyBt
dWNoDQpoYXJkZXIgdGhhbiB0aGV5IHNob3VsZCBiZS4NCg0KQnVpbGRpbmcgYSBYZW5zdG9y
ZSBzdHViZG9tIHNob3VsZCBqdXN0IHRyaWdnZXIgdGhlIE1pbmktT1MgYnVpbGQgd2l0aCBz
b21lDQpjb25maWd1cmF0aW9uIG9wdGlvbnMsIGluY2x1ZGluZyB0aGUgcG9pbnRpbmcgdG8g
dGhlIFhlbnN0b3JlIHNvdXJjZSBkaXJlY3RvcnkNCmFuZCBhIG1ha2UgdGFyZ2V0IGZvciB0
aGUgWGVuc3RvcmUgbWFrZSBpbnZvY2F0aW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------pyS0kHsSAoI1xImeFrSWoHlN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pyS0kHsSAoI1xImeFrSWoHlN--

--------------btL7pXQBiFTagmflgxX0ZSjE--

--------------xrhDtI5LTaLjWk0MmX4sWtQV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqyHlYFAwAAAAAACgkQsN6d1ii/Ey/4
AAf/VJ9kvF9fZ0ZLXhCk38AeojDuFe92yVFmI6iyTYqtU4FqWWo5Va3OvYpI0QesadQJmPutY2wq
pX4caCENFvXdO8dr3XWGc8XsPi6JxOresOwS/7UwkDtshZ8V2LKvQa7w5P8QDVMXdRqXaxLpI+a0
I5a2lPEAHb5lheIEAuue9kyPCE6MWQupuJMDKexGy/MAFCN71Q3MI7ILkBPLITD0Cq39/DqeUnIg
aguERjbTrsezc6DXHEyKauEBh1XzmeojX2s2N6OyTvajpTREvlVTiFaK8Qh9jSLpScjbkRx3FOKg
AjfpNNYAj7/g6FadfVBD21aWtN6xlWN6raZLCGGfxA==
=yXTL
-----END PGP SIGNATURE-----

--------------xrhDtI5LTaLjWk0MmX4sWtQV--

