Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21804C624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:43:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406018.1639457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mB8-0004y4-BT; Wed, 02 Sep 2026 14:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406018.1639457; Wed, 02 Sep 2026 14:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1mB8-0004xx-6i; Wed, 02 Sep 2026 14:43:06 +0000
Received: by outflank-mailman (input) for mailman id 1406018;
 Wed, 02 Sep 2026 14:43:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1mB6-0004xo-UN
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:43:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1mB5-00H12L-3i
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:43:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9835e5-2eae-0a2a0a5409dd-0a2a4508a2e8-32
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:43:03 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9835f6-f659-0a2a45080019-d155da2fec95-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:43:03 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c25b661d37dso173330766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 07:43:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c25cffc5cd9sm152327366b.6.2026.09.02.07.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 07:43:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360182; x=1788964982; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnS0O81H1ol9JvrVgUlqr/z68wE3I+O0ZA3sQWlSm+Y=;
        b=dfRcensXg180Hdcxt3zA1O5l+MY2QpU3/0Z6DqJUr6Pf5Oyg1sGzUp0wXUfaeonJiv
         swZ+ze0Ed97GnvXVk71VyaisEa9wB8XHGmgybMdUb7w/HtWpbcHKOryjIvn1FW0fAzWe
         g3rXlXRPx9H4UboRTXuimnWo99jFSCMFLKlcr5zmBo2HyKFlRfAaahha8qwqUy3YXwPj
         ncg258rQT3NiTuqBJ/QS1vNTQUhT3s14mMpF2K3b3eUHVOp8Oht7uCZY+aOzNqy130Rv
         3et9PGdcdnGUa27+zaBOk/rwkG4KjA3Q0dAQ9Mt7rScJ11l5nEVKJSIhMUUPoirunhfI
         2b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360182; x=1788964982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AnS0O81H1ol9JvrVgUlqr/z68wE3I+O0ZA3sQWlSm+Y=;
        b=E655d6WAFkh8sN1aecC2HgC+zeBCv0fJnQPR4T/Zc6H9jcPueRuclNu1zmBDvFJfDa
         Wft+MBloepkDtdw1lH9QwKXv5OmSRGsKktZhTR57MjuWSye0T5O9vLpyzes8PbQe2+zQ
         cVVVVOWjXamr7MUA64gGq088Yl96k12AbrRz3AogbOpHQc7jxtBhmfoTUVNgPjoerL4n
         GYxk10GBWn7c2ULNctWMhbB9pN+Y5vm/0fsTVca+mjz1b1vh0XE5nxpSnHCy3EAuA3zv
         VjdUA/dMy6W3pmwCJVacj8wR4BEh4G6DZegM5DPwJcYSBZiAbqkTZbiJK4vCrsnuul0W
         119w==
X-Gm-Message-State: AFuF++mYB3TkRQtoTDUDeKfTvsI4eKDIaIcgx/nhIjhZr96BzUvuv1aZ
	5bmYdd4Ka7/htF06AtRD96gle+/s1rTuVIYwB8NnFwJSRFICR0S9uepoXexFVg==
X-Gm-Gg: AYBFou0yMdxL1VQIpewhi1vcJ8oUOfivjcqxajdwLHwM1YIazgJ/1wSnJtWlgrR/YKK
	CMXPZ5oF3JUegPI2hrkoi3bfHKUAWPqnR2Nj5qa93zxPN30zc55Xhq1q6u1UgWBY97Jmo275zK5
	tStxbnAXU+c81yimK10NKvitZtt0CjsdBvcOPFOe1j+xElAfXopbY20aEa1GTijZZEyrCsWGnZt
	cdjulDAyEjxBBytlmuJIB65RKCri9LNb723avp+ykc/IhaY/JU7jci6/ZTcyU+QdZe9NU/jNgIh
	j8SNxsRsaTZLgVvezzHkpNJuyx51caoByeRyy9NYxtwHKHYRKBcgky8G+S79jgj6aAP2YUJy5Fh
	se5hU/xNUqgCqt3GuU/pJ5UmOvpn6XVhv8JraS5lYcwzjpY3RMF8Fc6kNpqAflK1HBAH4c3qBw7
	sSv4Lh+I7mDh7xN4f5NuSlzaBR5XyoWzr+Wr2xTuZnaFgDjoGLY6izifG5FaqIAwwPmS6LRw4hJ
	/NI/CY4MalNNLxlIKEWAK9aDYsgx0oFS03JX+d0MA==
