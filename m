Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E5AC79FA0
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 06:26:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411129.1641864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3pHw-0005UZ-BC; Tue, 08 Sep 2026 06:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411129.1641864; Tue, 08 Sep 2026 06:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3pHw-0005US-7I; Tue, 08 Sep 2026 06:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1411129;
 Tue, 08 Sep 2026 06:26:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3pHu-0005UK-Hg
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 06:26:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3pHt-008uw5-5i
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 08:26:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9faa98-8faa-0a2a0a5109dd-0a2a4505c5fc-2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:26:33 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9faa98-4cb1-0a2a45050019-d155dd2dbd0e-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:26:33 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4859245e493so2038395f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 23:26:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce46696e8sm318885975e9.0.2026.09.07.23.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 23:26:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1788848792; x=1789453592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NCGHLLm0dUzJmFJNvDd/j288PmHir+QouhzLPNUm8nY=;
        b=VfwWWWmx4OXLevCN5iLZMX8RdslKEtMb/v0wyvFXJ7AP4gHtmV2HcrUdc37Ezu0pnN
         j8GIgd42SUXjHH/+JhSABOURxiBbwZpinM0cRHFDvEo176R/5Xmgl13H9Cmj5yBLpED2
         jSQuAGXmg66RdoMYWdpGHdRON5LSV+eXMg0P2Q6LOMF2XGBAofAlRMMyXtByFgh3afmA
         c9JcPJAxNDo7+rAsQh+5NXRn+NFVDQ2petHf5x2fbt5fy5/UehRkcMEVFo86se9ZXatm
         i9SWR+ukatviCMG3R9SuCPeybMrEsm5E/eQiOqzP6at2AxAM5rx08UYuRslFRGJFwcTK
         45vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848792; x=1789453592;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCGHLLm0dUzJmFJNvDd/j288PmHir+QouhzLPNUm8nY=;
        b=gC1G+yiS+FPP8isPxIjkQolqu7oHbJmM1D9situmYl9/JfTJIzI45LSskKM6BZeUb1
         Em2s8sdwL0T3n77RJyzF2ViiMBOcCjWundOHhtqrBf7tvE2wzU/nIu19DmXDmHT4Q6PS
         nzDcKja2idzFgQ/TW4vim5GgvPD8MALTUcvKk0MiWJCmtIyDsXwFuQQJpMqBIrUB1MTX
         /nean8olYR8ZUNyI+Ab4iVj4d9kVoCK2LstG4GcMBtZcaBbf5ZCzzzmZXwVQr7Q6WCVe
         RbSCOvQdu1P4dQ3ws7t9s0cZB2GWh4XbgM9gZUYcWavTFVfCGbvUipfJ4epG8ZkcnI0b
         8fQg==
X-Forwarded-Encrypted: i=1; AKwUvByMPrnVE9JeVCyQBC9ad/dAmOwfVeqMEN4js2AzEioxHAkbubHqjF9PmOsghs+Wfn4IRohZ049xr8k=@lists.xenproject.org
X-Gm-Message-State: AFuF++lozKdx7Y3LTV7BqPBobJV59B0LksoXAPfbfIw90Rt2bbbTh7Hg
	xYK+WLuyMdeH3VIO9x8qvYtZPuxGLCtGQ6yKIHd3MrBKejsW26hsTuyTG2vmLizOBA==
X-Gm-Gg: AYBFou3ySyraH7boK3bwHD27Y6K4sAsTaQAkFUnI+LF4hSUhBkCxAQbfD+HnZhW/Nhp
	hPOSjHGNlvgC2QtTG3NvBbGHliHJ963c/1olmczXZsLwR6FQ6Q/Uo9pfJdUy8yD2/A04IiIA/Q7
	nQ0tqFlEmwZlJaM/gaek58gKZxCLX4lXq+GUcOBj6gxorJOX5fqNn2ujObwxJNz5z/kspJLDZVA
	EiA6ZdrcRgWSltOqWmayM3+B116eJdgN65YJeBb85pgbveRuJPrMHl3g178PYL876Ox6WVeQe9r
	ZgnXQeoeruOEuVajoAsbhKB5iX8m8t7oCukgpjRF3Titmj/UvX0RIFBjrIEmjQtX60Pd5B1usT8
	/nVPp0IMrUWcZNd9112sqPlNXqex8j3TolU+qkiz5dlkr2FaJj9Zs7EUSOUAoneM8zzJPLOZwS0
	Do5bBN0Zk58dzZRYyZRwasKE9xrHs2AjnmuIvJQlK26aiQqqf0+T6Isb8uZDCFeAx5TkG8rVgO0
	ioU7hKnsHeL58Hamwvhileak/p74wUws40J0QtcRg6PyHmri+LW
X-Received: by 2002:a05:600d:4444:20b0:49c:fa21:e74a with SMTP id 5b1f17b1804b1-49cfa21e8c9mr176786235e9.32.1788848792483;
        Mon, 07 Sep 2026 23:26:32 -0700 (PDT)
Message-ID: <a11ec239-460b-4509-beee-4f65063ef336@suse.com>
Date: Tue, 8 Sep 2026 08:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260907213231.3159241-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788848793-F4AA72A1-23E0712B/0/0
X-purgate-type: clean
X-purgate-size: 2359

On 07.09.2026 23:32, Andrew Cooper wrote:
> @@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>      return false;
>  }
>  
> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
> +{
> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
> +
> +    /*
> +     * Treat pre-production as always safe - anyone using pre-production
> +     * microcode knows what they are doing, and can keep any resulting pieces.
> +     */
> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
> +        return true;
> +
> +    /*
> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
> +     * sufficiently old firmware.  GNR101 retroactively declares that one
> +     * ucode had incorrect min_rev fields, in light of discovering GNR98.

We still have no min_rev field, so imo a reference to it wants some
clarification. Really I first meant to ask why there's no use of that field,
to merely make that one exception.

> +     * Both are incomplete statements of the problem.
> +     *
> +     * At the time of writing (August 2026), the believed safe sequence is:
> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
> +     *
> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
> +     * GNR, this allows multi-hop loading to get up to the latest.
> +     */
> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||

This is odd: The lhs of && uses the lower bound of the inner permitted
range, while the rhs of the && doesn't use the upper one. If it's intended
that way, I think this also needs clarifying in the comment. Otherwise imo
lhs and rhs better would be consistent in this regard.

> +          (cpu_sig->rev < 0x01000405 && mc->rev >  0x01000405)) )

This one, otoh, fully matches the comment.

> +    {
> +        printk_once(XENLOG_WARNING
> +                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
> +                    "microcode: Firmware update recommended\n", mc->rev);

I think a 2nd XENLOG_WARNING is wanted after the inner \n (or none at all,
to use the default for both).

Jan

