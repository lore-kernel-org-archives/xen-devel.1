Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B751DC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:57:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383450.1626724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbBN-000115-0u; Wed, 05 Aug 2026 12:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383450.1626724; Wed, 05 Aug 2026 12:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrbBM-00010y-TI; Wed, 05 Aug 2026 12:57:16 +0000
Received: by outflank-mailman (input) for mailman id 1383450;
 Wed, 05 Aug 2026 12:57:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wrbBL-00010s-DT
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:57:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrbBK-004dNI-Gr
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a733324-e002-0a2a0a5209dd-0a2a450bd186-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:57:11 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a733327-b7e8-0a2a450b0019-d155d036a42d-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:57:11 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6a0a0466d12so2137761a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:57:11 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a18b26b488sm264446a12.25.2026.08.05.05.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 05:57:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1785934631; x=1786539431; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uez3Y760HCQxEKEaZ9zt8WAYJlzXp3nbhVm+nYgHW9Y=;
        b=f4CU36V84buenv3rSqOhO31cqUt5mK1lh4wDDwgZOMuruFN9o1FfIgwQdxhEL4MNM2
         9zKfVfKDFscBiJuV3eYzcAtaamM9iKMPLoUk16BhWCGO2FWFt7RlQ+dK4szkE4FoYtIQ
         zJVKjlEzhl44VUmfJW06AYNREl2/ChSc0kyebMQ0qdOxgHORcyBvtlUzGI7tDIBTdaxn
         LBeBii387W2TMsvjjasyYek5i/V+qYq0I8InyZKlbepUmE5FZfKcfhoSkRzCll0+woNV
         fqkdiPAV2vBk9xv4VsZwqox0iKqPAhs/QbYYKPJKK3svg1xvE11+x9r+QlWC+pxowsMl
         q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785934631; x=1786539431;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uez3Y760HCQxEKEaZ9zt8WAYJlzXp3nbhVm+nYgHW9Y=;
        b=WQ44CjiONgieh6gDcLLu6lw3+yLcrK3Cpyfk7qyaIbgLlufj2YYnr9+1RioMoUr+fi
         RBi2xzCy+uYBk733sPfOTtKfMC8W/tosMD5pxJWIZC1Tphed8zojcuKZq3+z35pS47tq
         4A9z5qzkShyVhQvbOTnktcFxq8nF5P/OK7MD7AzidQqA0mzU1VzI6YH4nVoIqc7nNe8d
         PAjJkoicyuf0e4o1BxUOJPwZg8YQpLWr1ZUdxGFO7LQN30WVoa7ZTaJecNl7Lxmrzh/1
         q6y1LKRVlpSUyhL33mnj2Pk1eHSMVzJhu16cgsTJZ3nV3KvwatC/aWhbh9jQvcqTFdaf
         fZkA==
X-Forwarded-Encrypted: i=1; AHgh+Ro90WSjoP34W4JmfVIPJL3ozU7W2ug9OPRvkaGmDhsQ0PUiSNs2VHf31cocXd7g4hPPbbaoC2cbnVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFKxqShXUojhhpdcVVlN26SZrWdgJCqXFKehmIHbFhzUr49wbU
	uu3amZFvIy76CufxsJ6Ph6AngG7KDCj34wSQ94Q4fKQ6p0OWdcFy9nc9Jtj7akMqwdM=
X-Gm-Gg: AR+sD10PhEwVEuufcys2MFEmecOgKgcrYndaY4W+AP835N30x0Hdfrq+5PWy5O6I0NF
	yJNegnle3Wo+UmMjbDsGriJ70gFHcTvaf1wXsfYTzTmHfKDoQMfU8v8Vp9Sf3yL5DOmOhxs3SMP
	R8scGm211kZLKT4bhkXJperXG600ipgQnjwEH/TGvH3Uah1sBs0BsCyT1VfoEJJ4Bs5BhGFBPhJ
	iXMZ1czV8kdSaDPcrfYl0cRSvh2qBwQs8tVkLm9I6XnByYSG23YhzttEpuEllt8OF2hywbonSVC
	n8yvKs/ZMjrgQtH2EXonWosJTlfeUfNpHjHH2ejbXd6zPZsJi7OVYJMJDpSGiwN0TuMbRwRjjpX
	NAmbkTzrsGE8iQ802JT9ATrX1XjKJeM10CZvTy9JG9TFGaKuE+0LaYGSgvDXT5ZJRZrCHrUQccy
	1GUPd17asKm8KW5X+9nUfKqgqGYpw/u7PZZlM1f2MEnNitPUuSy2mN6LEneoOx9AHgBvucmnlnO
	yaK0EaORX8/Ov/13ALFzQPJN/s7j4rUJ7yo6GJ6r83hGT5QfBpGyHCSmZSvwZ9y9ojmMEOtMMwE
	ABlwi2uCk/Y6tSI=
