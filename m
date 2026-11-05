Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7A606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 08:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D6AopTyu
Received: from list by lists.xenproject.org with outflank-mailman.1474200.1681384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOspQ-0001YL-IA; Thu, 05 Nov 2026 08:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474200.1681384; Thu, 05 Nov 2026 08:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOspQ-0001YE-E0; Thu, 05 Nov 2026 08:28:12 +0000
Received: by outflank-mailman (input) for mailman id 1474200;
 Thu, 05 Nov 2026 08:28:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOspP-0001Y0-Ua
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 08:28:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOspP-009g7w-Am
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 09:28:11 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3e0c-8faa-0a2a0a5109dd-0a2a4507af9e-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:28:11 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec3e1b-b4ea-0a2a45070019-d155802abd81-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 09:28:11 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so15490855e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 00:28:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56b78d656sm54569295e9.0.2026.11.05.00.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:28:10 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793867291; x=1794472091; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3kBeTVyBcCE5oGMZpxlxDy7FshH5xsThhUlSFWeM+Q=;
        b=D6AopTyuXBdN/3jT1W+FBqrBs4RP/h//pHHNnlaUN9dMMlXvo/HihcAdJHSuYFrq3k
         Ss8gcnFEHyG5EGGgKjz+KKyW+SNRR4Q2fH1XP5X3G0ha4DzcaY1vEIQVSby1urhQkz+I
         vNiAy43znzu6ZLQPNZy9ybg/Pc5tR0ZPAHCUztQGE7tLaukGjbLyUgMksU/kXBOx8mxo
         /7ychhtN1iTfuQRwzmYLPSBTc2MiSwwCX/905dXBKptPkG+VNYp/NuaLsybUy+NM3LZL
         798ae7HjofOUzCfIYttuzYT2uUdGS3uymridrugRdQ5xH8qr+d4v/yrkzlluQXKQYTak
         GtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867291; x=1794472091;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W3kBeTVyBcCE5oGMZpxlxDy7FshH5xsThhUlSFWeM+Q=;
        b=k4jxblLmUwGdupVT/j1AsRnJMxFqaFrSA/BsL4DYYIrnQnsKnelHm9q8U9GQnEGb94
         /6/rhpgFWT7Gcr3R/oKNAU2KNG8bUC6zQL4WdegqLGVnqgg4PZDIWXxHtJqef+pAL1rC
         bAst67oxjA7VErGXjB/TxtNvq53y+zyZCKqf2eCNIxOqYOorZlbjs8trLiJV5iAdQcc9
         SRYP8wFpLyxYjZfWzRQmHQzTdBmeLUqAqZ3LDcCCvD7q47SimnhnEdihDHw0W64PjEi9
         lR2fOBwYU/u+rXuKsB+ZVnSzPy5XZP3UjXA36jKyVhGzJ7oRsh6dzI0toWXvOVDEWdpP
         ockQ==
X-Forwarded-Encrypted: i=1; AKwUvByy/pL8aDu9+F5boGgadoY04Ud/gJnbPtxN7C4GYyf+3xhr3bovwzEe1XxLfE/8F7+IJKXRhwD6NvA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/HeBK3nbB5CqvSay2uexBXEQ/UuudtJS1L3Bsb6H7HN4RmEqaO
	/7oIqnF2s8/KqGMext92o+c6eTb4yac8jZG2kVEi9FYkDFYqLKPLrDyEjE7rwsR+sQ==
X-Gm-Gg: AYBFou1T4zcHNx7OmOvCqGYcx/nWv297g4TnsZ0ISlo0eMxl0jL8VQqQ6hAdWUZnnJz
	2UU6nA+cS9U93fwsKH/2TI+FegaXaU3xE4mMZacC07MaNRwFvrxgmYQt+XCdFF02s3muXhucQwD
	qlOyC6qhRKYICLwFw8MeUgD+yAcIwqPFbZGHZePgRUnw28R4ezl1VFCQRLuSUyZgP32Ltis5rkA
	LLAZm2amG1eJn3E/RjdQS+9kefXGtelFvXJkd7TMW60eRK/uIogLA6ILTUG4UJFtZ+yOtC+FK3+
	CsKeYd+ikZ+ZhD6/Sjb3bU5hdYLuFjNiywhlUxKt2ZFsebSs1d/DwtDITFQwyiUja2OAYwovYMW
	v/XXl8ez/BLPkrvkyn1Nmwjy/Vb/x2HEs2VEBXgev3q5ixBbECB/v/ev3jQsUYMmiSJM/UvCIaK
	dny8XbrMf+OVLBs1T4czosLKleRbmfbQHGYSQv0/HwVHaissIRrTxY/THvQxaateCgu+Mgswjwh
	NpL1lIqPJe9XBBqnKSidKlKlCZzz6oD/27ywbgdA5mW3C4EwbIlKj6Vf5aYrsYVNRen0udH+4o2
	I1oo2pJF2yAj5dDdy5TkYsdo50nPJberRkVd01+Kw1bONLHPNLUSR7hSIUW8dBysBgDj1hSyL2S
	SwwtMG250ieT4vDE=
X-Received: by 2002:a05:600c:8116:b0:4a2:150f:160f with SMTP id 5b1f17b1804b1-4ac1913eecdmr398648835e9.25.1793867290756;
        Thu, 05 Nov 2026 00:28:10 -0800 (PST)
Message-ID: <c3a080e5-c6ff-44b2-9f8e-abf1afb87e71@suse.com>
Date: Thu, 5 Nov 2026 09:28:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/28] x86: apic: use APIC_EIO_ACK instead of
 open-coded 0
From: Jan Beulich <jbeulich@suse.com>
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-13-dmukhin@ford.com>
 <981e549b-6445-4947-968f-644cca5f81b5@suse.com>
Content-Language: en-US
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
In-Reply-To: <981e549b-6445-4947-968f-644cca5f81b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793867291-35CC7AE4-8D595DE2/10/78276251493
X-purgate-type: spam
X-purgate-size: 485
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 09:27, Jan Beulich wrote:
> On 05.11.2026 02:33, dmukhin@ford.com wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Use the symbolic value in ack_APIC_irq() instead of open-coded 0.
>>
>> Also, correct the EIO -> EOI typo in the constant name.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Oh, actually: Only with the typo that you correct in the header also
corrected in the patch subject.

Jan

