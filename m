Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220C3C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 09:08:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427191.1649815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8a0X-0004fu-H7; Mon, 21 Sep 2026 09:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427191.1649815; Mon, 21 Sep 2026 09:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8a0X-0004fn-Dw; Mon, 21 Sep 2026 09:08:17 +0000
Received: by outflank-mailman (input) for mailman id 1427191;
 Mon, 21 Sep 2026 09:08:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x8a0V-0004fg-Df
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:08:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8a0U-006I6B-Av
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:08:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ab0f3fe-8faa-0a2a0a5109dd-0a2a4504eb1e-0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:08:14 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ab0f3fe-b57f-0a2a45040019-4a7de18c9b92-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:08:14 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso23208375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 02:08:14 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc52a5b6esm132645815e9.4.2026.09.21.02.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 02:08:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1789981694; x=1790586494; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RPErNZG8IlmwDWCzvPzHpBex+Z0N6oXDUtKvqtBA5Es=;
        b=brD4dn8umWhkp2+4GKcbQbroBScALdCWRf3Tqgdjc3kuOkEi+paW8jrMoYb+7/swKi
         Qor/+HsEp5xfrBUnx2BVnnD0Iv9xWIa9p0RKpE/fgcN1GeuYXd4szNwtDbQ1f4G7466S
         oo964XqCu63rbvgHbcW/ewTQX6sIdzyQMaP0hLCSVrLkSa8KSYj/ALx2gzcoyS1d4jBW
         gpWWsaXpFPv0ga4OYg0gbFg6+d0uOuTbcCRB+M9zc8PfuFThfMXSdaLLH/R31Il5Ngu2
         a3sJIKAY/rDwaKP1jtaw13jHESMNlI3CNNBktOJSr2B5Lcwj2qDdC/3iHnyAOg8gxrny
         uUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981694; x=1790586494;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPErNZG8IlmwDWCzvPzHpBex+Z0N6oXDUtKvqtBA5Es=;
        b=LlNXGSJoYKKnYGG1XBMJuujiJwGT82HuIdX1mdhCxnhxussRQ6X8Vxb+ZL6tDNEDop
         9/R58DSnQls5NC7EORNNBk5oKb4SuEEb1LT5ypWYA7x8qBjOxOFzr26qJextTcdMJrcf
         J54omSkFTeBkylnHDgrj7W2ewecohFWic9RciPHz/qYL+NyDRDZav65GZ5D899k1SuqG
         WA9tYmXT8Nfz0LISBe9svJfqDGiGEbdMF4FFw8aCBgd+xTs5AZnRCNHAUiiwuIsIi7my
         KTHMEcQxE9VfYaBn66OaVLLTwiClK9a2vMp8QHUaXy/lbQVSzQtZ8XE2ICzT0BPhBGMc
         Wpxw==
X-Forwarded-Encrypted: i=1; AKwUvBy/mkcgDWbGVa/zEJGl+zFUZm2U7l8Xu2utBZSI1wVPQoZNI2bAw9lhQnkEoSRMHVyv/5zupIQ8AdY=@lists.xenproject.org
X-Gm-Message-State: AFuF++k1ps3aMs89dqC2O7EPIzPMt2RnqHmB89WqLDQzZpEE4Oav/Tnn
	4A3feFjdtBMAp2qj7mDqSCDmACs8tIvBRneTVNUGEQskdCjWQQw9UDrIsOej8+WoUQ4=
X-Gm-Gg: AYBFou0ppLLtSbKQr8vhoNn3GIxGkyNxiNzNxzjp8guHqOcdYh4JYsSSyHMOg5IswwW
	ilfNS9frwGZ3VgjjNIyeqdcmc42hD/3LCq3oN0KxVKDP0D6ULTHZFt202MKpDeQN1C77YWulR7N
	9cyvI+Gu1a7R0vuYLW2Os9QPK1njKdUiraz2Fzk1P5FzXc4G1Br6k6T0vS+Ly/lAHkloZz2eH86
	myoVXoJhY1KGQbnJEwY5e9QtNkvKQwghyLFTuRxAxA/msa8QqglLpOGXEm7G5Cgyg6eDF0IZWXY
	YofrZZxZIxorKau3/zdfPdMQ+oAZGyh4rT86FwZ42PHgmqo3Vb0oVJgQ2bD0DBO3S3/jZl/684x
	qhyV2SLpo6EDjTRmH7r/sEkgU+Hz2apcBCGHHZAkzV5jIHArMFvRkTa17i9lrJ8jbvireQ2PC2/
	VHyP2AMupnMgE2+nPizuddwDdQxn+apZOBDRx7ZECNJXF2J4mvuCi2TEFrrmIPa3shcwtRxIz5I
	2XYpyuBALGE48xqG8qNDUvQ/TS+5xm93HP3j0sYgV+0Mn6E1p2AY6ZabYW+NxqTWmNsg5ZcTwes
	toQrx+g8xU+G7m3Yk6cBodKz
