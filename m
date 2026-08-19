Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDC3C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 13:37:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395392.1633785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwgTc-0007bY-00; Wed, 19 Aug 2026 13:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395392.1633785; Wed, 19 Aug 2026 13:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwgTb-0007bR-TZ; Wed, 19 Aug 2026 13:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1395392;
 Wed, 19 Aug 2026 13:37:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwgTa-0007bJ-Bo
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 13:37:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwgTZ-00Ghxl-KZ
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:37:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85b17e-8faa-0a2a0a5109dd-0a2a4505aba8-14
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 15:37:05 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85b181-4cb1-0a2a45050019-d155dd2cbcb8-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 15:37:05 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so590110f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 06:37:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441b0fsm5620257f8f.4.2026.08.19.06.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 06:37:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1787146625; x=1787751425; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTcSuDVkFf5dwBrguIb3nNGNVEVOqcTPkUcXw9M5yn4=;
        b=bSV3eg2Rz3S++0GCVFOyfsGWn7ngMcqgepcy2QiEZkcwFOvvXJIaz1nVyBYzQGlowD
         /B2X3abM5jmRxBLK17wKzf3TN/njBW+C28osSPbbeTFBPTrPtK1SljDCLNSIdOSCdQg/
         bGi0aCZl5wFNU50M3eooDqV3QqRY463BlVpA3WiQwQKk9tay84v/2HbSmOYKm7in57hu
         9Jz/xMKtAbRMa2Vm3ENSRdMZse1vHcv/8gVsIsyfrgBaVhpaeqK68ruG3z/bM+OXgj+M
         odDRg/vVKg48s/thd+75KN1SyaK/veuwWcIts8gIGYSDzhm7CtEuSgesZ1P5EH96OvWd
         +7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787146625; x=1787751425;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTcSuDVkFf5dwBrguIb3nNGNVEVOqcTPkUcXw9M5yn4=;
        b=fjiUmYPriUYzsHbbDOdqffaSzvPAN7PLAm9oJU4fyGS73ghlCaVIQu6ltp7uN/hNa/
         5lUptNso2AgV1daWw1nvGTiROj38QmqDOpxGyWiTwgXa88QHzMz8i9rhQj/+fnKNGFwG
         t0qxqI6IrgkxJ+XV7cOJC/lz9y+Dt0SWCw6pAe9XkwlRvdFmHmFQO3z8G23ibuXizjHI
         O6V+BB5V/f8yyoywPxt6gZi/WiOt7iosbFkcEx7ELu0AGqJvJeOaheS7nZX9VR5w4l50
         D58xPVQcF3kP+7p09UrvmjU7hetkDtpk1TOKpaaA6KokVbD3YDsF3mhRaCqA/7KfhaAq
         7dug==
X-Forwarded-Encrypted: i=1; AHgh+RoWR+zLS/UnA/mM6hDTgVhg1fG/7Ipz795jfqarJQaYXheC9ytvoIPOVNY2JXOSzdezvfg/B7vWmEc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mmicp24LPJ70aIf/MM7VAyl8g7q1SxzrT+XRO3R5D5RJjasElY
	G8STjN2/YnwZnlDqPYC2i95CL8cKXd7czBpfdov/EHkZmNdfP+W+7vCEq/hbGyKoOg==
X-Gm-Gg: AR+sD10rjEOC+ue0y4Fevwf0biwu9S/m9cu8ufjwXYsDzlSVwebJIzZmaOjidwIHNJk
	P41kG2S15qmmWcia68c0H6vxWM/Qu5VHXM5DJTuLknrSBgtUG9hL8Y728387TUKbtA4qWdrXRwW
	r3TbSi0/STzkgHSxb3UmW4Fs/UYItqoc4Lw6XDxlL4QrjTJbFJgjDHaOBjxz9GIfJXGWllWbsKt
	X8i/Jn7xowXqz/aZ1851q6a5h84p0rUNYKYNZ/TQMEqOysD0dUyponLii3g6LXY3bUUcBSYFgVS
	1hCY3uQNr8wq0Fg2wny6hldDoO7g/Vi9MLLK0h7Dao/jV3AUnGi1xA2p+ANthRyd0yKIA1804rx
	e4il3nPWv0ofASZMVzSct8LK6fI4wC5wO8hFMbWMYuG8JkeWHB+mXDX/0m6Z/EZ6o8vSFXdb4bb
	FmQF+nt0V8dSHS1LT4JkxWtRXTxwcKmYgNBFyY70WP36zgYg+xUORxHa0dMW9mwuA3d4pqMEYz3
	bhxp6Zowew/ELTzAPKbYXFXHSvroJ7l97XRV9gOwwpPtKvTA6sE
