Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BBACA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:45:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437396.1656298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvYx-0006Dw-2J; Wed, 30 Sep 2026 14:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437396.1656298; Wed, 30 Sep 2026 14:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvYw-0006Do-V1; Wed, 30 Sep 2026 14:45:38 +0000
Received: by outflank-mailman (input) for mailman id 1437396;
 Wed, 30 Sep 2026 14:45:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBvYv-0006DI-EJ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:45:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvYu-005WsJ-R8
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:45:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd2086-e002-0a2a0a5209dd-0a2a450cbf3a-14
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:45:31 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd208b-f479-0a2a450c0019-4a7de18cd57f-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:45:31 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a00713639cso25428325e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:45:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01e64dabfsm5588935e9.6.2026.09.30.07.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:45:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1790779531; x=1791384331; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZBq3WUDaWCkwFKH+Grs8AUxsLXZJRYEH//emU4AsuE=;
        b=gY8uTnCFP79Xc3WIGu2WPV1gn5p2qCK2ah0pnwjDdf3GsJ7vwx4Ku2tUO/sql8TAfo
         69cnqnBrq8barfpGMWJeALBor76IZR3PutXF6jqKeG9Q8EixVrVA+ge03uQVZBwIIikQ
         mTM2L8C/P7S+iaWE2O5c4gMJ8jWrJUog01Z6Lz3IMAhG0eIpg4uE/9nlbAQrPzIkQh5o
         svcRZ96/GetCV7dzTEdYq//kqWdXQ+AwIzeLdjuxgXSvz+pbB7yzs+cREKeOjTnagOni
         q5VAU+maTyvKeTQb2Ru0/8DeLCbm+uz72kEifsGreUyvBF2HszcGS+iXQ5P2doajDvXW
         yDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779531; x=1791384331;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZBq3WUDaWCkwFKH+Grs8AUxsLXZJRYEH//emU4AsuE=;
        b=FugoPlkUUJSx5DHYjKsh5vhMyUw1q7yHvKtXVcTJYIluGXMhBBPPN9MDw8s8OrnHXZ
         MxVB6igQcRmwIkt4sFYnjJ/oTREY58hsIGxoR30/yMfcyTo7VNANPq0LJGz8gczAKOon
         9zz9rZnGER+wU86sAl4O4Z4gsbWygV0mdyRkN0Qkq2O6H2FQaUm7x9B2JFJ2ZBCS7R07
         M60i4JP5UkaAlYvi8RYI67pMYRxlXRqAnibopL7m3zwaN5kEHEBXxmv4GP0dBZ9LOIkS
         PRSaLhF3ZfcqqmzvwCF2EYc96rCRNVu6v4ypRqP4SPULwDyvHawm11M60Kly8XRv3pRz
         Uwzw==
X-Forwarded-Encrypted: i=1; AKwUvBzM6FIjrg4GlWbi5vsVyj78BzB7QMHsLRdJ5m8g5qdzCdpbtUeOM9kgyV65u/itXSLksFZraq1xbHQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++lUUjEU7tO2WeKw1zE4ABtNQb6RTRchUT7qhJTVvHLiVZQLv9TH
	esk9z7dEjHD2saggq91ZS9anZkmuqFuJRUUVbBX+Gp2xF4BKVF6ZcMlqZHw4akQg6g==
X-Gm-Gg: AYBFou1Ihg+sP/M+yVntJw6j3DPMtJOfvQaRVK68/GUc0CtvwgXBeTH2DvIPIrpdwNe
	9FurTVlUIg/gqJcimZCLfjgo0Ya9VJRVi0HmI0oi15gORu33I85hMVjoyt9peJx9vQMAnVWvkXK
	+3TMZ552TGDfAkWQ5f2PAC8pyG1rZ/Jz/Jku//J4ubh33aaWYOCbFkjxgzbUnMXbokgRS7cQosa
	Aue7LTSDHuD1V9VSFwskhtY0o/l7uUdCcfWCseyzPQA6iTpVnsVVKLCGqSQpUUYUahYTX1dkodm
	rrUyfi7Rp5N8I6nUoLMywQpqwRQdyqj5SH0QkzDdxfsqqq/jPEzjt64InJd9iwnX9crAYDHc8zx
	zqD879JMnCWR06lbSLbWjnOHXY+4rPhn4Fc0q7VcTB9DiwBbgewkaV0YxoiFQrk1OzbALrc8VOa
	hNheLgJN8gEsOjlP/M1LTCyoAF9ODuzYMxMmT0XfodnyhAL62MQJiQnuXTHFRwjM9hCFkJaUm8+
	kBc2m1yioM7J1R+0vYWsLDE8oNam2CoSO/M7KC3vBAI63v3wqyz4THdXHYTeg==
X-Received: by 2002:a05:600c:1912:b0:4a0:1d24:dee3 with SMTP id 5b1f17b1804b1-4a01d24e165mr9168165e9.17.1790779531201;
        Wed, 30 Sep 2026 07:45:31 -0700 (PDT)
