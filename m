Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B956C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:32:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384760.1627557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wryCV-0003EQ-9u; Thu, 06 Aug 2026 13:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384760.1627557; Thu, 06 Aug 2026 13:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wryCV-0003EJ-6q; Thu, 06 Aug 2026 13:31:59 +0000
Received: by outflank-mailman (input) for mailman id 1384760;
 Thu, 06 Aug 2026 13:31:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wryCT-0003EA-Al
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:31:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wryCS-004LYS-Bc
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:31:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a748cb7-e002-0a2a0a5209dd-0a2a45039d68-46
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:31:56 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a748ccc-fae8-0a2a45030019-d155d02aed7c-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:31:56 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6a1a546a6bbso803594a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 06:31:56 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a196aed253sm837140a12.29.2026.08.06.06.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 06:31:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1786023116; x=1786627916; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ER2daL09LDBbo/3gJph6npA5SXNYn5TQtVyv8ie4GOI=;
        b=Uj5hrzuz5pSSU2Ysz/r3qdndk+DRSuWv9vHuJyNvKaunObvZ2FyDq+PmZiapEdcxuj
         AB22/V5g/OiwFp/cFGpT6LqV5sF8To/CA2dhGE9RSlKD8sG6BTywtLSVmUGr352cwph0
         RvIm3dG8zEWNy1v/51TdYPbms2abyXkE8OTGegKzx3XjOkoEZlIMeiRZGo11QK8zci1Y
         XZTvkuHsYvvSS2H1qCUv1hUpU1JB+6FI5UNfqSLOJhQdvhBhlKQijhiS4uH4nfjqBY73
         O700zfsah7egsfiLpgQ/kvovCiWOOyTnzXzYdaga94ZMmacVu4KRHq5ssmNWgAfL8qsy
         jTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786023116; x=1786627916;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ER2daL09LDBbo/3gJph6npA5SXNYn5TQtVyv8ie4GOI=;
        b=Hr+/W7wr04FUcwiZwKYPZ8yDix36eLcdJWbafEEDV16v4FzlsCoFq3Ypi6aI73cbZd
         1URs/OBx7SH6fzhBxHR7+OqbwrX8//PQNXXnSL7OVsy9mlr7cacA/J+1wvaNaAiWoONh
         iMyd9CG7lN8kttZ6aklHt7PD9xh3dlKl4plVL6/TEScIVzD0mXEgEh1MQqgIQvzpka2Q
         ozjCiO93eNNwWTV4ylza0PX+c5MONr2Z3sTTBBJ3SApcrGlFan/KSKqq97/DqeA88r19
         J/uQIOUP22BGpURuAIZkgq/S4vF5/v0oznqF/DtUnZUU1DBvHtVQI20nPwK7ylHxni33
         vzww==
X-Forwarded-Encrypted: i=1; AHgh+RoEWaP5JJZWjvzCS6rp4zLy1hzr+IcWfH4Vn4r6IBLH/x6PfT9eDPvwufs/ZuI4M7vYKst2TiseStE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhXNNNQ8gjsLr7NKsoTzBwkQlWjzANd/xpoCaIUqPznNvdJmOc
	/jgMEvaRrtqSWjVR2IjLhCb0k4Wt7DeXThpDl2uZ1mdiU99FMGIRwqNHAIltqLHvoOQ=
X-Gm-Gg: AR+sD10dEOAAgS40a7qPNKakHPnZH3JDcu9Kdn/O+cv5gCfK+NFpjoRp13yatls+jQr
	OoDSs/gwnqf4FAFSGxtQtdBVQue5VHAiGW1p+X0+8zqgNarYxXaKG2zWAlmOQ7q9j3sGxo2H9JO
	W28OulPO+tIefUM7K4E+FWGqtWo2FgmTJHmnsOZ2LI23y/j/nEQARImxHAl9ONo5GvjME/LgV47
	lwP1qhfZtIicy9ctkOXYSvXYyfFsVzcGJRQAP14UnUMLCUMSVvwgfSVBxMxnZwbWSBKzsPXYpLh
	luShwpgT0owrXbrGYAFupO6Elho6OqSgdEUAxhrjX3CVrc/7WhIkXAcNUSgile/JTwfk3NnEEO9
	9Z7Sd+/UglUyZT/w7pASMMsIZ0s6RSAE+MwCd+MlCEYp/xVUw2w6hdUe5YsZn9uU2n8BWibz06h
	9Ecupm9BwkOgb3NpEggwVMQI/RTYwid2bJrGbxNMhPWcCFZ1RGEnWo5CDraTxxpYVEgbz18lbd2
	Qw3lbmDYv8ncA+aGWihMeDftJl2ey2GNQxKmLDzQ8Zgu7VDsqpvJbPZCL/cSWDQdYLkAENsTQJL
	SuEWOl4h4ZYZZ/k=
