Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DFEC88E4A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 11:00:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416375.1645441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yzv-0002Gv-Dm; Fri, 11 Sep 2026 11:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416375.1645441; Fri, 11 Sep 2026 11:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4yzv-0002Go-B8; Fri, 11 Sep 2026 11:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1416375;
 Fri, 11 Sep 2026 11:00:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4yzu-0002Gi-1b
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:00:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4yzt-0013Iv-Eb
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:00:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3df58-2eae-0a2a0a5409dd-0a2a4507e75e-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:00:45 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa3df5d-b4ea-0a2a45070019-d155802be92b-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:00:45 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49cd77e0f95so6335215e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 04:00:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e60ad0614sm70116235e9.10.2026.09.11.04.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 04:00:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1789124445; x=1789729245; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8PdBJR7CzaykuyZqgUz+eOqrsIDkGTM21u88RGF+wk=;
        b=LZYDsFoOakGFjs6nGhGP7TqV1LJOsfizZ9AUr6cgWVjNIx8T2/x+TVaNPSmFr2Fk9t
         6cvxf7UduKVMumN9E1EKYNJkhbMYQMDk80O7sOfBn7qGqDDg76VP2pZQFgL4vjU5WyDN
         zqlz66FOqurvhonuvZFE6h9TKwjJJwoprOnmhaCrz6TgtYlgfGWIK08LYmBvNjZm0ILr
         UZ30cKTRnfKWzlR1PyWH4nNLq6N3F88FbjPOm1mhw7FA4ahhiYWeFROEBu2bJDfsadM3
         zgSf3wJr2j/kRVR71CuCq+e4g9nzpZG/sBBYJNJAQJkMkAVpPUmA1BxtMDSWE2B83gBE
         RJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789124445; x=1789729245;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8PdBJR7CzaykuyZqgUz+eOqrsIDkGTM21u88RGF+wk=;
        b=PNdK+pVIgSQtosfeJ1GwlbDnYrGEHNyu2ZgFK3Yh0nijod41YLO+Vzo1fEHvIxVa2f
         EiZ3ydzQ/8djnPhSALn+PAabBysb9z6/UalvDZNXVfsvyLsHdN7iL7IfQO5g7yJop7Ou
         58pUyvEo1Xet6I2ylfh2WJeIXRL2esDFT4+WVeRL6J8PDxhOoIijT3ua7yscb598j8hf
         N+lbOQQFnb/jUG6DerWGtoPMfUDx5I1Bd/jmPODD1K3chJawLCKjRVbNx5Bs2UuvTyoW
         qquKZJfLqcZNXnEJc/NVDuKcjAY3GAe3u0LJG4RpaNnLtDSccP8hSIjI0C/8E/caWy8Q
         ulNw==
X-Forwarded-Encrypted: i=1; AKwUvBzI/bkBqXgv6nIOCk9omK3kwib2Z8nQHNtThBtjNRp4tcLg6EaCTOUskWjKqXIuk5EGxgWsC9cFhI0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kmDOhtuKdrhF41u56hJP9KOhe3LQZESY8Hq/U7z5AEhYdBDhnR
	qvAeVvfdkBfbaZFo7oVN0RRDw554/9ik4Xo6VYqlTb6lnJ4ym+E/xBDbHi03j8fjiA==
X-Gm-Gg: AYBFou3ggGNU4wWhIuR7pIlH/kULeNjc1/e9BB5ANsaK9MStwZegaEtciohYPKsZZv2
	DDgfQ3hQKeE9hH4Sk7lZZ4Qj5R12+Cnx6WaYJqmlcqwQI0kE7yeBE9qv/v5Nmg6MYy/U0NurUDX
	v/x6IO87axs7rhqBPwgSunld9q1bkKZJo0FXU7Dav8/9Zr6JOfWu+08cFWWLxz5gcNYEZ1j1KBV
	BWW5KDLz205ZSSP4s0jbs5yaLX6EtR10zGSftR4eqLWCXxfjD+XFuUO3RCfpu3JnTTfj4yG5M8N
	pDN4tvyLryEiDr30JS+0gJ8KH94DoeFwhDufowtWhl+Z2EbEZARBcnMyF2neBry1MUOH/TEDNPY
	CbkNsUkwAo6asDaS5e0bPua38xVExvHcmINF9LOPN9x6ZKVH0NLHYOmaGW/fp63IBy96Tlc/arK
	La8+JFnEcxZJ5/uvrlu1FojPrhrvhzXvKmlqaRP74U7a3ex/5+AIq6U5i/O6ltmfT0LVPr+r5JR
	axdBcIbWC0QzTDXqXzF9yuR7yGxD6rRTQSSZdFRIfoKPO/+u7foSBnnOnAS+awc
X-Received: by 2002:a05:600d:8490:20b0:49d:e0c:e560 with SMTP id 5b1f17b1804b1-49e61983771mr31443445e9.4.1789124443474;
        Fri, 11 Sep 2026 04:00:43 -0700 (PDT)
Message-ID: <87a733b3-4647-4fe7-84f3-10280a4e077d@suse.com>
Date: Fri, 11 Sep 2026 13:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Rename X86_ET_EXT_INTR to X86_ET_INTR and fix
 function names
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260911105728.3633306-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260911105728.3633306-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789124445-358C1AE4-B07EEFC5/0/0
X-purgate-type: clean
X-purgate-size: 868

On 11.09.2026 12:57, Andrew Cooper wrote:
> The name X86_ET_EXT_INTR came from the VT-x code originally, but it's not
> really correct.
> 
> The SDM doens't give a concrete name, and only describes the fields as
> "external interrupts".  The APM does give a concrete name of INTR, and both
> Intel and AMD use the name INTR for related purposes elsewhere; the name
> derives originally from #INTR which was a real pin on early processors.
> 
> Very importantly, this is distinct from ExtINT which is a type of maskable
> interrupt which can be sent in an x86 system.
> 
> Therefore rename all {svm,vmx}_*_extint() to {svm,vmx}_*_intr(), as they
> pertain to all maskable interrupts, not only to ExtINT interrupts.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


