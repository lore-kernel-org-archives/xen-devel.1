Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A46C43458
	for <xen-devel@archiver.kernel.org>; Thu,  9 Jul 2026 06:59:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1357564.1611940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whij9-0007c2-Ku; Thu, 09 Jul 2026 06:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357564.1611940; Thu, 09 Jul 2026 06:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whij9-0007bv-Hl; Thu, 09 Jul 2026 06:59:19 +0000
Received: by outflank-mailman (input) for mailman id 1357564;
 Thu, 09 Jul 2026 06:59:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whij8-0007bp-Vt
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 06:59:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whij7-00CMap-9K
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 08:59:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f46c4-e002-0a2a0a5209dd-0a2a4503a690-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:59:17 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f46c4-ec1a-0a2a45030019-d1558033dc5e-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:59:16 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493d1e8aa46so11373315e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:59:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6d5055sm39563805e9.5.2026.07.08.23.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 23:59:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1783580356; x=1784185156; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQpsb3iXAQijiU4BHnxRyrvo/fL4hiT8x+4qFs+RK5M=;
        b=ZQ1MrqyPfeKb0rU2rcUhtDlIk7WE25ODJwtn5KIjRtDi1PQgbQ185UcYiwUZb13KyK
         3HYYRNcCtpu6nc0gbxyRGekoF95g7s02dUL6SIMpsWJJhpFK0GdKQgM0VAGBzTvxUU3s
         qzHOpo11DHgqGgWWRBetVRrGud67EQFKuNLsKfv2/2vKbInzVWTgmaZm+q0TnuiCayV2
         8ZIKwiNEs406GncR/sXqQjfAHt3ebor0CEuj8fHpTe2Va9Feh0UNG5aSroY1Ukkzuv7P
         QbsjBi3daVWpwJPTBODzav8CICeQk/Vj6I8ysjb793XPBDSObleDsWr3kDafNex/eNsR
         SISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580356; x=1784185156;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQpsb3iXAQijiU4BHnxRyrvo/fL4hiT8x+4qFs+RK5M=;
        b=gM5wI4eIw54GNeA9grJDR1SUytwwwqIQb7Ban6mcoPV3r7fMj2mYcxKZ6mhFWQEuei
         pA4y10C+OcazGPVeE1kxTU8x1t2xnMcnx+FnA2dr68yz/Ekvim+hLdsWhF/S3Xq0Z2OC
         /P5jPagpMxAv+lJRUmTqc5LyaKJ8dLOIPB/yJbUrgcMSO6GvClWQGqm8OB4MJfhVKwQI
         Im4jY7d5SpmDYmP4r5wijZhIHhRvPWfftOwGJRbeDsp4scX9GPm/8Cae5lyID7FkkEEu
         Jt1l1b1547iSxBdJoVESrPdkcdUN6pblV3c2ifadkp8eSmN5ztPVK0vYwkXjDL954bG7
         5gRw==
X-Forwarded-Encrypted: i=1; AHgh+RoveP95S2sJe0sphvOcggxeJoeoUPzklaVOmf7oly4REQ6qCYcyoYd9VzwujV1Wwom8Lq4osSQqSEA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyxd+TyNndWCIfCs8dX8HXv3p21uqoH6E4UieMLrKERqoiTktg2
	imnExynt5ZaJNoLsdDBWR1ANIUmPNpfcKYoNwsfyeSns5XzNGqNH/tyATBRAZ2lHmA==
X-Gm-Gg: AfdE7cmeXsRZrBr9xZYzb/jZjlTmBQAYnW/w+ECYaCw7FOrB8y7qHSIl9+wC0DWXP8N
	e+SvR5eJFGHDnP7zWSwM9qbdSc6aWsdrlWgw5i8YUoBGU2/e1qxsWPDgyiA0IOhE32m0eFG3fEI
	TGMhNi9XRbqA4vaKrujUdjnhoWxrvqSJ/7InKfJJahsx9dpOYixV0WI7pHrsqtqv7EkdJl8AYje
	+/uuvdYivXqZY8h6axCyZEcgR4Oyk3jr/08VEsUbd8DuM7MjhhQfnWx6JOtOCBbQLWkm3JM/PX4
	e/pb67n6D/P6HQBj/FGpy/15Nh4D5LDRaorVnd1WDeaRdhLvay/4BXCh/1yzEiOEutVoN3KpJUJ
	GPKpkCAlDBLWsOflRrzdhOYVt9ga2AzCrHO86X61w3nOt3sZ/IE/Xb1P5WqmGZb+9NQLY3Wtunn
	KD9cm5d/e4YKtQnb1Z8UfhnDX1VhNQ7HY7AWjGmmAZufayAaCzkamSqzCpBTO4Ut4+PTWiSsjbx
	NU9I25wrbkcBGI=
X-Received: by 2002:a05:600c:6094:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-493e68bef5dmr53511405e9.11.1783580356253;
        Wed, 08 Jul 2026 23:59:16 -0700 (PDT)
Message-ID: <73814d0c-6cb7-40b2-89e1-dbb15f9c96e3@suse.com>
Date: Thu, 9 Jul 2026 08:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] get_maintainer: Add maintainers based on keyword
 after removing THE REST
To: Anthony PERARD <anthony@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260701162022.30265-1-anthony@xenproject.org>
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
In-Reply-To: <20260701162022.30265-1-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1783580356-BC7875D1-C6DD3EE8/0/0
X-purgate-type: clean
X-purgate-size: 1197

On 01.07.2026 18:20, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
> 
> There's some logic to avoid CC committers (THE REST section) when a
> file is fully maintained by a list of maintainers. There's also some
> logic to add maintainers if a patch or file contains some keywords.
> 
> We do add maintainers based on keyword to the list of $email_to before
> checking if we can remove emails from THE REST. And at the time when
> checking if we can drop THE REST, we've lost the information which
> tell if the maintainers was added because of a keyword of because they
> maintain the file.
> 
> Reorder the logic, add maintainers based on keywords only after
> checking if we can drop THE REST.
> 
> For example, if we have a file covered by a sections with only
> reviewers, but this file also contains the keyword "XSM", then:
>     scripts/get_maintainer.pl -f $file
> would suppress THE REST without this patch.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Seeing that no-one else (with better Perl knowledge than mine) responded
so far, based on this looking plausible:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