X-Received: by 2002:a05:6402:518f:b0:6a1:8ec3:766d with SMTP id 4fb4d7f45d1cf-6a1b4bad1f5mr742692a12.19.1786023115597;
        Thu, 06 Aug 2026 06:31:55 -0700 (PDT)
Message-ID: <3206813c-33fc-476f-a553-4d3f319459aa@suse.com>
Date: Thu, 6 Aug 2026 15:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20260806015233.202486-1-jason.andryuk@amd.com>
 <083db883-558a-4000-b404-bf170c8309ee@suse.com>
 <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
 <967208c9-8d51-4380-8cb4-298f5c313d35@suse.com>
 <a6c55f20-c5cf-45fa-beb8-532fe3b95270@amd.com>
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
In-Reply-To: <a6c55f20-c5cf-45fa-beb8-532fe3b95270@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RBWR0lk1dgQ1uIbaPM46ZDwI"
X-purgate-ID: tlsNG-33051d/1786023116-6CEDA4E9-1AE071EA/0/0
X-purgate-type: clean
X-purgate-size: 12320

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RBWR0lk1dgQ1uIbaPM46ZDwI
Content-Type: multipart/mixed; boundary="------------tzV1pVdD3C6cGm0x2ChdpT1y";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <3206813c-33fc-476f-a553-4d3f319459aa@suse.com>
Subject: Re: [PATCH 0/2] xen: Fix PV-only build
References: <20260806015233.202486-1-jason.andryuk@amd.com>
 <083db883-558a-4000-b404-bf170c8309ee@suse.com>
 <62b5117f-928d-4908-9217-cc16d9cf15f9@suse.com>
 <967208c9-8d51-4380-8cb4-298f5c313d35@suse.com>
 <a6c55f20-c5cf-45fa-beb8-532fe3b95270@amd.com>
In-Reply-To: <a6c55f20-c5cf-45fa-beb8-532fe3b95270@amd.com>
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

--------------tzV1pVdD3C6cGm0x2ChdpT1y
Content-Type: multipart/mixed; boundary="------------UgvAncgvKwTDoFqxTDog8p7a"

