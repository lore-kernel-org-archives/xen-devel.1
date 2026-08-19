Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6F0C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:52:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394792.1633441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwb62-0005ZZ-Lc; Wed, 19 Aug 2026 07:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394792.1633441; Wed, 19 Aug 2026 07:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwb62-0005ZS-Hg; Wed, 19 Aug 2026 07:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1394792;
 Wed, 19 Aug 2026 07:52:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwb61-0005ZM-Lc
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:52:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwb60-00BJki-Gd
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:52:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8560b1-e002-0a2a0a5209dd-0a2a4502cefc-28
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:52:24 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8560b8-6ca4-0a2a45020019-d1558034b141-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:52:24 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-499ae1c6471so477865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:52:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0d6a84sm38904575e9.10.2026.08.19.00.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 00:52:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1787125944; x=1787730744; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Nl+LoQuvaTo57INmOcUA55t6MJUqdmCvn37eHHwtcM=;
        b=KXdXz+knFq2Q68LDkkF0qKrCZaAwXZGHc3rdRcdTY1PTlIMqXFXJdrr1sIaDvMAojX
         kXBZozG8W0uVHlONmzNdxqzsL4Qn+lNdPSozj0xRxZirukjq3Kt4ExuKl/BOSJWNZpqy
         mucd5M9nS0A5tLcz//iy/Q3MuL3l6i/uPafrZ6l4Y9Qw1WJKO1Lth9iX+H/iHYJCri1Z
         KPCmXDojtRL4JUFmlV0XzY6QoezywcgWpDBvNwaXeu6vLd0fppGz9mknQ8aTpca61nFQ
         fiw84i0yoHHtV+fsvfiYMPIJF2AM9rBixehiLSQkIQgx/aTZYyuXj0bgQJB79S+HQ+rf
         jCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125944; x=1787730744;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Nl+LoQuvaTo57INmOcUA55t6MJUqdmCvn37eHHwtcM=;
        b=hbutDkgoTCxisF3ES2auID0wHEtJAajpqnCuu4xo0hOKc2W3uZT1zeHB3au0FMuYyE
         UTvg3HyT0o8G/jvRjHVKDjPH0LhXKGAqcv1gn+5ZgY+TRZKlyt+cQCHTD5oili1BCYaF
         kY3gIjVvEL80zXGS35vV81o3oKyl2/KA0WArRzOPtrkadTU/bJd0hng1jmJz7erhaNL3
         r4rQhZH1q1Mvo8X6YTTv7RKprb5ojGD1rdbd9jmKoV5rIXU7sjJkATtVy1iGNaiffeVa
         Exg7Thnz/vFaKPVK9IEGvcaHQdvwu3VkCjMzxaqBgggjby8EWq7yfOypuy5UnOoxiU91
         2XQw==
X-Gm-Message-State: AOJu0YwtEW0VDipVpujKBaEJE2ban55MS9Le8EC5X/pdRD/S2FYqqXtK
	ywWEXWfF1niUxDD+nT571s0KtH1pq52sFsPprvwIwYB3ZvS6lnBQ9q/Ly5mTh4dUZg==
X-Gm-Gg: AR+sD13IUO47XSnDmpRd8tZw5xB7/fxQMx8JFM1T3Ws77jFwn6fpLKyk+qiSXi0H1ik
	FgayeHiCqaEHEs+DRnzULQxXykbtYVPios9ZdVzmR2o1ETPH/8DwEQh5fgCrWVuwHMF2Q/XqDKG
	+5MaUhG58qpCLcVyprTKUVVCf9fsTtKsMXJHddLUg7kzEeUlJj8TiEGVmlBNJyPC3m46lqsnItO
	5UF125XvX08ZfwZm/Sl99x6B9hVsAh9b9amHX9n8YSoh4sex5vTm8KsN1va9/t1nPEdaLJKi4B/
	imUMRDVtCv300Y+tOSbXalrQvgU0fdK3gMF/TufJ81CRnhkWpg35etihFaUyFyzj1c1G2mk9/3M
	eRooI3Lsyuia9mPE70iRd5w7zIwTvae3DuLAcpDpSFnQaEjJ0UmXkjws3Ky4bdSLPj33Tj+E7gm
	WZTMs8OKu2NUaFRofL5xXOTG5Nz3vIVPHMVGaZGFXYkkxWIew38W2Kh0pu4xwcoN0n1rbABBaEt
	Cx0R6pfhyasP+J2ncMMOXi9EFJ+gi+Hsc8nJkgj33Jgw8xIeqHG
X-Received: by 2002:a05:600c:3f12:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-499aa0dd282mr47257335e9.0.1787125943751;
        Wed, 19 Aug 2026 00:52:23 -0700 (PDT)
Message-ID: <83abdfca-70f3-479d-b7ed-929567c4254d@suse.com>
Date: Wed, 19 Aug 2026 09:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Linux kernel crash in amd_smn_init during PVH Dom0 boot on
 AMD EPYC
To: Arthur Borsboom <arthurborsboom@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
 <4a1b5392-93b9-4b9e-bf65-3fb280f385fa@suse.com>
 <CALUcmU=QNXA8gs8JYy01tLVOH-y8mjZM-GxKzOCoA_3e2QFVwQ@mail.gmail.com>
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
In-Reply-To: <CALUcmU=QNXA8gs8JYy01tLVOH-y8mjZM-GxKzOCoA_3e2QFVwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1787125944-66AB52AC-939F12B0/0/0
X-purgate-type: clean
X-purgate-size: 2158

On 19.08.2026 09:09, Arthur Borsboom wrote:
>> Well, a pretty natural question: What amount of research have you done yourself?
> 
> Lovely response. You really know how to motivate people and welcome
> them into a community.
> 
> It has taken me about 1,5 day of work to find out why the screen
> remained black, to determine where the problem was, how to retrieve
> potential info by a serial-over-LAN console, subscribe to the mailing
> list, and create this bug report to help.
> 
> But don't worry, I won't do any debugging anymore for the Xen project,
> you have made sure of that. No need to respond.

Well, no, I can't really skip responding here. Yes, there was a risk that
you may take my reply as "not welcoming". Yet please can you try to see
both sides of the medal? From your initial report, which effectively
wasn't much more than the dumping of a log with the traces of a crash,
how could anyone have concluded how little or much work it was for you to
get there. As much as you have felt offended by my reply, I consider such
reports as an abuse as well: This is xen-devel@, not xen-users@, and I
think it is only fair for us to expect that reporters check whether their
problem was reported before, and whether therefore a fix already exists.

In fact, looking back - you did identify the earlier report. I clearly
scrolled down too quickly, and I'm sorry for that. The question then is,
though: What did you expect from re-reporting the issue to xen-devel@?
A patch for the issue is in flight, yet that patch to be taken is
nothing any of the Xen developers really have much control over: It's
not Xen interfacing code in Linux which is affected. So I continue to
have the feeling that this wasn't helpful at all, and my putting time
into finding the (apparently) most recent variant of the pending fix was
not valued / pointless, as I ended up offending you be a non-technical
aspect of my reply.

As a result I wonder: Would it have left you with better feelings if
your mail was left entirely unresponded to (as would end up reasonably
likely, according to my observations over many years)?

Jan

