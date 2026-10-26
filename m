Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B64606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kXykSvy5
Received: from list by lists.xenproject.org with outflank-mailman.1461530.1672558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMjl-0003Uk-3H; Mon, 26 Oct 2026 15:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461530.1672558; Mon, 26 Oct 2026 15:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLMjl-0003Ud-0f; Mon, 26 Oct 2026 15:35:49 +0000
Received: by outflank-mailman (input) for mailman id 1461530;
 Mon, 26 Oct 2026 15:35:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLMjk-0003UX-2C
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:35:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLMji-00EVeq-Vz
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 16:35:47 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf733f-bab6-0a2a0a5309dd-0a2a45088c1c-34
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:35:46 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6adf7352-f659-0a2a45080019-d1558032e15c-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 16:35:46 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a7992e2f7dso1896905e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 08:35:46 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a359fbc718sm169888085e9.2.2026.10.26.08.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 08:35:45 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028946; x=1793633746; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArKdPa6IZ/yJ/dSMZV5e1/c7JYalaff2uxtu7hJz/Hw=;
        b=kXykSvy5v3wcEZFXbxdQh2sEg78O7qJ3q15oOkINkXxWC0XUJOgZo6Cb7YADwjczCN
         jdG2cF78zsQKuq02whnSn5ocanSjb9Z0yWCAmghnxh7RYUsRJCkZuo5fvV19Ylaq8K6F
         b4fLAg8B2O/3e4HB13joHVsHaLWPgL4tskO/bTMT35oj25xFaBhIEbKvepcCorD1y50I
         lJbUsWA1dBFXCjlQwqrkv90Tp/N+czQT/RznnrZSfb9bkBC5a+pU+fYvIojMrNNJEMNT
         2rFTtNf8gTICmBjB/TbXsbnjQQzNfFGEgaPjZqSfEZRyTx5phJW6nF0T2YUktJ5LxuMT
         Zmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028946; x=1793633746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArKdPa6IZ/yJ/dSMZV5e1/c7JYalaff2uxtu7hJz/Hw=;
        b=BYp4dIBw5rt6v/Yl2les9tbA8IYhS4WHBo3ExJQ/HSk7foUipy9JbN05J6i+i/cHY/
         vfMYCSBPqZ3eQjE6/mODDd/SUDO/5vZSS86TWiEc7usIFR4/ngxViHMZ8gmZf4zM1pn3
         2QR5rNgNxL9m9QvjxOZ6d064adRwKqIEh2/Dj1P3FIMk40FBvfvnFLJICsVGIf80wfem
         LCKjO3D7WaXHaxTqOIVTBhPIDDCTyLuvDFsckmwlFV63/mjdIP6lvl5BdnXOtvGJBgtA
         wKWPjjlg2SfXr70JcKNc3YOzTzWYqPQVv0DtShXYgoclX+QGx2OJSs2d3biTUScpI49l
         Bq4g==
X-Forwarded-Encrypted: i=1; AKwUvBxAQjXjnYZd5s3nfWeo1kB8pwLYyxIl1sLJV1Nc28SFhgC4vgPIi48TMzRyBraiVMgPwbiynQ+tVRc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJJXL8i7ToKqnCAU6QsggPZz8ReDD6IjD3ZLjGXMDUe+9zgWVgH
	Y+Ha8KkfHUFGgTFnbAxQEvFPgKbwXxjaBLlL5wKuetE8MeWBO2oIVxYN
X-Gm-Gg: AYBFou1z1x0BsScNkGmSKY9IDpGRri98ewx2+pgBkzzng8Q+vRBK0yBO+mhQOApQ0Um
	jhPOJRPN+dAUjxo/+3Ht7GO4vaqJonI6dX60U33djPgW8hSNtB642ngcnvzutMtUHQ6Pi6LwqUw
	wkirYYU/d9GF8ReUxTZ1BzMTYKfPH2T+UJuhSvT8/+KbS6w2sYxxK2xPIveCvgdwR2N68GFV+3G
	T1SE21lbNjaEIn+9qcW4y7csqehAR2S62dQHoZOUaHySVn1sHZo9DPO4+YOOmIBp9nhrJpv3fUl
	VVuL/wXz/JJZvHKudEQuprdLnFW9kpQCtV8nHx3s1XDaswXxjL/Qo6lhiDMuwlDRbySEC41+UVR
	lgdU1IsiMtODle3g36AwZqX4x1jnyrLwf5fRqJJSOgvGdID7mXfUutr4BZz9SZcY9tmRRC3nncO
	2zwB2VPCabXo7UjsEUjjHthZ8x24PyLIIHZ6OuWhtmNQwSqyImMqD/BBqCsifPVxwUQCuLtYFrn
	YN199Y2BhYfKphI9ydqwkCG8B3dyOMQKzgrbF3oghx1RWxFcA0kVvxjMf5gexJU7IJu9C7eIqd1
	s7HJ4oFuG1prbxAG2kLU8HuHi1q7