X-Received: by 2002:a05:6402:52cd:b0:697:8b0c:36e1 with SMTP id 4fb4d7f45d1cf-6a14ef2123bmr3632287a12.4.1785934630814;
        Wed, 05 Aug 2026 05:57:10 -0700 (PDT)
Message-ID: <a7f8dbfd-6247-4905-bc37-ac4e9977ad94@suse.com>
Date: Wed, 5 Aug 2026 14:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/sched: rename scheduler registration symbols
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, gwd@xenproject.org, dfaggioli@suse.com,
 stewart.hildebrand@amd.com, nathan.studer@dornerworks.com,
 roger@xenproject.org, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, michal.orzel@amd.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 tpearson@raptorengineering.com, alistair.francis@wdc.com,
 connojdavis@gmail.com, xen-devel@lists.xenproject.org
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-3-frn1furkan10@gmail.com>
 <14dd261f-8d78-4c24-b927-f7f2c01dbdf8@suse.com>
 <3de6fbd2-0e2c-46ac-b858-d3987833d796@gmail.com>
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
In-Reply-To: <3de6fbd2-0e2c-46ac-b858-d3987833d796@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8VDZGiCxvC0PohVfEt0ee0cV"
X-purgate-ID: tlsNG-42698a/1785934631-A88C99EA-BCD349D8/0/0
X-purgate-type: clean
X-purgate-size: 11470

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8VDZGiCxvC0PohVfEt0ee0cV
Content-Type: multipart/mixed; boundary="------------Dt5H7KYGzgPxZyK0fqoYT3T4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, gwd@xenproject.org, dfaggioli@suse.com,
 stewart.hildebrand@amd.com, nathan.studer@dornerworks.com,
 roger@xenproject.org, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, michal.orzel@amd.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, teddy.astie@vates.tech,
 tpearson@raptorengineering.com, alistair.francis@wdc.com,
 connojdavis@gmail.com, xen-devel@lists.xenproject.org
Message-ID: <a7f8dbfd-6247-4905-bc37-ac4e9977ad94@suse.com>
Subject: Re: [PATCH v2 2/2] xen/sched: rename scheduler registration symbols
References: <20260804055327.22119-1-frn1furkan10@gmail.com>
 <20260804055327.22119-3-frn1furkan10@gmail.com>
 <14dd261f-8d78-4c24-b927-f7f2c01dbdf8@suse.com>
 <3de6fbd2-0e2c-46ac-b858-d3987833d796@gmail.com>
In-Reply-To: <3de6fbd2-0e2c-46ac-b858-d3987833d796@gmail.com>
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

--------------Dt5H7KYGzgPxZyK0fqoYT3T4
Content-Type: multipart/mixed; boundary="------------IRlJKDHBgdj9ad1hPAxHm6Jb"

