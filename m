Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D58C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:44:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383046.1626305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXER-0002uR-Le; Wed, 05 Aug 2026 08:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383046.1626305; Wed, 05 Aug 2026 08:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrXER-0002uK-Ik; Wed, 05 Aug 2026 08:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1383046;
 Wed, 05 Aug 2026 08:44:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrXEP-0002t1-So
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:44:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrXEP-008z9Q-9e
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:44:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f7d1-bab6-0a2a0a5309dd-0a2a4504de10-14
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:44:09 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f7d6-b57f-0a2a45040019-d1558030dc52-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:44:06 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4954afac04bso7361125e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:44:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994a0f7bf4sm162465895e9.11.2026.08.05.01.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:44:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1785919446; x=1786524246; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9r862YZOyOGjhCsS+AtVypyNoqeUq1wkQoy8TnKSRE=;
        b=cklmco0fPAljN8a1UZG4uJl68sB3k507e+FWImXeGmxBn00zEohwt0nfgtHamxesHE
         ojeWDsWjOsH2V3+dpF/F3aWF+CmGGFvcbcjpWULutI+EbyxWramQZV3AJGfeaK4litl7
         AunN0+iD1g3M7l1Gl2Men4Jzzuc9uQ/YSigthBI+sxxSND0cC0hWZ9ay3UACCe/ClOnS
         Lz2Ao2KtHcSnfaN1lXYWN5t8o0ZqWRLEtDfvxpappn/hhrABDK1/8iJcPUaCMlpmzoPb
         9DA7AZhvIAmLLClf/62k657Z6aZgXtVim+jJTxX3Ml1yMzTathfpXFF4eER6Svaot7OK
         8Rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785919446; x=1786524246;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9r862YZOyOGjhCsS+AtVypyNoqeUq1wkQoy8TnKSRE=;
        b=a2O7edOEJRXOH8YEglCJ3513Shs9Nrp7u56gbCY3G+dfx19NRZUGgd9t2BD3Ak1RF1
         ZTtKyKtojX4xPAUxAwfDPXQTbdp+TprKomgjy48Ng4RzztJDioi2KLvBgVkNFUG5RajH
         gr/WvgyPV/i5DTKIR3tGbIGQMaO57qAVLSGsFPReC8IcKmJ3rJG825PZbxe2E3vuYXg6
         vaoR0yWZ/ezaXCdjXVInaqmBC2ChYJOSXl0MWewnJM2TC+aNni8UePeB1z3I993rmUa8
         umD2Gc+0Ab3ll7rgnixmbZzKfMZjP0XmeT+/JE/7Eoir3KyUU6EBulVfU3ksqyAe6BQY
         R1Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrpwKvD3UleDzIZHCR6TN7xu57VJMdU6c5gzLWbrwEpPbjJOM0zBuU66FZNspF+uKBNo5zXHX8uMB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3eDx8CtSdMaDs5bHYfLNO0MEGvsaPD3XQq9K8l1OfCjU1ssML
	hioUube77aHur8g0hGhOYI6lDzozeFnDy0lOWcDoZinuosJ/6IeGtgBW3c/1qiO4Ew==
X-Gm-Gg: AR+sD11kY2KJDiT161SUSF32iDuLEaorvbbDw/YDn7ZO17KokZs5f40tzx0/CbDhXcM
	WQTJ7iQGFCSaetZWUbiqE/zpThGEiQww9w1jqE24xB/K26eO558o2o6CUJuFntQBbKae6YgCjib
	9EDH+D0h+m67wbExW2ZNgvjV+LJ71zwgDUH8+PJeVI4hPffa6KSFEl+JorwCLxBX8qtjiU+KYKm
	epl5HfM3gbmyN1lfStMNXKRs5tNqjAHSCKP1UIqU3u7KU8hDvldV+wSbW9Kp1VHdKwrQf/2eulZ
	mtIRKrCYhviYp7SMTsqQrr7fo7x3edE9PEE4o0WF5NVe7ukNHwE5TL05+4DGSIvhukSOXthGPF7
	K7K1+5JTvYk1Dhr1bJIJEft9RSitlxZPXwsmtpfPJQ9Asq4vUcTh8/NyX0+NksMaypor2Nt2QQf
	+7z50QIiwAVhFF5eblqPh6+KrKLL/nL2VlQvceNrxYgXgcfYijTC9+ltdWf0XNX2T9U2koINSNv
	bIyGYYoA5Ts0y0bWlSoIaEYWYzhopSjMkHSIT+2RmI0Ja+16yxl
X-Received: by 2002:a05:600c:8b23:b0:495:4d00:2fc0 with SMTP id 5b1f17b1804b1-4994e7bb12dmr49451095e9.12.1785919446376;
        Wed, 05 Aug 2026 01:44:06 -0700 (PDT)
Message-ID: <f06ccf87-c244-44a1-af82-52da3b01c334@suse.com>
Date: Wed, 5 Aug 2026 10:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/xen: Drop CONFIG_XEN_PVHVM_SMP
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-5-jgross@suse.com>
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
In-Reply-To: <20260805082137.1214967-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1785919446-C1ED6B50-E9AD63C3/0/0
X-purgate-type: clean
X-purgate-size: 476

On 05.08.2026 10:21, Juergen Gross wrote:
> --- a/arch/x86/xen/Makefile
> +++ b/arch/x86/xen/Makefile
> @@ -37,8 +37,8 @@ obj-$(CONFIG_XEN_PVH)		+= enlighten_pvh.o
>  obj-$(CONFIG_EVENT_TRACING)	+= trace.o
>  
>  obj-$(CONFIG_SMP)		+= smp.o
> +obj-$(CONFIG_SMP)		+= smp_hvm.o
>  obj-$(CONFIG_XEN_PV_SMP)  	+= smp_pv.o
> -obj-$(CONFIG_XEN_PVHVM_SMP)  	+= smp_hvm.o

Similar issue here - in a PV-only config smp_hvm.o doesn't want / shouldn't
need building.

Jan

