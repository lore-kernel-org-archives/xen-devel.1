Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291BC982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 12:31:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428766.1651707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8zec-00046X-KM; Tue, 22 Sep 2026 12:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428766.1651707; Tue, 22 Sep 2026 12:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8zec-00046Q-H9; Tue, 22 Sep 2026 12:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1428766;
 Tue, 22 Sep 2026 12:31:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8zeb-00046H-Rx
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:31:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8zeb-002t10-5P
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:31:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab27518-8faa-0a2a0a5109dd-0a2a4507cfac-2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:31:21 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab27518-b4ea-0a2a45070019-4a7de18da0bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 14:31:20 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so23575255e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 05:31:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdad53c7dsm44649225e9.12.2026.09.22.05.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 05:31:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790080280; x=1790685080; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+92Dl39HqApT06XXPezMG+SG8nsAQtZw+yIjN81Wtug=;
        b=b5rEgd3HRXJXl8W976uw2Lx2N2hiYyLlZ9ryFpO5CZ27UKf+HdjOAdR2Hii1xvM4pD
         qQ+RfkZ+CcehLeKePc9Y2gCO0m41fzUcrzskY03JRWG1cyGSUz+gHZY4J1UtJoQGfiQB
         0lm0hORVqDrWkzR6h0w23PgwWUnOFlJrCzRDBvN0mjTTFziuMdtEWHZdhbILpkQKLqkW
         hBAmaNuU4du0TCX46Xo6uO3zp5SFfUCCbh6eaxColxBCIH6WIZUg3FAY30upBKPvqAql
         eh9zkkgwgzMbZTRH+VXJMFKn7oLyrokgfre/0yjBiiGECVapxTn4MptemvwYBeMMQZLq
         VkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080280; x=1790685080;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+92Dl39HqApT06XXPezMG+SG8nsAQtZw+yIjN81Wtug=;
        b=tda9Ud9hQs17jxKpDyR7OahH8pul3bNEVj/VLOvA+qw2cabAVk9pCIGh45U8XCDdfa
         I7534LdENmtfjELDT77MA4SnxNbjv7wDsENNIiVf9Tko3U07bxeduaUHmbLBe86PXqjW
         yAHpXXPmUJy3kwPoS5upJafgN2D32/zOal6gXoeQ9VkfpDSVOwKctCfAkQ3U5WgV5osH
         +c/jJ6vG2PN6vzBkufgMvNEULuHEKu+tui3V+kse/0CR989LdPYkoLLDNL/DwYVmweHT
         FRYxlHaH6hAszB5gKH8v5+6Xa/uuPINrN6mcKeVxZCFxUWamhbe0c22Mkd6zD5KvOYGz
         Pqkw==
X-Gm-Message-State: AFuF++kESR5JxjwHd53Vk8pZCB4CVr1xrX2uZ4kffJ0X/WzxLUMwzXB9
	byuNV7PswZokbxM9iODQmi5z6zNJdCZyJjgBvOjAmfnkfan76/RxIjETI9bwPu89hw==
X-Gm-Gg: AYBFou1iymHRnuCmm8yULAurGFN3urH4H1Tx+BccPnR9Er0PqBtDP/zQ+6XnKFxkDeq
	cpgTQhGlvRozdrmHIk3ZMJaB4oM1aljiDdkZS8+TexxiLqXhkxSOM0ZaULImCwcUYu45ks9Tza5
	J6qti07bM45JRrRwl7Xc2UskaYPyRB+swD8mDNmzJKUSCpUIv3s1nyk02Npu6NWc8s4mzFjvHPX
	IaeFVW81HD9/85doWskY+pSvCs8fPKIq6zRne+PAbLum9r25mkv9h6wHwmGGPIySFeDrdSU2twp
	dQ2Z141ZSX/50pw020oHKI7y7Pgl1TbHilaE6eWg9XEveq49gq55VXJmU7sXnSnzxPBSevU/Jcw
	fwxAeLUWTVykowxmlEXoxKf45G7PKL6yrVOn3dKTGaUvX0ux28J8+CjlF3EAailSzUVvEHgRwiY
	aHdEMMdTTlkeRpkayynoryUYfclROvZvMNfQn7Hb6FqBkUT6fxNrBYVWtEKnUUkqJhNldwvmKl6
	ye8WJ6O/89ryLXlyCTQkcDb4XJdr1Gzp6Jp8bQ9n0zG2sU=
X-Received: by 2002:a05:600c:4505:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49fc56db92fmr199087405e9.7.1790080279539;
        Tue, 22 Sep 2026 05:31:19 -0700 (PDT)
Message-ID: <89defb83-6e1d-4961-b5f8-a425f093a25c@suse.com>
Date: Tue, 22 Sep 2026 14:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen/riscv: flush speculatively cached Bare-mode
 TLB entries in turn_on_mmu()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@vates.tech>
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
In-Reply-To: <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790080280-366DAAE4-E32E8335/0/0
X-purgate-type: clean
X-purgate-size: 1329

On 10.09.2026 11:34, Baptiste Le Duc wrote:
> The existing SFENCE.VMA before the satp write only orders the page table
> stores from setup_initial_pagetables() against subsequent implicit reads.
> It does not prevent the CPU from speculatively caching translations after
> the fence retires.
> 
> According to the RISC-V Privileged specification, implementations are
> permitted to speculatively cache Bare-mode identity mappings. Furthermore,
> selecting MODE=Bare (which happens during check_pgtbl_mode_support())
> requires zeroing the remaining fields of satp, causing ASID=0 to be
> actively used in Bare mode. Consequently, the TLB can be polluted with Bare
> identity mappings tagged with ASID=0.
> 
> Once satp is written to enable Sv39 translation, these cached identity
> mappings (tagged with ASID=0) can shadow the true Sv39 translations. This
> would lead to translation failures since turn_on_mmu() jumps to a
> non-identity-mapped linker address.
> 
> Fix this by adding a post-satp-write SFENCE.VMA to invalidate any stale
> translations (including Bare-mode identity mappings under ASID=0) before
> jumping to the virtual address space.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


