Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A04C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 15:22:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425647.1649527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7aQ0-0000he-NT; Fri, 18 Sep 2026 15:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425647.1649527; Fri, 18 Sep 2026 15:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7aQ0-0000hX-Kd; Fri, 18 Sep 2026 15:22:28 +0000
Received: by outflank-mailman (input) for mailman id 1425647;
 Fri, 18 Sep 2026 15:22:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x7aPz-0000hR-G0
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 15:22:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7aPx-005980-Go
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 17:22:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad572e-8faa-0a2a0a5109dd-0a2a4508e0fe-4
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 17:22:25 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aad5731-f659-0a2a45080019-4a7de18de40d-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 17:22:25 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e8185e037so5346135e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 08:22:25 -0700 (PDT)
Received: from ?IPV6:2003:ca:b735:68a5:80e:d31a:d029:ea6f?
 (p200300cab73568a5080ed31ad029ea6f.dip0.t-ipconnect.de.
 [2003:ca:b735:68a5:80e:d31a:d029:ea6f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc521f5d9sm1924285e9.2.2026.09.18.08.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Sep 2026 08:22:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1789744945; x=1790349745; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1acggxj5Mxmu56PtXNj/cLaMh5dmNk3kCC62oFD/yI=;
        b=A+dklrSwakxNEIbEUjN3TMf7f8YYb/NCjMjioqzaVT3llfFeDBdUx400U4AxyDjBw1
         6N0eENeW1Q1KCOtaAyR1C++yM+pfKX/Kw4YcHAmdeOR0ZjQPNhgh595MmX9RPMMy8znq
         uw9mUz7vhx4tr0wun3aTak/31OuE3ooqu+EQ9ss7V0NJLOdh81MESb/4MfwIIYEQNLaG
         92GX2kRtgAXzvJWB4sFhgkCSCJ3MbB3mJvIBJ6vHWW4QYbllhyWa4XMcQ+FW5FfpP2Ow
         kiKYe5LIG7KKsGK13va2rg+Zt/Kp7GVrfiUwvZttC1RCcbKKOMHuE/40eqXDoxKwFm9Y
         WC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744945; x=1790349745;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1acggxj5Mxmu56PtXNj/cLaMh5dmNk3kCC62oFD/yI=;
        b=UFrn5gy1oEbpuEHOYO3C0yHA9xu1GG8LAoscjBqN2CkLaYk8dBhlTt+wyOXj4WijQN
         9vj/5zyo03a1qel4t0pFLu0TupFJj/cVTavlaIn2rCREE+/P83Oblni5JkLG4j0LfbiC
         bpEAwqnVXQvRest45gO6UqYHk025MUvro2Vzs81CNE3yGRCVBEEJ+0DPTXlnYlQnrcA7
         8W5dslUshYXtuhQZ3qYTqWewjxRaPhDv71j3A8y5RnNxKHFAsmLiQEtUsqMrWx2Z1ila
         bw0OHcK9nB8M6gh6kS+RoEpbBt5uSNXEqmyOWww55qWy5Zq/fhbFFg6An+eeDXUsYouq
         oklg==
X-Forwarded-Encrypted: i=1; AKwUvBxR3f9xaXewDn2ohtpiGNguiFk9qLYqabMyDUvHZdOXIql5ij0AzRMgzZPUaRzwQO42RK1MVPTguDY=@lists.xenproject.org
X-Gm-Message-State: AFuF++lchvp9CTRtIMXasg4gF+lxl3MZfh56d2ycDnJd+meIKCUXrhuT
	zfj7QbJyVVH3dW7AwhL8BHrKKBEV+fG4snNedfbpFQlafT6S7SInRltpV/eYXgB3XA==
X-Gm-Gg: AYBFou1PZplRW+2hWGkH+cdf25V4HsvRb/3529FWh9pYa4ZDBA3OcXyXplAQFZQmnJG
	BawKLs8RtdNGI7tkKHlLzglv8Fq8jZNFKbx2Y6g/36+mBdRZibLHjfKuOEgbEEEd0FRXrSZooKP
	SoO2D+q4WHcG2g+sXu5qJgSoCjEUbNQ7vfmrkzS5IGBAGGU9lig18rsNj/4MlWB4FyhnetshP7J
	o0Cet3pDeum96wd0O7zuQLkbIEzXQQUwWoTjchgprzW3v/np9LQ/LdtLhYgG5awmTkKWEtFZ3Cg
	hBQ5lyaqKQrcTaYdgH6l44s7jOiLY9z5edEESfF/Y16Z2GnW2koQM7ElzNOpN0xppVQqdGl+1WS
	RZJ96sMVf8f2lOTMpQn8R7W6WLakM4GQEYnHk6n8+B5HbasFlYSTT+bwHyK6pme1KxvmZaU5c2q
	MmNthU5IdK4B8gJiEFXL6clUL60gUkc0wS6BuLDmLPtP6cn7M4oMDQUq8+11yib6nBc1WDuSpeQ
	hud583WO3T0Kp0jRuZfjj2EjETy2kLuuvbYXLLsqY9/3GOxFON4FsvcDjrm6r2uCZjedf9WuChU
	qIPjZYjH9Uw3yE6SN536gA++XscS
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr48915195e9.8.1789744944711;
        Fri, 18 Sep 2026 08:22:24 -0700 (PDT)
Message-ID: <6f663204-fb2d-4b52-b703-188abdf074c8@suse.com>
Date: Fri, 18 Sep 2026 17:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] x86: Track vcpu context switches and introduce
 needs_tlb_flush field
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
 <1785509308.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@vates.tech>
 <aacfb18a-d445-4623-938f-09bdbea83219@citrix.com>
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
In-Reply-To: <aacfb18a-d445-4623-938f-09bdbea83219@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1789744945-D4F4F87B-6F135618/0/0
X-purgate-type: clean
X-purgate-size: 700

On 18.09.2026 15:48, Ross Lagerwall wrote:
> On 7/31/26 3:46 PM, Teddy Astie wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -38,6 +38,7 @@
>>   #include <xen/smp.h>
>>   #include <xen/softirq.h>
>>   #include <xen/wait.h>
>> +#include <xen/xvmalloc.h>
>>     #include <asm/amd.h>
>>   #include <asm/cpu-policy.h>
>> @@ -874,6 +875,13 @@ int arch_domain_create(struct domain *d,
>>         spec_ctrl_init_domain(d);
>>   +    rc = -ENOMEM;
>> +    d->arch.latest_vcpu = xvmalloc_array(int, nr_cpu_ids);
> 
> Does this work with pCPU hotplug or do you need to use NR_CPUS?

nr_cpu_ids covers all CPUs which may ever come online.

Jan