X-Received: by 2002:a17:906:6a05:b0:c16:6a42:c7d6 with SMTP id a640c23a62f3a-c25d52b8474mr393398466b.9.1788360182507;
        Wed, 02 Sep 2026 07:43:02 -0700 (PDT)
Message-ID: <1fb1593e-b192-40ad-878c-6e53d44066f5@gmail.com>
Date: Wed, 2 Sep 2026 16:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/39] xen/riscv: implement vCPU context switching
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8848874c69f00fbfcf6ad75a39e28479a4cdd08b.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788360183-CC57487B-69C26CBF/10/73395122804
X-purgate-type: spam
X-purgate-size: 3580



On 8/27/26 5:20 PM, Oleksii Kurochko wrote:
>   }
>   
> +static void save_csr_regs(struct vcpu *vcpu)
> +{
> +    /*
> +     * There is no need to save these CSRs as only hypervisor writes them in
> +     * restore_csr_regs() and guest can't access them so they shouldn't be
> +     * stored here. Keep them commented here just for symmetry with the
> +     * restore CSRs register part.
> +     *
> +     * vcpu->arch.hedeleg = csr_read(CSR_HEDELEG);
> +     * vcpu->arch.hideleg = csr_read(CSR_HIDELEG);
> +     * vcpu->arch.henvcfg = csr_read64(CSR_HENVCFG);
> +     * vcpu->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
> +     * vcpu->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
> +     *
> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +     *     vcpu->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
> +     */
> +
> +    vcpu->arch.hvip = csr_read(CSR_HVIP);
> +
> +    vcpu->arch.vsstatus = csr_read(CSR_VSSTATUS);
> +    vcpu->arch.vsie = csr_read(CSR_VSIE);
It should be heere csr_read64() (accidentally this changed moved to the 
next patch).

> +    vcpu->arch.vstvec = csr_read(CSR_VSTVEC);
> +    vcpu->arch.vsscratch = csr_read(CSR_VSSCRATCH);
> +    vcpu->arch.vscause = csr_read(CSR_VSCAUSE);
> +    vcpu->arch.vstval = csr_read(CSR_VSTVAL);
> +    vcpu->arch.vsepc = csr_read(CSR_VSEPC);
> +}
> +
> +static void restore_csr_regs(struct vcpu *vcpu)
> +{
> +    csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
> +    csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
> +    csr_write(CSR_HVIP, vcpu->arch.hvip);
> +    csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
> +    csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
> +    csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +        csr_write(CSR_HSTATEEN0, vcpu->arch.hstateen0);
> +
> +    csr_write(CSR_VSSTATUS, vcpu->arch.vsstatus);
> +    csr_write(CSR_VSIE, vcpu->arch.vsie);

It should be heere csr_write64() (accidentally this changed moved to the 
next patch).

> +    csr_write(CSR_VSTVEC, vcpu->arch.vstvec);
> +    csr_write(CSR_VSSCRATCH, vcpu->arch.vsscratch);
> +    csr_write(CSR_VSCAUSE, vcpu->arch.vscause);
> +    csr_write(CSR_VSTVAL, vcpu->arch.vstval);
> +    csr_write(CSR_VSEPC, vcpu->arch.vsepc);
> +}
> +

[...]

> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
> index 15e8fa19685e..90ed584bb844 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -29,6 +29,12 @@ struct arch_vcpu_io {
>   struct arch_vcpu {
>       struct vcpu_vmid vmid;
>   
> +    /*
> +     * The last CPU this vCPU ran on. Initialised to NR_CPUS
> +     * (never ran).
> +     */
> +    unsigned int last_cpu;
> +
>       /*
>        * Callee saved registers for Xen's state used to switch from
>        * prev's stack to the next's stack during context switch.
> @@ -60,11 +66,19 @@ struct arch_vcpu {
>       register_t hcounteren;
>       register_t hedeleg;
>       register_t hideleg;
> -    register_t henvcfg;
> +    uint64_t   henvcfg;
>       register_t hstateen0;
> +    uint64_t   htimedelta;
>       register_t hvip;
>   
>       register_t vsatp;
> +    register_t vscause;
> +    register_t vsepc;
> +    register_t vsie;
It should be uint64_t.

> +    register_t vsscratch;
> +    register_t vsstatus;
> +    register_t vstval;
> +    register_t vstvec;
>   
Sorry for inconvenience.

~ Oleksii