--------------IRlJKDHBgdj9ad1hPAxHm6Jb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjYgMTQ6NDgsIEZ1cmthbiDDh2FsxLHFn2thbiB3cm90ZToNCj4gSGkgSmFu
LA0KPiANCj4gT24gOC81LzI2IDE0OjQzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA0
LjA4LjIwMjYgMDc6NTMsIEZ1cmthbiBDYWxpc2thbiB3cm90ZToNCj4+PiBSRUdJU1RFUl9T
Q0hFRFVMRVIoKSwgc2NoZWR1bGVyc1tdLCBOVU1fU0NIRURVTEVSUywgYW5kIHRoZQ0KPj4+
IHBlci1hcmNoIFNDSEVEVUxFUl9BUlJBWSBsaW5rZXIgbWFjcm8gbm93IHJlZ2lzdGVyIGFu
ZCBob2xkDQo+Pj4gc3RydWN0IHNjaGVkX29wcyBpbnN0YW5jZXMgcmF0aGVyIHRoYW4gc3Ry
dWN0IHNjaGVkdWxlciBvbmVzLA0KPj4+IGJ1dCBzdGlsbCBjYXJyeSBuYW1lcyBkZXNjcmli
aW5nIHRoZSBvbGQgdHlwZS4NCj4+Pg0KPj4+IFJlbmFtZSB0aGVtIHRvIG1hdGNoIHRoZSBj
dXJyZW50IGJlaGF2aW91ci4NCj4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+Pg0KPj4+
IFNpZ25lZC1vZmYtYnk6IEZ1cmthbiBDYWxpc2thbiA8ZnJuMWZ1cmthbjEwQGdtYWlsLmNv
bT4NCj4+PiAtLS0NCj4+PiAgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICB8ICAyICst
DQo+Pj4gICB4ZW4vYXJjaC9wcGMveGVuLmxkcy5TICAgICAgfCAgMiArLQ0KPj4+ICAgeGVu
L2FyY2gvcmlzY3YveGVuLmxkcy5TICAgIHwgIDIgKy0NCj4+PiAgIHhlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMgICAgICB8ICAyICstDQo+Pj4gICB4ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUz
LmMgfCAgMiArLQ0KPj4+ICAgeGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgICAgIHwgMzMgKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICB4ZW4vY29tbW9uL3NjaGVk
L2NyZWRpdC5jICAgfCAgMiArLQ0KPj4+ICAgeGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMg
IHwgIDIgKy0NCj4+PiAgIHhlbi9jb21tb24vc2NoZWQvbnVsbC5jICAgICB8ICAyICstDQo+
Pj4gICB4ZW4vY29tbW9uL3NjaGVkL3ByaXZhdGUuaCAgfCAgNCArKy0tDQo+Pj4gICB4ZW4v
Y29tbW9uL3NjaGVkL3J0LmMgICAgICAgfCAgMiArLQ0KPj4+ICAgeGVuL2luY2x1ZGUveGVu
L3hlbi5sZHMuaCAgIHwgMTAgKysrKystLS0tLQ0KPj4+ICAgMTIgZmlsZXMgY2hhbmdlZCwg
MzMgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gSSdtIG5vdCBxdWl0
ZSBzdXJlIGlmIGFsbCBvZiB0aGlzIGlzIHJlYWxseSB1c2VmdWwuIEluIG1hbnkgKGFsbD8p
IHBsYWNlcw0KPj4gSSB0aGluayAic2NoZWR1bGVyIiBhcyBhIHRlcm0gaXMgc3RpbGwgcXVp
dGUgYXBwbGljYWJsZS4NCj4+DQo+PiBPbmUgKGdlbmVyYWwpIG5pdCB0aG91Z2g6IGlmIGFs
cmVhZHkgeW91IHRvdWNoIG1hbGZvcm1lZCBsaW5lcyAob3ZlcmxvbmcNCj4+IG9uZXMgaXMg
d2hpY2ggcHJvbXB0ZWQgdGhpcyBjb21tZW50KSwgcGxlYXNlIGFkanVzdCB0aGVtIHRvIGJl
IHN0eWxlLQ0KPj4gY29uZm9ybWFudC4NCj4+DQo+PiBKYW4NCj4gDQo+IFRoZSBtYWluIHJl
YXNvbiBJIHJlbmFtZWQgdGhvc2Ugc3ltYm9scyB3YXMgdHlwZSBjb25zaXN0ZW5jeSAtIHNp
bmNlDQo+ICdzdHJ1Y3Qgc2NoZWR1bGVyJyBpcyBub3cganVzdCB0aGUgcnVudGltZSBwZXIt
Y3B1cG9vbCBvYmplY3QsIGtlZXBpbmcNCj4gJ3NjaGVkdWxlcnNbXScgYW5kICdSRUdJU1RF
Ul9TQ0hFRFVMRVIoKScgYXJvdW5kIHRvIGhvbGQgJ3N0cnVjdA0KPiBzY2hlZF9vcHMnIHBv
aW50ZXJzIGZlbHQgbGlrZSBpdCBtaWdodCBjb25mdXNlIHNvbWVvbmUgcmVhZGluZyB0aGUg
Y29kZQ0KPiBsYXRlci4NCj4gDQo+IFRoYXQgc2FpZCwgSSBnZXQgeW91ciBwb2ludC4gQXQg
YSBoaWdoZXIgbGV2ZWwsIHRob3NlIG1hY3JvcyBhbmQgbGlua2VyDQo+IGFycmF5cyBhcmUg
c3RpbGwganVzdCByZWdpc3RlcmluZyBzY2hlZHVsZXIgaW1wbGVtZW50YXRpb25zLCBzbyBr
ZWVwaW5nDQo+IHRoZSBuYW1lcyBpcyBva2F5IHRvby4gSWYgdGhlIG1haW50YWluZXJzIHBy
ZWZlciBrZWVwaW5nIHRoZSBleGlzdGluZw0KPiBuYW1pbmcsIHBhdGNoIDEgY2FuIHNpbXBs
eSBiZSB0YWtlbiBvbiBpdHMgb3duIHdpdGhvdXQgdGhlIHNlY29uZCBwYXRjaC4NCj4gDQo+
IEp1ZXJnZW4sIHdoYXQgZG8geW91IHRoaW5rIGhlcmU/DQoNCkkgZG9uJ3QgdGhpbmsgZGlm
ZmVyZW50IG5hbWVzIG1ha2UgYSByZWFsIGRpZmZlcmVuY2UuIEkgYWxyZWFkeSBleHBlY3Rl
ZA0KdGhpcyByZW5hbWluZyB0byBiZSBxdWVzdGlvbmVkLCBoZW5jZSB0aGUgc3VnZ2VzdGlv
biB0byBkbyBpdCBpbiBhbiBleHRyYQ0KcGF0Y2gsIGFsbG93aW5nIHRvIHRha2UgdGhlIG1h
aW4gcmV3b3JrIGluZGVwZW5kZW50bHkgZnJvbSBpdC4gOi0pDQoNCklPVzogSSB3b3VsZG4n
dCBvcHBvc2UgZG9pbmcgdGhlIHJlbmFtaW5nLCBidXQgSSdkIHRha2UgcmVwbGllcyBhcyBK
YW4ncw0KYXMgYSBoaW50IG5vdCB0byBBY2sgdGhlIHBhdGNoLg0KDQoNCkp1ZXJnZW4NCg==

