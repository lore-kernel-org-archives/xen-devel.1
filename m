Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B2C56205
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 12:00:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384673.1627504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrwlt-0005Aq-To; Thu, 06 Aug 2026 12:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384673.1627504; Thu, 06 Aug 2026 12:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrwlt-0005Aj-QG; Thu, 06 Aug 2026 12:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1384673;
 Thu, 06 Aug 2026 12:00:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrwls-0005Ad-PD
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 12:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrwls-003fam-5W
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:00:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a747752-bab6-0a2a0a5309dd-0a2a45058f22-46
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 14:00:24 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a747757-4cb1-0a2a45050019-d155da2bcdd3-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 14:00:24 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c1677c91969so245824166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 05:00:24 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2036428e13sm239555266b.45.2026.08.06.05.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 05:00:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1786017623; x=1786622423; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Ybdpf8/wjx+iaseSxODwkj4wcj0Z9/yn9laCTF9dtE=;
        b=cj5KX/oBukMy+reKPdK2YcOGux12slEYV06ZLr5gXcd4qWEbH5XHSOJ+RHaraUZ6xa
         qLDvTnk/NxX3uI0BdfKg4zmIYvBBwOY5gsuAzwh2llAucrjepgS88SadimH5j+pGxJ/h
         aqwdKZp6ncQOYPiQiwxVWBRiwsMd40Xlw19WId+MQ/H6bWJ2z8GTIuE7So7p1Adb0qaU
         qWOZjg0t0W+zCh3Sz14aEk/pF/zlYMXcAmgHr3Nx+H1dzWgpsAbuvwrX/bW/xDrXxH+O
         96w1y2wsFyq6EF8w/qdBIu294QW2sIAVYelajTi+Y1A4i0AP5SaudzuUh3Ff9WxwwSzv
         1fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786017623; x=1786622423;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Ybdpf8/wjx+iaseSxODwkj4wcj0Z9/yn9laCTF9dtE=;
        b=qQ0xDOMZ1Wj8mgkPjeg9wHhgxe52ETbb20hMMLlWJVBTeJ7ohjTXtL6yfdqwgShOsd
         6siXbus+DfZSWMFJsmpTQoIK7oVitK1y1hZwATnN6LzXYdRfg6/ejd/h8dzM3JcWa1z9
         wKyURb6O8BTMSQ0VJNFL23I5zjeWWKVCBDswx0xVb6ONa1bbZ35sVOnAip7Kyfbzz9is
         kxSXSosQsMI/Rr5fbPnaOTXN8LwAFIlwn+rg/oZbs5yBYQA7fy15f9JyCD/dMZSqYqQr
         ITsrgwk+9f+yChtRQAmqpS2r6YvBybNV+TzA2f3O1foXjdfKPrj8d4l6+7Civo9Fj2VM
         YzCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7IAZ3WA3wTD8J6UUN8anNDhBXAM/vcR84mmyzadhiEqcABzenD7X6+9R784zE19VfuBtUKOq0aBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGzP4G5vbcq6zt2Yr9eWiw+tb2C8ebK+v/6pY1VPA5Ohq8S+aa
	MDSCLXsejJBEBcNkENat7uo2WetioYjWx/UzD5prPX4bsSmtetr/9hkJ3F06wGeFVOE=
X-Gm-Gg: AR+sD13fsOFDJvvpelzTbp8pKhyY7vvkyTYwLwEjTh89P3ItB6OuHSx3dRNztaJ4qYH
	luUxa6O6Bu7T2/z6m1iSwjItU74J8PMTuAiGlZ3puKIuAUmRGhavxfNyIokzAJLU/nlQSY+Tc5l
	6a6SLs3XjIuLbk0znvPeJPho0WeUu0fBFApV/ZsLAG5Nx4hW5jcpkmtfXI1BzoIXkSOpmbyAivr
	uY0DCnjsgwULwPiqTw/k/LkGoqqh1gX7mU1fwrmoT9CzlZtY/dY35DklzgBszgTkWB2a+WcWTkl
	535bS8UwUJLVF8jJ0SEtt7uYs9nwXJlqq9xfxZwpl3CXvoLMN9D2jz0ocf7E/R68LYRWMjWcL5P
	IsT03XEQCUlJpFgyT9AoAOPry/MCWCNUfHQo8ph55kvACwJfYSFFrJcdFSEJnTWkqYvAP/0TkPn
	vYQoaBZicv966llHa6WIYHyk8hSGuPOg7dditVbnND7zFK8vTB/bpZS42KPmkrbP36Cs38ZzyUD
	bn9Z2Kgoh7NyeKMZY+HqBKepISPcwrfNJ5BfMhP+ewaDFQYJRfUstUhDrhy8GNumwEt4zxavdX9
	wmu4yKgRBTHLeWDq7ie+CaaxKgY=
