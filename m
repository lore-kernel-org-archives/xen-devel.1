Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC14606A32C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YHqX+exh
Received: from list by lists.xenproject.org with outflank-mailman.1494753.1694090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThTN-0005bv-Ow; Wed, 18 Nov 2026 15:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494753.1694090; Wed, 18 Nov 2026 15:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThTN-0005bo-MA; Wed, 18 Nov 2026 15:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1494753;
 Wed, 18 Nov 2026 15:21:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xThTM-0005bi-Td
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:21:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xThTM-008lud-5z
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:21:20 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc260-bab6-0a2a0a5309dd-0a2a450aa386-38
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:21:19 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc26f-f2d2-0a2a450a0019-d155dd2fe015-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:21:19 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso654817f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 07:21:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a654a8c23bsm4695180f8f.12.2026.11.18.07.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:21:18 -0800 (PST)
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
        d=suse.com; s=google; t=1795015279; x=1795620079; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3I7uov8IQcggIfEW3sm9/12hYqN8sgZ9Q3tjuHhTXRA=;
        b=YHqX+exhyPZygyuOJZ6V8rcpSjwvx63WwBsjctK6sKifGbTtDKtGxXIFUgjBN0toMG
         2+LgWjf8Ai7z3QXhjbenEjebMHabRNBbGnk9lgQ1P1Ks9AY3IdoKasH2yGUx17Uv22xz
         jX5Sy7ubeA218uXxy4iC48aQyDZYy+YWbgRBXBaqWB5TxdY+uP/NOQnNhEvWlJHmZyq8
         hVkWfPZAE0MIRrIHaxNV2ckWm0T6R+ZBxBIpIZCr16nXy1DZOVwfLhWxnB6qc9+HaxVT
         FGKfXDCaXyfcLUc5471HjemnRxdOmfMvKBBewnUTcCIFhSuOzwyhTMEt/vHO3NNwHub0
         rA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015279; x=1795620079;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3I7uov8IQcggIfEW3sm9/12hYqN8sgZ9Q3tjuHhTXRA=;
        b=NsIbTyUcurqto/TM0mEqa1cXxxmjVKpMHq5fSZyab4jQhz86W6RZf2AMXPZL7RfCwN
         MZb22fBKz5Se2oL/pq8F4ht06QXLt0Rmd8ISQj85s37aVsv+6pbjioqqWrIj+FjWHBUA
         L6IoPCZsINXnr320p4YQgdDeF7wtXrb/Vig/aFJM+KDbr59UYnWBTbY08BlDs3PrBUzC
         Eux79GDZc58OqqDpUZ66jVx7EWX3hKGcQl8p4HaJc64RLnz/ycy+HQC+Vfsewe+HzBd5
         h21irLSMRl7aZWCBjDq4uL9CbDBJnHTUXnCAyLq7N0fcBcP2xbtuKi3oMpOW7byOwPcn
         JyPA==
X-Forwarded-Encrypted: i=1; AL+hErGdOyb9xTxhxQVcvEU3ANI5OxUgw5nbfFKjRTT0/q20jnUPmpD2AT8zA3SW4jy7foaQUNkDucRvFT4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z99SNNApOpDhLJoGE6mO/3XcqhvNxtbg+PyH+vrAJdc4a6/2qfG
	aU2d5tRsOsBOeg7WtLGBnJq4AiNBz+TZ4ON6c9tsR0qo8Y7eb70bF4cEiTDnpPI6Pw==
X-Gm-Gg: AZFdTZexZfK/wrv4GFbQ0RrkTcwQcYvO7K2KQPSgKMIbSrDyIw+z8nP7hP7JzNt1U/4
	N2CtXcD4RqIZNuXLiJG5wkfNIGFggRRU3XZma28soVAsP62/p6EfD6oF7dmEsZTFHSKEW3HH8mi
	5aqq8yW106pmMEmvpJ8Xi6ktj8nrsRhrOZSHOnEGb3Xfp36mGV3FDlZhR4UzNPOwOzTixEttgbg
	fHezdL0woa94pJTMwsh2AXDXXXESex8hSZdkR7mUIBiz9Vy5DJLor1F3Ic2LKxQde3a/b6imILU
	IXPF8WchvxME3qQSvCEopn76OPWeYoMQHjLGDZRRBUjGoQcuMGhuDubEalm/iA14SiVr3mQ0hKQ
	khm82H3WTB5MMrHLUERu6IGnt8PTqaMBUL0+0GECWzj9D4/dwi0ggQxrqAY8MlVhhdT7BmuiDHt
	1Qrgp08Z5GX4Gtgr4GYiXwyhzMPhs8ZEcSVkZ269WnsdMCsMhbDo88xm2NhfIEuVCllLkN5JdGn
	TjIiX4VlqthorJjayNkEnuhFfMzyNMmEEI0psogNH8IkCZDsxc3xCIZ4ksGlB/IDRS6SRzKC3Ee
	VTeHeZ3CSvjZmPAi4M9bjzTu035Y28lfPi3maCb05FwkcsIMMFFqcq6yRrh0Qf7Xv1oV9H9ysnA
	PIKAS8Vq5k2HwmYX0yw==
X-Received: by 2002:a05:6000:4284:b0:4a5:33ad:871a with SMTP id ffacd0b85a97d-4a62d6d5650mr7147990f8f.0.1795015279197;
        Wed, 18 Nov 2026 07:21:19 -0800 (PST)
Message-ID: <b8629f68-b703-4ead-b94d-e80b067a1cdb@suse.com>
Date: Wed, 18 Nov 2026 16:21:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-5-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795015279-583CCCFC-8E4CE9B6/10/78276251493
X-purgate-type: spam
X-purgate-size: 566
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Establish per-domain SVM AVIC backing page mapping and SPA mappings
> for APIC physical/logical ID tables. Use MEMF_no_refcount mappings
> similarly to Intel's VMX APICv setup.

Are one or both of these to become guest accessible? If so, more of what
VMX does is going to be needed. If not, I don't really see much of a
similarity, i.e. then I think this wants explaining differently.

Also (nit) MEMF_no_refcount is used for allocations, not for mappings.

Jan