X-Received: by 2002:a05:600c:83cd:b0:49c:c0d4:53d9 with SMTP id 5b1f17b1804b1-49fc56f7a11mr118173935e9.14.1789981693611;
        Mon, 21 Sep 2026 02:08:13 -0700 (PDT)
Message-ID: <f464b3ac-87a0-4c28-a588-511e44356516@suse.com>
Date: Mon, 21 Sep 2026 11:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] stubdom: remove build of zlib
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260917075351.37208-1-jgross@suse.com>
 <20260917075351.37208-3-jgross@suse.com>
 <6f9965b4-4d06-46a2-ae18-8014b1a1c4cf@suse.com>
 <d69cbb72-e46f-488c-bd35-109d8707731c@suse.com>
 <09190c27-fd5f-4f7b-9d2b-be03785c7bbc@suse.com>
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
In-Reply-To: <09190c27-fd5f-4f7b-9d2b-be03785c7bbc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M4vCLbVHTSP0rWrWxCBAgdet"
X-purgate-ID: tlsNG-ebf023/1789981694-C22D4B50-F0CEE8BA/35/110847
X-purgate-type: clean
X-purgate-size: 9804

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M4vCLbVHTSP0rWrWxCBAgdet
Content-Type: multipart/mixed; boundary="------------GC7n4NqRYBzRgc080pet7zK7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
Message-ID: <f464b3ac-87a0-4c28-a588-511e44356516@suse.com>
Subject: Re: [PATCH v2 2/4] stubdom: remove build of zlib
References: <20260917075351.37208-1-jgross@suse.com>
 <20260917075351.37208-3-jgross@suse.com>
 <6f9965b4-4d06-46a2-ae18-8014b1a1c4cf@suse.com>
 <d69cbb72-e46f-488c-bd35-109d8707731c@suse.com>
 <09190c27-fd5f-4f7b-9d2b-be03785c7bbc@suse.com>
In-Reply-To: <09190c27-fd5f-4f7b-9d2b-be03785c7bbc@suse.com>
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

--------------GC7n4NqRYBzRgc080pet7zK7
Content-Type: multipart/mixed; boundary="------------UThrPfXKhZV9NJ90dVF0zQAB"

