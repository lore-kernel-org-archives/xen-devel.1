Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D1C44525
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:53:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366406.1616290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkgQ-0005Nl-Di; Mon, 20 Jul 2026 09:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366406.1616290; Mon, 20 Jul 2026 09:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkgQ-0005Ne-An; Mon, 20 Jul 2026 09:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1366406;
 Mon, 20 Jul 2026 09:53:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlkgP-0005NY-0F
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:53:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkgO-00GMc3-DL
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:53:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5deff8-2eae-0a2a0a5409dd-0a2a450be680-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:53:08 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5df002-b7e8-0a2a450b0019-d1558030b5e4-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:53:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49557167508so14150065e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:53:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954a2692a3sm234681515e9.0.2026.07.20.02.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:53:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1784541186; x=1785145986; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUjAV7VVSrXXJH0eYmRtHDd8vFVtaItUrZ5KU4Pdv3k=;
        b=V5wwcQgfMXLD/yWjk1G80artCDnsLuFJajvAlQgrjdKiGoJRqy125H9/Q1seo5j1ig
         IT5A8hxMYrx09uv62ksNn71ouCt5cGubey3ZxMEf1cbpcwElyIPnwgJ3lRUpxK4u5rLL
         KSSHJnSXQ6a/eBmB7/tKN/ihZCK/Ai1Q20Z2KlDGdjV7CdTKQAF39Z4CEbRzr8iwDx/E
         Yx9S256O/BL7zx+QfGMCD+IQVNGK5+1nog8hyw1ixCYipiopo6d9fj5VKSLWWuiL2aVt
         NBbR+YOfg2op16jtZD4TqtQ09j1H0/M/o6yZ8PP9NO22XzzYCthkQ82nfudr2SZPLnLY
         jfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541186; x=1785145986;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUjAV7VVSrXXJH0eYmRtHDd8vFVtaItUrZ5KU4Pdv3k=;
        b=DdVblUuxYkmcy6usMporzJHJMA196d018e4dyKdOGMqvLYC9ZG6oIFO5VL64+bhYF4
         Ek4YP81QqzmjGO6/YSwuZrphaz92AsUZuSexzlk3eQJ+3CI78MWkHWDaPXRFCzurdDxm
         TglA7vxjDUAqEZ7qZ40vH2rvB9wH2uMBAmu/60Dis103wXNeumXrkit5xXSO4BIX+QZr
         fnFyoGMztKoHLtLIHo4NEPcjbYO0yXGkIuOoc84ZfT0stU9eLdHUaZ1aNlqy7VGEqoPR
         tlUqJMIwDg+ebA4CWSQ8I2gCMceLXWOV45TV7yBLqL1L/sWTxXUzr5ttjbNyAmUsu3Sw
         ujqg==
X-Forwarded-Encrypted: i=1; AHgh+RpD5/uldSwDDEFAHWy+yy7QIYgiFLpbvL8zXdhsjBzMBW5hoYp+uTdYnSlUw+vzVDVDtjH32X1zxZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwejciSS6cEsXDQ6SbdlRwEa2qo/4lv3HTvzbCMeZtltDhjaKX
	Qq9voo8nSDrwM2Ik5sXEH8gnYQHTohHB6UHiI5cqBkgyibgTJjSOwAIQ7hVJxeasEw==
X-Gm-Gg: AfdE7cmgjpCMRgNlIWWTnIADZ6xkX4Qpw9t/kQnZGy773k0/vQxh1PHPde8qMsaMwnC
	E/MNl0y+CYuma2GTbsdu41L6l2xXSXl4qe1sTUejy8UsS0lufI6toK2U3SQj2tuk9xqWRVbiZxR
	510urq+/mmZe+Hu/eZkZlHjN7ArV38Q/xyi7jpDrWJEASuHnX06ln5de/dUiwpV4u2m+HbJK8fW
	grEUfJuv773HjO6QSa/BjPt6GaSdT89zYA/aGGtesKjgxjoy1MiQT9Df6VVLz0rMeCtaPezlFIf
	R/LgdnioduM9Ti0Ny0InoV8BhqHleH3nY3GjUs+YLl/ahw0jv471Z+yBFaVGZM4Nb32J1W4rCwJ
	dVPck0jtp6xuNleQvkGv5SAtvEgDrcEBRp4KFFjSwx7vfhJURrkLSgmeuIovLCzAD25+yVhlWAx
	wSzZxeoz/lK00riLwMdCY4y6tsu3yYjMJ2OrOKDvdmCuRDSbcCBlUJDxmmm2+aOUZZbA==
X-Received: by 2002:a05:600c:4685:b0:495:4aff:5fdf with SMTP id 5b1f17b1804b1-4954aff61f3mr161154705e9.28.1784541182193;
        Mon, 20 Jul 2026 02:53:02 -0700 (PDT)
Message-ID: <b839ad67-c6dd-4d72-9910-dcabe28afaa0@suse.com>
Date: Mon, 20 Jul 2026 11:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/domctl: Introduce XEN_DOMCTL_SENDTRIGGER_DEBUG
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
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
In-Reply-To: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1784541186-A9AC09EA-112E1A2B/0/0
X-purgate-type: clean
X-purgate-size: 1401

On 20.07.2026 11:25, Tu Dinh wrote:
> VIRQ_DEBUG causes guests to print their diagnostic information.
> Currently, the only way to send VIRQ_DEBUG to a domain is via the 'q'
> debug key. This method indiscriminately sends VIRQ_DEBUG to all domains
> and vcpus.
> 
> When debugging guests, it's useful to have a way to target a specific
> domain with VIRQ_DEBUG. Add XEN_DOMCTL_SENDTRIGGER_DEBUG for this
> purpose.
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

Fine in principle, but ...

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -605,6 +605,11 @@ long arch_do_domctl(
>              }
>              break;
>  
> +        case XEN_DOMCTL_SENDTRIGGER_DEBUG:
> +            ret = 0;
> +            send_guest_vcpu_virq(v, VIRQ_DEBUG);
> +            break;

... unlike the other XEN_DOMCTL_SENDTRIGGER_* this one isn't really x86-specific.
Hence, at the risk of being called guilty in causing scope creep, I think this
wants some re-structuring. The handling of XEN_DOMCTL_sendtrigger wants to move
to common code (at that occasion also making it properly use domain_vcpu()), with
a new arch-specific handler to deal with non-generic XEN_DOMCTL_SENDTRIGGER_*.

And then, if already moving this, it will also want considering where to move it
in do_domctl(): It doesn't look as if holding the domctl lock would be required
here.

Jan

