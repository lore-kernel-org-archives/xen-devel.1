Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C62606A320
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bWot1zx/
Received: from list by lists.xenproject.org with outflank-mailman.1461175.1672140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJK6-0001eg-2B; Mon, 26 Oct 2026 11:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461175.1672140; Mon, 26 Oct 2026 11:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJK5-0001eZ-UX; Mon, 26 Oct 2026 11:57:05 +0000
Received: by outflank-mailman (input) for mailman id 1461175;
 Mon, 26 Oct 2026 11:57:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJK4-0001eT-Tx
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:57:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJK1-00D3sv-RX
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:57:01 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf3ff4-bab6-0a2a0a5309dd-0a2a4505dee0-42
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:56:58 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf400a-4cb1-0a2a45050019-d155802eb9f8-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 12:56:58 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so33589475e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:56:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0aa097sm209436265e9.3.2026.10.26.04.56.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 04:56:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1793015818; x=1793620618; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnLmwNwP/O4q7mGg8UAOdyNk5IZGlVFRmJBWjhG0gWk=;
        b=bWot1zx/OCBCR2W+QCNn1B2qBByGCzX9eAo2sNU6jl/dc45OnpcLCgUuq+paC/MKgx
         9onK0CmcMg44hXSdilgkDPeqJVFnMqXs+Y7Bji/zADSrZ5lU3y0VQbKjperCnbBuK1eC
         wL29o4JCnIwu+I8Ya523KROrKsrmq62iiBUWHsTZTSHdZ+m2yrz+osKP4jAlBH3qaZuy
         ReqPclrXw4ZZglts7op8B5IR1iuFxEb4cVe12c8IxzuWm+HCRShVBBGsxmRU/DroY1rK
         +Hf94Q6kwFn/d/Wx5NvfMftlRfABbKsifxBKGXhBqEZTvz9+8W8LSIHFFjkF1ky5e6cw
         tzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793015818; x=1793620618;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnLmwNwP/O4q7mGg8UAOdyNk5IZGlVFRmJBWjhG0gWk=;
        b=LpV91PqefAW9MQT29pOdkkAHH45how7aoUSmjOqE4ghoZ7udgY5O06Xhslhwa/Ckqz
         wPaLPOWcllJ5Kpz+mlis0LU6pMVJsqmfeUkHJlF7wRUwtfSp6JEi0DEe62vru9YJW9hJ
         uo5bE884jCIG0YzdvK8Sh/xvzY2Yx9il0fFjOuIRAphIMQiAdBpCfWE6Qk4mSqU2omF7
         PZZRoWRPZwjFKuO1do93VJc+CJiCNY9kb6z/i42/fTu8L1HCVLFk0+YPg9FppgULEme5
         LoAcIilp6wFb6r2gcbm3pupHdfXwc2iS5XYvLsefU4KJPkeGT1twvYWqtZ930gMxUvya
         cZfA==
X-Forwarded-Encrypted: i=1; AKwUvByrbWa5+1F2bTvwHo5lX/9pqzEzB+FmYuHgJlBLdNqB343pA9N376XOti3i1STvzy2sbVNl8HtUyxY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLFwrIwZnLkIX+up70pMZkPuiPkCpX59rn1MgXkWp1jEtl0hU7z
	EeJWk+41h74NsSpvtmbXb4oju2SO92HwhJhvOnsmNTKc9iGZ7ECKxexgeZBt7wNlHA==
