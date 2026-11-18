Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041C1606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ahuaR7Z8
Received: from list by lists.xenproject.org with outflank-mailman.1494784.1694118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThfU-0000cl-Ak; Wed, 18 Nov 2026 15:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494784.1694118; Wed, 18 Nov 2026 15:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThfU-0000ce-70; Wed, 18 Nov 2026 15:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1494784;
 Wed, 18 Nov 2026 15:33:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xThfS-0000cY-Dj
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:33:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xThfR-00577V-MV
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:33:49 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc553-2eae-0a2a0a5409dd-0a2a450a8650-14
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:33:49 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc55b-f2d2-0a2a450a0019-d1558032e8d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:33:47 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so7847145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 07:33:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656095f2csm5146726f8f.40.2026.11.18.07.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:33:46 -0800 (PST)
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
        d=suse.com; s=google; t=1795016027; x=1795620827; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWY3pwm8G0CH5mXCQfPSkMTlhzQGUpPLb9c0LRJHyqk=;
        b=ahuaR7Z86RlDY/dfjUO2zaBdleXIZDiQ/Y4R+EEBZ4nsVWoUSPtyd+XDo+7RrxulEV
         Vs2U1ZeyLSKiVpdfkFM2nmV4mqAm2m487D6bbOCZprG0s18fw3WVvepnAGHOLNszl5Rz
         8J+1bdGa9iv5aEt1PbNtoC5jaWbgxYTXk6O8akmL2argeT9C+9aQphQ/8l65rW6KIc8D
         SaiBAsSl4ewtcbhE4v4+64Mh+G6KGC6iPxTpLEohF1MxQpwxgHrb51Q/3kFBdRV5fyD3
         1IYCMc0B56lvd2jgBAxfR5TZejOA6C8YIpwcf/gfVi/CbrZ/Jb4Ys65I2CrqkVfOHxX4
         A2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016027; x=1795620827;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EWY3pwm8G0CH5mXCQfPSkMTlhzQGUpPLb9c0LRJHyqk=;
        b=UGl3whmjJg5DGy5vBVxBs/ThuR6lSfUJsMJPBnbrY4NyfJSqsQUz71dokXiZvKyysV
         igF3DGgiVAE1vGJydxnyl09zTQLOUuAi0dcIFQ2+hIh5mq9xnAfisI/u8lbFmIJqQeBC
         1Bhe6ZYS7TofFzUTxm5S2Mtc+RqQ8NgN07MZoU9XpP3q+215qTbsYJJxcDA7f7GPmiEt
         V/lvjOz7gXUCgMl7jUoWxCugv+/a0L46ngbLUXDyiFJW7Bl99+4u6uq/mQ8RrNz/z5et
         ReCg0Vu1trGs2meaYgVM4wULbJLvJMyluIsBcHBZ96Y5p1SE8WcID6ZSTcc2J6LX9wtX
         iEkA==
X-Forwarded-Encrypted: i=1; AL+hErH4KWTZA7/sNWnPynG8cK7pjf0hmTxlJ1i+FkhUrfd1xvSAEXAyYNOdGx229R/9UfDj4BNoQmXZioc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+4tmuDGfYOwm0LMCe3ciRTRXWBa7TRW028cNmao7aZbn7P0Ayn
	fBCgfY1yWNfloZ9tE0Z3Au56zNXpcC8eCIeqFU7ZICr26hx7ys9b8NVYeb/P6rzZBg==
X-Gm-Gg: AYBFou0ot/CQ6XxMfIfUWeZlDlAuWMj6VxjKaRMETsvaJ0ZI0qCXyBrHVRztP9vy/O1
	MFdN570aFx1u4679PU2107Uvu5Hb8YdqzAQwLDtKUpZ4/d0TYYXjtXSzKBTAuQ8JDdWQhhCZFMD
	MYjpNo8WgCPJIZQZmfYtvYO2xURx5pr1oVBLYOzhFfZO6Gyt/+V+iU5gYQPcl/1iRCKEVWPuiO5
	wDWLBF6CrIdzkUjXt31Hner/TstmyzvGqOE/2udBYuuCPagHnZbGT1it276srWg+CgV88Zr2pzt
	mtYi8DiqZ/PwXhsRSJYKSEdO3nhmH96TXHrrX5nhuaUAYe+9LaW3iaSZsIDpB+/WhsLKdGgBDZw
	jBAOpXOvLJoh5Vi5zEF8ZATkAmUMXDrjKkMXwo2L9TADf5SgoJk/1nmYBYRfSshUW0IZDASbRso
	OLKxyFK0DDa3bCppFjh2obB/w3IbFieWlJ5BtGi3jABj2KyBYOZokusG4ANZab9gYJc/Pnn3jGB
	mySup7/izRsn2g8LNGeoZgVgsgWlhq6fKQJ6rHvgRuDhBNWO8EjiD1urjvVnaGn33fMqD6mpo5r
	axuEKtdwMy/qQ06tu4dB9EOU3y0H3/Q+gI+DT6Tct+wzywGqJWBgHsZgwoaIcubnCNrzC9K3fwv
	DybQM3hETgBA7bTqDZA==