X-Received: by 2002:a05:6000:4b10:b0:47f:97f6:d39a with SMTP id ffacd0b85a97d-482b1fece9emr9108588f8f.17.1787146624835;
        Wed, 19 Aug 2026 06:37:04 -0700 (PDT)
Message-ID: <b4f7fac9-c9fa-4a84-977e-373fc4df5297@suse.com>
Date: Wed, 19 Aug 2026 15:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM
 ops
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@vates.tech>
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
In-Reply-To: <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787146625-F64B42A1-62F7206E/0/0
X-purgate-type: clean
X-purgate-size: 7777

On 27.04.2026 15:54, Julian Vetter wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -574,6 +574,14 @@ long arch_do_domctl(
>          if ( !is_hvm_domain(d) )
>              break;
>  
> +        /*
> +         * PT_IRQ_TYPE_MSI is obsoleted by XEN_DMOP_bind_pt_msi_irq, which
> +         * passes raw MSI address/data so Xen can decode extended destination
> +         * ID bits. Device models must use the DM op path instead.
> +         */
> +        if ( bind->irq_type == PT_IRQ_TYPE_MSI )
> +            break;

Oh, here is where you have put the reject logic. With the other call to
pt_irq_create_bind() having been removed by patch 5, respective logic in
that function (as last modified also by patch 5) is now unreachable,
violating Misra rule 2.1.

Then again you cannot do this anyway, as it breaks older DMs. You want to
reject this only when XEN_DMOP_enable_ext_dest_id (subject to rename) was
called earlier. And you want to reject XEN_DMOP_enable_ext_dest_id when
XEN_DOMCTL_bind_pt_irq with PT_IRQ_TYPE_MSI was called earlier on. We
want to make sure that we get to see uses of only one kind of interface
(unless both interfaces can be made interoperate cleanly).

> @@ -607,6 +611,68 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_bind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_bind_pt_msi_irq *data =
> +            &op.u.bind_pt_msi_irq;
> +        int irq;
> +
> +        rc = -EINVAL;
> +        if ( data->pad || (data->flags & ~XEN_DMOP_MSI_FLAG_UNMASKED) )
> +            break;
> +
> +        irq = domain_pirq_to_irq(d, data->machine_irq);
> +
> +        rc = -EPERM;
> +        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
> +            break;
> +
> +        rc = -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            read_lock(&d->pci_lock);
> +            rc = pt_irq_bind_msi(d, data->machine_irq, data->addr, data->data,
> +                                 data->gtable,
> +                                 !!(data->flags & XEN_DMOP_MSI_FLAG_UNMASKED));

As before, no need for !!.

> +            read_unlock(&d->pci_lock);
> +        }
> +        if ( rc < 0 )
> +            printk(XENLOG_G_ERR
> +                   "XEN_DMOP_bind_pt_msi_irq: pt_irq_bind_msi failed (%ld) for %pd\n",

Imo this is too verbose. If anything needs logging here at all (which I
question), "%pd: pt_irq_bind_msi() failed: %ld\n" would likely do, without
becoming ambiguous. (Same below then, obviously.)

> +                   rc, d);
> +        break;
> +    }

Where did, btw, the XSM check go that the original code has? Daniel - I
don't think such can simply be dropped, despite there being xsm_dm_op()
on the path here?

