Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0473C44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 12:50:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363991.1615386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLXJ-0006d5-1R; Thu, 16 Jul 2026 12:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363991.1615386; Thu, 16 Jul 2026 12:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLXI-0006cy-V3; Thu, 16 Jul 2026 12:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1363991;
 Thu, 16 Jul 2026 12:49:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkLXG-0006cs-Ua
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:49:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkLXG-00HLZi-BW
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:49:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d364-bab6-0a2a0a5309dd-0a2a4504df08-48
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:49:54 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d371-b57f-0a2a45040019-d155dd34b91a-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:49:54 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f3e6cc44aso3857358f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 05:49:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c7c96sm23879797f8f.33.2026.07.16.05.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 05:49:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1784206193; x=1784810993; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6k6uqnNcxBGn6PB3uRPHz/Z9KrPxNrbVq7rpBYBgLw=;
        b=AuehNHjuCvSGwSLgDtJI/DIJyX+o9U2BQSG698TH8sCEj9/tdm/l7GZmigFBBQEhAk
         nFWT7LD64UrSJ32LM4+hUMAYDDRThVEaQ38NwYlfw6XuUXrdwDGpu7hKnNu9gQiTwYhB
         sw9JsDjDjlXwQi+Phv1/nbXjpp9OlE8NqPkTAwVYvHduqC2XZUAvbVyP/zjnuq8elUR6
         zbi0rWysgyCOpYwHz/Usk4kNH8GdBI6gB8MHhYrc+LNs9WhpN/Yx4X2XetlV9RvBr8rL
         hzNNixClGZnAW90K17UdjqKrdVWJEFmgFubb2pWfu8Aa0onlHu4pSj9Urp992A1jx7np
         +DHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206193; x=1784810993;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6k6uqnNcxBGn6PB3uRPHz/Z9KrPxNrbVq7rpBYBgLw=;
        b=pFaIuLyzy0IvLx288ZbaxaDzkfoKLWhsXO+2AhM5zzTw81Xj7WLf8fmum6bCvR/fW1
         dX87+RZ19JSX+10iaTZWijQrbiAUb5D2qoBqCw5C+R1vrbR3vx9CHvp2CD25kX7SGADe
         fVwDjIKdwX8+MmkY6qfzB2rMsFw61+SdGPr7SJOoTtCquKFYR2MGdQTs8liTFZ4M5XH4
         xRTw3R83jI+6BmWJkj0Fx+f7CWDpFfKqr3xnBJc13lwo6kUTjkkjAJLEDSCfaNSbteYU
         bqUj0BsIzuqyKfrkguP9ei0m2BqNeeXuF7Tbfi8Brwz7O5vZTNWbwCpvHwQ8BZE4QqOl
         eweg==
X-Forwarded-Encrypted: i=1; AHgh+RrK2+Eiu3WH4CRjs6axWrivpXIfjp/0XmMo/UXMPw1n0WH3c5w8PzQbSpmsJSTZZIMc49GGL8kRBg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzunQeKRQKJ0TIjN4XZJi6Xws1TOth8aZe9a/c2B+IMFzP737sg
	fORs3TOgfLDQoVzcPSBLcYWc/uKrJI1U+Zzewige2Aa5u/fUb3C9TBm8ODW60xfHsg==
X-Gm-Gg: AfdE7cmAnIjNniKK+ZMr8gjL5PzXRiM9KLaOvlshYChXpf1ozHc1QTW824v25yCGomR
	BMIw2tlRvcrHP+TLrou+IcocoNgOlhJ4Ia0v5VyxDuL0yVsp7JLbyHfaR4lyc54NAWnpmUY06xz
	SVVZ+xfsk3N3uXuDR5Fj46dgdqjM7i1JkJGdm+fe6xOLmsBLyBGej+rBjOMwsr587So249C63Vs
	5BCbTpPSUBL2OgRCAL0tvmEJ+NuEvuGRc1lXo+DLjtnGKIHwUvMxHSuyuKF88tqOdSlpyPDkUzM
	1ueFGxCLJHfn5EuuAoBUkQ7hqhFyRsPBoerRSPYpddg7BPBL3JEK/+Xl6wv+ZyQkPW0/goy0auR
	7sOr4j+tEmDYPYYaEIdARbkuPuKfw1wggKuOl/LUXy3tfs2UEnrx2GiAmgMvv2PA49ETUxhC3OY
	rN1Uv9U7Yuvh1uZH2MYFL1g+k3/hw/51VJpdqxv1t8eEqeG60t0rHFwW3u2WJGLB33vg==
X-Received: by 2002:a05:6000:310d:b0:474:83d4:9916 with SMTP id ffacd0b85a97d-47f4885698emr13575854f8f.17.1784206193349;
        Thu, 16 Jul 2026 05:49:53 -0700 (PDT)
Message-ID: <78dd1a83-48a4-40d6-841b-58a94d57d3f3@suse.com>
Date: Thu, 16 Jul 2026 14:49:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] generic/altp2m: align and simplify altp2m_vcpu_idx()
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f246f66c9020d5ab5f6ca20e0645b93b6210b4a2.1783608944.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <f246f66c9020d5ab5f6ca20e0645b93b6210b4a2.1783608944.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784206194-C32CCB50-B1F182ED/0/0
X-purgate-type: clean
X-purgate-size: 1450

On 09.07.2026 17:23, Dmytro Prokopchuk1 wrote:
> The return type of altp2m_vcpu_idx() in the generic altp2m.h header is
> currently 'unsigned int', which is inconsistent with its uint16_t
> return type on x86 and the altp2m_idx member of the monitor structures.
> 
> To fix this type inconsistency and simplify the header, this patch
> replaces the static inline implementation of altp2m_vcpu_idx()
> (contained a BUG() stub) with a simple function declaration returning
> uint16_t.

While I appreciate that this may be the easiest route, I disagree. Not
even considering ./CODING_STYLE, uint16_t may be an appropriate choice
on x86, but it pretty certainly isn't a good one in generic code. I
have a vague recollection that it might actually have been me to request
use of unsigned int when the stub was added. If so, it was for said
reason.

> For architectures using the generic altp2m.h header (such as ARM when
> CONFIG_VM_EVENT is enabled), common code calls to altp2m_vcpu_idx() in
> common/monitor.c are guarded by altp2m_active(), which statically
> returns false. The compiler DCE will optimize out these calls, avoiding
> any linker issues for the missing definition.

This part is definitely fine in principle. However, if a declaration
suffices, that would then better also be what x86 uses when !ALTP2M.
I.e. I think you want to #include <asm-generic/altp2m.h> from that
section of x86'es asm/altp2m.h

Jan

