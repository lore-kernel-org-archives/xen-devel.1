Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2E606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X8PUbIeP
Received: from list by lists.xenproject.org with outflank-mailman.1500413.1696578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU6U-0004OP-5c; Mon, 23 Nov 2026 13:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500413.1696578; Mon, 23 Nov 2026 13:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU6U-0004OI-2u; Mon, 23 Nov 2026 13:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1500413;
 Mon, 23 Nov 2026 13:29:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVU6S-0004OC-RS
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 13:29:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVU6R-005GT0-Sy
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 14:29:03 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b043f9c-2eae-0a2a0a5409dd-0a2a450bbd94-4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:29:03 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b043f9f-b7e8-0a2a450b0019-d1558031d44b-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:29:03 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so30812725e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:29:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853ca452sm347143265e9.15.2026.11.23.05.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:29:02 -0800 (PST)
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
        d=suse.com; s=google; t=1795440543; x=1796045343; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uq7OBNKtcV5wY7AUrrxCWIoZHPr+W1a4WoIjYm9lJOc=;
        b=X8PUbIePQ2GVEj7V6X6UtdN4lEBP8zoDdIEOG/6vz2UzQ17VhMmh3FV/o3O6duHEtc
         ksOKegOcvsXnFhJe01SJpHuYlGeGzw1tpIMjHJlrS4YiCkp36dgxLMJ/jfwRu2TGmEby
         ZFwiFp7subsIzlo8KRIUyZRJs0iXgqhfZN2SoyeyZLvjXviQxADDjk+gjQK2RlInMV8i
         weqPQBXb21F+iW9evYnApaXNchiB5gbSut3h+FIobeNwPmjlNI9sf1xsSY3neAEEjJbE
         HQpHgzGXw4+gkKKuYig2OvgBbFTQ4OEzxWpSCFCYB40a6mbF1gFfmOJYOIU5UtDoNnQB
         WBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440543; x=1796045343;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uq7OBNKtcV5wY7AUrrxCWIoZHPr+W1a4WoIjYm9lJOc=;
        b=HeO+1e6ay8KJmC59eTxudBJ2M8vDxK42wAipN7426iW+gmMVJooLFc6O5vA1t8TRek
         8wELm6zhtVH6JW3zYRr2nrtTn++y64Xx6XA5YWhuHzH1XhnAhsx+ijbyuJ5OAqfwWt+z
         s/NlySx3V6yvtbdVA98ehGDj6LgBZwtKEKj6rM2xNIzRfBSMrTuEwoPqHMmTibtnGgjH
         iOML9UN16mHrbprOghkI2DkF/dvhUzzoAUQiKzaD0O2hce1PEGrqMHOssfLNLCPSmaVI
         hpqX2Bc2/rCr8tkr7X2nVmRgc8JjM9nepOzaXCKRCpBoiWagSqkKTIDBPPPBXuzrzpb3
         hquA==
X-Forwarded-Encrypted: i=1; AL+hErF5AVnAhvYcOcFHPPwm9GVT0rA+FjZjGudOaFhEcI/owJVMBfeA/2vvLNzMTNIte1/5RkkdAu9x2AY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9scxHDdEPy7yt+fsYdNCXA95H2uKIZfs78JkZBOLBJ9RUDUih7
	AaEoDl/Z5keahP8s0jotxGAvSxidumT96hYOQWbpp+VPXjj9kQTozcjYy1LONhNFW8XP9Vm1uNj
	41uFRfg==
