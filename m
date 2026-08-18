Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED67C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 15:10:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394267.1633099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLSZ-0008Jw-69; Tue, 18 Aug 2026 15:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394267.1633099; Tue, 18 Aug 2026 15:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwLSZ-0008Jp-3E; Tue, 18 Aug 2026 15:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1394267;
 Tue, 18 Aug 2026 15:10:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwLSY-0008Jj-D3
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:10:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwLSW-0039Az-IH
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 17:10:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8475d8-8faa-0a2a0a5109dd-0a2a45059f86-30
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:10:36 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8475ec-4cb1-0a2a45050019-d155802dc943-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 17:10:36 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so32187055e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:10:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100184sm305073375e9.1.2026.08.18.08.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 08:10:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1787065836; x=1787670636; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kG7Zaffwl0mxSN4K5nDR/1mjY7t5FTHW4GrkGQ7+s74=;
        b=KzQ6SXdycJE0W+Eox4NFTl7aAtmnyorqsO5lNN86CPTjrfuBY/Vpbsy/hp64hEczbZ
         owLsXTiIrVaZLi51bqoA2/FnnXUv42A7tdW3T0999AZZ2MDoAkOhaH4s0IoxRlXwAwIC
         rfUZVMVolenOFZz6the14ilpHnksCI/Wg7MxlDHSWNqlQzerrcYDvKyKVpZnV6aJ80/Z
         cOAOQPKcGd/UEjtiGE/ZT77b39483F96tPgA78g5RXj/VCtdrDSqqSLQkMzw/2Gn8gOr
         gPhTupZXRnSUHzU+W5xEZBA7DgMzWJ/wDNB8Yt472XJ6B6uDKBLVu2b3wFE82NLkkHPc
         TWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787065836; x=1787670636;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kG7Zaffwl0mxSN4K5nDR/1mjY7t5FTHW4GrkGQ7+s74=;
        b=AS6oTqHJ5bfzHdVX4JLgn+W/75R6LgtfXEjslpE5CF7jw3N26od17ND9cRR0ASs92o
         1cHzJ9mYVtddTzVdCZEkm0Se4yh+2HSBKAM9GFLqqIBqLd53zEu897jJr/7f9IptFIew
         x7kwnAg5tvGAnC3B+nMjKG2QWpmH5sv/EN2Sr4RGi60C8+GGHfWAB3t9Gbcee2QvFjMh
         a41VPkuPIXBYzHBpouruvn8elgAqgJWk0oPgOrXQHVQiZwpDfUEJmVi4WPIoCc7z2jzk
         jYV3rfRhIYLwmCLFu6wMg4QToXVBjcysFppAHKvgFcKcSiIZEWRA6yXAk4ixKAflUcF7
         ls6w==
X-Forwarded-Encrypted: i=1; AHgh+RqiPtBZriFpzJ95A0jNB0sDkHS9j+e6nit+jo/vtj4nLWfiP8GTQUvApLZ8Ov5ZaVzr38pycyEtUEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBbmQqlQHT9pQCwTQSriZUjAqnSnjhtHJtVvdeQ6/Vm7Ku2PVP
	bwdsBNuueb1qIcdx/v+J+jsZzJtPMpx4GzeUIyo6pZPscNMGKxaIuXZ0r2xoywzw2A==
X-Gm-Gg: AR+sD13ayxU0wpCQ1XID4UURentQBeVlzyn7f0LKIOVBqQTBF/w+YNgwlJXSXes3ITN
	haDxQIzl9XBIRTxRyJ54j4WJujQ9yXjL8Skzcglux/lHYGUCICRReb15T5dMvoTRPMJymXxbvIf
	ffo3DTLMVDmOM6UqfW+BQcqxVIRO0Q5dmKOlW7lePua80C3MPlhnAjiHDSEd76/uaeMYa560TEB
	wxOPFfFRD/4dMS1ztEM+0da9Amucq/NTa+F8PBgnpnx5TnmUgRot0SPYVRPuuIjPcu0UoSYC6eP
	A5bBuwLUXmbn6UeKC+lPUW5/5BFG+uoY9B4roIWhGdICqMkYAOsK8qim0XiNzcaHG3EatXEjJOw
	MkWASztKBEPslxzmYG9lDNxfFbzyPN2+aavNlfMMYK9PCkPz3IRyDr4mBtU51jxLmNIczhA/0tu
	dpfD4L6g5bYpXIWDSdokyDaEIyULyLyDskgjTapNhtkLJ0dwPkPFfcaxb9WG+cuuQ5vGIAyQDDn
	KbpVGRUiCjCIzNK70raAFgBLGTc2mQbs2r0QiQWFz/XyPZbZbgk
