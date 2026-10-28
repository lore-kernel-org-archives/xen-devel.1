Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02331606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=a0XnvcMg
Received: from list by lists.xenproject.org with outflank-mailman.1463151.1674119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM270-0007OL-1o; Wed, 28 Oct 2026 11:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463151.1674119; Wed, 28 Oct 2026 11:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM26z-0007OE-VL; Wed, 28 Oct 2026 11:46:33 +0000
Received: by outflank-mailman (input) for mailman id 1463151;
 Wed, 28 Oct 2026 11:46:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM26y-0007O8-Jh
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:46:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM26x-0024iR-TJ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 12:46:31 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1e095-e002-0a2a0a5209dd-0a2a4503d5c0-8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:46:31 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1e097-fae8-0a2a45030019-d155dd2fa589-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 12:46:31 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48e0d1da913so690353f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 04:46:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48fasm27816771f8f.31.2026.10.28.04.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 04:46:30 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793187991; x=1793792791; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0bOMVZPXAm5IU2Mgv8WQH5ASwOH3yLkWTr+Ua5rv5I=;
        b=a0XnvcMgjI94MfBeZiYMLsNkfSql8akzETUISQYqBprjEmVTRpSU6+225kqDu3X9Zo
         v/mRFJOmKqsPTwUxVI3y9kxNevTd3mAKmEgrsXcXYoMqWSIOhjb5aBOwkr7zD410Ru3z
         NOvjc9rR7OaRVJVMuEGEXIQc6ds+ddT1ZelbBFDervlJNwlPSDEeN4VPl2zpkWiYu7Em
         8RcZs+iyjC8VCg8pUZVzpxjFj0s4/At1nqInGjqenJHvuijb/CYxHAe5GYOWWmvSQrxG
         PPe1mjDUAllvy1uJXtvxkxO8FMKgodG7p000/Q0MCHpUBvnVVIM2wkwB+RLckRKnd7Bc
         tCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187991; x=1793792791;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0bOMVZPXAm5IU2Mgv8WQH5ASwOH3yLkWTr+Ua5rv5I=;
        b=ZjUng5JyDBt4P9fqo/6wDkNP4blwv1aas2Ww9+NOomNQ7d9Hp0uFmIhBCvEIpnY4zX
         TVn//4hqiBP05VGdSq8ueBDFzeGF1c9le+sdQrf88h8HaqTLu+lD4FFVHBhC8LtxwsOm
         qWuJFnsJUxcOsp7HAPlO3XXP2KXv6B8ZWxaKbqIhxGL0LX49srfD8h1FOd95W0lSlBFz
         vt2LxuzB2bPClbqOGztfGmAGKjK75HsiEmZHeLOFxkcy0fKH1vCsGu/FCn+wt5X3/KVj
         f+tsIoO74B4wMyKPFo6lV5RjpYSEzx1urKXodjzmAXFrvuhbMO1xyuDA8IJkGeQEVsfq
         yisg==
X-Forwarded-Encrypted: i=1; AKwUvBxiXZHBzib1j7EdAmKiaeEf28AR8gGOYc3evlYMrkH0S0GW2PeGxLrKoXWvFV5OQjvLYZAFkGA3/Mk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKYAeU5/inbsEtUqe4Mtiuu2UEJ2yhmeIVk7Qof1vNwXD1Q9hZD
	2oVXh3or3uVob+T+cdeVn4kdfODUrR7J+qbu1eg9RHx2HONFrfXJgeeitNVT10H84Q==
X-Gm-Gg: AYBFou2Q4yiI8Gd5mnOzvcAR7M2oQ1mFZpvZbIBrLpb5ixMUJGtrYcY2N5VWvIEFcdd
	zmQMV9NDwLqdqWYy2mxp6zASKGPhnLODG/ompVxgdxtGQm60NVadFWkT1xfjz/FOpJqOuLkPp90
	eTG6Z3GW4KgvnXAbWgADX99G9QmVh4kmv5INTbS4DJEXUkQ/HHdW3JMfiT1njwKGJaLHAMJcSLz
	nQ4lK8nwnA1vBh9B7gBosaHJ1jkp9ArsLNFOxlq2yQDw5Bs5PC58Tdl5AmLaL85pUNlqDQ45D90
	RFTYqRSMg0a8L7HO5w6h62NDtOutGB8oLQgCt2Bj+PQY/aqPVGBIvd6prS/IjQiv5LP20A3+X/u
	qLj6AH80ObPPKIILKa5m1J6ogJqMt0CXu2FgGDqooe/zbQWhu/fMdu8JyV0uYhCHkOkW3MEdnDS
	k62YdKESZRUibp8fb7i/ITg9o3umiwSRtjq96iIl0odbRalJjfLckT6Xh3ZY/BnWRURuFy9L7SD
	dXqmO8CGl2hhQLBiYPgAGPQ/PeWSoy6Zx1iMCJ2yE5VmzReJlwsC1VMKbtR5CcxHzhX7IiNJVEt
	xGy6ge+JaErO5cJE2fJ1G1uHOxVu3oqDqLHWLSBe/KLP/jcQn/jEl7f11Zb6z/DEFF6thsUfvs7
	UHSDZBUf8cM8r5H3jUQ==
X-Received: by 2002:a05:6000:490b:b0:48e:850:c0b7 with SMTP id ffacd0b85a97d-48e601eb154mr2919581f8f.1.1793187991186;
        Wed, 28 Oct 2026 04:46:31 -0700 (PDT)
Message-ID: <8ee013ce-e6ff-48be-8d55-9870ad14e26e@suse.com>
Date: Wed, 28 Oct 2026 12:46:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitops: Remove unused get_bitmask_order()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261028114328.1514337-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20261028114328.1514337-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793187991-6C6DE4E9-C389CC59/10/78276251493
X-purgate-type: spam
X-purgate-size: 290
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 12:43, Andrew Cooper wrote:
> This is a wrapper around fls() with an incorrect comment about the output
> range of the function.  It's also unused, so remove it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


