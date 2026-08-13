Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEF6C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:40:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390249.1630757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXXF-0001Zq-Lh; Thu, 13 Aug 2026 15:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390249.1630757; Thu, 13 Aug 2026 15:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXXF-0001Za-Hh; Thu, 13 Aug 2026 15:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1390249;
 Thu, 13 Aug 2026 15:40:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuXXE-0001ZJ-Cm
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:40:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXXD-00GDxd-Px
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:39:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7de541-2eae-0a2a0a5409dd-0a2a4504cc0c-16
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:39:59 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7de54f-b57f-0a2a45040019-d155802ff08d-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:39:59 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4953e04ef16so435735e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:39:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499851141bfsm22865015e9.2.2026.08.13.08.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 08:39:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786635599; x=1787240399; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4q0fxP5wBDJlq2VjCkO83xALUPClcrEWGu0tlrgm1w=;
        b=Hd6ZvHASK0pAM8GUtKVWo71QmxZC3OR9qGjetiNtERJLnKQCUSScPenLaK8nq5iplE
         BIRkOI7tbcVVwy5tAPlzi7K7/plL0h7RDLZ4QSfN3xjuHC5i019MrQ6UtzBrSV/KqzLo
         K7ZntQWgWjCPbXROHkpZsnYnhAuuR4bU4QN7H0hbgrZuRIz+V1EXLDsTFh1qVWy/FClR
         ZOtxgImtShPe91Bnh6QCg00nUEm18DBvdHxxTSdx4b3yPQnjOcAZMDm0IqGbMwrB+UCF
         lEmtwyDrlhh4g5aoQw6YG2P62WhkN0qokuUwQ36yjXgCCvByv3VGccZBbVZGrBrMsdz8
         Au0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635599; x=1787240399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4q0fxP5wBDJlq2VjCkO83xALUPClcrEWGu0tlrgm1w=;
        b=nuVqf7Wo6vkz2OIZzgs/wrO07ZIPqZC2SbnnHzAkDYCkBEZenzbwlsBGSChBYBhJAP
         SLk2tTatoVYjTFtDcjociykLlK8g7ZEuwE1IVv08MbzlvVvx18wqpNb2CwZf3u8jrYSv
         oidPhwsak+UsOKn/m35CJcFtGEBWZ/xmiOKLdkIzH0fOGKIoLM9L7Dt46wX2krYHLLrY
         xYxGyynUJuqqZFPq7DB16oPPLUsj9ccdKWUVy/leasXCAAcOYkfrKbMUDUcY1mdJPj26
         Azm4ZySpVpADJqsE0XRkW2lP7RZmZ3u8zAPx1SaVmSwFYqVjm1RO8hxmicX1wJ1Z+77y
         J/yw==
X-Gm-Message-State: AOJu0YxpPFgGbDCIZ0zeM27PGUVhB5bJDWujhAta2mTLiD0AFtrfqtle
	cQwiLx3POJgYu8dani8lhIiAlL4J5JmQVH9TGGgYZMKUx0bFZQ7Ez7NcElTRNA==
X-Gm-Gg: AR+sD10T7XOHz2dmblTWitYKNjJT+A8ZYjR4Nko6PLny/WrBPPcPOdoiEE4wW8lNn9x
	MPVMzuH8Z6+BiklkqqDtcoMhGiIbiOBW31RRhzjWkmfUBLFMDX7QZ7sGflzGsEker7cafBUED+7
	RT/wj+OuNAcDk82cnfGYCJ6fWy+oPA5fbhWYse70rajh/Wew7PaotK85LOARQevWzvc/uZmsp+e
	Eny2XKbC1bGk7gAATSxXNKRIKFPy1JtK4p/zs7Npj7tc7mgyPnbzNFBJElj3gSdvyiIAEdniivs
	3d6+q+t6rOY+r6hsGkngKGsrh1Y367gpzubXRzvh3/HtoXZvoQgdVBldOpWMf0iFV2txlpQyklc
	HSCWbunHzzCQYiPhZR1sKn1dimbCq7m1R03Qu7bYU4WTXx9gQ4mvpUHER4k9A53VKa5PSDu0QzD
	HU5EfnhKLean72dHNHxKdcHpVp8EHHzIqDNsqp5Q/q/RKM6kpizo3bAHJhRyiMNVbEPsk8pOl8w
	dRlBBJ1Nt5c9HrTqxvUxK5KhhfbCVyDha+9lCnav+w=
X-Received: by 2002:a05:600c:e558:20b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-49984ad90cemr39588075e9.17.1786635598925;
        Thu, 13 Aug 2026 08:39:58 -0700 (PDT)
Message-ID: <efc18770-3889-4d87-969d-c75ad82cfbc0@gmail.com>
Date: Thu, 13 Aug 2026 17:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/20] xen/riscv: introduce per-vCPU IMSIC state
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
 <d78555b8b7b683f72a2668d8d2e2da3f89a4fc06.1785836421.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d78555b8b7b683f72a2668d8d2e2da3f89a4fc06.1785836421.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786635599-510DDB50-0B5A2297/10/73395122804