X-Gm-Gg: AYBFou0PlAE9E0H0t75CHSt5J413LdRy5At4l0pUBHPaY13aL+ABp6JdRRDNQ4Z6gDW
	NhOhBGiCXnOectwi5nbpTTrkWmOTod5iGXLWE41Az1JbTByCd8KOXOFZ5Rh78r6JL1L6o6en3dF
	uYtozLCgLWTIDuLe3cQMQ90Tn2GisFEaKnhghnHpkWSSq+icYlsK87eAJFCrSiXo1Yf94dqFZEw
	H5DWMpLafyKkEJMLO1UEqZAFBWxfe0+xJSLyUG8cMzbeZKHZuLtkR21XiYmt3vwlEdMEw4OS/0i
	nA/6v4vGvJ8NV4VOq0//RBXo0j8IAwoWQyItcQHjvxMo/WrBh9/9Y9AvtT3GupBRVOZ7E9zgp9b
	dzlyW8eu47Irt8zXRw9M+/ISN0Bzt80eze9g3t6G7qad9C4pTBxOmJ5D+cX83eE+SSWBEtdjAJQ
	DZltZiudyJmsdKSvgS17GJRFekIiEHCOOGRqsVUe36GcfZmrRTNepwdH4asBIVZjTbJPs/QOcAE
	qjycwNH2iE2UIymk1ODw6AdP7gvo+4BbeQixWh8CO266uNs6wGPgMIDSDiul1WLoJ9CnymaCsI0
	SmoyqDA9pq7KotTGmfmJ71zc65WKyGKG8eK484SjxBonQndcPngas0Zcs1TuZRebNw==
X-Received: by 2002:a05:600c:19d4:b0:4a3:59c9:a750 with SMTP id 5b1f17b1804b1-4a35ac90dcemr106254855e9.9.1793015818075;
        Mon, 26 Oct 2026 04:56:58 -0700 (PDT)
Message-ID: <00f95d00-3d43-4e85-92e9-0b1cba4f0c4f@suse.com>
Date: Mon, 26 Oct 2026 12:56:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ryo Takakura <takakura@valinux.co.jp>
Cc: roger@xenproject.org, ross.lagerwall@citrix.com, sstabellini@kernel.org,
 julien@xen.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, anthony.perard@vates.tech,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261023044809.162759-1-takakura@valinux.co.jp>
 <20261023045808.165276-1-takakura@valinux.co.jp>
 <97d772f1-322f-43f6-a793-fdbba16c7f04@citrix.com>
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
In-Reply-To: <97d772f1-322f-43f6-a793-fdbba16c7f04@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793015818-F429B2A1-0F197BA6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1846
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 12:42, Andrew Cooper wrote:
> On 23/10/2026 5:58 am, Ryo Takakura wrote:
>> +FUNC(xen_livepatch_trace_caller)
>> +        pushq   %rbp
>> +        movq    %rsp, %rbp
>> +        pushfq
>> +
>> +        /* Preserve general-purpose registers. */
>> +        pushq   %rax
>> +        pushq   %rcx
>> +        pushq   %rdx
>> +        pushq   %rsi
>> +        pushq   %rdi
>> +        pushq   %r8
>> +        pushq   %r9
>> +        pushq   %r10
>> +        pushq   %r11
>> +
>> +        /*
>> +         * xen_livepatch_trace_dispatcher(ip, parent_ip)
>> +         *
>> +         * ip: Address of the traced function.
>> +         * parent_ip: Address where the traced function was called.
>> +         */
>> +        movq    8(%rbp), %rdi
>> +        subq    $5, %rdi
>> +        movq    16(%rbp), %rsi
>> +        call    xen_livepatch_trace_dispatcher
>> +
>> +        /* Restore the saved state. */
>> +        popq    %r11
>> +        popq    %r10
>> +        popq    %r9
>> +        popq    %r8
>> +        popq    %rdi
>> +        popq    %rsi
>> +        popq    %rdx
>> +        popq    %rcx
>> +        popq    %rax
>> +        popfq
>> +        popq    %rbp
>> +        ret
>> +END(xen_livepatch_trace_caller)
> 
> Just in case there's a problem doing this all in C...
> 
> No need for pushf or popf at all.  Flags are undefined at function
> boundaries.
> 
> Please drop the q suffixes; they're all unnecessary here.
> 
> The ret needs to be RET for speculative mitigations.  (It's emitted as
> JMP which will be turned back into a RET on safe system.)

Just for completeness: "will" as in "will eventually"; see my still
pending "x86: re-inline RET used in assembly code" (with me doing C side
work still pending feedback for that initial, smaller change).

Jan

