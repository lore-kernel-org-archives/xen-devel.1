Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D10CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:04:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448137.1664192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeza-0006AP-Q4; Tue, 13 Oct 2026 16:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448137.1664192; Tue, 13 Oct 2026 16:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeza-0006AI-MO; Tue, 13 Oct 2026 16:04:42 +0000
Received: by outflank-mailman (input) for mailman id 1448137;
 Tue, 13 Oct 2026 16:04:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGezZ-0006AC-Ic
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:04:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGezY-00G0rQ-Qn
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:04:40 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace5694-8faa-0a2a0a5109dd-0a2a45039e26-12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:04:40 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace5698-fae8-0a2a45030019-d155802eb1a5-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:04:40 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so27627605e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:04:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bbbdd75sm288269005e9.1.2026.10.13.09.04.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 09:04:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1791907480; x=1792512280; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BunnkNB1gTMoRua6fKKaK15LnDOzwmyq7eAoBBwjfg4=;
        b=CzDatNtCVUlqpn/txqCSX1moRrvzDddijIQNcys9LybzJ28sCtBrTndWlOb4YNbCro
         faMUKyxxd8Os6zJrr2Scanjyel1UnV8xDRIFGqf/b6jnLjdhasjnPd6aZI1iixfsTHXC
         +r/QmctrLRiMQGVP2vzTYN9uUqHxg6UPpneq3Vpp3DfeZCtyvpqE9ve+BjNd/pNanQQ5
         3QrZ/saorhvwfj+tqI1iH0KTbcEAxr6k2JB/w6xtWmssvUs74NH/qMD2h63dxYaeMs11
         w0XsoK0md/Eyjuo0wSFh1+BCpAEPqzGBY5JIdJTnrKi1rEljJ3G1UEuPw3KjEibtU/uI
         c3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907480; x=1792512280;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BunnkNB1gTMoRua6fKKaK15LnDOzwmyq7eAoBBwjfg4=;
        b=2ci8liEjTz8mR2cZMMr0GG15056Si1rEmD0lgAOizrmsqap8gwze3jbhOkjC8+b+jc
         8IZzVigKcqOwsS+jOJncXq1r039rWaFYXtyZBcNXNvMiQxwXgFfoCUHfdi5RFYoQ1tPJ
         LnZm2Y5S1fsdmJOZV6n6FMH6O3y/jSfnm0IgeuvZOge4X7CfwawlCTSnBrWEIQ3gsJmD
         MUDZvA+RwsD8/iBnX7tBmXQsaNUSmPFAWQCzljArIy0Qma39vUIByoPAqHk1+c+2uoZB
         1+gReH+jPe1R5O7yqNmg2Fed7Lg4zafHD3ViogxdgQDg2tsYW2ZjLNNpTq6/cJx1beBL
         JCzg==
X-Gm-Message-State: AFq9FYIcvPo3ksCk5iVCifBYjhzuICaEjBpM5EX1nM53k/61VNwCYyYk
	gKiKqxFV8G8/cz/FIXi91XtKS0rXYxaNOD/s0gqa2LqMBn5+E6wfPRr5n2HffeB5BQ==
X-Gm-Gg: AYBFou2f9wSBPCy9WFqTADptqbKoPwXcc2KK+CudXLI0wGUpJT/wz+kwsKxqUyARO4Y
	jWc9cXvPvVx/aZgz8hw409DzcNAljh0dbIF1yFqnz874B+S1L7/cLUDG+UuneLtSQZMrfe5+QPT
	mqPK/oGcoyv9RwwWx4eFGWFbEB4MjEVBTYXG4jpiGYsibeD3qM8xoe2tR6tPtiavfdXCWgt6a/t
	QU1LoGg+1puizAtazECQds8BkWCktY+d8HVpd+VVwHi8xbO4lqOLS4+J+6BuxtvL6VQrjKQ+WqZ
	upC8Rl5Y8E5S2RkCHtG1NW0SFQMWhMv7spcCNvYbuGRrHr2Okh3MnkPYNdY7RsvgGId+Utu6nsl
	hJGkD5JEzVi/z0Il8KZrexB5uWerAptxSu4OqgTqaTC7Mw8tSHP45KBf91kaJt0pULlhTh9FM+M
	z6qFLBEQP1Y7flt8OHKtqpTSI+090lEEJKdxp21SMgU26Y+kGykWOVf3g0AoYORYW916iwdhabT
	CeuFqaJuvLSdETHlYB8O1dckOaIQcbO6k8RK9hzhPSrdRKG9KNgSdmUdpti2cs=
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr128827115e9.0.1791907479983;
        Tue, 13 Oct 2026 09:04:39 -0700 (PDT)
Message-ID: <f79d68c4-271b-44a9-950f-a6a85f4ea7ff@suse.com>
Date: Tue, 13 Oct 2026 18:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/PVH: split pvh_setup_acpi()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d0f1a88b-66a0-4bf9-9dd2-ea0cc48bc3ae@suse.com> <as5TyD0ZX1HnN578@Mac.lan>
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
In-Reply-To: <as5TyD0ZX1HnN578@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791907480-6D8D54E9-70BDA573/10/78276251493
X-purgate-type: spam
X-purgate-size: 1650

On 13.10.2026 17:52, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:23:16AM +0200, Jan Beulich wrote:
>> All E820 manipulations want to happen before the initrd is placed, or else
>> pvh_steal_ram() may steal from the tail part of it. As a second step,
>> split placing ACPI data from actually populating it.
> 
> Would it be less intrusive to duplicate the memory map (like it's done
> in a change ahead of this one), and subtract the kernel and initrd
> region from that memory map, then use it as the basis for
> pvh_steal_ram()?
> 
> We could adjust/replace pvh_add_mem_range() so it allows changing
> regions from RAM to other types.  That would seem to be less churn
> overall.  Maybe you did already consider this and found further
> problem with this approach that I'm failing to see?

No, I didn't try that route. In fact despite the order now this patch
(and maybe also the VMX one) pre-dates the E820-copying one. The one
aspect I consider problematic with the suggested alternative is that
then two E820 maps need updating: The one with kernel (not sure about
initrd; see below) subtracted out, and the one we actually mean to hand
to Dom0.

As to overall churn: I'm not sure which one would cause less. Certainly
the patch here would remain largely unaltered, as the splitting is
going to be necessary no matter what.

As to initrd: That one wants to go last, as it has no constraints on
placement. If there's not enough space below 4G, we just put it above.
The same isn't true for ACPI or VMX data (albeit for the latter I
haven't checked in how far placing below 4G is strictly necessary).

Jan