Message-ID: <595c9bc5-7fa7-459d-987b-bc9cdde14a2c@suse.com>
Date: Wed, 30 Sep 2026 16:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/11] x86/passthrough: Wrap pt_irq_create_bind()
 restart block in braces
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
 <1788444856.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3@vates.tech>
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
In-Reply-To: <1788444856.8631fc262581453bbf619ec5b2062170.1a0679ed206000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790779531-020C1A5B-A9AAC002/10/78276251493
X-purgate-type: spam
X-purgate-size: 5127

On 03.09.2026 16:14, Julian Vetter wrote:
> Enclose the restart/retry block in pt_irq_create_bind() in an explicit
> compound statement to prepare for its extraction into a helper function
> ("x86/passthrough: Extract pt_irq_dpci_setup() from
> pt_irq_create_bind()"). Reflow the two comments inside the block that no
> longer fit in 80 columns at the increased indentation, and fix an
> unbalanced parenthesis in the second one. No functional change.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v5:
> - Fixed two comments to fit 80-columns (and fixed unbalanced-parenthesis
>   in comment)
> - Commit message now names the follow-up patch correctly.
Having this properly split (taken together with the subsequent two patches)
is pretty helpful. Now that one can see what's going on, I wonder though:
Do we actually need all the re-indentation here? The setup ...

> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -229,52 +229,55 @@ int pt_irq_create_bind(
>          return -EINVAL;
>  
>   restart:
> -    write_lock(&d->event_lock);
> -
> -    hvm_irq_dpci = domain_get_irq_dpci(d);
> -    if ( !hvm_irq_dpci && !is_hardware_domain(d) )
>      {
> -        unsigned int i;
> +        write_lock(&d->event_lock);
>  
> -        /*
> -         * NB: the hardware domain doesn't use a hvm_irq_dpci struct because
> -         * it's only allowed to identity map GSIs, and so the data contained in
> -         * that struct (used to map guest GSIs into machine GSIs and perform
> -         * interrupt routing) is completely useless to it.
> -         */
> -        hvm_irq_dpci = xzalloc(struct hvm_irq_dpci);
> -        if ( hvm_irq_dpci == NULL )
> +        hvm_irq_dpci = domain_get_irq_dpci(d);
> +        if ( !hvm_irq_dpci && !is_hardware_domain(d) )
> +        {
> +            unsigned int i;
> +
> +            /*
> +             * NB: the hardware domain doesn't use a hvm_irq_dpci struct
> +             * because it's only allowed to identity map GSIs, and so the
> +             * data contained in that struct (used to map guest GSIs into
> +             * machine GSIs and perform interrupt routing) is completely
> +             * useless to it.
> +             */
> +            hvm_irq_dpci = xzalloc(struct hvm_irq_dpci);
> +            if ( hvm_irq_dpci == NULL )
> +            {
> +                write_unlock(&d->event_lock);
> +                return -ENOMEM;
> +            }
> +            for ( i = 0; i < NR_HVM_DOMU_IRQS; i++ )
> +                INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
> +
> +            hvm_domain_irq(d)->dpci = hvm_irq_dpci;
> +        }

... here and the logic ...

> +        info = pirq_get_info(d, pirq);
> +        if ( !info )
>          {
>              write_unlock(&d->event_lock);
>              return -ENOMEM;
>          }

... here don't need going through again after a restart. Therefore what
wants converting from goto to for() is potentially far less: It's the
->is_dying check at the top and ...

> -        for ( i = 0; i < NR_HVM_DOMU_IRQS; i++ )
> -            INIT_LIST_HEAD(&hvm_irq_dpci->girq[i]);
> -
> -        hvm_domain_irq(d)->dpci = hvm_irq_dpci;
> -    }
> -
> -    info = pirq_get_info(d, pirq);
> -    if ( !info )
> -    {
> -        write_unlock(&d->event_lock);
> -        return -ENOMEM;
> -    }
> -    pirq_dpci = pirq_dpci(info);
> +        pirq_dpci = pirq_dpci(info);
>  
> -    /*
> -     * A crude 'while' loop with us dropping the spinlock and giving
> -     * the softirq_dpci a chance to run.
> -     * We MUST check for this condition as the softirq could be scheduled
> -     * and hasn't run yet. Note that this code replaced tasklet_kill which
> -     * would have spun forever and would do the same thing (wait to flush out
> -     * outstanding hvm_dirq_assist calls.
> -     */
> -    if ( pt_pirq_softirq_active(pirq_dpci) )
> -    {
> -        write_unlock(&d->event_lock);
> -        cpu_relax();
> -        goto restart;
> +        /*
> +         * A crude 'while' loop with us dropping the spinlock and giving
> +         * the softirq_dpci a chance to run.
> +         * We MUST check for this condition as the softirq could be scheduled
> +         * and hasn't run yet. Note that this code replaced tasklet_kill
> +         * which would have spun forever and would do the same thing (wait
> +         * to flush out outstanding hvm_dirq_assist calls).
> +         */
> +        if ( pt_pirq_softirq_active(pirq_dpci) )
> +        {
> +            write_unlock(&d->event_lock);
> +            cpu_relax();
> +            goto restart;
> +        }

... the logic here. Of course we could also tidy this afterwards, so I'm
not going to insist that it be done up front. Yet I wanted to at least ask
whether you might be up to doing that transformation in order to reduce
overall churn.

Btw, the first sentence of this comment likely wants re-wording in the next
patch, as it goes from "crude" to "normal".

Jan