X-Received: by 2002:a05:600c:8b5c:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb7da13a97mr62650745e9.8.1795016026580;
        Wed, 18 Nov 2026 07:33:46 -0800 (PST)
Message-ID: <dd71f48b-f39c-4b7c-b298-f392686f5749@suse.com>
Date: Wed, 18 Nov 2026 16:33:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/28] x86/hvm: avic: add AVIC_INCOMP_IPI VMEXIT
 handler
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-9-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-9-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795016027-52ADCCFC-84777B96/10/78276251493
X-purgate-type: spam
X-purgate-size: 3893
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> @@ -235,6 +236,120 @@ void svm_avic_vmcb_destroy(struct vcpu *v)
>      vmcb->avic_vapic_bar = 0;
>  }
>  
> +/*
> + * Handle the AVIC_INCOMP_IPI #VMEXIT when AVIC is enabled.
> + *
> + * The hardware generates this fault when an IPI could not be delivered to
> + * all targeted guest virtual processors because at least one guest virtual
> + * processor was not allocated to a physical core at the time.
> + */
> +void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs)
> +{
> +    struct vcpu *v = current;
> +    struct domain *d = v->domain;
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    const struct vmcb_struct *vmcb = sv->vmcb;
> +    uint32_t icrh = vmcb->exitinfo1 >> 32;
> +    uint32_t icrl = vmcb->exitinfo1;
> +    uint32_t id = vmcb->exitinfo2 >> 32;
> +    uint32_t index = vmcb->exitinfo2 & 0x1FFU;

0x1ffU please, to have the U better stand out.

> +    if ( id >= AVIC_IPI_FAILURE_MAX )
> +    {
> +        domain_crash(
> +            d, "%pv: AVIC: Unknown IPI interception (exitinfo1=%#"PRIx64" exitinfo2=%#"PRIx64")\n",
> +            v, vmcb->exitinfo1, vmcb->exitinfo2);
> +        return;
> +    }

Why can this code not live in the default: case further down?

> +    BUG_ON(sv->avic_physical_id == NULL);
> +
> +    switch ( id )
> +    {
> +    case AVIC_IPI_FAILURE_INVALID_INT_TYPE:
> +        /*
> +         * AVIC hardware handles the delivery of IPIs when the specified
> +         * Message Type is Fixed (also known as fixed delivery mode) and the
> +         * Trigger Mode is edge-triggered. The hardware also supports self and
> +         * broadcast delivery modes specified via the Destination
> +         * Shorthand(DSH) field of the ICRL. Logical and physical APIC ID
> +         * formats are supported. All other IPI types cause a #VMEXIT, which
> +         * needs to emulated.
> +         */
> +        gprintk(XENLOG_ERR,
> +                "%pv: AVIC: Invalid IPI type (icr=%#08x:%08x, idx=%u)"
> +                " avic_physical_id=%#"PRIx64"\n",
> +                v, icrh, icrl, index, ACCESS_ONCE(*sv->avic_physical_id));
> +
> +        vlapic_reg_write(v, APIC_ICR2, icrh);
> +        vlapic_reg_write(v, APIC_ICR,  icrl);

Is this legitimate in x2APIC mode? Also, if this is what you introduce
vlapic_reg_write() for, wouldn't this better be a dedicated ICR writing
helper anyway?

> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -291,6 +291,13 @@ enum VMEXIT_EXITCODE
>      VMEXIT_BUS_LOCK         = 165, /* 0xa5 */
>      /* Remember to also update VMEXIT_NPF_PERFC! */
>      VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
> +
> +    /*
> +     * AMD64 Architecture Programmer's Manual Volume 2: System Programming
> +     * Table 15-22. Guest vAPIC Register Access Behavior
> +     */
> +    VMEXIT_AVIC_INCOMP_IPI  = 1025, /* 0x401 */
> +
>      /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
>      VMEXIT_INVALID          =  -1

Please pay attention to the pre-existing comments here.

> --- a/xen/arch/x86/include/asm/hvm/svm-types.h
> +++ b/xen/arch/x86/include/asm/hvm/svm-types.h
> @@ -25,6 +25,16 @@ struct svm_domain {
>      uint64_t *avic_physical_id_table;
>  };
>  
> +/* AVIC_INCOMP_IPI #VMEXIT reason. */
> +enum avic_ipi_failure_cause {
> +    AVIC_IPI_FAILURE_INVALID_INT_TYPE       = 0,
> +    AVIC_IPI_FAILURE_TARGET_NOT_RUNNING     = 1,
> +    AVIC_IPI_FAILURE_INVALID_TARGET         = 2,
> +    AVIC_IPI_FAILURE_INVALID_BACKING_PAGE   = 3,
> +    AVIC_IPI_FAILURE_INVALID_IPI_VECTOR     = 4,
> +    AVIC_IPI_FAILURE_MAX,

As per the comment towards the top, this last one shouldn't be needed
(or else it's mis-named). I also don't see why for the others explicit
values would need assigning.

Jan

