Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC163C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:00:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416835.1645756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51o4-0003qM-62; Fri, 11 Sep 2026 14:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416835.1645756; Fri, 11 Sep 2026 14:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51o4-0003qE-2s; Fri, 11 Sep 2026 14:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1416835;
 Fri, 11 Sep 2026 14:00:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x51o3-0003q8-2g
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:00:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51o2-005zVr-3N
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:00:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa40981-e002-0a2a0a5209dd-0a2a4506d65c-40
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:00:41 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa40989-195a-0a2a45060019-d1558033d8fe-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:00:41 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so9521435e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:00:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c300e2sm172036035e9.8.2026.09.11.07.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 07:00:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1789135241; x=1789740041; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dnq1/1GrB1zbFEE6TLR8yg37CtdjBNWT3gZ0MWETUvU=;
        b=L1fA9m16obNw2YQMHyKUzWIVsXYJHePZl1Dlbs2Jl8obptjznc2veGy9GQdx6p4S2l
         igEJeZnHIzZNwuOwQ+kQ2Oh8ejsWmodkB2RshalU3pjaTOLhGYHaoHRhv+blTebs9Ett
         71BFrGjbHxM4p9bL1Uko9v5cfvQHUnr+UBwxudY0AUs8nhES+ovtOi1BX0XVokdw9g1P
         TBMMFoZY8668i6E1M6ZfhqqQIUxb3VcPhgZ5eaSinnJ4876M9VU6Jwo1MjQly2Fv7f5g
         hkuuvSiSmru3ixCNTimH0JnUTfHtbneDB7w+02Kc+s/DqR1kj+zvAH0UOBJEpCHGx33J
         897Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135241; x=1789740041;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dnq1/1GrB1zbFEE6TLR8yg37CtdjBNWT3gZ0MWETUvU=;
        b=cO81imSQUN+GHq5I2IV0NVhN0pusyanITECaliOB/9Y4AnW50RWdmUO7aE/XnvUSSM
         hyRJJWIlXFBObIP68aLZNMgnxL/ipGUKSOznFdNWr+/LN5F3NSq8h1CQGCyk2WZrgWpZ
         fGws4omZrEWblKGnF6s7WzMRw4EZLlPc9NOrpJ6ggHkUdanRDCttSzPdqV/gf7LQX8SY
         TefOxwvK9Yqi2Yzu1EutxeMb6+lpQ9a3RFSQhjfJwck//7+QUC7rzZP76ByvaM/vTgaj
         voLqtHvrtTyIUCoyEI7NFSC+pbut55308mTsVxwFuuhUaDdrinrakMx3JvbK1V8HxZoU
         0pLw==
X-Forwarded-Encrypted: i=1; AKwUvBwBv6UVg6Z74iIfXj6/ndPwPNzjfKN/4LilL0P4us3zenFHyoSomnMbvd0c06g0bia0kvtWtBFfpjg=@lists.xenproject.org
X-Gm-Message-State: AFuF++l544KOsAv84bwSlOR2S0uhoAraZeimflmfTuGxCxkeapHcY/Nx
	ZC5ZSwCjODOU9U7xLZuDBrl7sv5JXLBDVkK6UEhjGVWdGF6oIleX1WKB84Sm8Cxn5w==
X-Gm-Gg: AYBFou0sYDVQzUsprviXj5mYVMtkZAlK3lXBSq/qq1oTCVmyxl3K2uYhmB/mSEtPQJ4
	DEKSxbluCBR59czZ4q+1q9SJ6dodWyAup0wlXVqQ/IB+z1LEQ+ny+UbBDLkYGpGIYKoVwAms6a9
	Cw4Zw61sYP6EeWgr+dIxpLD611y8JqWHqeR0OPgmzsUE7d4P4liP9s6vdmVI2Uk//lANZOJOptE
	mrtD6XHhfOJo2SJLWfWBhIVGZ3aIp8zQjz5uXPycqhiysbZaS7x2b88bZy0n9AtzPKrdmUPO0QO
	NiiBXW6kiJJKodu12ZsAc3Un1pSQM1R9ZvpUPMLpHiHfbPZzIaaOjJ0iA/OfZ9+gnozEMXtlW8/
	CS2bGB7k9J4mK+XAqBdJsglLpsWFAEovrzPZ/N43knNfWgqCXhCV/M6sHNNI+rzwqAarwz4u0gq
	zeTKpL4N0YAC4b6k7/YpemM4+FMAiLkwU4/H7EMmz2n4QF1p2Y27K+PZMzRzzlr5B1MGtTNXWRr
	REYW2uedFSI6mYpxLj9DK5OsYR140Zs4397mm6ThY9PX4Ayx/RKbToC6ResYgY=