X-purgate-type: spam
X-purgate-size: 5092



On 8/4/26 5:48 PM, Oleksii Kurochko wrote:
> Each vCPU interacting with the IMSIC requires state to track the
> associated guest interrupt file and its backing context.
> 
> Introduce a per-vCPU structure to hold IMSIC-related state, including
> the guest interrupt file identifier and the CPU providing the backing
> VS-file. Access to the guest file identifier is protected by a lock.
> 
> Initialize this structure during vCPU setup and store it in arch_vcpu.
> The initial state marks the VS-file as software-backed until it becomes
> associated with a physical CPU.
> 
> Add helper to retrieve the guest interrupt file identifier:
> - vcpu_guest_file_id() is going to be used during update of APLIC's
>    target register with the pair of information <guest_file_id, cpu_id>
>    (to have MSI delivery mode work properly) when guest is trying to
>    access vAPLIC's target register.
> It will be used in the follow up patches.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v6-7:
>   - Nothing changed. Only rebase.
> ---
> Changes in v5:
>   - Move v->arch.vimsic_state = imsic_state; after full initialization of
>     the struct, so the pointer only becomes globally visible once all
>     fields are set up.
>   - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
> ---
> Changes in v4:
> -  s/w vs h/w IMSIC VS-file commentary for struct vimsic_state:
>     - fix the vsfile_pcpu h/w condition:
>       "vsfile_pcpu >= 0" -> "vsfile_pcpu < NR_CPUS"
>       (the old wording conflicted with the s/w "== NR_CPUS" case).
>     - reorder both comment blocks to the "s/w ... / h/w ..." form for readability.
>   - drop IMPOSSIBLE_GUEST_FILE_ID: the s/w IMSIC VS-file is always available
>     and corresponds to guest_file_id == 0, which xvzalloc() already provides,
>     so the explicit initializer in vcpu_imsic_init() and the macro itself
>     are unneeded.
> ---
> Changes in v3:
>   - Drop const from imsic_set_guest_file_id() and vcpu_imsic_deinit() as
>     it only works due to vimsic_state being a pointer member.
>   - Use XVFREE() in vcpu_imsic_deinit() to make it idempotent.
>   - Fix SW-file typo in struct vimsic_state comments; should be VS-file.
>   - Drop imsic_set_guest_file_id() here, it will be added later when it
>     will be nessary to initialise guest file id as the correspondendt code
>     in this patch series was reworked and there is no need to use this
>     function in arch_vcpu_create().
>   - Introduce IMPOSSIBLE_GUEST_FILE_ID and init with it ->guest_file_id.
> ---
> Changes in v2:
>   - Rename imsic_state to vimsic_state.
>   - Use 'unsigned int' for vsfile_pcpu.
>   - Drop initialzation of ->guest_file_id as it will be by default zero.
>   - Add the comment about ->guest_file_id field.
>   - Drop __init for vcpu_imsic_init() as it could be used during post-boot
>     vCPU creation.
>   - Update the commit message.
>   - Drop locks around ->guest_file_id() in  vcpu_guest_file_id() and imsic_set_guest_file_id().
> ---
> ---
>   xen/arch/riscv/imsic.c              | 35 +++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/domain.h |  2 ++
>   xen/arch/riscv/include/asm/imsic.h  | 22 ++++++++++++++++++
>   3 files changed, 59 insertions(+)
> 
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index f7b70a8da09e..5a5758e45dc2 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -16,6 +16,7 @@
>   #include <xen/errno.h>
>   #include <xen/init.h>
>   #include <xen/macros.h>
> +#include <xen/sched.h>
>   #include <xen/smp.h>
>   #include <xen/spinlock.h>
>   #include <xen/xvmalloc.h>
> @@ -56,6 +57,11 @@ do {                            \
>       csr_clear(CSR_SIREG, v);    \
>   } while (0)
>   
> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
> +{
> +    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
> +}
> +
>   void __init imsic_ids_local_delivery(bool enable)
>   {
>       if ( enable )
> @@ -312,6 +318,35 @@ static int imsic_parse_node(const struct dt_device_node *node,
>       return 0;
>   }
>   
> +int vcpu_imsic_init(struct vcpu *v)
> +{
> +    struct vimsic_state *imsic_state;
> +
> +    /* Allocate IMSIC context */
> +    imsic_state = xvzalloc(struct vimsic_state);
> +    if ( !imsic_state )
> +        return -ENOMEM;
> +
> +    /* Setup IMSIC context  */
> +    rwlock_init(&imsic_state->vsfile_lock);
> +
> +    /*
> +     * xvzalloc() already cleared the context, so guest_file_id == 0, i.e. the
> +     * always-available s/w IMSIC VS-file. Only vsfile_pcpu needs an explicit
> +     * initializer as its s/w VS-file value is NR_CPUS rather than 0.
> +     */
> +    imsic_state->vsfile_pcpu = NR_CPUS;
> +
Considering our conversation in another patch series vsfile_cpu would be 
better name. Don't you mind if I will change vsfile_pcpu -> vsfile_cpu 
and everywhere it is needed in this patch with saving of your Acked-by?

~ Oleksii