X-Gm-Gg: AZFdTZdaEvKNNA1N0KtISsXCC0IVbr+qS9M5VCLX8oRKFl6HGg7AbKVrNX933WVasm/
	kDXbGSRy8xiwGNL/Tws7N3jzz94yUNXZQADjgV6yit0vp5cZ9eXL40yYYKRXE9l48gs3QSttL5R
	tPNgew6bOxrnXkzByhF9HNZaZKEFl8NS/0bRi5FtGMqhwYrITLA79bcVWUqGKP3pE4yMeKn4e4R
	oFK9DryD5+Kxi6E8uPnBLYIUOTxFaFp1tSZRJTAhG8GLPt6ebrZXucdCisS87JTZv0asQtP0sfz
	xKjkgELCXyPc4+j0RhpOsToY4QQsw9qbkGVCyt1enj1TB5YEMGNaQqyCPQR0y4V2mJlVcUFG+Up
	6A2vQzxPx5B9HS4Z28n9iE0+IpM0iHq2CG/bdkkH9WPlmD3OWmM8Io18uv6bZUWWcodyEAhLRcD
	sVry7Endhk3BMTPU++dz5K2rdjQ6FUTr58IwKzpZzqXcEqdYA1dEVUzx9upJApK3yghgits847v
	42xDecinDCJi8eDijjXIa6J1uy+CJPs3WQQ18MHrYMgP3m8URasdtD6hmS6K0ud0xRZSs+Ap4LU
	eq5m8tUOA/j/a2braqndrpv3QzO+p4tx9DjvqLprk9wkyEsz61+LVEdnFt2p0+eYlqjey6ZWQRL
	r62bDnOGRFC2G6Nok
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr225976005e9.11.1795440542730;
        Mon, 23 Nov 2026 05:29:02 -0800 (PST)
Message-ID: <3f430bfd-27d1-441c-ae57-8e520ab0c31f@suse.com>
Date: Mon, 23 Nov 2026 14:29:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/50] x86/mm: introduce a per-vCPU state window in the
 perdomain area
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
 <20261119-asi-hvm-v7-2-6551b6d5c879@xenproject.org>
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
In-Reply-To: <20261119-asi-hvm-v7-2-6551b6d5c879@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795440543-19EC69EA-FCA84A6C/10/78276251493
X-purgate-type: spam
X-purgate-size: 2941
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 22:06, George Dunlap wrote:
> Guest-owned register state that Xen keeps in always-mapped memory, on
> the xenheap or in the xmalloc pool, is to move to the domain heap,
> reached through mappings of its own rather than through the directmap.
> The long-lived per-vCPU structures involved (the SVM VMCB, the VMX
> guest MSR load/save list, the guest XSAVE area, and later the
> aggregated small per-vCPU allocations) all want the same shape: one or
> more domain-heap pages, mapped once at fixed per-vCPU virtual addresses
> for the life of the vCPU.
> 
> Add a fourth per-domain-mapping sub-area providing that destination: a
> small per-vCPU stride of page slots, with a fixed index assigned to
> each relocated structure and the page tables created at vCPU creation
> time.  Consumers allocate their own pages and install them with
> populate_perdomain_mapping(); the backing pages remain caller-owned,
> so their lifetime stays with the consumer, while the page tables are
> torn down with the rest of the per-domain area.
> 
> Before freeing their pages, consumers take them out of the window with
> unmap_vcpu_state(), on failure paths as at teardown: vCPU creation can
> fail once a consumer has mapped its pages, and the domain lives on.
> It flushes the domain's dirty CPUs: the window is in the per-domain
> area that all of the domain's vCPUs share, so these are the CPUs whose
> page-tables carry it.  So far that mask is empty on every call, as the
> vCPU has not run or the domain is paused.  A consumer reaching a page
> from another context, through a transient map_domain_page() mapping,
> drops the mapping with unmap_vcpu_state_page(), which also flushes this
> CPU's translations of it, there and at its alias in the per-domain
> mirror: the mapcache defers that flush, and the translations would
> otherwise outlive the mapping.
> 
> The window has the same domain-wide visibility as the other
> per-domain sub-areas: each vCPU's stride, at virtual addresses keyed on
> vcpu_id, is mapped in the page tables of all of the domain's vCPUs.
> 
> This is infrastructure for moving the SVM VMCB, the VMX MSR load/save
> lists, the saved register frames, the HVM emulator's caches and the
> guest XSAVE areas off the xenheap.  Slots specific to AMD or Intel can
> share the same space.  Nothing occupies the area yet; the only
> behavioural change is the page-table allocation itself and the failure
> path that comes with it: vCPU creation can now fail with -ENOMEM.
> Both apply to every guest vCPU, PV ones included.  A domain gets one
> L2 plus an L1 per 64 vCPUs: 2 pages for up to 64 vCPUs.  A PV domain's
> window stays empty until the register frames and XSAVE areas move
> there.
> 
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


