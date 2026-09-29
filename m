Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC9CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 15:35:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436524.1655175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZra-0004Lm-MF; Tue, 29 Sep 2026 15:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436524.1655175; Tue, 29 Sep 2026 15:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBZra-0004Lf-IF; Tue, 29 Sep 2026 15:35:26 +0000
Received: by outflank-mailman (input) for mailman id 1436524;
 Tue, 29 Sep 2026 15:35:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBZrZ-0004LZ-8e
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 15:35:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBZrY-002njy-3s
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:35:24 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbdab7-e002-0a2a0a5209dd-0a2a4509cae4-2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:35:24 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbdab9-be1a-0a2a45090019-4a7de18c8c5e-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 17:35:21 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a006bb267eso11909695e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 08:35:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cf4598esm93469635e9.0.2026.09.29.08.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 08:35:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1790696121; x=1791300921; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZyO70NfDiF6JXCDY9tMHtHB5fcbO61/4cbXYv8ya30=;
        b=SLYVHtkCNZ14fQaVsoHDOsdNuBQBLDlo4Btwl1NHFrzvI1nB1Ka89iVlHo1OWsbbyK
         bscNBfIVH5P3PgXc/FvBOgoEYZkFoUwGdVE9pjHv5F6lzAFofIPjNi9tIHNPrOepoXwR
         dxeWb1p395kSQDhrseQdTlBQV9CsnXvvoNInWkJ2R1nx1Fh8hJvbnb8DAPi4DU+ALROU
         Lsiaqx+5uLLdDjSdhF8ppYfTBBvJsKHPXbvtK5Pm7+OMWvf0d45WTuEr+OL8U4Xe4KCv
         o7EpNe7AtOSAAhLaEsPLr3O2WKZ43IPdu7nrlxULXmrxtSfjATpsvuwCdSsXn6rdJ+WG
         GjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696121; x=1791300921;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZyO70NfDiF6JXCDY9tMHtHB5fcbO61/4cbXYv8ya30=;
        b=Bi83SoPb3+7sq25Hl3/F/dHCLLDYEb1qkpWgHOtO4VqjkofHiHgJLZSBoBGACC7u6j
         DG2CsxQgxfTgBfBLgQwnYyh7zGeyW6qJM4cfVsX5IC2EhFoyIT1WXAcQ5y30W+BgVHXP
         JBB/oGudB07s92t7GkMuyIb1b2HkMAV0W+fv9lVyQzYog5XnPE7z8ab90x6h4ykSqSjV
         27DIgD9M7GLHberU4H9OTJb7F0DxnSw3wTKMZpTJxyKe80zxdIx+RaMssdm/aWUKx14o
         2OHjM/SabP3ohdBhyMaCEMY0JUdII3ccVLgu/S64+1k/d7WbJoEuL+mM+ZZUsILvos1o
         pUFw==
X-Forwarded-Encrypted: i=1; AKwUvBz3QiGOSADSUPU1IsMhuAf4qQo5Qg02E0zwge9sMcFUvs8pj6e3JWUE13gVStemn5XS70jBn0RWtmw=@lists.xenproject.org
X-Gm-Message-State: AFuF++nJRWz1GPNII5JUD1Ujr1rHNxkBmAIb2c7KZt8jMTe3Jvr7klbN
	5RSC3VKI00uc5rs+wN5htB8bAeJgIkCD28uFbTWLt0s6ZpIiHUcXPUoBHTGi5M76Nw==
X-Gm-Gg: AYBFou3/K5bpCXFwHRKCbHinrxajjN4qSzHZsaXJ+hixgYCkIpu2WoKGSUq8JeUJmTj
	K58eoqz8n1uEPyD/DluGO4qBcRKnoCsjNws4qnedcH6HYT/pP36v0AwUz6/qZ2NTbRcMT48MbDu
	m085M9lpIai5bPUq3UZk8ncN6H51fSoSXSOGjA/XgijOe2FA6rEG5SPiNQB+/Ma7da4r1TjVauF
	uaWrs6yaVOTv5pyHzurGZixM2Ey+liPOQSeePjt3nwLOdlm4Af/9f+VY1pJMZgm+oyJv1jTDwpB
	tPC+3mBmAaV/SlbTS33UANOSIkqXiizunt9YjMiAVJFFOKJrXIySxfk5aZsOdGTiiHtNkxVef3L
	93o5U2UjYKg3qdyiMqWeCjzczAnWda7m6vvYpSjMiBTPvR2VHrEaT9l8iQkFTuHc3erwrqo2dX/
	kyMvLa+UM/DudQSm3zjy71gJasGa8BMRyfGwSH0vDaA32MayPd0nyOwKK78737QX51t969DQozy
	nyhLjJzb4fTeJNr6kOBoanGxeCxxpDVgL5UQcsGrngFkbR0riydg9SP9k1IJUTSPSQIXmZvuKk=