X-Received: by 2002:a05:600c:2114:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-4998792e462mr385780165e9.1.1787065835734;
        Tue, 18 Aug 2026 08:10:35 -0700 (PDT)
Message-ID: <47f3e8ea-ecb2-46b5-841d-a0234e0d536f@suse.com>
Date: Tue, 18 Aug 2026 17:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] x86/passthrough: Extract PT_IRQ_TYPE_MSI body into
 pt_irq_bind_msi()
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf3880b0000f373@vates.tech>
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
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf3880b0000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787065836-F5AAF2A1-9A3C87F0/0/0
X-purgate-type: clean
X-purgate-size: 12956

On 27.04.2026 15:54, Julian Vetter wrote:
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -290,161 +290,186 @@ static int pt_irq_dpci_setup(struct domain *d, unsigned int pirq,
>      } while ( true );
>  }
>  
> -int pt_irq_create_bind(
> -    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +static int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
> +                            uint8_t gvec, uint32_t gflags, uint64_t gtable,

Please see ./CODING_STYLE for the use of fixed-width types. With relaxed
interpretation of them, at least machine_irq and gflags should be simply
unsigned int. (gvec and gtable I think are tolerable as you have them.)

> +                            bool unmasked)

Nit (for both wrapped lines): Indentation.

>  {
>      struct hvm_irq_dpci *hvm_irq_dpci;
>      struct hvm_pirq_dpci *pirq_dpci;
>      struct pirq *info;
> -    int rc, pirq = pt_irq_bind->machine_irq;
> +    uint8_t dest, delivery_mode;
> +    bool dest_mode;
> +    int dest_vcpu_id, rc;
> +    const struct vcpu *vcpu;
>  
> -    if ( pirq < 0 || pirq >= d->nr_pirqs )
> +    if ( machine_irq >= (unsigned int)d->nr_pirqs )
>          return -EINVAL;

Rather than merely asking on the cast: What use is this check, when the
caller has done it already?

> -    rc = pt_irq_dpci_setup(d, pirq, &hvm_irq_dpci, &pirq_dpci, &info);
> +    rc = pt_irq_dpci_setup(d, machine_irq, &hvm_irq_dpci, &pirq_dpci, &info);
>      if ( rc )
>          return rc;
>  
> -    switch ( pt_irq_bind->irq_type )
> +    if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
>      {
> -    case PT_IRQ_TYPE_MSI:
> -    {
> -        uint8_t dest, delivery_mode;
> -        bool dest_mode;
> -        int dest_vcpu_id;
> -        const struct vcpu *vcpu;
> -        uint32_t gflags = pt_irq_bind->u.msi.gflags &
> -                          ~XEN_DOMCTL_VMSI_X86_UNMASKED;
> -
> -        if ( !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
> +        pirq_dpci->flags = HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_MSI |
> +                           HVM_IRQ_DPCI_GUEST_MSI;
> +        pirq_dpci->gmsi.gvec = gvec;
> +        pirq_dpci->gmsi.gflags = gflags;
> +        /*
> +         * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind'.
> +         * The 'pirq_cleanup_check' which would free the structure is only
> +         * called if the event channel for the PIRQ is active. However
> +         * OS-es that use event channels usually bind PIRQs to eventds
> +         * and unbind them before calling 'pt_irq_destroy_bind' - with the
> +         * result that we re-use the 'dpci' structure. This can be
> +         * reproduced with unloading and loading the driver for a device.
> +         *
> +         * As such on every 'pt_irq_bind_msi' call we MUST set it.
> +         */
> +        pirq_dpci->dom = d;
> +        /* bind after hvm_irq_dpci is setup to avoid race with irq handler */

Much like you add the missing blank at the end, please also correct the start
of this comment (to use a capital 'B').

> +        rc = pirq_guest_bind(d->vcpu[0], info, 0);
> +        if ( rc == 0 && gtable )
>          {
> -            pirq_dpci->flags = HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_MSI |
> -                               HVM_IRQ_DPCI_GUEST_MSI;
> -            pirq_dpci->gmsi.gvec = pt_irq_bind->u.msi.gvec;
> -            pirq_dpci->gmsi.gflags = gflags;
> -            /*
> -             * 'pt_irq_create_bind' can be called after 'pt_irq_destroy_bind'.
> -             * The 'pirq_cleanup_check' which would free the structure is only
> -             * called if the event channel for the PIRQ is active. However
> -             * OS-es that use event channels usually bind PIRQs to eventds
> -             * and unbind them before calling 'pt_irq_destroy_bind' - with the
> -             * result that we re-use the 'dpci' structure. This can be
> -             * reproduced with unloading and loading the driver for a device.
> -             *
> -             * As such on every 'pt_irq_create_bind' call we MUST set it.
> -             */
> -            pirq_dpci->dom = d;
> -            /* bind after hvm_irq_dpci is setup to avoid race with irq handler*/
> -            rc = pirq_guest_bind(d->vcpu[0], info, 0);
> -            if ( rc == 0 && pt_irq_bind->u.msi.gtable )
> -            {
> -                rc = msixtbl_pt_register(d, info, pt_irq_bind->u.msi.gtable);
> -                if ( unlikely(rc) )
> -                {
> -                    pirq_guest_unbind(d, info);
> -                    /*
> -                     * Between 'pirq_guest_bind' and before 'pirq_guest_unbind'
> -                     * an interrupt can be scheduled. No more of them are going
> -                     * to be scheduled but we must deal with the one that may be
> -                     * in the queue.
> -                     */
> -                    pt_pirq_softirq_reset(pirq_dpci);
> -                }
> -            }
> +            rc = msixtbl_pt_register(d, info, gtable);
>              if ( unlikely(rc) )
>              {
> -                pirq_dpci->gmsi.gflags = 0;
> -                pirq_dpci->gmsi.gvec = 0;
> -                pirq_dpci->dom = NULL;
> -                pirq_dpci->flags = 0;
> -                if ( !info->evtchn )
> -                    pirq_cleanup_check(info, d);
> -                write_unlock(&d->event_lock);
> -                return rc;
> +                pirq_guest_unbind(d, info);
> +                /*
> +                 * Between 'pirq_guest_bind' and before 'pirq_guest_unbind'
> +                 * an interrupt can be scheduled. No more of them are going
> +                 * to be scheduled but we must deal with the one that may be
> +                 * in the queue.
> +                 */
> +                pt_pirq_softirq_reset(pirq_dpci);
>              }
>          }
> -        else
> +        if ( unlikely(rc) )
>          {
> -            uint32_t mask = HVM_IRQ_DPCI_MACH_MSI | HVM_IRQ_DPCI_GUEST_MSI;
> -
> -            if ( (pirq_dpci->flags & mask) != mask )
> -            {
> -                write_unlock(&d->event_lock);
> -                return -EBUSY;
> -            }
> -
> -            /* If pirq is already mapped as vmsi, update guest data/addr. */
> -            if ( pirq_dpci->gmsi.gvec != pt_irq_bind->u.msi.gvec ||
> -                 pirq_dpci->gmsi.gflags != gflags )
> -            {
> -                /* Directly clear pending EOIs before enabling new MSI info. */
> -                pirq_guest_eoi(info);
> -
> -                pirq_dpci->gmsi.gvec = pt_irq_bind->u.msi.gvec;
> -                pirq_dpci->gmsi.gflags = gflags;
> -            }
> +            pirq_dpci->gmsi.gflags = 0;
> +            pirq_dpci->gmsi.gvec = 0;
> +            pirq_dpci->dom = NULL;
> +            pirq_dpci->flags = 0;
> +            if ( !info->evtchn )
> +                pirq_cleanup_check(info, d);
> +            write_unlock(&d->event_lock);
> +            return rc;
>          }
> -        /* Calculate dest_vcpu_id for MSI-type pirq migration. */
> -        dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
> -                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
> -        dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
> -        delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
> -                                  XEN_DOMCTL_VMSI_X86_DELIV_MASK);
> -
> -        dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
> -        pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
> -        write_unlock(&d->event_lock);
> +    }
> +    else
> +    {
> +        uint32_t mask = HVM_IRQ_DPCI_MACH_MSI | HVM_IRQ_DPCI_GUEST_MSI;
>  
> -        pirq_dpci->gmsi.posted = false;
> -        vcpu = (dest_vcpu_id >= 0) ? d->vcpu[dest_vcpu_id] : NULL;
> -        if ( iommu_intpost )
> +        if ( (pirq_dpci->flags & mask) != mask )
>          {
> -            if ( delivery_mode == dest_LowestPrio )
> -                vcpu = vector_hashing_dest(d, dest, dest_mode,
> -                                           pirq_dpci->gmsi.gvec);
> -            if ( vcpu )
> -                pirq_dpci->gmsi.posted = true;
> +            write_unlock(&d->event_lock);
> +            return -EBUSY;
>          }
> -        if ( vcpu && is_iommu_enabled(d) )
> -            hvm_migrate_pirq(pirq_dpci, vcpu);
>  
> -        /* Use interrupt posting if it is supported. */
> -        if ( iommu_intpost )
> +        /* If pirq is already mapped as vmsi, update guest data/addr. */
> +        if ( pirq_dpci->gmsi.gvec != gvec || pirq_dpci->gmsi.gflags != gflags )
>          {
> -            rc = hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
> +            /* Directly clear pending EOIs before enabling new MSI info. */
> +            pirq_guest_eoi(info);
>  
> -            if ( rc )
> -            {
> -                pt_irq_destroy_bind(d, pt_irq_bind);
> -                return rc;
> -            }
> +            pirq_dpci->gmsi.gvec = gvec;
> +            pirq_dpci->gmsi.gflags = gflags;
>          }
> +    }
> +    /* Calculate dest_vcpu_id for MSI-type pirq migration. */
> +    dest = MASK_EXTR(pirq_dpci->gmsi.gflags, XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
> +    dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
> +    delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
> +                               XEN_DOMCTL_VMSI_X86_DELIV_MASK);
> +
> +    dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
> +    pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
> +    write_unlock(&d->event_lock);
>  
> -        if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
> +    pirq_dpci->gmsi.posted = false;
> +    vcpu = (dest_vcpu_id >= 0) ? d->vcpu[dest_vcpu_id] : NULL;
> +    if ( iommu_intpost )
> +    {
> +        if ( delivery_mode == dest_LowestPrio )
> +            vcpu = vector_hashing_dest(d, dest, dest_mode,
> +                                       pirq_dpci->gmsi.gvec);
> +        if ( vcpu )
> +            pirq_dpci->gmsi.posted = true;
> +    }
> +    if ( vcpu && is_iommu_enabled(d) )
> +        hvm_migrate_pirq(pirq_dpci, vcpu);
> +
> +    /* Use interrupt posting if it is supported. */
> +    if ( iommu_intpost )
> +    {
> +        struct xen_domctl_bind_pt_irq bind = {
> +            .machine_irq = machine_irq,
> +            .irq_type = PT_IRQ_TYPE_MSI,
> +        };
> +
> +        rc = hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
> +        if ( rc )
>          {
> -            unsigned long flags;
> -            struct irq_desc *desc = pirq_spin_lock_irq_desc(info, &flags);
> +            pt_irq_destroy_bind(d, &bind);
> +            return rc;
> +        }
> +    }
>  
> -            if ( !desc )
> -            {
> -                pt_irq_destroy_bind(d, pt_irq_bind);
> -                return -EINVAL;
> -            }
> +    if ( unmasked )
> +    {
> +        struct xen_domctl_bind_pt_irq bind = {
> +            .machine_irq = machine_irq,
> +            .irq_type = PT_IRQ_TYPE_MSI,
> +        };
> +        unsigned long flags;
> +        struct irq_desc *desc = pirq_spin_lock_irq_desc(info, &flags);
>  
> -            guest_mask_msi_irq(desc, false);
> -            spin_unlock_irqrestore(&desc->lock, flags);
> +        if ( !desc )
> +        {
> +            pt_irq_destroy_bind(d, &bind);
> +            return -EINVAL;
>          }
>  
> -        break;
> +        guest_mask_msi_irq(desc, false);
> +        spin_unlock_irqrestore(&desc->lock, flags);
>      }
>  
> +    return 0;
> +}

For all of the above, going in two steps would again help review quite a
bit: First introduce the new function, but leave excess indentation alone.
Then have a purely mechanical patch removing one indentation level (and
the associated leftover figure braces).

> +int pt_irq_create_bind(
> +    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +{
> +    int rc, pirq = pt_irq_bind->machine_irq;

rc, afaict, is now only used in the more narrow scope below.

> +    if ( pirq < 0 || pirq >= d->nr_pirqs )
> +        return -EINVAL;
> +
> +    switch ( pt_irq_bind->irq_type )
> +    {
> +    case PT_IRQ_TYPE_MSI:
> +        return pt_irq_bind_msi(d, pirq,
> +                               pt_irq_bind->u.msi.gvec,
> +                               pt_irq_bind->u.msi.gflags &
> +                                   ~XEN_DOMCTL_VMSI_X86_UNMASKED,
> +                               pt_irq_bind->u.msi.gtable,
> +                               !!(pt_irq_bind->u.msi.gflags &
> +                                  XEN_DOMCTL_VMSI_X86_UNMASKED));

No need for !!.

Jan