X-Received: by 2002:a05:600c:1c10:b0:49c:fc6c:be05 with SMTP id 5b1f17b1804b1-49e619f7187mr59497495e9.28.1789135241266;
        Fri, 11 Sep 2026 07:00:41 -0700 (PDT)
Message-ID: <36c57293-1448-4283-ac85-5507d9cc637a@suse.com>
Date: Fri, 11 Sep 2026 16:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <e1b02a7a-24b4-4500-a690-313c823280f6@suse.com>
 <895ad4e5-37cd-4a1e-bc49-9a69ab00a920@gmail.com>
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
In-Reply-To: <895ad4e5-37cd-4a1e-bc49-9a69ab00a920@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1789135241-F520877B-77F8E77B/0/0
X-purgate-type: clean
X-purgate-size: 3173

On 11.09.2026 15:57, Oleksii Kurochko wrote:
> 
> 
> On 9/10/26 5:28 PM, Jan Beulich wrote:
>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>>>       return copy_guest(buf, gpa, len, GPA_INFO(d),
>>>                         COPY_to_guest | COPY_gpa);
>>>   }
>>> +
>>> +/*
>>> + * Read machine word from guest memory
>>> + *
>>> + * @guest_addr: Guest address to read
>>> + * @read_insn: Flag representing whether we are reading instruction
>>> + * @trap: Output pointer to trap details if something went wrong during read
>>> + *
>>> + * The hlv/hlvx instructions translate guest_addr through the live
>>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>>> + * space of the currently running vCPU.
>>> + *
>>> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
>>> + * wider than 32 bits are not supported. Such an encoding cannot be completed
>>> + * by calling this function again at @guest_addr + 4: the length check is
>>> + * applied to the first halfword read, which would then be a continuation of
>>> + * the instruction rather than its opcode. It is up to the caller to reject
>>> + * anything that is neither a 16- nor a 32-bit encoding.
>>> + */
>>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
>>> +                               struct trap_info *trap)
>>> +{
>>> +    /*
>>> +     * Poison the result: if the very first access faults, the fixup skips
>>> +     * over the loads without writing it. Callers must check trap->scause.
>>> +     */
>>> +    unsigned long val = ~0UL, tmp;
>>> +
>>> +    /*
>>> +     * hlv/hlvx use hstatus.SPVP for the privilege of the access, and the
>>> +     * live vsatp/hgatp for the translation. Xen never installs a value of
>>> +     * its own in hstatus (it is only saved on trap entry and restored
>>> +     * before sret) and it doesn't reschedule before returning to the
>>> +     * guest, so all three still belong to the vCPU which trapped.
>>> +     *
>>> +     * Check the saved copy rather than the live CSR: a nested trap taken
>>> +     * from HS-mode clears hstatus.SPV in the CSR (but leaves SPVP alone).
>>> +     */
>>> +    ASSERT(vcpu_guest_cpu_user_regs(current)->hstatus & HSTATUS_SPV);
>>[...]
>> Question being of how much value
>> that checking is: vcpu_guest_cpu_user_regs(current)->hstatus can't possibly
>> have SPV clear, can it? Only nested exception frames could.
> 
> Given that vcpu_guest_cpu_user_regs(current)->hstatus will always have 
> SPV set for any valid guest trap frame, the ASSERT is purely a defensive 
> sanity check to ensure riscv_read_guest() is never called outside a 
> guest trap context.

It is not, afaict: vcpu_guest_cpu_user_regs(current) will give you the guest
frame no matter what context you're in. For what you want, you'd need to
pass struct cpu_user_regs * into here.

Jan

> Would you prefer to keep this defensive ASSERT (with 
> the updated comment), or drop it as redundant?
> 
> Thanks.
> 
> ~ Oleksii
> 


