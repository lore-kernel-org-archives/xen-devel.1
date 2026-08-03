Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68A6C55179
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 11:20:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381391.1624987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqqhw-0003qh-C2; Mon, 03 Aug 2026 11:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381391.1624987; Mon, 03 Aug 2026 11:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqqhw-0003qa-92; Mon, 03 Aug 2026 11:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1381391;
 Mon, 03 Aug 2026 11:19:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wqqhu-0003qB-Ba
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 11:19:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqqht-00EYud-62
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 13:19:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a707948-2eae-0a2a0a5409dd-0a2a45049896-34
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 13:19:45 +0200
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a707950-b57f-0a2a45040019-d155da2eb020-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 13:19:44 +0200
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c16794450aeso457755166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 04:19:44 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1fd44e9ff0sm486592866b.42.2026.08.03.04.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 04:19:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785755984; x=1786360784; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y6ZiLzDwyrefHpHNId0SfIDP7KVAik7WooDx4DLjY7M=;
        b=TcXCcNKeKOr4GXR4qbdD+NAvgMD4FP+ZLkB6uKPfqHQgFf7rakqprMST7qhcmL2ksK
         nwF8YOqAGNyrdCRV1dd22meAJoJE26qAsgkaJ8RHluB8uZNcr3tpgiXvumLnynqhpmAs
         /GY16HawYCPZ1IVTqE71MA6yRGAErzIpEJ5TBGJO8qY8yPOgQP8Wud2Zq9S6qw/bnIHU
         eaQ34OoG9LBkcovu4WhatA2L5W2PmFd4tmqeh+c9MtfyRZ7Bk0CEOvCwCRBivlC3G9H7
         Pp2+Gn9ci9yr+k/14Jk3s7YkozBVUO0k/1ra6UH8um6AejBLkvGSOUdhX5qygA9HJ/AA
         CAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755984; x=1786360784;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6ZiLzDwyrefHpHNId0SfIDP7KVAik7WooDx4DLjY7M=;
        b=p0s34uawrylsQ+kYk0Pf6TqfTJZ3t+ydoFXVBlSxiQ/Yy1xG90drYxmxhPaSuHT4nI
         GhOcb2yLyB9hECKXnoKvbyfr03mgtlp19PJu5EtM12Nq9eNwz6jb7hGDDqUJMeQ7qWY+
         BX6YGU0/Bwjzxvxb8Tr80ckM6cEWUFBLNNtgdCVMMyvCg9qZWhGloKXScDD+O6mDfi4T
         Qeo2YRSNmevtnrcuL+8wzsZP7Bcd7ubNNLyZKXCwTZPOcDUy6J5mo7EzJuchVVeWEfi7
         Yu17JP+/51DAM4AbT42faG5HCxJuowZtq4n3dNgknBD3NgO80kvKnJ/cqaIR5dKtSrpF
         LqPg==
X-Forwarded-Encrypted: i=1; AHgh+RqoxNoetnh7LxLDeIRFPOhfTelrWfLbhOGxguLWRXmmPU4yMQzzaTe3NsBpdzfhHrPSdquEg8Bl3II=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyF5xZ9uJ2G8JZd+fyZY4mZerMY7Ia3SFdn7qgMRcniWQJAQdR
	qFp7MvN6wpB3mXQTtPDYYLCsiHOnUXm1Be4NViJS0/4XzUHpjPUjvQ44demHS+XKOoo=