X-Received: by 2002:a05:600c:1987:b0:4a2:1612:636e with SMTP id 5b1f17b1804b1-4a35ac8b2b2mr122043565e9.5.1793028946126;
        Mon, 26 Oct 2026 08:35:46 -0700 (PDT)
Message-ID: <9986e03e-bf09-46b6-9d2a-82a1864a59b5@gmail.com>
Date: Mon, 26 Oct 2026 16:35:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1793027589.8631fc262581453bbf619ec5b2062170.1a178c5c430000f79f@vates.tech>
 <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793027685.8631fc262581453bbf619ec5b2062170.1a178c73a5d000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793028946-CCB7187B-A912828A/10/73395122804
X-purgate-type: spam
X-purgate-size: 4651
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/26/26 4:14 PM, Baptiste Le Duc wrote:

>   
> +/*
> + * Probe whether hardware updates the PTE A/D bits by writing to a local
> + * variable through an alias mapping whose A and D bits are clear.
> + *
> + * Check the D bit rather than the A bit, as the A bit may be set
> + * speculatively while the D bit can't.
> + *
> + * Under Svade, the store raises a page fault instead, so use the extable to
> + * handle it.
> + */
> +static bool __init probe_hw_ad_update(void)
> +{
> +    unsigned int probe_target;
> +    vaddr_t va = FIXMAP_ADDR(FIX_MISC) + PAGE_OFFSET(&probe_target);
> +    pte_t *entry = &xen_fixmap[FIX_MISC];
> +    bool d_set = false;
> +
> +    ASSERT(!pte_is_valid(*entry));
> +
> +    /*
> +     * Any page in use will do, so alias the stack page this code runs on,
> +     * with A and D clear. Store to a variable of its own, so that nothing
> +     * the compiler relies on gets overwritten.
> +     */
> +    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(&probe_target)),
> +                                  PTE_VALID | PTE_READABLE | PTE_WRITABLE));
> +    flush_tlb_one_local(va);
> +
> +    asm_inline goto (

I think that generally this code should be wrapped by "#ifdef 
CONFIG_CC_HAS_ASM_GOTO_OUTPUT" but we can keep it as is here as we don't 
use output operands.

> +        "1: sw zero, 0(%[va])\n"
> +        ASM_EXTABLE(1b, %l[out])
> +        :
> +        : [va] "r" (va)
> +        : "memory"
> +        : out );> +
> +    d_set = read_pte(entry).pte & PTE_DIRTY;
> +
> + out:
> +    write_pte(entry, (pte_t){});
> +    flush_tlb_one_local(va);
> +
> +    return d_set;
> +}
> +
>   void __init riscv_fill_hwcap(void)
>   {
>       unsigned int i;
> @@ -674,6 +721,28 @@ void __init riscv_fill_hwcap(void)
>                  "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
>                  "wire up this platform's pause equivalent in cpu_relax()\n");
>   
> +    /*
> +     * The privileged spec allows exactly two schemes for updating the PTE A
> +     * and D bits:
> +     *  1) hardware sets them on access and on write;
> +     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
> +     *     so that software can set them (ratified as Svade).
> +     *
> +     * Every implementation uses one of them, but may predate the extensions
> +     * and advertise neither. In that case, trust the hardware probe.
> +     */
> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
> +         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
> +    {
> +        bool hw_update = probe_hw_ad_update();
> +
> +        __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
> +                  riscv_isa);
> +        printk(XENLOG_WARNING
> +               "Device tree advertises neither Svade nor Svadu, probed %s: add it to \"riscv,isa\"\n",
> +               hw_update ? "svadu" : "svade");
> +    }
> +
>       for ( i = 0; i < req_extns_amount; i++ )
>       {
>           const struct riscv_isa_ext_data ext = required_extensions[i];
> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
> index 2973eb13a5..b0a23be18e 100644
> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -8,13 +8,13 @@
>   #include <xen/types.h>
>   
>   /*
> - * These macros represent the logical IDs of each multi-letter RISC-V ISA
> - * extension and are used in the ISA bitmap. The logical IDs start from
> - * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
> - * letter extensions and are used in enum riscv_isa_ext_id.
> + * Logical IDs of RISC-V ISA extensions, used as bit positions in the ISA
> + * bitmap.
>    *
> - * New extensions should just be added to the bottom, rather than added
> - * alphabetically, in order to avoid unnecessary shuffling.
> + * Single-letter extensions use IDs below RISCV_ISA_EXT_BASE and are sorted
> + * alphabetically. Multi-letter extensions start from RISCV_ISA_EXT_BASE and
> + * follow the same order as riscv_isa_ext[] (see the ordering rules described
> + * above it).
>    */
>   #define RISCV_ISA_EXT_BASE  26
>   
> @@ -41,6 +41,7 @@ enum riscv_isa_ext_id {
>       RISCV_ISA_EXT_ssaia,
>       RISCV_ISA_EXT_sstc,
>       RISCV_ISA_EXT_svade,
> +    RISCV_ISA_EXT_svadu,
>       RISCV_ISA_EXT_svpbmt,
>       RISCV_ISA_EXT_MAX
>   };
> 

Generally, looks good to me:

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

