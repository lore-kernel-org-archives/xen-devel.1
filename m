Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1FEC61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 08:13:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403802.1637761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0x8z-0006tS-UQ; Mon, 31 Aug 2026 08:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403802.1637761; Mon, 31 Aug 2026 08:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0x8z-0006tL-Rh; Mon, 31 Aug 2026 08:13:29 +0000
Received: by outflank-mailman (input) for mailman id 1403802;
 Mon, 31 Aug 2026 08:13:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x0x8y-0006tF-Oc
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 08:13:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0x8w-008zmE-T8
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 10:13:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a953780-e002-0a2a0a5209dd-0a2a450cd370-46
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:13:26 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a9537a1-f479-0a2a450c0019-d155da31c9a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 10:13:21 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c2020421077so473355766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 01:13:21 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c255f1b2917sm393150766b.30.2026.08.31.01.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 01:13:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1788164001; x=1788768801; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0+SeBKhG3TJqxssUaee07ETrfab+C+rs+vTSL4kGhq4=;
        b=OhEpaFzEFsxSY2DeHzYAUmTgALb+kqFg40EHGWM9A9rlpEGHMK0sAuP7PM6IEsGH/F
         HnxtkhSOQcZYMvsluLoGWm8D25vBVYMsPa1UhnL7i+VjJ7sx7NoFuDGJFq1yklWhSAJV
         tyyKco3BHPWBUJ7U/MWdTZUCeubsu3ylXyUNdaBZm0Y9fsOJ99oyNwXJZ6Lbr1LCsGGj
         m9n/b8N/GV1rKeHrVMhJA+rTTUJhWKiQTKXyiFEDwo0dmxM+qM9eWcEunFkDempncvRK
         e2Jk7kwOwPwMn6PoVEbj2jVI1JluolUlsSojvAVmZu+DQqCgUKuROOFmtit7lrpMGoaY
         dwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164001; x=1788768801;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+SeBKhG3TJqxssUaee07ETrfab+C+rs+vTSL4kGhq4=;
        b=bNs+QTADtZjJv7gfzSzMLHgfSd82wkCM5b3BELxgZZa3CQIKQcRA0FourjgOcNAPII
         WkW+LL7OpFb7z4w/2mqKPsKBtfSK2O9zTjbOTSHHcNIBUkOCTH0dCPjptq9Zp8oVNCR+
         K3FSGi+uskGXMO5WR1hGSr1n528asZUfHEwfEzob+FNCn1RWIKmi8vbCops+fNK7u9B8
         Th+setUowBN5h16KfgoVgmSZyb50nFBHvDSALYuEHBk3AawAykBuTor3v26ClEi9PvWs
         Lxu12hDQdpi1ETI5Ljn3df+EpTVzuMqg3tnscX0JZk7rWp827mEbvLmWaR6vrUknjcLQ
         oJ3g==
X-Forwarded-Encrypted: i=1; AHgh+RqZtoQIEFp4ctRVviHnRL7xffVGT7OqMMACTl/vJgdpDNaFKXXuaRr8NyxlOJ7RFbLXQmirgAjybB8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kFU/BlRvBhQB3mceC6wwCkFoynrNotYxko548CCCBLTst6un8F
	QI19UGMMSAoC8ByFwnsKL22jhTQ0Q/8f6Mj8lrnkgIyBHFC3J9Yg9xskIa0V+0SNrKk=
X-Gm-Gg: AR+sD13vuwvjQ8MpXpaFqR3v4A8yVgNT0CR1bNCILJJxxUjwlwocoeNKesnsN3M1SmF
	eehncPC72JZw5NsK9DSnx/NtRHew6MOpckM4EuDgOkUfRexQ2h8NF+odrRSxilYYnfNvNyjuVwr
	Tnd0jzeIDBoEWBP2r9XlkHuA6NaqQ6izlsZkv0sy9rySUjBH7YQKM7eFM1yn2pEOjbwcChDFRmk
	TxCulc4XgUMXd8kICTdlqLKz7yb0tSdK/ho2B8gOyhzUF5KhaPUB/V41JemzI4V/9F6qyGJP0is
	HtD8OYGvYTZcwoSHLupAWR8zdFpIfA4Fu3ss5HxWlpmnItp7XaZ/WvgYWjSHZnBoPSRHjTiTYK2
	bhL2FZCKeWnSmzQLWrG3xct1k5sF2m88lq2Bo4RMwkRZVD5roCSgRML83+DVO64qjyBA4XudOPX
	5xw5Fvi18NC2OLtsuFmtOve5F6qNatd/yE+FSW0gjrH+l22t/SXbe+xFshOy2aPM2V8O7zCufcW
	bdnFAXlnobLs1De06tmamyVtJwx12SGlMlXqaHHGx44GeF9vOpwsMDYcLc1KuVJ8Gat6URgUsbA
	VUlTxouCFYY2rQ==