X-Gm-Gg: AR+sD131fi2nSO4QYMUUHzBa3Lfz5zjaSv3w/ULyilfdVBKdoElBEfpWog8GXZHann6
	FdccfbF7k+kSZpbK3+cv57KWkQz2UEmp/UvxTHqGa5aVKV+8NT8/FZF0TbBYKXI1Xg+SEfr5ZW0
	XWHlWitY1JKEqUiw0SvtBBW2FLCcjUoHwv3Cwm3fvuamLWHrHFPPx1NgFht+Qn3t+rZ48CcEaBS
	JiJySkiB9vQ9uuokR/I3p0W5XgwM4pZjVshvWHIzTXZ0Qa4Z1auQiBSPRlzCcdUQEo8tgZD5Cg4
	GszfF+vVH/I6fQDB8zBT5HDavU8KWxA+Nfn8r1pnT7iu61RTlmHY/xYyupwW/ib9chO+1tndg1w
	CBM7JG0jjVD8i1Q4uTQRL+4Wx4lCwQZ2491eTGj2udBx6v49qic1o8Tb1ek6/LrGKBjpyJt2VpF
	sQMrSOcbhW2jqcGPorlYqL39kGLfQY9Ey85gkwsn8CEMB/rVFXzv66WUZuIRGHieGmiKC2BDZQ5
	N1OgvJ+1JIKO1pl3gWk2UGIzlP0vdBCXSncDyEmW0XwtYywMMpZsk2AIqi9qdl6HsuOrSqYdxPC
	saLDtezhLRbz09g=
X-Received: by 2002:a17:906:99c2:b0:c20:1db7:f486 with SMTP id a640c23a62f3a-c201db7f6d5mr51425966b.4.1785755984414;
        Mon, 03 Aug 2026 04:19:44 -0700 (PDT)
Message-ID: <cc3e2b95-5b3d-422b-999f-e3f798687e8a@suse.com>
Date: Mon, 3 Aug 2026 13:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] xen/sched: split scheduler vtable from scheduler
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, oleksii.kurochko@gmail.com
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
 <b90e2fa6-0725-4f39-8a5f-31b02c8aef72@suse.com>
 <6a6a04dc-0d8c-4b7a-a190-09113b3b68cd@gmail.com>
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
In-Reply-To: <6a6a04dc-0d8c-4b7a-a190-09113b3b68cd@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Jb0N41yXYZfVlxU4E0wzd6Gy"
X-purgate-ID: tlsNG-ebf023/1785755985-C22D4B50-A11A547A/0/0
X-purgate-type: clean
X-purgate-size: 14780

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Jb0N41yXYZfVlxU4E0wzd6Gy
Content-Type: multipart/mixed; boundary="------------e0KE3W7ckWjUDvsdlmgZxEAX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, gwd@xenproject.org,
 dfaggioli@suse.com, stewart.hildebrand@amd.com,
 nathan.studer@dornerworks.com, roger@xenproject.org,
 anthony.perard@vates.tech, julien@xen.org, sstabellini@kernel.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech, tpearson@raptorengineering.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, oleksii.kurochko@gmail.com
Message-ID: <cc3e2b95-5b3d-422b-999f-e3f798687e8a@suse.com>
Subject: Re: [PATCH 0/7] xen/sched: split scheduler vtable from scheduler
References: <20260803050614.5222-1-frn1furkan10@gmail.com>
 <b90e2fa6-0725-4f39-8a5f-31b02c8aef72@suse.com>
 <6a6a04dc-0d8c-4b7a-a190-09113b3b68cd@gmail.com>
In-Reply-To: <6a6a04dc-0d8c-4b7a-a190-09113b3b68cd@gmail.com>
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

--------------e0KE3W7ckWjUDvsdlmgZxEAX
Content-Type: multipart/mixed; boundary="------------rgestBAm8DxHNbbDoJMPTflu"

