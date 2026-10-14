Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898D7CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 12:04:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448885.1664877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxiN-0001HL-Ks; Wed, 14 Oct 2026 12:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448885.1664877; Wed, 14 Oct 2026 12:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxiN-0001HE-Hl; Wed, 14 Oct 2026 12:04:11 +0000
Received: by outflank-mailman (input) for mailman id 1448885;
 Wed, 14 Oct 2026 12:04:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGxiM-0001H8-OM
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:04:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxiL-00GOyP-U5
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:04:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13a4c5fce0008425@swg.vates.tech>)
 id 6acf6fb2-e002-0a2a0a5209dd-0a2a4509dbc6-40
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:04:09 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13a4c5fce0008425@swg.vates.tech>)
 id 6acf6fb9-be1a-0a2a45090019-b9ff1c12a30f-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:04:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13a4c5fce0008425.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 12:04:06 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 007CF81DF2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:04:03 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=lVZY4m8lq60yyKfkLI9HNVvE+A7IfZPVIooGJDCfPF4=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=TcXal8Wqn4Hqdb8FNDdZo6f1yuQ06M8ENgNWkDAAoz9sZ0vHFBjobufLVMuaJxQ++VKfaCuss
 PSXstVZk36CBamQZ4WitZwmij/snUFKulj96+xcIGiPBw75dCM+1uShJvrUHKGPja9UMAZxOIIB
 eO+FEqTjyMjEKa/11h5NpMeb+51zLdffsE8iPKYUIyI6/5XTrIL111K7qEwWzCCw+QhpCtnPVEr
 Mijnc5Mk9mb0y8SmA8l3PBKAB6/UyG3uOlDrzIE1tMT8VUKEcFqSghR8t2QjuDzd42XUVOHJxAr
 565Xk2n33r4um2CAjzJnCK7WBT3tAxQgKMGV7QnzRy/Q==
X-Zone-Loop: 2e12086df38e1b4c07fe3cf8839b59f9d48427a28f70
x-campaign-type: default
x-transaction-id: 4aca05ae-54da-40e0-9f01-40b6cf0f1ed0
x-swg-uid: 01-0d082fdd-e87a-4d6b-8685-451fef1fea02
X-Mailer: Sweego
Message-ID:
 <1791979446.8631fc262581453bbf619ec5b2062170.1a13a4c5fce0008425@vates.tech>
x-swg-bid: 1791979446.8631fc262581453bbf619ec5b2062170.1a13a4c5fce0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 14 Oct 2026 14:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] xen: make config argument const
To: xen-devel@lists.xenproject.org
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
 <1791812541.8631fc262581453bbf619ec5b2062170.1a130599b7500080d7@vates.tech>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <1791812541.8631fc262581453bbf619ec5b2062170.1a130599b7500080d7@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791979444040
X-purgate-ID: tlsNG-bad1c0/1791979449-3BED6034-18812A6C/10/78276251493
X-purgate-type: spam
X-purgate-size: 8299



