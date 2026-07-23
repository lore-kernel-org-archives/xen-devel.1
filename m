Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C9EC531CA
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jul 2026 13:31:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369155.1618038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtVc-0001rs-TN; Thu, 23 Jul 2026 13:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369155.1618038; Thu, 23 Jul 2026 13:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmtVc-0001rl-QK; Thu, 23 Jul 2026 13:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1369155;
 Thu, 23 Jul 2026 13:30:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmtVb-0001rd-Eg
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 13:30:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmtVa-00FvMJ-HS
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2026 15:30:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a621778-2eae-0a2a0a5409dd-0a2a4508e8e2-24
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:30:42 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a621782-f659-0a2a45080019-d155dd36d126-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 15:30:42 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso628153f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 06:30:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f8635c8d7sm14471327f8f.21.2026.07.23.06.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 06:30:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1784813442; x=1785418242; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD6qRQL1y86TWiBYPwsDblFWyLfSp0GjXcXDx6AN+P8=;
        b=X9E9liboJd41RnFXnPm+Cmj9AJq0hvw310cjbfkfV8qia3QRGp9DhCr14IE8E25QrY
         1KHXr8k3byBX4XXGP4Bm8tmZNglooqVjHFCl8m9uyvU4nJY6k0aKu9a6SEjrP2+piUzR
         XngvQcRwNMt4L2d/KFX84MrojuGMbvH0tGn7GHXPtmuv8X+LwQFnd9nQCKwTrn62Qk22
         L9NYwBnhrVGd7Z58E0ccAjfdApJDB+GCGNXkZ7RB+m82L1KIJovd/hdMuTJ+DOTyvdmD
         B6gfQVoCCGgJF1z0rH2XM5jxOaCrh+TKgAM9EX0b7mr4jPcWLgoLykYGWSfxy2Ua5dH4
         51bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813442; x=1785418242;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD6qRQL1y86TWiBYPwsDblFWyLfSp0GjXcXDx6AN+P8=;
        b=QR7VKehqVYwtuIAtKsUvjanfMsFmwOh8RQVX55RciMEn3f1RA8KbgFgJUOjCJAD1EB
         0k5gvoToDRVtFYizb6b9RxmybEd2OBxMtPwHV8dxstKR7FHEhciLQugCLXOMYHgtrD//
         f7f0NVWwekRp66QhbxyEO/eDWDU3Hg130s9BjacFueDxDuLlQgjwS2JHJTOPOmAxNKSD
         zI7KxLjrTF5ar272igWA10fXLdSbY4ks7FnEKpvxCU/kp3P9gsBSUZcmsUodcTeXsrsp
         I0M0xrLq1V6Y1bH3Tiz205IriUBWcYlTkvHDYw52k06T9bIBZqsd3D6biicL7AW2ZMmg
         6Mzg==
X-Forwarded-Encrypted: i=1; AHgh+RrnITLLP5ZvSefGZIQ0sMV6O2n3jbCkg2qH8BcPcvR4hd4Smk6V0sUVlScAnjCL5Q0BkVj1AVdjUdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmEoJDJ7NoEXy/acdYtZeb9lJblPlRio4ZL2s8wVgwpoMA3gPT
	IBrPCWETv4dFgIMCuSKDwgRi6s4fMJQh77+Zb4Hz2pkraHfqqyLPGVtedHH+Xx2YMQ==
X-Gm-Gg: AR+sD13OGZfxQie/hff3wlrYdN+UEShHsFnSzvB9rCUxZjCn9v1QNViAhw9Osr6MR7m
	WE9elvVqPQJinrimg1vgYrndonjePXF4SbDtT5bcaO3ci8ILWTBmckXkIALo5Ur4hT2Il1RC21q
	eg20YLile2zHxX7IAUNkBZjaOAqDbgd8pFcdvH8kE27GcSQ8HrDsVfMG8OPKh2yg0p1U7xTiHXL
	Lu5wq8VkdjLKr2405vw5s5aL/i7QrwkQqO8PjSCAPY6Jtbn1v9igWLuM+viOdqXmslSHH6yu+CD
	6ZzPDYd0mtgompTet7s7IV1nkmX7I98YDPpkL2xxBKq5fgOT6embFKXqAUTBws3wRWUMcBiiedt
	VrlgqopSI8QdLA4T/rxDx3ecfXoautYMgd4tzCICSO/2QqAJLlVya7V+gNe7INsRs6kOtugb1I3
	dC4CehSGbpx/o89uMGzxSN4ZZ5ElKGYxcaC4a5VmkEETvFLD0VDFhZ0uVQrsyYzs7Sfg==
X-Received: by 2002:a05:6000:454d:b0:47f:9311:34cf with SMTP id ffacd0b85a97d-47f931135edmr1126684f8f.22.1784813441547;
        Thu, 23 Jul 2026 06:30:41 -0700 (PDT)
Message-ID: <c64fc958-73bb-44ed-a3b2-dc368ce675ac@suse.com>
Date: Thu, 23 Jul 2026 15:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c489a420b1c01c5312773c2e2b51f63d3babf855.1784559209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784813442-CDF4787B-9ABFEA81/0/0
X-purgate-type: clean
X-purgate-size: 1997

On 20.07.2026 17:59, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += aia.o
>  obj-y += aplic.o
>  obj-y += cpufeature.o
> +obj-y += device.o

Since you don't permit OVERLAY_DTB=y just yet, this could simply be

obj-y += device.init.o

for the time being. Else use Arm's construct. (And I can't help the feeling
that I did point this out before.)

> @@ -227,3 +253,215 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>      spin_unlock(&desc->lock);
>      irq_exit();
>  }
> +
> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
> +    ASSERT(desc->action != NULL);
> +
> +    return desc->action->dev_id;
> +}
> +
> +

Nit: Just to remind you - no double blank lines please.

> +/* Route an IRQ to a specific guest */
> +int route_irq_to_guest(struct domain *d, unsigned int virq,
> +                       unsigned int irq, const char *devname)
> +{
> +    struct irqaction *action;
> +    struct irq_guest *info;
> +    struct irq_desc *desc;
> +    unsigned long flags;
> +    int retval = 0;
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    desc = irq_to_desc(irq);
> +
> +    /*
> +     * release_irq() frees this action via xvfree(), relying on action
> +     * being the first member of struct irq_guest so that &info->action
> +     * coincides with info itself. Guard the layout so a future field
> +     * reorder can't silently turn that into a free() of a mid-allocation
> +     * pointer.
> +     */
> +    BUILD_BUG_ON(offsetof(struct irq_guest, action) != 0);

Can't release_irq() simply use container_of()? One way or another it feels
like you're painting yourself into a particular corner ...

With at least the earlier two issues taken care of:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