X-Received: by 2002:a05:600c:8b86:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-49fe6701ed1mr288631865e9.34.1790696120708;
        Tue, 29 Sep 2026 08:35:20 -0700 (PDT)
Message-ID: <1753bd8f-effd-40c4-a3b0-1e61ec8f7474@suse.com>
Date: Tue, 29 Sep 2026 17:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: refactor urgent count update
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Cc: dfaggioli@suse.com, jgross@suse.com, gwd@xenproject.org,
 artem_mygaiev@epam.com, Ruslan_Ruslichenko@epam.com,
 xen-devel@lists.xenproject.org
References: <20260925212803.799550-1-ruslichenko.r@gmail.com>
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
In-Reply-To: <20260925212803.799550-1-ruslichenko.r@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790696121-FD26A034-ACB601FA/10/78276251493
X-purgate-type: spam
X-purgate-size: 2635

On 25.09.2026 23:28, Ruslan Ruslichenko wrote:
> From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
> 
> With current implementation whenever vCPU blocks on
> waiting for event channel via SCHEDOP_poll hypercall,
> scheduler sets 'is_urgent' flag. The flag is cleared
> on vCPU runstate change, if it is no longer in
> 'VPF_blocked' state or its vcpu_id is not in poll_mask.
> 
> However, the only way for vCPU runstate to change in
> polled state is when it's going to wakeup.
> 
> Thus when 'is_urgent' is set, inner condition will always be:
> 
> if ( unlikely(v->is_urgent) )
> {
>     if ( !(v->pause_flags & VPF_blocked) ||            // Always True
>          !test_bit(v->vcpu_id, v->domain->poll_mask) ) // Never evaluated

Maybe this invariant indeed applies, but then there must be more to it.
Simply from taking the "else" branch here

        if ( unlikely(v->pause_flags & VPF_blocked) &&
             unlikely(test_bit(v->vcpu_id, v->domain->poll_mask)) )
        {
            v->is_urgent = 1;
            atomic_inc(&per_cpu(sched_urgent_count, v->processor));
        }

clearly immediately afterwards the invariant you name does not hold.

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -241,26 +241,22 @@ static inline void trace_continue_running(const struct vcpu *v)
>  
>  static inline void vcpu_urgent_count_update(struct vcpu *v)
>  {
> +    bool cur_urgent;
> +
>      if ( is_idle_vcpu(v) )
>          return;
>  
> -    if ( unlikely(v->is_urgent) )
> -    {
> -        if ( !(v->pause_flags & VPF_blocked) ||
> -             !test_bit(v->vcpu_id, v->domain->poll_mask) )
> -        {
> -            v->is_urgent = 0;
> -            atomic_dec(&per_cpu(sched_urgent_count, v->processor));
> -        }
> -    }
> -    else
> +    cur_urgent = (v->pause_flags & VPF_blocked) &&
> +                 test_bit(v->vcpu_id, v->domain->poll_mask);
> +
> +    if ( unlikely(v->is_urgent != cur_urgent) )
>      {
> -        if ( unlikely(v->pause_flags & VPF_blocked) &&
> -             unlikely(test_bit(v->vcpu_id, v->domain->poll_mask)) )
> -        {
> -            v->is_urgent = 1;
> +        v->is_urgent = cur_urgent;
> +
> +        if ( cur_urgent )
>              atomic_inc(&per_cpu(sched_urgent_count, v->processor));
> -        }
> +        else
> +            atomic_dec(&per_cpu(sched_urgent_count, v->processor));

Assuming the transformation is valid to make (scheduler maintainers will
need to judge), may I suggest to fold these two into a single atomic_add(),
passing in either +1 or -1?

Jan

