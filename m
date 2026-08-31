Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7870C624A4
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 13:00:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404046.1637987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11bz-0001uv-9C; Mon, 31 Aug 2026 12:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404046.1637987; Mon, 31 Aug 2026 12:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x11bz-0001uo-5u; Mon, 31 Aug 2026 12:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1404046;
 Mon, 31 Aug 2026 12:59:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x11bx-0001ue-Oq
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:59:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x11bw-002rZq-PQ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 14:59:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a957abc-8faa-0a2a0a5109dd-0a2a450adc44-0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:59:40 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a957abc-f2d2-0a2a450a0019-d155d02aa5b7-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 14:59:40 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6a5ebf75d62so5666754a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 05:59:40 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a611b675d1sm3735822a12.9.2026.08.31.05.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 05:59:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1788181180; x=1788785980; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rmbwc7pbIyZmSLHU25g8L0LQHx9DUCsFZZGV1gqiF8o=;
        b=OGW5AbL0bDBF2lefDinjsITaOuPJgoeK/wiPzL5S5/24dm1/5SVUCCWIGTuQg8wZUt
         HjMqLuGdkOPZoN+S1HQu/Py1AWDBbdaW54xuzRrc9Jv9dx466nGCaL0uvKr5WOReEt3o
         sdR10gTmZ9K/Au//8RrvJJN8yPAxQVrxYuxju7tioz0A8o/R5wnU5aNeJ3dJyE/MNYna
         eIbIJTddSJO0ArtIy95nHXi5stiD9yGQ65YWlKU5Kstx2GHu5QiE4vYW6ZrpTlMNHK/Q
         TUPTuM77xjdSh2jTE/2Ozq9H+TytLPJkhTvNO9bsV2gK7/17388XP5rpEx19IL6N0XBt
         XLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181180; x=1788785980;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmbwc7pbIyZmSLHU25g8L0LQHx9DUCsFZZGV1gqiF8o=;
        b=lCOHzB7m/B64xeTZ9ajc+Oo9fu6orCKPbfHCn/9yhWP8pqh4zIGbBuo4JRtYvXxrzQ
         0p9tzVVRGx7kUghONVW7/uaoDhBnyZAINKo0WiutSSPMQRsMLLhBeCa0G6oAIojTw5cm
         Wf3UNiERDvRlOTLob3B96cccb5gxLptMO0q3sUK0exJjyzJWyDUD6jzg2wht/Vn5Z6Cl
         IoeMaUK151gybmCkJ0SANNGKBoikIyDcJ4f2K/wdFS1Sb610q0dpH+Gj/PmC+KhlYDjz
         3li3GjIlMpamuSfHdJ79O5Qpwd+gq1jvSPOX/htjRETb5y2Arpum0Ve6gk5ZvN0Yima+
         75FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA5/E/grWOhoilfEKoKDrwBtnD2LarDyaoCFKIZjnOuFTHqKLmgQwfWyPAnM/XyCZ+wVbyX7nsetA=@lists.xenproject.org
X-Gm-Message-State: AFuF++khMpnxykNQSAy3KqeN7DjWeuMhvxxoSMFTDpgggnGvaA967ggp
	yiHQW2M7RqBAzKL54E3Wgshg/vRsl1xEwl7hvMkrk1EFVAOqkfw3bBqZvYYoMPCD8DE=
X-Gm-Gg: AYBFou3hTC5EXEDK1ebRtv1i7XKkNH3IlzdYLk+5dbhs0WPMsCtSUkzqSvGej5SY+9V
	vDK8BcAjDPHJqym+cAH5s5N6l0ssz9kIejgX0HYqd2eXxGhMaElx6tT10tFUyz39TCReyDo7xLu
	H4LDJTH7vZCtVqkaxLmoUw9R+jBR3hba9Av98uB7+cQjzLm/k+4k/O8TaJcL16ybvhWAKO/Ah6w
	gksvAXteDYZERgK+N+ia2Cp5ntZ00jiGN54LKAf/gbGbAF0jHtFHV1Zr2cgDhVQ+kG+nYtRgQh9
	d0hc5njFAahgFr1R1kPzfk0FpD3vBsTb45uogbsRVcrsgMTC/AN0FcVQwUF/1FNaNgurJ25LRAH
	h5VUa/U70X4cACQHnja6viYe+ltgUSZiqruzQnTok1ahn1Oeou2dyHy1hVETfI4R4TXTY/Jfi1G
	nB5k56Tr37X6yun34IyMIURmw3w1A2FcIcb4vuJ5WOTo73GwLxcI8Zgf72NeCJCUXvWr+3GyKVi
	d+5KoZIYMgX9EgfEwjl0+v8aOY9CKX6YsdzS8mAx0feJDI0bhwWZyXO+d7bdh7UFlruHGdyupbo
	VSojdQbUpYm9uQ==
X-Received: by 2002:aa7:d7ce:0:b0:6a5:d284:1134 with SMTP id 4fb4d7f45d1cf-6a6476996b7mr3283736a12.2.1788181180092;
        Mon, 31 Aug 2026 05:59:40 -0700 (PDT)
