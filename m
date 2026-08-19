Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8877C5DF81
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 14:39:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395456.1633821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhRG-0000HW-7m; Wed, 19 Aug 2026 14:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395456.1633821; Wed, 19 Aug 2026 14:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwhRG-0000HP-4b; Wed, 19 Aug 2026 14:38:46 +0000
Received: by outflank-mailman (input) for mailman id 1395456;
 Wed, 19 Aug 2026 14:38:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwhRE-0000HI-SN
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 14:38:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwhRD-0060Sp-LC
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 16:38:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85bff3-2eae-0a2a0a5409dd-0a2a450bb1a2-0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 16:38:43 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85bff3-b7e8-0a2a450b0019-d1558033d549-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 16:38:43 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so9976805e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 07:38:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9b6ed64sm40026485e9.1.2026.08.19.07.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 07:38:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1787150323; x=1787755123; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjXOyh07FZshHAd+xtDfXNOYHDG5hYOaZotRxQ8Uox0=;
        b=WfnYWpgQEHZ2qjTVqJeGCGRVvOvFVoIOnaUsdxDrwRgc50WoiGrlBnoMS+g+43qOmM
         VGwF//QatGsa/V1UV9lGs086pitiIin1VsauNWMTiN/Bf7ymtm+bVHFnRxD19OGcAQTY
         6DZsUjuKjWTAh4G+irC5zXvYuzf4U16ZY5oNNGmxW1ZbKmezCofCMyHDxDhDpShVB/hs
         ZovWKsOqhgsjIXPcHOpmWOA6WF/IUMoi6tjBf5GohjL6h1DQACESfBNeHiIjhlols1hv
         tnpQsdjLK67LGEMN1l92gZxWQ3vrhmD73Wp2WDsPDFW6VHGrL5V187IqZZzxxYuiBfjw
         hA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150323; x=1787755123;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjXOyh07FZshHAd+xtDfXNOYHDG5hYOaZotRxQ8Uox0=;
        b=gnu5Io/uAc0kJKYIkyStm1OvONna125XDZmQWyuI8YNiWznQmzTZybw0qsXh73XjNV
         k0WIvVYGhw7WdCUEJ7k1hCVakVr70H9/dWKM1eYARLTTp+pcwWvQsVI0OBQeeoqj42VH
         9kAhP6n6hnIfQIKoE0vU8pAZ83HLXCUutLGeDpxb2CpnPnF90Vv7kGMW73icK2eFJJaf
         pMZ7NAjCKgJbqo994ob8Vv//9AFckwse5m/57ZNBNHT98EHGK3iixRzy87NTZV1CvUNc
         3T5BF1A2evefWESDqEwBATHPWBckrqjwzQD3VNdnVKkNp+v9zgbW8mxvsiNmjlwPEexM
         X2Iw==
X-Forwarded-Encrypted: i=1; AHgh+RpyMKyJbCbOSXhhTNVGG7hAgpEo4g40Xb9c//FsDh0azBK6HuXHs4t4aK2RafMSOA2n+M7i5Aw2uxw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYaomaul+PyE1QfkS6HoCzkqUWJinuxMjeYF/NA1MkTZ1URPPv
	SqINdKusfZX7BXaAFZLQrHgutgpm5SLUjdH8ehnV4sTp94ZRlxZGje+DAipRphnGIA==
X-Gm-Gg: AR+sD13VDmENcZ4Q6TmCEh79+ymJ81TjCeDGi0mQgzFdMI5JJmqDRBHEcSQGWQhPe5K
	2ICb64vxe+JZk7IBu1dV/6yuTEONhEYAqnlrSV0Vc8xOwz+l9/N6ATF6ZzpsPbXKrl0e0rGbIOG
	UI+67JlzbvmGIHyRvWkNeMTdYmgzd/UB6S5kHcNIELDsxzw5IfVR4Xj08cO0Ew7qpjnvr2+h9n/
	EGSjgqp14+1guEho9zQXB+X2it0R8b/rJn7KksLq0Qoou84ZayAENibfdQnr3xA+tM3R6HYhIjP
	PqiWfGpfKEsz7S4WowSViUgFvMB84mxb+87z5uuBXIeVUSxZKL4y95gDUxLn75phVvJ4GfLLfkd
	EkvQSPRWrd7yi/0Ul//StYQ8L6jnjJz/illlChtf/IqwlHp9bcPk8yVUAndc2ycoBiHIy64xHid
	YUayxS3wH/kawRM9Pi3xmWYarBRb8lHuYjCbKu8+4afhe6aR4K74ruWTJaLJXLJ/zECbyoFMPnS
	C77paHbQkZE7lY3kT0D/5ZtvMxK8VSY0OO0iiJzKwzU1nNrj3sP