On 10/12/26 3:44 PM, Julian Vetter wrote:
> arch_sanitise_domain_config() validates the configuration requested by
> the toolstack, and should not fill anything in. The config struct passed
> to createdomain is supposed to be pure input. ARM used to abuse this
> (GIC_NATIVE resolution, now removed) to smuggle output back to the
> toolstack. Making the parameter const stops that type of abuse from
> happening on any architecture.
> 
> The x86 implementation turned out to have its own instance of the same
> issue. It set XEN_DOMCTL_CDF_oos_off into config->flags for non-HVM
> guests. Since The sanitisation runs before the function domain_create()
> copies config->flags into d->options, this relied on mutating the
> toolstack's config to take effect. Move the default onto d->options
> directly in arch_domain_create() (which runs after d->options is
> populated), where all the remaining domain options are resolved. This
> has the same effect and no mutation of the input config is required.
> 
> ARM, PPC and RISC-V need no equivalent change, Their implementations
> were already read-only.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # x86
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
LGTM on riscv.
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech> # riscv> ---
> Changes in v7:
> - No changes.
> ---
>   xen/arch/arm/domain.c                   |  2 +-
>   xen/arch/arm/firmware/sci.c             |  2 +-
>   xen/arch/arm/firmware/scmi-smc.c        |  2 +-
>   xen/arch/arm/include/asm/firmware/sci.h |  6 +++---
>   xen/arch/ppc/stubs.c                    |  2 +-
>   xen/arch/riscv/domain.c                 |  2 +-
>   xen/arch/x86/domain.c                   | 16 ++++++++--------
>   xen/include/xen/sched.h                 |  5 ++---
>   8 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 4ca3a3749f..34b5a85f9f 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -557,7 +557,7 @@ static bool v8r_el1_msa_domain_sanitise_config(
>       }
>   }
>   
> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> +int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config)
>   {
>       unsigned int max_vcpus;
>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
> index aa93cda7f0..f73ed06092 100644
> --- a/xen/arch/arm/firmware/sci.c
> +++ b/xen/arch/arm/firmware/sci.c
> @@ -45,7 +45,7 @@ int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config)
>       return cur_mediator->domain_init(d, config);
>   }
>   
> -int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +int sci_domain_sanitise_config(const struct xen_domctl_createdomain *config)
>   {
>       if ( !cur_mediator )
>           return 0;
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> index a0cc6c6192..391df8b945 100644
> --- a/xen/arch/arm/firmware/scmi-smc.c
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -68,7 +68,7 @@ static bool scmi_handle_smc(struct cpu_user_regs *regs)
>   }
>   
>   static int
> -scmi_smc_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +scmi_smc_domain_sanitise_config(const struct xen_domctl_createdomain *config)
>   {
>       if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
>            config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC )
> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
> index 485ce211c9..1d566be8e2 100644
> --- a/xen/arch/arm/include/asm/firmware/sci.h
> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> @@ -32,7 +32,7 @@ struct sci_mediator_ops {
>        * it to sanitize domain SCI configuration parameters.
>        * Optional.
>        */
> -    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
> +    int (*domain_sanitise_config)(const struct xen_domctl_createdomain *config);
>   
>       /*
>        * Called during domain destruction, releases all resources, that
> @@ -101,7 +101,7 @@ int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config);
>    * Sanitise domain configuration parameters.
>    *
>    */
> -int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
> +int sci_domain_sanitise_config(const struct xen_domctl_createdomain *config);
>   
>   /*
>    * Destroy SCI domain instance.
> @@ -162,7 +162,7 @@ static inline int sci_domain_init(struct domain *d,
>   }
>   
>   static inline int
> -sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +sci_domain_sanitise_config(const struct xen_domctl_createdomain *config)
>   {
>       if ( config->arch.arm_sci_type != XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
>           return -EINVAL;
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index a333f06119..82a289af85 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -162,7 +162,7 @@ void arch_vcpu_destroy(struct vcpu *v)
>       BUG_ON("unimplemented");
>   }
>   
> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> +int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config)
>   {
>       BUG_ON("unimplemented");
>   }
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index d94652809e..cfce8e91fa 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -284,7 +284,7 @@ void sync_vcpu_execstate(struct vcpu *v)
>       /* Nothing to do -- no lazy switching */
>   }
>   
> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> +int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config)
>   {
>       return 0;
>   }
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 6ebe6c5052..368e4deff3 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -590,7 +590,7 @@ void arch_vcpu_destroy(struct vcpu *v)
>           ASSERT_UNREACHABLE();
>   }
>   
> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> +int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config)
>   {
>       bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
>       bool hap = config->flags & XEN_DOMCTL_CDF_hap;
> @@ -633,13 +633,6 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> -    if ( !hvm )
> -        /*
> -         * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear
> -         * for HVM guests.
> -         */
> -        config->flags |= XEN_DOMCTL_CDF_oos_off;
> -
>       if ( nested_virt && !hvm_nested_virt_supported() )
>       {
>           dprintk(XENLOG_INFO, "Nested virt requested but not available\n");
> @@ -833,6 +826,13 @@ int arch_domain_create(struct domain *d,
>   
>       spin_lock_init(&d->arch.e820_lock);
>   
> +    /*
> +     * It is only meaningful for XEN_DOMCTL_CDF_oos_off to be clear for HVM
> +     * guests.
> +     */
> +    if ( !is_hvm_domain(d) )
> +        d->options |= XEN_DOMCTL_CDF_oos_off;
> +
>       if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_121) )
>       {
>           if ( !opt_allow_unsafe )
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 73c54794ac..ce1fa636db 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -772,10 +772,9 @@ static inline void domain_update_node_affinity(struct domain *d)
>   }
>   
>   /*
> - * To be implemented by each architecture, sanity checking the configuration
> - * and filling in any appropriate defaults.
> + * To be implemented by each architecture, sanity checking the configuration.
>    */
> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
> +int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config);
>   
>   /*
>    * Create a domain: the configuration is only necessary for real domain