--------------rgestBAm8DxHNbbDoJMPTflu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjYgMTM6MTIsIEZ1cmthbiDDh2FsxLHFn2thbiB3cm90ZToNCj4gSGkgSsO8
cmdlbiwNCj4gDQo+IE9uIDgvMy8yNiAxMzozNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+
IE9uIDAzLjA4LjI2IDA3OjA2LCBGdXJrYW4gQ2FsaXNrYW4gd3JvdGU6DQo+Pj4gRWFjaCBz
dHJ1Y3Qgc2NoZWR1bGVyIGN1cnJlbnRseSBkb3VibGVzIGFzIGJvdGggYSBzY2hlZHVsZXIN
Cj4+PiBiYWNrZW5kJ3Mgc3RhdGljIHZ0YWJsZSAobmFtZSwgb3B0X25hbWUsIHNjaGVkX2lk
IGFuZCBldmVyeQ0KPj4+IGZ1bmN0aW9uIHBvaW50ZXIpIGFuZCB0aGUgcGVyLWNwdXBvb2wg
cnVudGltZSBvYmplY3QgdGhhdA0KPj4+IHNjaGVkdWxlcl9hbGxvYygpIGFsbG9jYXRlcy4g
QmVjYXVzZSB0aGVzZSBhcmUgdGhlIHNhbWUgdHlwZSwNCj4+PiBzY2hlZHVsZXJfYWxsb2Mo
KSBtZW1jcHkoKXMgdGhlIGVudGlyZSB2dGFibGUgaW50byBhIGZyZXNoIGhlYXANCj4+PiBh
bGxvY2F0aW9uIGZvciBldmVyeSBjcHVwb29sIGl0IGNyZWF0ZXMuIFdpdGggTiBjcHVwb29s
cyBydW5uaW5nDQo+Pj4gdGhlIHNhbWUgc2NoZWR1bGVyLCB0aGlzIGR1cGxpY2F0ZXMgTiBj
b3BpZXMgb2YgaWRlbnRpY2FsIGZ1bmN0aW9uDQo+Pj4gcG9pbnRlcnMgYW5kIGlkZW50aWZ5
aW5nIGZpZWxkcyB0aGF0IG5ldmVyIGRpZmZlciBiZXR3ZWVuDQo+Pj4gaW5zdGFuY2VzIC0g
dGhlIG9ubHkgZmllbGRzIHRoYXQgYXJlIGdlbnVpbmVseSBwZXItY3B1cG9vbCBhcmUNCj4+
PiBzY2hlZF9kYXRhIGFuZCBjcHVwb29sLg0KPj4+DQo+Pj4gVGhpcyBzZXJpZXMgc3BsaXRz
IHRoZSB2dGFibGUgb3V0IGludG8gaXRzIG93biB0eXBlLCBzdHJ1Y3QNCj4+PiBzY2hlZF9v
cHMsIHNvIGl0IGNhbiBiZSBzaGFyZWQgYnkgZXZlcnkgY3B1cG9vbCB1c2luZyBhIGdpdmVu
DQo+Pj4gc2NoZWR1bGVyIGluc3RlYWQgb2YgY29waWVkIHBlciBjcHVwb29sLiBzdHJ1Y3Qg
c2NoZWR1bGVyIGlzIGxlZnQNCj4+PiBob2xkaW5nIG9ubHkgd2hhdCBpcyBhY3R1YWxseSBw
ZXItaW5zdGFuY2U6IGEgcG9pbnRlciB0byB0aGUNCj4+PiBzaGFyZWQgc2NoZWRfb3BzLCBw
bHVzIHNjaGVkX2RhdGEgYW5kIGNwdXBvb2wuDQo+Pj4NCj4+PiBUaGUgc2VyaWVzIGlzIHN0
cnVjdHVyZWQgYXMgaW50cm9kdWNlL21pZ3JhdGUvcmVtb3ZlLCBzbyB0aGF0DQo+Pj4gZXZl
cnkgY29tbWl0IGJ1aWxkcyBhbmQgYm9vdHMgb24gaXRzIG93bjoNCj4+Pg0KPj4+ICDCoMKg
IC0gVGhlIGZpcnN0IHBhdGNoIGFkZHMgc3RydWN0IHNjaGVkX29wcywgUkVHSVNURVJfU0NI
RURfT1BTKCksDQo+Pj4gIMKgwqDCoMKgIGFuZCBhIHNjaGVkX29wc19hcnJheVtdIGFsb25n
c2lkZSB0aGUgZXhpc3Rpbmcgc2NoZWR1bGVyc1tdLA0KPj4+ICDCoMKgwqDCoCBleHRlbmRp
bmcgZXZlcnkgbG9va3VwIHBhdGggKHNjaGVkdWxlcl9hbGxvYygpLA0KPj4+ICDCoMKgwqDC
oCBzY2hlZF9nZXRfYnlfbmFtZSgpLCBzY2hlZHVsZXJfaW5pdCgpKSB0byBzZWFyY2ggYm90
aCBhcnJheXMuDQo+Pj4gIMKgwqDCoMKgIFRoaXMgaXMgcHVyZWx5IGFkZGl0aXZlIC0gbm8g
c2NoZWR1bGVyIHVzZXMgaXQgeWV0Lg0KPj4+DQo+Pj4gIMKgwqAgLSBUaGUgbmV4dCBmaXZl
IHBhdGNoZXMgZWFjaCBtaWdyYXRlIG9uZSBzY2hlZHVsZXIgYmFja2VuZA0KPj4+ICDCoMKg
wqDCoCAoY3JlZGl0LCBjcmVkaXQyLCBydGRzLCBhcmluYzY1MywgbnVsbCkgZnJvbSBzdHJ1
Y3Qgc2NoZWR1bGVyDQo+Pj4gIMKgwqDCoMKgIHRvIHN0cnVjdCBzY2hlZF9vcHMuIEVhY2gg
aXMgc21hbGwsIG1lY2hhbmljYWwsIGFuZA0KPj4+ICDCoMKgwqDCoCBpbmRlcGVuZGVudGx5
IGJpc2VjdGFibGUsIHdpdGggbm8gYmVoYXZpb3JhbCBkaWZmZXJlbmNlLCBzaW5jZQ0KPj4+
ICDCoMKgwqDCoCBzY2hlZHVsZXJfYWxsb2MoKSBidWlsZHMgYW4gaWRlbnRpY2FsIHJ1bnRp
bWUgc3RydWN0IHNjaGVkdWxlcg0KPj4+ICDCoMKgwqDCoCByZWdhcmRsZXNzIG9mIHdoaWNo
IGFycmF5IGEgbWF0Y2ggaXMgZm91bmQgaW4uDQo+Pj4NCj4+PiAgwqDCoCAtIFRoZSBmaW5h
bCBwYXRjaCByZW1vdmVzIHRoZSBvbGQgc2NoZWR1bGVyc1tdIGFuZA0KPj4+ICDCoMKgwqDC
oCBSRUdJU1RFUl9TQ0hFRFVMRVIoKSBwYXRoIG5vdyB0aGF0IG5vdGhpbmcgdXNlcyBpdCwg
c2hyaW5rcw0KPj4+ICDCoMKgwqDCoCBzdHJ1Y3Qgc2NoZWR1bGVyIGRvd24gdG8geyBvcHMs
IHNjaGVkX2RhdGEsIGNwdXBvb2wgfSwgYW5kDQo+Pj4gIMKgwqDCoMKgIHVwZGF0ZXMgZXZl
cnkgYWNjZXNzb3IgaW4gcHJpdmF0ZS5oIGFjY29yZGluZ2x5Lg0KPj4+DQo+Pj4gRnVya2Fu
IENhbGlza2FuICg3KToNCj4+PiAgwqDCoCB4ZW4vc2NoZWQ6IGludHJvZHVjZSBzdHJ1Y3Qg
c2NoZWRfb3BzIGFzIGEgc2hhcmVkIHNjaGVkdWxlciB2dGFibGUNCj4+PiAgwqDCoCB4ZW4v
c2NoZWQ6IGNyZWRpdDogbWlncmF0ZSB0byBuZXcgc2NoZWRfb3BzDQo+Pj4gIMKgwqAgeGVu
L3NjaGVkOiBjcmVkaXQyOiBtaWdyYXRlIHRvIG5ldyBzY2hlZF9vcHMNCj4+PiAgwqDCoCB4
ZW4vc2NoZWQ6IHJ0ZHM6IG1pZ3JhdGUgdG8gbmV3IHNjaGVkX29wcw0KPj4+ICDCoMKgIHhl
bi9zY2hlZDogYXJpbmM2NTM6IG1pZ3JhdGUgdG8gbmV3IHNjaGVkX29wcw0KPj4+ICDCoMKg
IHhlbi9zY2hlZDogbnVsbDogbWlncmF0ZSB0byBuZXcgc2NoZWRfb3BzDQo+Pj4gIMKgwqAg
eGVuL3NjaGVkOiByZW1vdmUgb2xkIHNjaGVkdWxlciByZWdpc3RyYXRpb24sIHNocmluayBz
dHJ1Y3Qgc2NoZWR1bGVyDQo+Pj4NCj4+PiAgwqAgeGVuL2FyY2gvYXJtL3hlbi5sZHMuU8Kg
wqDCoMKgwqAgfMKgwqAgMiArLQ0KPj4+ICDCoCB4ZW4vYXJjaC9wcGMveGVuLmxkcy5TwqDC
oMKgwqDCoCB8wqDCoCAyICstDQo+Pj4gIMKgIHhlbi9hcmNoL3Jpc2N2L3hlbi5sZHMuU8Kg
wqDCoCB8wqDCoCAyICstDQo+Pj4gIMKgIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlPCoMKgwqDC
oMKgIHzCoMKgIDIgKy0NCj4+PiAgwqAgeGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jIHzC
oCAxMSArLS0tDQo+Pj4gIMKgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jwqDCoMKgwqAgfMKg
IDgwICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQo+Pj4gIMKgIHhlbi9jb21tb24v
c2NoZWQvY3B1cG9vbC5jwqAgfMKgwqAgNiArLS0NCj4+PiAgwqAgeGVuL2NvbW1vbi9zY2hl
ZC9jcmVkaXQuY8KgwqAgfMKgwqAgNSArLQ0KPj4+ICDCoCB4ZW4vY29tbW9uL3NjaGVkL2Ny
ZWRpdDIuY8KgIHzCoMKgIDUgKy0NCj4+PiAgwqAgeGVuL2NvbW1vbi9zY2hlZC9udWxsLmPC
oMKgwqDCoCB8wqDCoCA1ICstDQo+Pj4gIMKgIHhlbi9jb21tb24vc2NoZWQvcHJpdmF0ZS5o
wqAgfCAxMDAgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gIMKg
IHhlbi9jb21tb24vc2NoZWQvcnQuY8KgwqDCoMKgwqDCoCB8wqDCoCA1ICstDQo+Pj4gIMKg
IHhlbi9pbmNsdWRlL3hlbi94ZW4ubGRzLmjCoMKgIHzCoMKgIDggKy0tDQo+Pj4gIMKgIDEz
IGZpbGVzIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspLCAxMTcgZGVsZXRpb25zKC0pDQo+
Pj4NCj4+DQo+PiBZb3UgaGF2ZSBhIHNlcmllcyBoZXJlIHdoaWNoIGlzIGFkZGluZyAxMTYg
bGluZXMgYW5kIHJlbW92aW5nIDExNy4NCj4+DQo+PiBQYXRjaCA3IGFsb25lIGlzIHJlbW92
aW5nIDI0OCBsaW5lcyB3aGlsZSBhZGRpbmcgNjcgbGluZXMuDQo+Pg0KPj4gU28gaW4gdGhl
IGVuZCB0aGVyZSBpcyBhIHNpbmdsZSBwYXRjaCBpbiB0aGlzIHNlcmllcyB3aGljaCBoYXMg
bW9yZSBjb2RlDQo+PiBjaHVybiB0aGFuIHRoZSBjb21wbGV0ZSBzZXJpZXMgd2hlbiBhZGRl
ZCBpbiBvbmUgZ28uDQo+Pg0KPj4gSU9XOiBtYWtpbmcgdGhpcyBqdXN0IGEgc2luZ2xlIHBh
dGNoIHdvdWxkIGJlIGVhc2llciB0byByZXZpZXcgdGhhbiB0aGUNCj4+IGxhc3QgcGF0Y2gg
YWxvbmUsIGxldCBhbG9uZSBhbGwgdGhlIHRlbXBvcmFyeSBtb2RpZmljYXRpb25zIHdoaWNo
IHdvdWxkDQo+PiBiZSBnb25lIHdoZW4gbWVyZ2luZyBhbGwgcGF0Y2hlcyBpbnRvIG9uZS4g
QW5kIHdpdGggdGhhdCB5b3UgY291bGQgZXZlbg0KPj4gZHJvcCBzb21lIG9mIHRoZSByZW5h
bWluZyB5b3UgZGlkIChlLmcuIGluIHRoZSBsaW5rZXIgZmlsZSksIG1ha2luZyB0aGUNCj4+
IGRpZmYgZXZlbiBzbWFsbGVyLg0KPj4NCj4+IEkgYWdyZWUgd2l0aCB0aGUgb3ZlcmFsbCBn
b2FsLCBidXQgSSdtIHNwYXJpbmcgbXkgdGltZSBkb2luZyBhIHRob3JvdWdoDQo+PiByZXZp
ZXcgb2YgdGhlIHNlcmllcyBpbiB0aGlzIHNoYXBlLg0KPj4NCj4+DQo+PiBKdWVyZ2VuDQo+
IA0KPiBNeSBmaXJzdCBpbnN0aW5jdCB3YXMgYWN0dWFsbHkgdG8ganVzdCBzZW5kIHRoaXMg
YXMgb25lIHBhdGNoLiBJIHNwbGl0DQo+IGl0IHVwIGJlY2F1c2UgSSB3YW50ZWQgZWFjaCBz
Y2hlZHVsZXIncyBjb252ZXJzaW9uIHRvIGJlIGl0cyBvd24gc21hbGwsDQo+IGJpc2VjdGFi
bGUgY29tbWl0LCBidXQgeW91J3JlIHJpZ2h0IHRoYXQgaXQncyBub3Qgd29ydGggaXQgaGVy
ZS4NCj4gDQo+IEkgd2lsbCBzcXVhc2ggaXQgaW50byBhIHNpbmdsZSBwYXRjaCBhbmQgcmVz
ZW5kLiBCdXQgSSB3b3VsZCBzdGlsbCBsaWtlDQo+IHRvIHJlbmFtZSBTQ0hFRFVMRVJfQVJS
QVkgdG8gU0NIRURfT1BTX0FSUkFZIGluIHRoZSBwZXItYXJjaCBsaW5rZXIgZmlsZXMNCj4g
YW5kIG90aGVyIHJlbGF0ZWQgdmFyaWFibGUgbmFtZXMgaW4gb3RoZXIgZmlsZXMsIHNpbmNl
IHRoZXkgbm93IGhvbGQNCj4gc2NoZWRfb3BzIGVudHJpZXMgcmF0aGVyIHRoYW4gc3RydWN0
IHNjaGVkdWxlciBvbmVzLCBhbmQgSSB0aGluayB0aGUgbmFtZQ0KPiBzaG91bGQgcmVmbGVj
dCB0aGF0Lg0KDQpOb3cgVEhJUyBjb3VsZCBiZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2gu
DQoNCg0KSnVlcmdlbg0K
--------------rgestBAm8DxHNbbDoJMPTflu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rgestBAm8DxHNbbDoJMPTflu--

--------------e0KE3W7ckWjUDvsdlmgZxEAX--

--------------Jb0N41yXYZfVlxU4E0wzd6Gy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpweU8FAwAAAAAACgkQsN6d1ii/Ey9v
gAf/ebSttKyOOXGrxS8t9W57Mu9fpoIa9l8Fmo6ofdzBSz/oLEvB+xg/Fp0XbM0z/JrBaugLGBHu
dvHnZktv5eUt7ERxaIf9UELJz3PhnXvbspGTZs0xOmmTLmMBWmUB5ckIliuWvNId+j4zSx/NlJHt
JHAQrreqjKm/3vnReccxQDnDz4w8b+VnE8ecOu7+tZIMNJLzFZhZ6uBWxpbEoisQ8rU/eOi9ScKx
5Tn990svnq6o5NZLzFpamQcrekfH23JYTtmm2IsmCeYnSA19jTOW8n7DP6dZH78Wri4ApGIVjRy6
qrhf39cFiZ1ijNANeK5W7VFifhev5ClbgTjlxODxwA==
=z37H
-----END PGP SIGNATURE-----

--------------Jb0N41yXYZfVlxU4E0wzd6Gy--

