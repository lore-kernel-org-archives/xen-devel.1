Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBDE606A330
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cN4mXjmq
Received: from list by lists.xenproject.org with outflank-mailman.1476278.1682433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPE23-00035C-Cl; Fri, 06 Nov 2026 07:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476278.1682433; Fri, 06 Nov 2026 07:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPE23-000355-9f; Fri, 06 Nov 2026 07:06:39 +0000
Received: by outflank-mailman (input) for mailman id 1476278;
 Fri, 06 Nov 2026 07:06:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPE22-00034z-G1
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 07:06:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPE21-00BvoU-T1
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 08:06:37 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aed7c71-2eae-0a2a0a5409dd-0a2a4504978c-40
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 08:06:37 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aed7c7d-b57f-0a2a45040019-d1558032ac03-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 08:06:37 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so2229895e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:06:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e2029278sm31901155e9.10.2026.11.05.23.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 23:06:36 -0800 (PST)
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
        d=suse.com; s=google; t=1793948797; x=1794553597; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOxVJjaBlXak0kah42tyznnDCf8vAV0MYb9sy+uKkxI=;
        b=cN4mXjmq76Iv0nrFrZ88xG6ywVW7TEGdAVHL/u0zJ7H4elplFPze6cd03RJtMFDZCC
         kHPCa91IzyMRLFIMDj3eyGqklgd0hGRuZfIJ5yM8eLeDGfqUSaj1TG1LrjwLIWNFYBQF
         soomdFSsXXOnNopqg5JHpngR5Xd5Dr48BidFjKwjtWRF1LBfbLkRsXZ+DhSfgSYGE7qg
         6tCCIjky7V0tQWb/k3NjGJs00HLHLSot8NQ9AEBlinx2Lffrf7RkKrvknzsvGRvqX2pB
         usfUFGBTib0JjNlBU011ck1OD8ZclFGV0mrjzmQEJvpaJd4lcAu3rSDBzKrA5f9L1F2g
         qNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948797; x=1794553597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOxVJjaBlXak0kah42tyznnDCf8vAV0MYb9sy+uKkxI=;
        b=pr9io82G+7HW9K+beF9KNE+S4tBr2M/vRs9EJ0lt4jcmlXz1FuPaYCIdTCQbn1dS/4
         5v2ysQ5YIpd+iDNW41I5hOnzpWIIglLH9tsQEMkcBtHWlNxb6z90baGWBzGP69Cq5uRg
         RV05K4/48/jZEmyOQnvHeJtZhgMfIRpvTa9FGyFIZV7PjrQpxh/asU9Pqe1CsNyNDCdC
         08RlF5C68pKfOkYJrG+nHB+NKUUEHfgQMQf4oM15gWD/Pn8RC40jajeJ3AL6m8PQ1ctX
         4Y8vOTkJ8pXAPvZWBnO8+/Ve6bMXWFNYNazMlAlDWqHKYurV7CnXYYKx6LAkBSPUA2lh
         /ttA==
X-Forwarded-Encrypted: i=1; AKwUvBwB0KiH/CUHneIcdPSiJqV4TIixAzYtp5xzRQJW+MQkMyH1sYJnQfNxH2Ts7ENvZuYLSS7Z88GTWp4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+jZMnKfL8FwDTWy3a1lx8w93tDsVonVt+GbYISwiHY1QZjMdw/
	2C7obAZU80tpifizXvOK/jqCoREtLLCg8vuJKAkAY4ruueQewq+Ev3ZOAWBk13z5iw==
X-Gm-Gg: AYBFou0NYlZtIDgcNJkH49cXMJGMAwmYKLOlsPy5f/q4b/Tf7FQqNDK2N0rJaKSrSP1
	YY0oPUdoUyxC6eKI3ijSKCfmimtXY1BvI/EHT33AkURoQHssIFfYV0lNDHaL8YZKYE6tkE7vXv7
	LfhCo5xU21GpiLHx2pabpuAyUkUC7pzR52QFSauk1LEsakVlyaMa/ckLCw3HYLvE4LC8YqRs+PE
	C8oLIn/gzgcAx/rTKsrD9y9+ci6Ptt0BoByYuLQ1AGuXq6V6GRdFIC/FRVg7plZ4B2DTSCCwABt
	ppkUWKumX+UMpSJazw1287OMB5ANBsD6CDqGw769u/5HtL7J65zJ6s/J4hlBGS752q0JNrEzgNN
	+5YwvPm19NxkyGX7b0O3k5VrEOK7VhX69kIa5Rt5HLa19nmqYhoFe0gf56K5ziU7LXQViJXojsh
	MPJ/sNXrjE9GkVCVrQ4+8qI+i+xb35SrYqfbf9FlYEIxH+CIMNoXQ41FOKFtYhWyDzmDPMeZuOB
	BEEHFnsXU1zZkSCqOyjoneW1qy7Th+JPMWO7tWP55RfzO2zVjG22YdPqG0H/GykL4+2F3U2q3U1
	j7blp3k1dBzl0UcqlYU9L2ELp6cTYYIP6+DpCx/7xHUFeIP4Ptfms7i1zDLXmgJTBUhF709yFVi
	ezNOLAXXUKk1Xub6h
X-Received: by 2002:a05:600c:a104:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4b769423bc1mr2680075e9.26.1793948797352;
        Thu, 05 Nov 2026 23:06:37 -0800 (PST)
Message-ID: <48cc7be7-c672-45d0-92f5-0ed6a0cbf21f@suse.com>
Date: Fri, 6 Nov 2026 08:06:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/28] x86/hvm: fix hvm_emulate_one_vm_event()
 definition
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-10-dmukhin@ford.com>
 <421bbdc7-400d-4ed8-b000-2d845ab88e9c@suse.com> <auzioxAtHJ1/3MZA@kraken>
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
In-Reply-To: <auzioxAtHJ1/3MZA@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793948797-C1ED6B50-D9615248/10/78276251493
X-purgate-type: spam
X-purgate-size: 569
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 21:10, dmukhin@ford.com wrote:
> On Thu, Nov 05, 2026 at 09:30:02AM +0100, Jan Beulich wrote:
>> On 05.11.2026 02:33, dmukhin@ford.com wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Add empty definition for !CONFIG_VM_EVENT case.
>>
>> Which is needed because of?
> 
> That is a fix for *-randconfig runs with AVIC series:
> VMEXIT_AVIC_NOACCEL handlers can call hvm_emulate_one_vm_event() 

Then I think the stub wants introducing in the patch where it's needed.
That'll allow better judgement as to possible alternatives.

Jan