--------------IRlJKDHBgdj9ad1hPAxHm6Jb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IRlJKDHBgdj9ad1hPAxHm6Jb--

--------------Dt5H7KYGzgPxZyK0fqoYT3T4--

--------------8VDZGiCxvC0PohVfEt0ee0cV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpzMyYFAwAAAAAACgkQsN6d1ii/Ey+K
fAgAgIT4pyEw2GnM013+P1NM1eLKA/QPWRpp4aekdA2de4MHsNArJTP4YmBFqrtQWUvXm/rIMw3s
tmXw9pWqNhbNCwb8opk8XYe61OTyb3xnKZWfZq/sBslexo697p0oIUJHL/BPIc6W3KNtGAChH0CJ
w02F2NAmAsR2FtFVD2vJUzJr4hG0GXB+pMkTftm8UWxVTucD+PEWy44lUPae/GAdofHvsCa+LnTC
8evYpKctcPh+drlFbsJafVXVy8nXYD1GMXvt5sOTdB6DkZ+8LJs1N5yxz5KTLMlgp0ZL9KXAKg1F
hzasZyhzf3qEpIeviolvLiSmi3WYF4I0WVkIUcncng==
=qBl0
-----END PGP SIGNATURE-----

--------------8VDZGiCxvC0PohVfEt0ee0cV--