X-Received: by 2002:a17:907:c48c:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c2557165b0emr1455118566b.11.1788164001071;
        Mon, 31 Aug 2026 01:13:21 -0700 (PDT)
Message-ID: <33c1d613-054e-4940-a14d-9e47e673286b@suse.com>
Date: Mon, 31 Aug 2026 10:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, roger@xenproject.org, anthony.perard@vates.tech,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260831051637.5029-2-frn1furkan10@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uaE5xMQWO0Hf6fnqZ8tv8RRJ"
X-purgate-ID: tlsNG-d25034/1788164006-51B35A5B-84BF1DAC/0/0
X-purgate-type: clean
X-purgate-size: 14733

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uaE5xMQWO0Hf6fnqZ8tv8RRJ
Content-Type: multipart/mixed; boundary="------------Cb3stSVCUVxYNMwVt50x0yGh";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, dfaggioli@suse.com,
 gwd@xenproject.org, roger@xenproject.org, anthony.perard@vates.tech,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech
Message-ID: <33c1d613-054e-4940-a14d-9e47e673286b@suse.com>
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
In-Reply-To: <20260831051637.5029-2-frn1furkan10@gmail.com>
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

--------------Cb3stSVCUVxYNMwVt50x0yGh
Content-Type: multipart/mixed; boundary="------------NIXbEHS5jN10LtGkWyyMVSCu"