X-Received: by 2002:a17:906:9fc5:b0:c12:12b7:84de with SMTP id a640c23a62f3a-c2039c4a959mr598128466b.17.1786017623286;
        Thu, 06 Aug 2026 05:00:23 -0700 (PDT)
Message-ID: <967208c9-8d51-4380-8cb4-298f5c313d35@suse.com>
Date: Thu, 6 Aug 2026 14:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20260806015233.202486-1-jason.andryuk@amd.com>
 <083db883-558a-4000-b404-bf170c8309ee@suse.com>
 <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
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
In-Reply-To: <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uxNiNwuKyqiy8WT2Z6TKl64T"
X-purgate-ID: tlsNG-c201ff/1786017624-F6EB12A1-F0DA8FFD/0/0
X-purgate-type: clean
X-purgate-size: 10903

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uxNiNwuKyqiy8WT2Z6TKl64T
Content-Type: multipart/mixed; boundary="------------qkri4ZR0n1B8ZcmddgEmCyAY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <967208c9-8d51-4380-8cb4-298f5c313d35@suse.com>
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
References: <20260806015233.202486-1-jason.andryuk@amd.com>
 <083db883-558a-4000-b404-bf170c8309ee@suse.com>
 <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
In-Reply-To: <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
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

--------------qkri4ZR0n1B8ZcmddgEmCyAY
Content-Type: multipart/mixed; boundary="------------hcsGsDhH3CmWe1jsW0yEqvuR"