> +    case XEN_DMOP_unbind_pt_msi_irq:
> +    {
> +        const struct xen_dm_op_unbind_pt_msi_irq *data =
> +            &op.u.unbind_pt_msi_irq;
> +        struct xen_domctl_bind_pt_irq bind = {
> +            .machine_irq = data->machine_irq,
> +            .irq_type = PT_IRQ_TYPE_MSI,
> +        };
> +        int irq;
> +
> +        irq = domain_pirq_to_irq(d, bind.machine_irq);
> +
> +        rc = -EPERM;
> +        if ( irq <= 0 || !irq_access_permitted(current->domain, irq) )
> +            break;

As we're making a new interface, we need to consider getting rid of bogus
aspects of the old one. Along the lines of what 6df6f24251db ("domctl:
restrict permission check for XEN_DOMCTL_memory_mapping's remove form")
says, and as then also mirrored by 6e42fa383c70 ("x86/domctl: don't imply
I/O port permissions from I/O port mapping"), a permission check on unmap
(here: unbind) for current->domain may be excessive: Even if permission
was already removed, the DM should still be able to unbind the guest's
IRQ.

> +        rc = -ESRCH;
> +        if ( is_iommu_enabled(d) )
> +        {
> +            read_lock(&d->pci_lock);
> +            rc = pt_irq_destroy_bind(d, &bind);
> +            read_unlock(&d->pci_lock);

Here and above - please pay attention to impending locking changes at the
original site, as per (much) earlier discussion. (As said there, I don't
think a lock needs taking here - or above - at all.)

> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -444,6 +444,41 @@ struct xen_dm_op_nr_vcpus {
>  };
>  typedef struct xen_dm_op_nr_vcpus xen_dm_op_nr_vcpus_t;
>  
> +#define XEN_DMOP_bind_pt_msi_irq   21
> +#define XEN_DMOP_unbind_pt_msi_irq 22
> +
> +struct xen_dm_op_bind_pt_msi_irq {
> +    /* IN - physical IRQ (pirq) */
> +    uint32_t machine_irq;

Please can comment and field identifier match up with one another? We don't
want to carry over such an inconsistency from the old interface.

> +    /* IN - MSI data word (bits [7:0] are the guest vector) */

The part in parentheses is x86-centric, which we'd better avoid in the public
headers.

> +    uint32_t data;
> +    /* IN - flags */
> +    uint32_t flags;
> +#define XEN_DMOP_MSI_FLAG_UNMASKED (1u << 0)

s/FLAG/BIND/ perhaps?

> +    uint32_t pad;
> +    /* IN - MSI address (includes extended destination ID in bits [11:5]) */

Please again omit the x86-centric part.

> +    uint64_aligned_t addr;
> +    /* IN - MSI-X table base GFN, 0 for plain MSI */
> +    uint64_aligned_t gtable;

This is a GADDR, not a GFN, isn't it?

With this, the earlier field being named just "addr" also ends up potentially
ambiguous. Perhaps msg_addr (and then also msg_data)?

More generally: Why does the DM need to be bothered about IRQ numbers in the
first place? To identify a particular MSI, what you need are device coordinates
and an index. Once passed in like this, the need for passing in "gtable" for
MSI-X should then also disappear. That said, re-working accordingly may incur
significant effort. That needs weighing against the downsides of introducing
another partly screwed interface.

> +};
> +
> +typedef struct xen_dm_op_bind_pt_msi_irq xen_dm_op_bind_pt_msi_irq_t;

Please omit the intermediate blank line, just like ...

> +struct xen_dm_op_unbind_pt_msi_irq {
> +    /* IN - physical IRQ (pirq) */
> +    uint32_t machine_irq;
> +};
> +typedef struct xen_dm_op_unbind_pt_msi_irq xen_dm_op_unbind_pt_msi_irq_t;

... you do here. That said - are these typedefs needed anywhere in the
first place?

> +/*
> + * XEN_DMOP_enable_ext_dest_id: Signal to Xen that this device model will use
> + * XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing raw MSI
> + * address/data fields. Once called, Xen will advertise
> + * XEN_HVM_CPUID_EXT_DEST_ID to the guest. Must be called before the guest
> + * starts.
> + */
> +#define XEN_DMOP_enable_ext_dest_id 23

I don't understand this. With XEN_DOMCTL_bind_pt_irq's PT_IRQ_TYPE_MSI case
cut off, DMs have no alternative besides using XEN_DMOP_bind_pt_msi_irq. If
that cut-off was viable, I think this comment would want re-wording almost
from scratch. As the cut-off needs dropping / constraining, some less severe
edit may do. The requirement to call this before the guest starts isn't
enough imo: It also needs to be called ahead of any binding, as the behavior
of the binding logic will need to be dependent upon whether this call was
issued.

The identifier XEN_DMOP_enable_ext_dest_id isn't suitable, though, as this
is about the choice of interface the DM is going to use. The newer interface
offering extended-ID support is merely a wanted side effect.

And then it's pretty odd that you add this #define here, but there's no
handling of the new sub-op. Was this perhaps meant to go in the next patch?

Jan