--------------NIXbEHS5jN10LtGkWyyMVSCu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDguMjYgMDc6MTYsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4gRXZlcnkgdmNw
dV9jcmVhdGUoKSBjYWxsIHNpdGUgdGhhdCBidWlsZHMgbW9yZSB0aGFuIG9uZSB2Y3B1IGxv
b3BzDQo+IG92ZXIgaWRzIHVwIHRvIGQtPm1heF92Y3B1cyBhbmQgc3RvcHMgb24gdGhlIGZp
cnN0IGZhaWx1cmUsIGJ1dCBub25lDQo+IG9mIHRoZW0gcm9sbCBtYXhfdmNwdXMgYmFjayB0
byBtYXRjaC4gVGhpcyBsZWF2ZXMgZC0+dmNwdVtpXSA9PSBOVUxMDQo+IGZvciBpZHMgYmVs
b3cgbWF4X3ZjcHVzLCB3aGljaCBhbnl0aGluZyB3YWxraW5nIGQtPnZjcHVbXSBjYW4gdGhl
bg0KPiBkZXJlZmVyZW5jZS4gVGhpcyBpcyB3aGF0IGNhdXNlZCB0aGUgY3Jhc2g6IHNjaGVk
X21vdmVfZG9tYWluKCkNCj4gd2Fsa3MgZXZlcnkgdmNwdSBzbG90IHVwIHRvIG1heF92Y3B1
cyB3aXRob3V0IGNoZWNraW5nIGZvciBlbXB0eQ0KPiBvbmVzLCBzbyB3aGVuIGEgZG9tYWlu
IGJ1aWx0IGluIGEgbm9uLWRlZmF1bHQgY3B1cG9vbCBoYWQgdmNwdQ0KPiBjcmVhdGlvbiBm
YWlsIHBhcnR3YXkgdGhyb3VnaCwgZG9tYWluX2tpbGwoKSBsYXRlciBtb3ZpbmcgaXQgYmFj
aw0KPiB0byB0aGUgZGVmYXVsdCBjcHVwb29sIGhhbmRlZCBvbmUgb2YgaXRzIGVtcHR5IHNs
b3RzIHN0cmFpZ2h0IHRvDQo+IHRoZSBuZXcgY3B1cG9vbCdzIHNjaGVkdWxlciwgY2F1c2lu
ZyBhIE5VTEwtcG9pbnRlciBkZXJlZmVyZW5jZQ0KPiBpbnNpZGUgc2NoZWRfYWxsb2NfdWRh
dGEoKS4NCj4gDQo+IEFkZCB2Y3B1c19jcmVhdGUoZCk6IGNyZWF0ZXMgZXZlcnkgdmNwdSBv
ZiBkIHVwIHRvIG1heF92Y3B1cyBhbmQNCj4gcm9sbHMgbWF4X3ZjcHVzIGJhY2sgdG8gdGhl
IGZhaWxlZCBpZCBvbiBlcnJvci4gVGhpcyBrZWVwcw0KPiBkLT52Y3B1W2ldIGlzIG5vbi1O
VUxMIGZvciBhbGwgaSA8IGQtPm1heF92Y3B1cywgaW5zdGVhZCBvZiBndWFyZGluZw0KPiBl
dmVyeSByZWFkZXIgb2YgZC0+dmNwdVtdIGFnYWlucyBob2xlcyBpbmRpdmlkdWFsbHkuDQo+
IA0KPiBDb252ZXJ0IGV2ZXJ5IHNpdGUgdGhhdCBidWlsZHMgdmNwdXMgaW4gYSBsb29wIHRv
IGNhbGwgdGhpcyBmdW5jdGlvbg0KPiBpbnN0ZWFkLg0KPiANCj4gRml4ZXM6IDYxNjQ5NzA5
NDIxYSAoInhlbi9kb21haW46IEFsbG9jYXRlIGQtPnZjcHVbXSBpbiBkb21haW5fY3JlYXRl
KCkiKQ0KPiBTdWdnZXN0ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogRnVya2FuIENhbGlza2FuIDxmcm4xZnVya2FuMTBAZ21haWwu
Y29tPg0KPiAtLS0NCj4gdjM6DQo+ICAgLSBSZXdvcmtlZCBwZXIgSnVlcmdlbidzIHN1Z2dl
c3Rpb246IGluc3RlYWQgb2YgZ3VhcmRpbmcNCj4gICAgIHNjaGVkX21vdmVfZG9tYWluKCkg
YWdhaW5zdCBhIG1pc3NpbmcgdmNwdSBzbG90LCBrZWVwIGQtPm1heF92Y3B1cw0KPiAgICAg
aW4gc3luYyB3aXRoIHRoZSB2Y3B1cyBhY3R1YWxseSBjcmVhdGVkLiBBZGRlZCB2Y3B1c19j
cmVhdGUoKSBhbmQNCj4gICAgIGNvbnZlcnRlZCBldmVyeSB2Y3B1X2NyZWF0ZSgpIGxvb3Ag
dG8gdXNlIGl0Lg0KPiAgIC0gUmV2ZXJ0ZWQgdGhlIHNjaGVkX21vdmVfZG9tYWluKCkgY2hl
Y2sgZnJvbSB2Miwgbm93IHVubmVlZGVkLg0KPiAtLS0NCj4gICB4ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgICB8IDE1ICsrKysrKystLS0tLS0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jIHwgMTEgKystLS0tLS0tLS0NCj4gICB4ZW4vY29tbW9uL2RvbWFp
bi5jICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIHhlbi9j
b21tb24vZG9tY3RsLmMgICAgICAgICAgIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAg
IHhlbi9jb21tb24vc2NoZWQvY29yZS5jICAgICAgIHwgIDcgKysrLS0tLQ0KPiAgIHhlbi9p
bmNsdWRlL3hlbi9kb21haW4uaCAgICAgIHwgIDEgKw0KPiAgIDYgZmlsZXMgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+IGluZGV4IDcyZDUzMTYxODAuLmUwOGVlMjFlZTUgMTAwNjQ0DQo+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMNCj4gQEAgLTE3NzQsNiArMTc3NCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBm
aW5kX2dudHRhYl9yZWdpb24oc3RydWN0IGRvbWFpbiAqZCwNCj4gICBpbnQgX19pbml0IGNv
bnN0cnVjdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpr
aW5mbykNCj4gICB7DQo+ICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiArICAgIGludCByYzsN
Cj4gICAgICAgc3RydWN0IHZjcHUgKnYgPSBkLT52Y3B1WzBdOw0KPiAgICAgICBzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncyA9ICZ2LT5hcmNoLmNwdV9pbmZvLT5ndWVzdF9jcHVfdXNl
cl9yZWdzOw0KPiAgIA0KPiBAQCAtMTg0MiwxNyArMTg0MywxNSBAQCBpbnQgX19pbml0IGNv
bnN0cnVjdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpr
aW5mbykNCj4gICAgICAgfQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAtICAgIGZvciAoIGkgPSAx
OyBpIDwgZC0+bWF4X3ZjcHVzOyBpKysgKQ0KPiArICAgIGlmICggKHJjID0gdmNwdXNfY3Jl
YXRlKGQpKSApDQo+ICAgICAgIHsNCj4gLSAgICAgICAgaWYgKCB2Y3B1X2NyZWF0ZShkLCBp
KSA9PSBOVUxMICkNCj4gLSAgICAgICAgew0KPiAtICAgICAgICAgICAgcHJpbnRrKCJGYWls
ZWQgdG8gYWxsb2NhdGUgZCVkdiVkXG4iLCBkLT5kb21haW5faWQsIGkpOw0KPiAtICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07DQo+IC0gICAgICAgIH0NCj4gKyAgICAgICAgcHJpbnRr
KCJGYWlsZWQgdG8gYWxsb2NhdGUgZCVkdiVkXG4iLCBkLT5kb21haW5faWQsIGQtPm1heF92
Y3B1cyk7DQo+ICsgICAgICAgIHJldHVybiByYzsNCj4gKyAgICB9DQo+ICAgDQo+IC0gICAg
ICAgIGlmICggaXNfNjRiaXRfZG9tYWluKGQpICkNCj4gKyAgICBpZiAoIGlzXzY0Yml0X2Rv
bWFpbihkKSApDQo+ICsgICAgICAgIGZvciAoIGkgPSAxOyBpIDwgZC0+bWF4X3ZjcHVzOyBp
KysgKQ0KPiAgICAgICAgICAgICAgIHZjcHVfc3dpdGNoX3RvX2FhcmNoNjRfbW9kZShkLT52
Y3B1W2ldKTsNCj4gLSAgICB9DQo+ICAgDQo+ICAgICAgIGRvbWFpbl91cGRhdGVfbm9kZV9h
ZmZpbml0eShkKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1f
c2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4gaW5kZXggNWM3
YTBmZjMwZS4uY2Q3Zjc0N2M4MCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21l
bV9zaGFyaW5nLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMNCj4g
QEAgLTE2MTIsMjEgKzE2MTIsMTQgQEAgaW50IG1lbV9zaGFyaW5nX2ZvcmtfcGFnZShzdHJ1
Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIGJvb2wgdW5zaGFyaW5nKQ0KPiAgIA0KPiAgIHN0
YXRpYyBpbnQgYnJpbmdfdXBfdmNwdXMoc3RydWN0IGRvbWFpbiAqY2QsIHN0cnVjdCBkb21h
aW4gKmQpDQo+ICAgew0KPiAtICAgIHVuc2lnbmVkIGludCBpOw0KPiAgICAgICBpbnQgcmV0
ID0gLUVJTlZBTDsNCj4gICANCj4gICAgICAgaWYgKCBkLT5tYXhfdmNwdXMgIT0gY2QtPm1h
eF92Y3B1cyB8fA0KPiAgICAgICAgICAgKHJldCA9IGNwdXBvb2xfbW92ZV9kb21haW4oY2Qs
IGQtPmNwdXBvb2wpKSApDQo+ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiAgIA0KPiAtICAg
IGZvciAoIGkgPSAwOyBpIDwgY2QtPm1heF92Y3B1czsgaSsrICkNCj4gLSAgICB7DQo+IC0g
ICAgICAgIGlmICggIWQtPnZjcHVbaV0gfHwgY2QtPnZjcHVbaV0gKQ0KPiAtICAgICAgICAg
ICAgY29udGludWU7DQo+IC0NCj4gLSAgICAgICAgaWYgKCAhdmNwdV9jcmVhdGUoY2QsIGkp
ICkNCj4gLSAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAtICAgIH0NCj4gKyAgICBp
ZiAoIChyZXQgPSB2Y3B1c19jcmVhdGUoY2QpKSApDQo+ICsgICAgICAgIHJldHVybiByZXQ7
DQo+ICAgDQo+ICAgICAgIGRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eShjZCk7DQo+ICAg
ICAgIHJldHVybiAwOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hl
bi9jb21tb24vZG9tYWluLmMNCj4gaW5kZXggZTE2ZjFhYzM4My4uYTBhM2U1MWIxNSAxMDA2
NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYw0KPiArKysgYi94ZW4vY29tbW9uL2Rv
bWFpbi5jDQo+IEBAIC01MzksNiArNTM5LDMwIEBAIHN0cnVjdCB2Y3B1ICp2Y3B1X2NyZWF0
ZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmNwdV9pZCkNCj4gICAgICAgcmV0
dXJuIE5VTEw7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIENyZWF0ZSBldmVyeSBub3Qg
eWV0IGV4aXN0aW5nIHZjcHUgb2YgZCwgdXAgdG8gZC0+bWF4X3ZjcHVzLiBPbiBmYWlsdXJl
LA0KPiArICogZC0+bWF4X3ZjcHVzIGlzIHJvbGxlZCBiYWNrIHRvIHRoZSBpZCB0aGF0IGZh
aWxlZCwga2VlcGluZyBkLT52Y3B1W2ldDQo+ICsgKiBub24tTlVMTCBmb3IgYWxsIGkgPCBk
LT5tYXhfdmNwdXMuDQo+ICsgKi8NCj4gK2ludCB2Y3B1c19jcmVhdGUoc3RydWN0IGRvbWFp
biAqZCkNCj4gK3sNCj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gKw0KPiArICAgIGZvciAo
IGkgPSAwOyBpIDwgZC0+bWF4X3ZjcHVzOyBpKysgKQ0KPiArICAgIHsNCj4gKyAgICAgICAg
aWYgKCBkLT52Y3B1W2ldICkNCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiArDQo+ICsg
ICAgICAgIGlmICggdmNwdV9jcmVhdGUoZCwgaSkgPT0gTlVMTCApDQo+ICsgICAgICAgIHsN
Cj4gKyAgICAgICAgICAgIGQtPm1heF92Y3B1cyA9IGk7DQo+ICsgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsNCg0KSSB0aGluayB0aGlzIHNob3VsZCBiZSAtRU5PTUVNLg0KDQoNCkp1
ZXJnZW4NCg==
--------------NIXbEHS5jN10LtGkWyyMVSCu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NIXbEHS5jN10LtGkWyyMVSCu--

--------------Cb3stSVCUVxYNMwVt50x0yGh--

--------------uaE5xMQWO0Hf6fnqZ8tv8RRJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmqVN6AFAwAAAAAACgkQsN6d1ii/Ey8X
QQgAlTH553EV8jyIlSfK2bSDz+kbZdEi1UnhF4JKCk/KS8xF04+XUmNTtbrJ7ha3iGpRTeQTsf4N
gslWUG++oWAhMBZidPzGJ4D+583s+SQebgSJP22oe3RUfNsquivOFrff9bKbSzKNY8IQtqOxJX/E
V6vSsfOA5ayd3+BPK1l911yqkWdRZWSj8Su5FRJjVGf8hIFjAsVbm0drKihz8PTZFG9qNUqWx9kF
9B32LNgKYGJI0JDPRdjomGfGGcItwvnZ3QDbMCeBV5EFqFJGnuVPYOhwCZO5g+cPikUK5IfOd/rK
Z8tTbwGHvyCeOdlJDHqROqjIwehah5DGV2zF6xVl3w==
=aWX+
-----END PGP SIGNATURE-----

--------------uaE5xMQWO0Hf6fnqZ8tv8RRJ--