X-Received: by 2002:a05:600c:468d:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-499aa17d5a2mr91260655e9.8.1787150322726;
        Wed, 19 Aug 2026 07:38:42 -0700 (PDT)
Message-ID: <a9510f21-b7a8-4323-a64d-0f33e44cd8b0@suse.com>
Date: Wed, 19 Aug 2026 16:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] hvm/ioreq: Negotiate extended destination ID
 support per ioreq server
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
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@vates.tech>
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
In-Reply-To: <1777298081.8631fc262581453bbf619ec5b2062170.19dcf3886cc000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1787150323-AAAD89EA-02523BE6/0/0
X-purgate-type: clean
X-purgate-size: 11576

On 27.04.2026 15:54, Julian Vetter wrote:
> ---
> Changes in v4:
> - As suggested by Roger, replaced XEN_DMOP_enable_ext_dest_id (v3 patch
>   6), a separate DM op the device model had to call before starting
>   vCPUs, with a flags byte repurposed from the existing pad[3] field of
>   xen_dm_op_create_ioreq_server

IOW the presence of XEN_DMOP_enable_ext_dest_id in the earlier patch is
entirely stale?

> - New XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID flag (bit 0) lets each ioreq
>   server signal support at registration time
> - As suggested by Roger level the feature across all ioreq servers.
>   XEN_HVM_CPUID_EXT_DEST_ID is only advertised when every server
>   registered before arch_domain_creation_finished() sets the flag. A
>   single server without the flag suppresses the feature for the whole
>   domain!
> - Lock the levelled result at domain creation time and enforce it for
>   servers registered afterwards, preventing a late opt-out from breaking
>   guests that already see the feature in CPUID
> - Persist the locked flag via HVM_SAVE_TYPE(EXT_DEST_ID) so that live
>   migration preserves the guest-visible CPUID bit independently of when
>   the device model registers its ioreq servers on the destination host

So a new save record for a single bit. That doesn't look very efficient
to me.

