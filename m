Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA0606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZskDL6kj
Received: from list by lists.xenproject.org with outflank-mailman.1486756.1689230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlRr-0003pe-CV; Fri, 13 Nov 2026 07:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486756.1689230; Fri, 13 Nov 2026 07:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlRr-0003pW-7f; Fri, 13 Nov 2026 07:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1486756;
 Fri, 13 Nov 2026 07:11:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRlRq-0003pQ-3G
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 07:11:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRlRp-001zb3-4d
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:11:45 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6b82a-2eae-0a2a0a5409dd-0a2a4502d7a6-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:11:45 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af6b830-6ca4-0a2a45020019-d1558034cde4-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:11:45 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso10030835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 23:11:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55ac0e3fsm32428105e9.5.2026.11.12.23.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 23:11:44 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794553904; x=1795158704; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYCytlz8HztJyLeG1XYf2cVU09WY2CulioNRxEUCW8g=;
        b=ZskDL6kjciFT8yLEka9sRo0tQTr0Tu2lBaXZ5NP6XHgXaCcq+oi+pd9gFF3em4ya1I
         50hmBbs9mRmxLJpE+GwlXCMIUMzc94KR4CYizg2smnc8eB001+IjyfWgibMMj75/L8vh
         dqcl6RaLqrWhKOoY2L24OC6l6Uj8OpbLVqgkW0nesZJhUj8KyLR9Axl3vaFKlXBIdtCB
         8LGJu/59C39VjUlaHmux7h78dUtdWLBzdVuie17/zbNuCcBQ646CzH0CHZ4sdl3259e0
         eYLU+hCcuSRaIgODm8uxp8HxUMYo/I4W0GII8fO9s3L/DgbJu3YRqHRAI88u6q80MwXs
         gUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553904; x=1795158704;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYCytlz8HztJyLeG1XYf2cVU09WY2CulioNRxEUCW8g=;
        b=q00CrjfDvn0DcTbCxw1GBKabRvE14Yjz5aTGCLAl1SqfYuk1aM8i3Hu2TPVRmRsipV
         FXsYizzUET78XDRbROgYwkiykGi6F/f6N62WxtuNglT5yEOeSD0Y4J0Y3qgC/XEnfh2K
         ifNX2rnxRIBpaVVcm5uEXIjICPPMw4OH+28zDBPECkBNr3W8ebezerVLbzBUnffQ2oLA
         afAA1RsfAyPwpWvpuq5taBD9P6svWrNu9aZfsUHjLvsW4lm4y1uSigYc3wAIyQQALhf+
         j6Em1OsHCwbUVycnSrIZlsSmJkDNAxdqYZ3w8OWWQHulzMmSTYtb1yZI+FTYl3XEAqU6
         WdLw==
X-Forwarded-Encrypted: i=1; AL+hErG3CAT+q2eMxuE6eupgOQ3v1DoB3WbrU8Vw5VmL3E9Z803bjOTmtw81SJ+mzHYZ7IFF6ptnqv6TzQg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8MpzB2+aleCtOI29zXbbFfoDjOihBwSKsMWZVAuMqYtRDV/jtY
	qiyFbdRLX25e61zCzZWYlLC7mq3//WEp+BSLxWSjx7YZFjW7+sJur6Xk2jKg7TFD1w==
X-Gm-Gg: AYBFou3SpAHSEoTy5l4LXAlePUG4KyHBmz9dJyUC6cOovmZptsBH3oNnYyy0LyRO2jh
	ciQ0NO43FdbwV1JMw5fM0StMGFNEFEo/QCJratiRTa5jPQKW1sa57uHU4jeoMgxSKOg7tSgzeN0
	8W0Z4SkNz1JKF4PTOftvLr9cO6V18PvZfR8xbaSRYdVBF+Pn0ZvZgPp993OWITNt94ZAG9hXW1B
	NmSsKTAyRIBYS2J0fj6XEjyfUM2vyKQ7iN2DEjjCl4CIukTIspVonsAH2u1Bvt350ubOIsJokRp
	8Y3K3grHy2eEfZNvYUauhaw49ePpYpZl6o7ngsC3I3JMAOGzHOs2SppwPiG9caSmVHDhHOKwBE+
	A+Dn9ytPVNmqeoNoppcrH/uihToA335qVltlfMYhr1nti95aK+SHH3JgOTST4wdrzuzFPCJSwjl
	kEAGfOIEMhlmAx/HCi1KCGRUAjlSdan0JYxpp1ngQkJnZrAtss38E4ETHFo0XIyHsAv9sp/1hjp
	RCSJWZc5GRS9EG5Z1nw8VQw/9AEFJKQCEHuESt6z3ebaKUyGUsTG88zx7XzzLuab8JkYQzzKVbe
	tbWW6BIxRHk/b8MWYH/xelu83ubI1i6putFb0NA4PbRcpCH4rR1y32EVF73JphY5Wou89dJmzCy
	Qy+L6zE9TxuRP1jUgS32Pu7GeRZ+vfGhR1FmBMlo=
X-Received: by 2002:a05:600d:11:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4bb55a51028mr27223775e9.13.1794553904504;
        Thu, 12 Nov 2026 23:11:44 -0800 (PST)
Message-ID: <b7b82597-b4ab-4a83-9ce7-2861d0347cfd@suse.com>
Date: Fri, 13 Nov 2026 08:11:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
To: Andrew Cooper <andrew.cooper3@citrix.com>, dmukhin@ford.com
Cc: jason.andryuk@amd.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-5-dmukhin@ford.com>
 <73b67813-7556-4a00-a92a-23316a634d39@citrix.com>
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
In-Reply-To: <73b67813-7556-4a00-a92a-23316a634d39@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794553905-F04A62AC-9C350ADB/10/78276251493
X-purgate-type: spam
X-purgate-size: 1460
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13.11.2026 01:29, Andrew Cooper wrote:
> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index db81dad4b681..8b7bfed0049f 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2464,6 +2476,12 @@ static void __init print_svm_features(void)
>>          printk(" - none\n");
>>  }
>>  
>> +static void __init svm_avic_start(void)
>> +{
>> +    if ( !cpu_has_svm_avic || pv_shim )
>> +        svm_avic_enable = false;
>> +}
>> +
> 
> arch/x86/hvm/svm/svm.c: In function ‘svm_avic_start’:
> arch/x86/hvm/svm/svm.c:2480:31: error: ‘pv_shim’ undeclared (first use in this function)
>  2480 |     if ( !cpu_has_svm_avic || pv_shim )
>       |                               ^~~~~~~
> arch/x86/hvm/svm/svm.c:2480:31: note: each undeclared identifier is reported only once for each function it appears in
> 
> But, you shouldn't care about pv_shim here at all.  By and large, shim
> won't have CONFIG_HVM, but if someone has decided to make such a shim
> and AVIC is in advertised in CPUID, then Xen should see about using it
> just as on native.

Even further: If someone has built PV_SHIM=y + HVM=y, and if we get here,
then pv_shim == false. (Of course this may change with hyperlaunch, unless
carefully guarded to prevent secondary domain creation when the primary
one is in shim mode.)

Jan