--------------hcsGsDhH3CmWe1jsW0yEqvuR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDguMjYgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wOC4yMDI2
IDEyOjU1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDYuMDguMjYgMDM6NTIsIEph
c29uIEFuZHJ5dWsgd3JvdGU6DQo+Pj4gQWxsb3cgZGlzYWJsaW5nIFhFTl9QVkhWTSBmb3Ig
YSBQVi1vbmx5LiAgQSBzdHViIGluIHRoZSBldmVudCBjaGFubmVsDQo+Pj4gY29kZSBuZWVk
cyB0byBiZSBmaXhlZCBmaXJzdC4NCj4+Pg0KPj4+IEphc29uIEFuZHJ5dWsgKDIpOg0KPj4+
ICAgICB4ZW4vZXZlbnRzOiBGaXggeGVuX3NldF91cGNhbGxfdmVjdG9yIHN0dWINCj4+PiAg
ICAgeGVuL0tjb25maWc6IHNlbGVjdCBYRU5fUFZIVk0NCj4+Pg0KPj4+ICAgIGFyY2gveDg2
L3hlbi9LY29uZmlnICAgICAgICAgICAgIHwgOCArKysrKy0tLQ0KPj4+ICAgIGRyaXZlcnMv
eGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIHwgMiArLQ0KPj4+ICAgIDIgZmlsZXMgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPj4gSSBkaWQg
YSBjb21wYXJpc29uIG9mIGEga2VybmVsIGJ1aWx0IHdpdGggeW91ciBwYXRjaGVzIGRpc2Fi
bGluZyBYRU5fUFZIVk0NCj4+IGFuZCBteSBwYXRjaGVzIHdpdGggWEVOX1BWSFZNX0dVRVNU
IGRpc2FibGVkLg0KPj4NCj4+IFRoZSBrZXJuZWwgYnVpbHQgd2l0aCBteSBwYXRjaGVzIGlz
IDYgYnl0ZXMgc21hbGxlciB0aGFuIHRoZSBvbmUgd2l0aCB5b3VyDQo+PiBwYXRjaGVzLg0K
PiANCj4gSXNuJ3QgdGhpcyBhIHNpZ24gb2Ygc29tZXRoaW5nIGVsc2UgbmVlZGluZyB0d2Vh
a2luZywgc29tZXdoZXJlPw0KDQpUaGlzIGlzIGEgc2lnbiB0aGF0IHRoZXJlIGFyZSBwcm9i
YWJseSBvbmx5IHZlcnkgZmV3IHJlYWxseSBIVk0gc3BlY2lmaWMgcGF0aHMNCihpbiB0aGUg
c2Vuc2Ugb2Y6IGV4cGxpY2l0bHkgbm90IG1hcmtlZCBhcyBpcnJlbGV2YW50IGZvciBQVikg
aW4gdGhlIGtlcm5lbC4NClllcywgSSdtIHN1cmUgeW91IGNhbiBmaW5kIHNvbWUgbW9yZSwg
YnV0IEknbSByZWFsbHkgbm90IHN1cmUgdGhpcyBpcyByZWxldmFudA0KZm9yIG1vcmUgdGhh
biBhIGhhbmRmdWwgb2YgdXNlcnMuDQoNCj4+IFNvIEkgZG9uJ3Qgc2VlIGFueSByZWFzb24g
dG8gdGFrZSB5b3VyIHBhdGNoZXMsIHdoaWNoIGNvbmZsaWN0IHdpdGggbWluZSwNCj4+IGVz
cGVjaWFsbHkgYXMgbXkgcGF0Y2hlcyBoYXZlIGEgbmVnYXRpdmUgZGlmZnN0YXQgb24gc291
cmNlIGxldmVsLCB0b28uDQo+IA0KPiBIbW0sIEphc29uJ3MgcGF0Y2hlcyBsb29rIHRvIG1v
dmUgdGhpbmdzIGludG8gYSBtb3JlIGFkZXF1YXRlIGRpcmVjdGlvbiwNCj4gdGhvdWdoLiBJ
biB3aGljaCBjYXNlIEkgdGhpbmsgYSBuZWdhdGl2ZSBkaWZmc3RhdCBiZWNvbWVzIGFuIGly
cmVsZXZhbnQNCj4gYXJndW1lbnQ/DQoNCkRlcGVuZHMgb24gd2hhdCB5b3UgYXJlIGxvb2tp
bmcgZm9yLg0KDQpNeSB0YWtlIGZyb20gdGhpcyBpcyB0aGF0IGEgUFYtb25seSBrZXJuZWwg
d2l0aCBKYXNvbidzIHBhdGNoZXMgaXMgbm90IHJlYWxseQ0KYWRkaW5nIGFueSB2YWx1ZSwg
d2hpbGUgbXkgc2ltcGxpZmljYXRpb24gaXMgYXQgbGVhc3QgbWFraW5nIHRoaW5ncyBzaW1w
bGVyDQppbiB0ZXJtcyBvZiBjb2RlIHZvbHVtZSBhbmQgbnVtYmVyIG9mIFhlbiByZWxhdGVk
IGNvbmZpZyBvcHRpb25zLg0KDQpPZiBjb3Vyc2UgaXQgd291bGQgYmUgcG9zc2libGUgdG8g
aGF2ZSBhIHNtYWxsZXIgUFYtb25seSBrZXJuZWwsIGJ1dCBhcyBJIHNhaWQNCmFscmVhZHks
IHRoZXJlIGhhcyBiZWVuIG5vIHB1YmxpYyBkZW1hbmQgZm9yIHRoYXQgaW4gdGhlIGxhc3Qg
eWVhcnMgYW5kIHRoZQ0KZG93bnNpZGVzIElNSE8gZmFyIG91dHdlaWdoIHRoZSBwb3RlbnRp
YWwgZ2Fpbi4NCg0KSU1PIHRoZSAiYWRlcXVhdGUgZGlyZWN0aW9uIiByZWdhcmRpbmcgWGVu
IHNwZWNpZmljIGtlcm5lbCBjb2RlIGlzIHRvd2FyZHMgUFZIDQphbmQgbm90IHRvd2FyZHMg
bW9yZSBQViBzcGVjaWZpYyB0d2Vha2luZy4gQW5kIEknbSB2ZXJ5IHN1cmUgdGhlIGtlcm5l
bA0KY29tbXVuaXR5IG91dHNpZGUgb2YgdGhlIFhlbiBjb21tdW5pdHkgaXMgYWdyZWVpbmcg
d2l0aCBtZSBoZXJlLg0KDQoNCkp1ZXJnZW4NCg==
--------------hcsGsDhH3CmWe1jsW0yEqvuR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hcsGsDhH3CmWe1jsW0yEqvuR--

--------------qkri4ZR0n1B8ZcmddgEmCyAY--

--------------uxNiNwuKyqiy8WT2Z6TKl64T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmp0d1YFAwAAAAAACgkQsN6d1ii/Ey/s
PQf/RmWSU8PmAFvgouFrYfNYILXmJGZhWhBd2gHdpMWHSOjgQFAmKhqIK42bjsNnyh1eF0crr+g7
m9O8qY+fd+fXcI6iwPa+RWDZHTGLxdYuI6TQX7OMsuaDRnTzHk+WacAwVfOSqvkDx0f2uagfxqef
sFhirnvS0wyiSKd9Qo3UGmFJGvKfiVdVYKfDb4y9TuOdxtM4E0BiFcyzYqWIWh+SHA3yoZXzwnAf
pyBpj/WERJZex8/+SEshJz1weNKMe7Z56P/12K2e4m83nndEF+qNOXRA89YAW5FCCb+Ri11VEJcm
AFCuNSIEYM1ZLI/qAx+nNLRZ8K75WKQrhe+gbd+/Ug==
=vN2B
-----END PGP SIGNATURE-----

--------------uxNiNwuKyqiy8WT2Z6TKl64T--