> @@ -1106,7 +1107,16 @@ int arch_domain_soft_reset(struct domain *d)
>  void arch_domain_creation_finished(struct domain *d)
>  {
>      if ( is_hvm_domain(d) )
> +    {
> +        /*
> +         * Lock the extended destination ID state. OR preserves any value
> +         * already restored from an HVM save record (migration path). For a
> +         * fresh domain, ext_dest_id starts false and the dynamic check
> +         * supplies the levelled result across all registered ioreq servers.
> +         */
> +        d->arch.hvm.ext_dest_id |= hvm_ext_dest_id_enabled(d);

For an unaware guest, after migration it'll suddenly get the flag set
if all servers are capable. That can't be right. It looks pretty much
unavoidable for the field to become tristate (unset / false / true).

>          hvm_domain_creation_finished(d);

Blank line please between what you add and what was already there.

> @@ -325,6 +326,42 @@ void arch_ioreq_domain_init(struct domain *d)
>      register_portio_handler(d, 0xcf8, 4, hvm_access_cf8);
>  }
>  
> +int arch_ioreq_server_create_check(const struct domain *d, uint8_t flags)

Bogus use of a fixed-width type again.

> +{
> +    if ( !is_hvm_domain(d) || !d->creation_finished )
> +        return 0;

Why the HVM check? ioreq_server_dm_op(), the sole caller, will only ever
be called for HVM domains (as per the check near the top of dm_op()).

> +    if ( d->arch.hvm.ext_dest_id &&
> +         !(flags & XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) )
> +        return -EPERM;
> +
> +    return 0;
> +}
> +
> +static int cf_check ext_dest_id_save(struct vcpu *v, hvm_domain_context_t *h)
> +{
> +    struct hvm_hw_ext_dest_id s = {
> +        .enabled = v->domain->arch.hvm.ext_dest_id,
> +    };
> +
> +    return hvm_save_entry(EXT_DEST_ID, 0, h, &s);
> +}
> +
> +static int cf_check ext_dest_id_load(struct domain *d, hvm_domain_context_t *h)
> +{
> +    struct hvm_hw_ext_dest_id s;
> +
> +    if ( hvm_load_entry(EXT_DEST_ID, h, &s) )
> +        return -EINVAL;
> +
> +    d->arch.hvm.ext_dest_id = s.enabled;

Afaict this can load arbitrary values other than 0 or 1. In fact ...

> +    return 0;
> +}
> +
> +HVM_REGISTER_SAVE_RESTORE(EXT_DEST_ID, ext_dest_id_save, NULL,
> +                          ext_dest_id_load, 1, HVMSR_PER_DOM);

... I think there's ext_dest_id_check() missing.

> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -24,6 +24,7 @@
>   *  Ported to xen by using virtual IRQ line.
>   */
>  
> +#include <xen/ioreq.h>
>  #include <xen/types.h>
>  #include <xen/mm.h>
>  #include <xen/xmalloc.h>

Is this hunk stale?

> @@ -597,6 +598,7 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
>  static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
>  {
>      const HVM_SAVE_TYPE(IOAPIC) *s;
> +    unsigned int i;

Better ...

> @@ -617,6 +619,24 @@ static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h
>      if ( s->ioregsel > VIOAPIC_REG_RTE0 + (ARRAY_SIZE(s->redirtbl) - 1) * 2 + 1 )
>          return -EINVAL;
>  
> +    /*
> +     * If any RTE uses extended destination ID bits, the EXT_DEST_ID save
> +     * record must have been loaded first (restoring d->arch.hvm.ext_dest_id).
> +     * The ioreq server re-registration by the DM happens later, so use the
> +     * domain-level locked flag rather than the per-server dynamic check.
> +     */
> +    for ( i = 0; i < ARRAY_SIZE(s->redirtbl); i++ )

...

    for ( unsigned int i = 0; i < ARRAY_SIZE(s->redirtbl); i++ )

> +    {
> +        if ( s->redirtbl[i].fields.ext_dest_id && !d->arch.hvm.ext_dest_id )
> +        {
> +            printk(XENLOG_G_ERR "HVM restore: %pd IO-APIC RTE %u has "
> +                                "extended destination ID bits set but "
> +                                "EXT_DEST_ID is not enabled\n",
> +                                d, i);

No, this is the wrong way round. As long as we permit guests to put
non-zero in these bits, we can't demand the bits to be zero here. You
need to avoid interpreting them as extended-ID when the feature isn't
enabled for a guest.

> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -641,7 +641,7 @@ static void ioreq_server_deinit(struct ioreq_server *s)
>  }
>  
>  static int ioreq_server_create(struct domain *d, int bufioreq_handling,
> -                               ioservid_t *id)
> +                               uint8_t flags, ioservid_t *id)

Inappropriate use of a fixed-width type again.

> @@ -1350,11 +1352,16 @@ int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op)
>          *const_op = false;
>  
>          rc = -EINVAL;
> -        if ( data->pad[0] || data->pad[1] || data->pad[2] )
> +        if ( data->flags & ~XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID ||

Parentheses please around bitwise logic being operands to boolean logic.

> +             data->pad[0] || data->pad[1] )
> +            break;
> +
> +        rc = arch_ioreq_server_create_check(d, data->flags);

It's a little odd to have an arch hook here, yet at the same time an
x86-specific check a few lines up (XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID
really is meaningless on non-x86, and should hence either be constrained
to x86 [with the bit position reusable for something else on other
architectures], or be properly rejected on non-x86).

> @@ -455,6 +456,18 @@ int pt_irq_create_bind(
>          uint64_t msi_addr;
>          uint32_t msi_data;
>  
> +        /*
> +         * Refuse the old MSI bind path when extended destination IDs are
> +         * in use. The caller must use XEN_DMOP_bind_pt_msi_irq instead,
> +         * which passes the raw MSI address so Xen can decode the extended
> +         * bits. This old path only carries an 8-bit destination ID and
> +         * would silently misroute interrupts to vCPUs with APIC IDs > 255.

"to" looks ambiguous to me here. Maybe better "targeted at"? It's also >= 255,
I think.

> +         */
> +        if ( hvm_ext_dest_id_enabled(d) )
> +        {
> +            return -EPERM;
> +        }

No need for curly braces here. Further I think -EPERM isn't a good choice, as
that's what xsm_default_action() returns. -EOPNOTSUPP may be an option, or
some other, more "exotic" indicator.

> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -627,12 +627,27 @@ struct hvm_msr {
>  
>  #define CPU_MSR_CODE  20
>  
> +/*
> + * HVM_SAVE_TYPE(EXT_DEST_ID): domain-level extended MSI destination ID state.

Why MSI when the vIO-APIC uses it as well?

> + * Records whether the extended destination ID feature was enabled for this
> + * domain at the time guest vCPUs were started. This allows migration to
> + * preserve the setting across hosts without relying on the device model to
> + * re-register its ioreq servers before the guest's first CPUID query.
> + */

The guest's first CPUID query surely is going to happen after at least one DM
has registered a server? (For HVM, that is. No server may ever be registered
for PVH, aiui.) It's not quite clear to me why this connection to CPUID
queries is being made here. The flag is necessary at server registration time,
as ones not supporting the feature need to be rejected.

> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -39,18 +39,28 @@ typedef uint16_t ioservid_t;
>   * XEN_DMOP_create_ioreq_server: Instantiate a new IOREQ Server for a
>   *                               secondary emulator.
>   *
> - * The <id> handed back is unique for target domain. The valur of
> + * The <id> handed back is unique for target domain. The value of
>   * <handle_bufioreq> should be one of HVM_IOREQSRV_BUFIOREQ_* defined in
> - * hvm_op.h. If the value is HVM_IOREQSRV_BUFIOREQ_OFF then  the buffered
> + * hvm_op.h. If the value is HVM_IOREQSRV_BUFIOREQ_OFF then the buffered
>   * ioreq ring will not be allocated and hence all emulation requests to
>   * this server will be synchronous.
> + *
> + * If <flags> contains XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID, the server will
> + * use XEN_DMOP_bind_pt_msi_irq for all passthrough MSI bindings, passing
> + * raw MSI address/data fields so Xen can decode extended destination ID
> + * bits. Once any server sets this flag, Xen will advertise
> + * XEN_HVM_CPUID_EXT_DEST_ID to the guest. Must be set before the guest
> + * vCPUs are started.

I don't understand the last sentence. Is it perhaps stale from how things
were earlier? There's nothing to "set" here.

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -54,9 +54,35 @@ struct ioreq_server {
>      evtchn_port_t          bufioreq_evtchn;
>      struct rangeset        *range[NR_IO_RANGE_TYPES];
>      bool                   enabled;
> +    bool                   ext_dest_id;
>      uint8_t                bufioreq_handling;
>  };
>  
> +/*
> + * Return true if every registered ioreq server has opted in to extended
> + * destination IDs (XEN_DMOP_IOREQ_SERVER_EXT_DEST_ID) and at least one
> + * server exists.

Why is one server existing relevant?

> A single server without the flag is enough to suppress
> + * XEN_HVM_CPUID_EXT_DEST_ID, preventing misrouted interrupts.
> + */
> +static inline bool hvm_ext_dest_id_enabled(const struct domain *d)
> +{
> +    unsigned int i;
> +    bool found = false;
> +
> +    for ( i = 0; i < MAX_NR_IOREQ_SERVERS; i++ )

Please use ARRAY_SIZE() in such cases.

> +    {
> +        const struct ioreq_server *s = d->ioreq_server.server[i];
> +
> +        if ( !s )
> +            continue;
> +        if ( !s->ext_dest_id )

As there's no locking here, and as the comment ahead of the function also
doesn't mention any locking requirements: What guarantees s to still be
valid to deref here? Furthermore, what guarantees the result of this
function to not be stale by the time the caller looks at it? (Some of
this may be easier if this wasn't an inline function in a globally
visible header.)

Jan