--------------UgvAncgvKwTDoFqxTDog8p7a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDguMjYgMTU6MjQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDgt
MDYgMDg6MDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAwNi4wOC4yNiAxMzozMSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDYuMDguMjAyNiAxMjo1NSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+Pj4gT24gMDYuMDguMjYgMDM6NTIsIEphc29uIEFuZHJ5dWsgd3Jv
dGU6DQo+Pj4+PiBBbGxvdyBkaXNhYmxpbmcgWEVOX1BWSFZNIGZvciBhIFBWLW9ubHkuwqAg
QSBzdHViIGluIHRoZSBldmVudCBjaGFubmVsDQo+Pj4+PiBjb2RlIG5lZWRzIHRvIGJlIGZp
eGVkIGZpcnN0Lg0KPj4+Pj4NCj4+Pj4+IEphc29uIEFuZHJ5dWsgKDIpOg0KPj4+Pj4gwqDC
oMKgIHhlbi9ldmVudHM6IEZpeCB4ZW5fc2V0X3VwY2FsbF92ZWN0b3Igc3R1Yg0KPj4+Pj4g
wqDCoMKgIHhlbi9LY29uZmlnOiBzZWxlY3QgWEVOX1BWSFZNDQo+Pj4+Pg0KPj4+Pj4gwqDC
oCBhcmNoL3g4Ni94ZW4vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDggKysr
KystLS0NCj4+Pj4+IMKgwqAgZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMgfCAy
ICstDQo+Pj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4NCj4+Pj4gSSBkaWQgYSBjb21wYXJpc29uIG9mIGEg
a2VybmVsIGJ1aWx0IHdpdGggeW91ciBwYXRjaGVzIGRpc2FibGluZyBYRU5fUFZIVk0NCj4+
Pj4gYW5kIG15IHBhdGNoZXMgd2l0aCBYRU5fUFZIVk1fR1VFU1QgZGlzYWJsZWQuDQo+Pj4+
DQo+Pj4+IFRoZSBrZXJuZWwgYnVpbHQgd2l0aCBteSBwYXRjaGVzIGlzIDYgYnl0ZXMgc21h
bGxlciB0aGFuIHRoZSBvbmUgd2l0aCB5b3VyDQo+Pj4+IHBhdGNoZXMuDQo+Pj4NCj4+PiBJ
c24ndCB0aGlzIGEgc2lnbiBvZiBzb21ldGhpbmcgZWxzZSBuZWVkaW5nIHR3ZWFraW5nLCBz
b21ld2hlcmU/DQo+Pg0KPj4gVGhpcyBpcyBhIHNpZ24gdGhhdCB0aGVyZSBhcmUgcHJvYmFi
bHkgb25seSB2ZXJ5IGZldyByZWFsbHkgSFZNIHNwZWNpZmljIHBhdGhzDQo+PiAoaW4gdGhl
IHNlbnNlIG9mOiBleHBsaWNpdGx5IG5vdCBtYXJrZWQgYXMgaXJyZWxldmFudCBmb3IgUFYp
IGluIHRoZSBrZXJuZWwuDQo+PiBZZXMsIEknbSBzdXJlIHlvdSBjYW4gZmluZCBzb21lIG1v
cmUsIGJ1dCBJJ20gcmVhbGx5IG5vdCBzdXJlIHRoaXMgaXMgcmVsZXZhbnQNCj4+IGZvciBt
b3JlIHRoYW4gYSBoYW5kZnVsIG9mIHVzZXJzLg0KPiANCj4gSSBzZWUgbW9yZSByZWR1Y3Rp
b246DQo+IDE1MDI5MjQ4IC0gYXJjaC94ODYvYm9vdC9iekltYWdlDQo+IDE1MDIxMDU2IC0g
YXJjaC94ODYvYm9vdC9iekltYWdlLmFmdGVyDQo+IA0KPiB+OGsNCj4gDQo+IDUyNTQyNDgw
IC0gdm1saW51eA0KPiA1MjUyMzE4NCAtIHZtbGludXguYWZ0ZXINCj4gDQo+IH4xOGsNCj4g
DQo+ICQgLi4vbGludXgvc2NyaXB0cy9ibG9hdC1vLW1ldGVyIHZtbGludXggdm1saW51eC5h
ZnRlcg0KPiBhZGQvcmVtb3ZlOiAxLzEzNiBncm93L3NocmluazogMTQvNDggdXAvZG93bjog
MTU5MDIvLTIyNDMwICgtNjUyOCkNCg0KRGlkIHlvdSBkaXNhYmxlIENPTkZJR19YRU5fUFZI
Vk1fR1VFU1QgaW4gdGhlIGJlZm9yZSBrZXJuZWwsIHRvbz8NCg0KPiANCj4+Pj4gU28gSSBk
b24ndCBzZWUgYW55IHJlYXNvbiB0byB0YWtlIHlvdXIgcGF0Y2hlcywgd2hpY2ggY29uZmxp
Y3Qgd2l0aCBtaW5lLA0KPj4+PiBlc3BlY2lhbGx5IGFzIG15IHBhdGNoZXMgaGF2ZSBhIG5l
Z2F0aXZlIGRpZmZzdGF0IG9uIHNvdXJjZSBsZXZlbCwgdG9vLg0KPj4+DQo+Pj4gSG1tLCBK
YXNvbidzIHBhdGNoZXMgbG9vayB0byBtb3ZlIHRoaW5ncyBpbnRvIGEgbW9yZSBhZGVxdWF0
ZSBkaXJlY3Rpb24sDQo+Pj4gdGhvdWdoLiBJbiB3aGljaCBjYXNlIEkgdGhpbmsgYSBuZWdh
dGl2ZSBkaWZmc3RhdCBiZWNvbWVzIGFuIGlycmVsZXZhbnQNCj4+PiBhcmd1bWVudD8NCj4+
DQo+PiBEZXBlbmRzIG9uIHdoYXQgeW91IGFyZSBsb29raW5nIGZvci4NCj4+DQo+PiBNeSB0
YWtlIGZyb20gdGhpcyBpcyB0aGF0IGEgUFYtb25seSBrZXJuZWwgd2l0aCBKYXNvbidzIHBh
dGNoZXMgaXMgbm90IHJlYWxseQ0KPj4gYWRkaW5nIGFueSB2YWx1ZSwgd2hpbGUgbXkgc2lt
cGxpZmljYXRpb24gaXMgYXQgbGVhc3QgbWFraW5nIHRoaW5ncyBzaW1wbGVyDQo+PiBpbiB0
ZXJtcyBvZiBjb2RlIHZvbHVtZSBhbmQgbnVtYmVyIG9mIFhlbiByZWxhdGVkIGNvbmZpZyBv
cHRpb25zLg0KPj4NCj4+IE9mIGNvdXJzZSBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBoYXZl
IGEgc21hbGxlciBQVi1vbmx5IGtlcm5lbCwgYnV0IGFzIEkgc2FpZA0KPj4gYWxyZWFkeSwg
dGhlcmUgaGFzIGJlZW4gbm8gcHVibGljIGRlbWFuZCBmb3IgdGhhdCBpbiB0aGUgbGFzdCB5
ZWFycyBhbmQgdGhlDQo+PiBkb3duc2lkZXMgSU1ITyBmYXIgb3V0d2VpZ2ggdGhlIHBvdGVu
dGlhbCBnYWluLg0KPj4NCj4+IElNTyB0aGUgImFkZXF1YXRlIGRpcmVjdGlvbiIgcmVnYXJk
aW5nIFhlbiBzcGVjaWZpYyBrZXJuZWwgY29kZSBpcyB0b3dhcmRzIFBWSA0KPj4gYW5kIG5v
dCB0b3dhcmRzIG1vcmUgUFYgc3BlY2lmaWMgdHdlYWtpbmcuIEFuZCBJJ20gdmVyeSBzdXJl
IHRoZSBrZXJuZWwNCj4+IGNvbW11bml0eSBvdXRzaWRlIG9mIHRoZSBYZW4gY29tbXVuaXR5
IGlzIGFncmVlaW5nIHdpdGggbWUgaGVyZS4NCj4gSSBkb24ndCBuZWVkIFBWLW9ubHkga2Vy
bmVscywgc28gSSBhbSBmaW5lIHdpdGggbm90IHB1cnN1aW5nIHRoaXMgcGF0Y2ggc2V0Lg0K
PiANCj4gTWFpbmx5IEkgd2FudGVkIHRvIHBvc3QgdGhpcyBhbHRlcm5hdGl2ZSBzaW5jZSBy
ZXN0b3JpbmcgUFYtb25seSBpcyBwb3NzaWJsZSANCj4gKGFuZCBJIGluYWR2ZXJ0ZW50bHkg
YnJva2UgaXQpLsKgIENvbnZlcnRpbmcgQ09ORklHX1hFTl9QVkhWTSB0byBDT05GSUdfWEVO
IA0KPiBsb29rZWQgd3Jvbmcgd2hlbiBpdCBkaWRuJ3QgYXBwbHkgdG8gUFYuDQo+IA0KPiBQ
dXJzdWluZyB5b3VyIHBhdGNoZXMgZm9yIHRoZSByZWFzb25zIHlvdSBnaXZlIGFsc28gbWFr
ZXMgc2Vuc2UuDQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------UgvAncgvKwTDoFqxTDog8p7a
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------UgvAncgvKwTDoFqxTDog8p7a--

--------------tzV1pVdD3C6cGm0x2ChdpT1y--

--------------RBWR0lk1dgQ1uIbaPM46ZDwI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmp0jMoFAwAAAAAACgkQsN6d1ii/Ey+w
0QgAgWFtwLXHbZiI2x6rwpaNKVn9HGdNEHtNajXZkomknhdnC4BlDSPqQtnqp0Sai0mrHWwfD4+I
c/N5h+PLnRGs4QT2KvS5/XNu0AYdNkb7W+Aml2Ac/gLMXoMnn6p8XpvGydDJxKph7tWyBrZH556F
YQCYOX8w+UjjZukEuw9riSvjdZliFdS7HU6jmBgkubbRTHTQBq1bDFGmC72/Tqo7yaDlivE0QJxe
m7t0cIWPOAr/5TPzpjV+TxH7rAbJqznPpFPh8eZRzGWN6y1HrEC4QmMry7XjWdfK88z99SEA1/PA
2qYSKDk2aZYDR4tw0+nHEnxrZLB8hbLcmxIMWqdmwg==
=odcF
-----END PGP SIGNATURE-----

--------------RBWR0lk1dgQ1uIbaPM46ZDwI--

