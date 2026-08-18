Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC0C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 14:46:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394248.1633080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwL4m-0003Py-3E; Tue, 18 Aug 2026 14:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394248.1633080; Tue, 18 Aug 2026 14:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwL4m-0003Pr-0b; Tue, 18 Aug 2026 14:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1394248;
 Tue, 18 Aug 2026 14:46:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwL4j-0003Pl-SD
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 14:46:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwL4j-00C16e-4m
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 16:46:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a847028-e002-0a2a0a5209dd-0a2a4503c284-0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:46:00 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a847028-fae8-0a2a45030019-d155dd33c531-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 16:46:00 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47fe2d179e2so3121079f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 07:46:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7834dsm12517790f8f.28.2026.08.18.07.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 07:45:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1787064360; x=1787669160; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjbvGHWsfYFg6XEBRxXMeyukweaBaztj01wqpgRPlk4=;
        b=KXBIaVoM9AByNohDgYsJbymmggKOnw2KQiLwtkSo9ZBLTqx0LwBLbA60dOJ1vyjXd2
         8Mh9DnICbhtcqxdeZ51FySvCgJ0cEB6Kw49MDI/AM/fQclBl0ZlwJdPqHswKYtNdTAz3
         i0GLmv5ZZ1oIJJFCw6Q/ikfelvoE51Vi3dGI5jo61DvyvtiP5vkcMY/un6NMc4r+TTCH
         +grkd7iqHg/MxE7Szt9EKme+6B/wgkzT9Z67jlk/74qk2Rx6xU/COkCMbQZUJngrypyB
         96Cg0+jgt+sMWILYlj5RcywwcMo+m5i7x3ErtcAQaaNRxAxW+e2vSHrXnk5OeibAdzns
         kT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787064360; x=1787669160;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjbvGHWsfYFg6XEBRxXMeyukweaBaztj01wqpgRPlk4=;
        b=mgEbGjf95lCKaQ/FOIGsk4brnBL2BYhEJZlHExlp4nMVUkpait+2liWQ2Chvh5i09o
         s+n/kobTR/c8usEm9BH7EB0DKD6WvZ72NDCxpxpUmew/lrKnlxPeVa94j0vfnxqk7UV4
         xWGCwhlN4ODcONn9aLOp2msQ/fHXK+cz8u3RWY95IRWfAQWJsvIG9RGlRIY8wU/tGg/H
         38SFwEKeBk9ihWIA0p8p7USusnNMPb6gmfpUCQVsdR8j7GZb9CkOCrygK0jJzymsnu0Y
         aH1lVAqGN3G7mC42krELn8qs9PHH7cFA/iPg6H2mEmhExYvYfst12ZbNAWnbI3WgHTas
         LQQw==
X-Forwarded-Encrypted: i=1; AHgh+RrCxMk9hzr9N7FSrtCizTmbavi9hz6OrQ9Pe7w/QvQSP+bu7+XcN9EshD1swP+MWn7u9ymMtk4vxRI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzybno1U6dxRH64wQMJcmFXVzuqCpiplQDgNVC7s6aW1t9/3n0G
	J2NWh4Og5I49EX06gRpWEopBCd3/KsTWBBF/W/olgSIEy6oUdVhl7ct5Hd/viVWOyw==
X-Gm-Gg: AR+sD13UBKVwBNVJKOjv+UEw2+sRjoe4EOmiwl55qQ+JzgSsogmcVn5/OQvlw+eI0bp
	Cap7kqjAv1aNQqXPIp75j53Q11tdPJ0SJS7V0/nsugOZ0CVwwoh08uBSTfAkNM5GtnVIWtbPjPm
	20roFc8FVTtVZlL0oFAQeHgbPkSNnVRupV2k5kOtvD51Wc1pgVQtIw+rqs8FQ2UbSl1oKy6Bhdy
	II4epAyPf6qjoNOjOU8TlGPjqabKg8lutZWUU9teJi/UpORPIha104jI/oF+yETeChKT9Km5+zr
	7gNHCmyfo1VbEdbWlvwJFxFTdiQl2i2P1Y27bniN8AhG4/qXVaFETmYOZ7gNdI2thj80t1TKsVy
	ZFx+F/EvxmHst0VibSCIbd4dezOTgTXqAO44Rao3ZdO0i+zak6AEmWEn7M5D/ekhxZP6R9j9Nyj
	mbvbr7e6mrEPS/zzCBaBSURoviZvS+m7Lch/+0W5+Zd5RQlem5hplHmGwwHYmW5eCIrYi4ImaBq
	eAlk5BBsz65CMmX9UqV1EXjbdn5vuDlzMPAFA==
X-Received: by 2002:a05:6000:230d:b0:47f:8ce7:8684 with SMTP id ffacd0b85a97d-481607100bdmr59106215f8f.6.1787064360018;
        Tue, 18 Aug 2026 07:46:00 -0700 (PDT)
Message-ID: <d1498f93-1b6e-4113-9473-efe9bbc53b93@suse.com>
Date: Tue, 18 Aug 2026 16:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] x86/passthrough: Extract pt_irq_dpci_setup() from
 pt_irq_create_bind()
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
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@vates.tech>
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
In-Reply-To: <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387f6f000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1787064360-77EC24E9-B407A8CC/0/0
X-purgate-type: clean
X-purgate-size: 2251

On 27.04.2026 15:54, Julian Vetter wrote:
> @@ -238,10 +242,11 @@ int pt_irq_create_bind(
>              unsigned int i;
>  
>              /*
> -             * NB: the hardware domain doesn't use a hvm_irq_dpci struct because
> -             * it's only allowed to identity map GSIs, and so the data contained in
> -             * that struct (used to map guest GSIs into machine GSIs and perform
> -             * interrupt routing) is completely useless to it.
> +             * NB: the hardware domain doesn't use a hvm_irq_dpci struct
> +             * because it's only allowed to identity map GSIs, and so the
> +             * data contained in that struct (used to map guest GSIs into
> +             * machine GSIs and perform interrupt routing) is completely
> +             * useless to it.
>               */
>              hvm_irq_dpci = xzalloc(struct hvm_irq_dpci);
>              if ( hvm_irq_dpci == NULL )

This wants to be part of the patch increasing indentation.

> @@ -269,15 +274,36 @@ int pt_irq_create_bind(
>           * We MUST check for this condition as the softirq could be scheduled
>           * and hasn't run yet. Note that this code replaced tasklet_kill which
>           * would have spun forever and would do the same thing (wait to flush out
> -         * outstanding hvm_dirq_assist calls.
> +         * outstanding hvm_dirq_assist calls).
>           */

This would also better be part of the earlier patch. And this block needs re-
flowing there as well.

>          if ( pt_pirq_softirq_active(pirq_dpci) )
>          {
>              write_unlock(&d->event_lock);
>              cpu_relax();
> -            goto restart;
> +            continue;
>          }
> -    }
> +
> +        *hvm_irq_dpci_out = hvm_irq_dpci;
> +        *pirq_dpci_out = pirq_dpci;
> +        *info_out = info;
> +        return 0;
> +    } while ( true );

do { } while ( false ) (as Teddy suggests) wouldn't be much better. Why not
simply for ( ; ; ), as we have it in quite a few places elsewhere? Yet then
I'm not overly happy to see this secondary change (to complicated code) be
folded into a change of entirely different purpose. Please consider
(further) splitting.

Jan