Message-ID: <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
Date: Mon, 31 Aug 2026 14:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org,
 roger@xenproject.org, anthony.perard@vates.tech, julien@xen.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
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
In-Reply-To: <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hH0nFQZmGGVK10bZd6Gxav8h"
X-purgate-ID: tlsNG-4011c0/1788181180-508CDCFC-867E2FBD/0/0
X-purgate-type: clean
X-purgate-size: 11188

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hH0nFQZmGGVK10bZd6Gxav8h
Content-Type: multipart/mixed; boundary="------------WmhsvkZAmVDqlQG7zk2Ptfaz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org,
 roger@xenproject.org, anthony.perard@vates.tech, julien@xen.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech
Message-ID: <4a71e08b-b3c6-4f14-a4ae-cc0506659ae9@suse.com>
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
 <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
In-Reply-To: <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
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

--------------WmhsvkZAmVDqlQG7zk2Ptfaz
Content-Type: multipart/mixed; boundary="------------z004N67swzAtFwgqQfqxsmPV"

--------------z004N67swzAtFwgqQfqxsmPV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDguMjYgMTE6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDMxLzA4LzIw
MjYgNjoxNiBhbSwgRnVya2FuIENhbGlza2FuIHdyb3RlOg0KPj4gRXZlcnkgdmNwdV9jcmVh
dGUoKSBjYWxsIHNpdGUgdGhhdCBidWlsZHMgbW9yZSB0aGFuIG9uZSB2Y3B1IGxvb3BzDQo+
PiBvdmVyIGlkcyB1cCB0byBkLT5tYXhfdmNwdXMgYW5kIHN0b3BzIG9uIHRoZSBmaXJzdCBm
YWlsdXJlLCBidXQgbm9uZQ0KPj4gb2YgdGhlbSByb2xsIG1heF92Y3B1cyBiYWNrIHRvIG1h
dGNoLiBUaGlzIGxlYXZlcyBkLT52Y3B1W2ldID09IE5VTEwNCj4+IGZvciBpZHMgYmVsb3cg
bWF4X3ZjcHVzDQo+IA0KPiBBcyBJIHRvbGQgeW91IGJlZm9yZSwgeW91IG11c3QgY29wZSB3
aXRoIHRoaXMgcHJvcGVydHkgaW4gbm9uLWVycm9yDQo+IHNjZW5hcmlvcy4NCj4gDQo+PiAs
IHdoaWNoIGFueXRoaW5nIHdhbGtpbmcgZC0+dmNwdVtdIGNhbiB0aGVuDQo+PiBkZXJlZmVy
ZW5jZS4gVGhpcyBpcyB3aGF0IGNhdXNlZCB0aGUgY3Jhc2g6IHNjaGVkX21vdmVfZG9tYWlu
KCkNCj4+IHdhbGtzIGV2ZXJ5IHZjcHUgc2xvdCB1cCB0byBtYXhfdmNwdXMgd2l0aG91dCBj
aGVja2luZyBmb3IgZW1wdHkNCj4+IG9uZXMsIHNvIHdoZW4gYSBkb21haW4gYnVpbHQgaW4g
YSBub24tZGVmYXVsdCBjcHVwb29sIGhhZCB2Y3B1DQo+PiBjcmVhdGlvbiBmYWlsIHBhcnR3
YXkgdGhyb3VnaCwgZG9tYWluX2tpbGwoKSBsYXRlciBtb3ZpbmcgaXQgYmFjaw0KPj4gdG8g
dGhlIGRlZmF1bHQgY3B1cG9vbCBoYW5kZWQgb25lIG9mIGl0cyBlbXB0eSBzbG90cyBzdHJh
aWdodCB0bw0KPj4gdGhlIG5ldyBjcHVwb29sJ3Mgc2NoZWR1bGVyLCBjYXVzaW5nIGEgTlVM
TC1wb2ludGVyIGRlcmVmZXJlbmNlDQo+PiBpbnNpZGUgc2NoZWRfYWxsb2NfdWRhdGEoKS4N
Cj4+DQo+PiBBZGQgdmNwdXNfY3JlYXRlKGQpOiBjcmVhdGVzIGV2ZXJ5IHZjcHUgb2YgZCB1
cCB0byBtYXhfdmNwdXMgYW5kDQo+PiByb2xscyBtYXhfdmNwdXMgYmFjayB0byB0aGUgZmFp
bGVkIGlkIG9uIGVycm9yLiBUaGlzIGtlZXBzDQo+PiBkLT52Y3B1W2ldIGlzIG5vbi1OVUxM
IGZvciBhbGwgaSA8IGQtPm1heF92Y3B1cw0KPiANCj4gTm8sIGl0IHJlYWxseSBkb2Vzbid0
Lg0KPiANCj4+ICwgaW5zdGVhZCBvZiBndWFyZGluZw0KPj4gZXZlcnkgcmVhZGVyIG9mIGQt
PnZjcHVbXSBhZ2FpbnMgaG9sZXMgaW5kaXZpZHVhbGx5Lg0KPj4NCj4+IENvbnZlcnQgZXZl
cnkgc2l0ZSB0aGF0IGJ1aWxkcyB2Y3B1cyBpbiBhIGxvb3AgdG8gY2FsbCB0aGlzIGZ1bmN0
aW9uDQo+PiBpbnN0ZWFkLg0KPj4NCj4+IEZpeGVzOiA2MTY0OTcwOTQyMWEgKCJ4ZW4vZG9t
YWluOiBBbGxvY2F0ZSBkLT52Y3B1W10gaW4gZG9tYWluX2NyZWF0ZSgpIikNCj4+IFN1Z2dl
c3RlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogRnVya2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwuY29tPg0KPiANCj4g
Rm9yIHRoZSBhdm9pZGFuY2Ugb2YgYSBsb25nIGRyYXduLW91dCBhcmd1bWVudCwgbmFjay7C
oCBVbmRlciBubw0KPiBjaXJjdW1zdGFuY2VzIGFyZSB5b3UgZWRpdGluZyBkLT5tYXhfY3B1
cyBhZnRlciBpdCdzIHB1dCBpbnRvIHRoZSBkb21haW4NCj4gbGlzdC4NCj4gDQo+IFlvdSd2
ZSBjaG9zZW4gdG8gZG8gc28gYXQgYSBwb2ludCB3aGVyZSB0aGUgZG9tYWluIG9iamVjdCBp
cyBsaXZlLA0KPiB2aXNpYmxlIGluIHRoZSBzeXN0ZW0gYW5kIGFibGUgdG8gYmUgdGhlIHRh
cmdldCBvZiBvdGhlciBoeXBlcmNhbGxzLg0KPiANCj4gRnVydGhlcm1vcmUgeW91IGhhdmUg
bm90IGZpeGVkIHdoYXQgeW91ciBjb21taXQgbWVzc2FnZSBjbGFpbXMuDQo+IGQtPnZjcHVb
Li4uXSBpcyBzdGlsbCBOVUxMIGZvciBhbiBhcmJpdHJhcnkgcGVyaW9kIG9mIHRpbWUsIGlu
Y2x1ZGluZw0KPiBiZWluZyBhYmxlIHRvIGJlIHRoZSB0YXJnZXQgb2YgaHlwZXJjYWxscywg
YmVmb3JlIHZDUFVzIGFyZSBjcmVhdGVkLg0KPiANCj4gQWxsIGNvZGUgTVVTVCBiZSBhYmxl
IHRvIGNvcGUgd2l0aCBkLT52Y3B1Wy4uLl0gYmVpbmcgTlVMTC7CoCBJdCdzIGhvdw0KPiB0
aGUgb2JqZWN0IGxpZmVjeWNsZXMgbXVzdCB3b3JrLCBiZWNhdXNlIGNyZWF0aW5nIHZDUFVz
IGlzIG5vdCBhdG9taWMNCj4gd2l0aCByZXNwZWN0IHRvIGNyZWF0aW5nIGRvbWFpbnMuDQoN
CldvdWxkIHlvdSBiZSBmaW5lIHdpdGggbWUgY3JlYXRpbmcgYSBwYXRjaCBzZXJpZXMgbW92
aW5nIHZjcHUgY3JlYXRpb24gaW50bw0KZG9tYWluX2NyZWF0ZSgpPw0KDQpUaGlzIHdvdWxk
IGF0IG9uY2Ugc29sdmUgYWxsIHRob3NlIHByb2JsZW1zLCB3aGlsZSBldmVuIHJlbW92aW5n
IHRoZSBuZWVkIGZvcg0KaGF2aW5nIHRoZSBYRU5fRE9NQ1RMX21heF92Y3B1cyBkb21jdGwu
DQoNCg0KSnVlcmdlbg0K
--------------z004N67swzAtFwgqQfqxsmPV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------z004N67swzAtFwgqQfqxsmPV--

--------------WmhsvkZAmVDqlQG7zk2Ptfaz--

--------------hH0nFQZmGGVK10bZd6Gxav8h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqVersFAwAAAAAACgkQsN6d1ii/Ey8w
QggAmUK9waKIAAMunEV3tcEBNrbx7TVOgUtkMVPBXeZTPo6XyJL+62iBtGfhJBJxgaFZd8yrIVRx
X6F5Xn+6XGtsZtP9S8NS0j6ku34ppso1p+mGaQTRobYVRwfHYSd81b4oTTEC2oNCErFP7n+jxK5s
m/nML0m/6GqiYQi325kseRzvQ0Gj4eQGTK9XuXgcHEJOHZDN+hJ/ZU+CDtN4hJ/aDY7hWRpU97tA
yjSJPoS1guKV0LCTg26BRrrex/KX1MChWF3nBl1NddtaEXSeLOWM9rfHDaufVEb29/UrxHJZU5Pk
oCTluNP8wCJxhH2OCfqN0BwaV6/8tbilA8jQuYXWKQ==
=SqJp
-----END PGP SIGNATURE-----

--------------hH0nFQZmGGVK10bZd6Gxav8h--