--------------UThrPfXKhZV9NJ90dVF0zQAB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDkuMjYgMTA6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wOS4yMDI2
IDE0OjMxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMDkuMjYgMTI6NTEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE3LjA5LjIwMjYgMDk6NTMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IFRoZSBsYXN0IHVzZXJzIG9mIHpsaWIgZm9yIHN0dWJkb21zIGhh
dmUgYmVlbiByZW1vdmVkLg0KPj4+DQo+Pj4gTG9va2luZyBhdCBwYXRjaCAxLCBJIGNhbid0
IHJlYWxseSBjb25jbHVkZSB3aGV0aGVyIHRoYXQncyB3aGVyZSB0aGUgbGFzdA0KPj4+IHVz
ZXIgZGlzYXBwZWFyZWQgKG5vIG9jY3VycmVuY2Ugb2YgInpsaWIiIGluIHRoYXQgcGF0Y2gp
LCBvciB3aGV0aGVyIHRoaXMNCj4+PiBwYXRjaCByZWFsbHkgY291bGQgZ28gaW4gcmlnaHQg
YXdheS4gUGxlYXNlIGNsYXJpZnkuDQo+Pg0KPj4gSXQgY2FuIGdvIGluIHJpZ2h0IGF3YXku
IFRoZSBsYXN0IHVzZXIgZGlzYXBwZWFyZWQgd2l0aCBjb21taXQNCj4+IDZhOTRlYWEyYmYz
ZmEwNmIwNWVkMmRhZDNkZDkxMTYwNjAyMzUzMjYuDQo+IA0KPiBBcHBhcmVudGx5IG5vdDoN
Cj4gDQo+IG5hbWVzLmM6MTg6MTA6IGZhdGFsIGVycm9yOiB6bGliLmg6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkNCj4gICAjaW5jbHVkZSA8emxpYi5oPg0KPiAgICAgICAgICAgIF5+
fn5+fn5+DQo+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQo+IDxidWlsdGluPjogcmVjaXBl
IGZvciB0YXJnZXQgJ25hbWVzLm8nIGZhaWxlZA0KPiBtYWtlWzNdOiAqKiogW25hbWVzLm9d
IEVycm9yIDENCj4gbWFrZVszXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4u
Li4NCj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy9idWlsZHMveGVuLXByb2plY3Qv
aGFyZHdhcmUveGVuLXN0YWdpbmcvc3R1YmRvbS9wY2l1dGlscy14ODZfNjQvbGliJw0KPiBN
YWtlZmlsZTozNzogcmVjaXBlIGZvciB0YXJnZXQgJ2xpYi9saWJwY2kuYScgZmFpbGVkDQo+
IG1ha2VbMl06ICoqKiBbbGliL2xpYnBjaS5hXSBFcnJvciAyDQo+IG1ha2VbMl06IExlYXZp
bmcgZGlyZWN0b3J5ICcvYnVpbGRzL3hlbi1wcm9qZWN0L2hhcmR3YXJlL3hlbi1zdGFnaW5n
L3N0dWJkb20vcGNpdXRpbHMteDg2XzY0Jw0KPiANCj4gSmFuDQoNCk9oLCB0aGVuIHlvdSBj
YW4ganVzdCBpZ25vcmUgVjIgb2YgdGhlIHNlcmllcywgSSBndWVzcy4NCg0KSSdsbCBzZW5k
IFYzIHVzaW5nIHRoZSBvcmlnaW5hbCBwYXRjaCBzZXF1ZW5jZS4NCg0KU2FtdWVsLCBjYW4g
eW91IHBsZWFzZSBjbGFyaWZ5IHdoYXQgeW91IGV4YWN0bHkgbWVhbnQgd2l0aDoNCg0KICAg
V2UgY2FuIHBvaW50IHBlb3BsZSB0byBwY2l1dGlscyB0aHJvdWdoIHN1Y2ggYSBjb21tZW50
Lg0KDQpEbyB5b3UgbWVhbiBwb2ludGluZyBhdCB0aGUgdXBzdHJlYW0gcGNpdXRpbHMsIG9y
IHRoZSBzdHViZG9tIG9uZSB1c2luZyB0aGUNCmNvbW1pdC1pZCBvZiB0aGUgcmVtb3ZhbCBw
YXRjaD8NCg0KDQpKdWVyZ2VuDQo=
--------------UThrPfXKhZV9NJ90dVF0zQAB
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------UThrPfXKhZV9NJ90dVF0zQAB--

--------------GC7n4NqRYBzRgc080pet7zK7--

--------------M4vCLbVHTSP0rWrWxCBAgdet
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqw8/wFAwAAAAAACgkQsN6d1ii/Ey83
NQf/RumQfNCKYWOutorUtC5QN/r/h1AyAK0tXKBWcxuQyXvKMF0O3ihdxUbkjd0YBlB+B4Tam7uE
lg5taWvKwHUEbT/BaIU1EPyka1ouMDnEHb6yRgAHBgqI/cC+RdxEuPbt1X9eOOdg43vCp8JUB/rM
GauoYGk2q5IBF+jPANEqPFRn7NZgyzPw47tZhR0/urk5w/qoGijV1KiqtmhHmgaIuYa28pGClUPG
aQRtnCoTrgilZb/Saqq1C/BDSxfuXkZd9iO0jAyinCDS4h21VO5vxnWzBhgOS+IgHTEhcV065CyO
ub7Cg1tEjSfSR0dQmyuQpiIrrlZN3fmsyn8sRQGl4g==
=X1Ai
-----END PGP SIGNATURE-----

--------------M4vCLbVHTSP0rWrWxCBAgdet--

