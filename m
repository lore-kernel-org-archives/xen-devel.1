Return-Path: <SRS0=cWgu=KW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11269C4707F
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 08:03:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA04161090
	for <xen-devel@archiver.kernel.org>; Thu, 27 May 2021 08:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA04161090
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.132871.247783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAyv-0006wj-KX; Thu, 27 May 2021 08:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132871.247783; Thu, 27 May 2021 08:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmAyv-0006ul-FH; Thu, 27 May 2021 08:03:05 +0000
Received: by outflank-mailman (input) for mailman id 132871;
 Thu, 27 May 2021 08:03:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmAyu-0006o2-E7
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:03:04 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 526b6eb6-ecf7-4237-827e-579e905d04cc;
 Thu, 27 May 2021 08:03:03 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D8C92190C;
 Thu, 27 May 2021 08:03:02 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 5D1B611A98;
 Thu, 27 May 2021 08:03:02 +0000 (UTC)
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
X-Inumbo-ID: 526b6eb6-ecf7-4237-827e-579e905d04cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622102582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IkW3zAf2inbBA6AE3IseVexUnjorfSHLh1YaVYufHYo=;
	b=FTOiNWCHeCHfjyO+XMWLXPJUGwO3WRAMLp69IJj/oYMD8tyycszXJz0iSjGY+m/yEIYYie
	iyv4lzu14xGIkW65JSsOcxuyFLJhSkjMq4v8iQRQC4Brp5tlHSfZRHZwKLJ3XSI9Lb7v+A
	utvcYCIu2iG+u1rjVtHR3emGu5a65lA=
Subject: Re: [PATCH 08/13] xenpm: Print HWP parameters
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-9-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8482e4b-1d0b-fd18-bb80-3ce4fc2459b7@suse.com>
Date: Thu, 27 May 2021 10:02:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-9-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -708,6 +708,43 @@ void start_gather_func(int argc, char *argv[])
>      pause();
>  }
>  
> +static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
> +                                          unsigned int *activity_window,
> +                                          const char **units)
> +{
> +    unsigned int mantissa = hwp->activity_window & 0x7f;
> +    unsigned int exponent = ( hwp->activity_window >> 7 ) & 0x7;

Excess blanks inside the parentheses.

> +    unsigned int multiplier = 1;
> +
> +    if ( hwp->activity_window == 0 )
> +    {
> +        *units = "hardware selected";
> +        *activity_window = 0;
> +
> +        return;
> +    }
> +
> +    if ( exponent >= 6 )
> +    {
> +        *units = "s";
> +        exponent -= 6;
> +    }
> +    else if ( exponent >= 3 )
> +    {
> +        *units = "ms";
> +        exponent -= 3;
> +    }
> +    else
> +    {
> +        *units = "us";
> +    }
> +
> +    for ( unsigned int i = 0; i < exponent; i++ )

This requires the compiler to default to C99 mode, which I don't
think we enforce just yet.

> +        multiplier *= 10;
> +
> +    *activity_window = mantissa * multiplier;
> +}
> +
>  /* print out parameters about cpu frequency */
>  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>  {
> @@ -777,6 +814,40 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>                 p_cpufreq->scaling_cur_freq);
>      }
>  
> +    if ( strcmp(p_cpufreq->scaling_governor, "hwp-internal") == 0 )
> +    {
> +        const xc_hwp_para_t *hwp = &p_cpufreq->u.hwp_para;
> +
> +        printf("hwp variables        :\n");
> +        printf("  hardware limits    : lowest [%u] most_efficient [%u]\n",
> +               hwp->hw_lowest, hwp->hw_most_efficient);
> +        printf("  hardware limits    : guaranteed [%u] highest [%u]\n",
> +               hwp->hw_guaranteed, hwp->hw_highest);
> +        printf("  configured limits  : min [%u] max [%u] energy_perf [%u]\n",
> +               hwp->minimum, hwp->maximum, hwp->energy_perf);
> +
> +        if ( hwp->hw_feature & XEN_SYSCTL_HWP_FEAT_ENERGY_PERF )
> +        {
> +            printf("  configured limits  : energy_perf [%u%s]\n",
> +                   hwp->energy_perf,
> +                   hwp->energy_perf ? "" : " hw autonomous");
> +        }
> +
> +        if ( hwp->hw_feature & XEN_SYSCTL_HWP_FEAT_ACT_WINDOW )
> +        {
> +            unsigned int activity_window;
> +            const char *units;
> +
> +            calculate_hwp_activity_window(hwp, &activity_window, &units);
> +            printf("  configured limits  : activity_window [%u %s]\n",
> +                   activity_window, units);
> +        }
> +
> +        printf("  configured limits  : desired [%u%s]\n",
> +               hwp->desired,
> +               hwp->desired ? "" : " hw autonomous");
> +    }

I suppose output readability would improve if you didn't repeat
"hardware limits :" and "configured limits :" on continuation-like
lines, but rather simply indented by enough spaces.

Also again please again omit an unnecessary pair of braces.

Jan

