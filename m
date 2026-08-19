Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE04C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 15:26:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395576.1633902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiBg-000321-Ib; Wed, 19 Aug 2026 15:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395576.1633902; Wed, 19 Aug 2026 15:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwiBg-00031u-Ed; Wed, 19 Aug 2026 15:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1395576;
 Wed, 19 Aug 2026 15:26:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwiBf-00031o-0q
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 15:26:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwiBe-009wG1-92
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 17:26:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85cb15-bab6-0a2a0a5309dd-0a2a4504aeb2-42
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:26:42 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a85cb31-b57f-0a2a45040019-d155dd35b866-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 17:26:41 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47362928f65so1062539f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 08:26:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14514d5sm6511823f8f.10.2026.08.19.08.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:26:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1787153201; x=1787758001; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAjSeqGo8bCvuUajX1CJPX/BVd8Amvrb66bC1ViYuAY=;
        b=f4Lhrw5XdL5+o8j6F8G6wKFzhYTEHyPbEnuiK53AGYI0xLCbOY31uo5iVGxynmAa4g
         zj2bs3nX1nsOMD0GEhcjgoLjsXPZ943PMqCX3fpM1NPDHcnfv0sD0VLp6zqvEytu2O9j
         a78GJlJEILVvhoLpUJsKe7OhfViXrjInagxMcxVX42ozna53nhxbHBCs1wV6pK8Hv3sp
         Wm64ix4OvqbpqKTDLbwxnHniYWYUGxcbdwm0YyWVYk0mazKPkDePMNx9ANNXUshDm/iG
         9V9HOY4QqWMEp+EvNtnzA7l7OkA84HkiQNyxeArd2lWdSU5h/FvrwqY//Za4dTqoQbU2
         E0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153201; x=1787758001;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAjSeqGo8bCvuUajX1CJPX/BVd8Amvrb66bC1ViYuAY=;
        b=bPFsqmzYeoZelUt/C/SE44qFsiHw5sgnQ4nDhY6iUVaOg5aOM5Rv12Rxu9UnUY+xFn
         YnDsD67PGMQ5+mC1csBnmAE7BCu09kVSPVCIbUp3AbOttr4BlfsOx3e3KRkYpplVc02v
         xyYQPbSNFlgWq5SfsrtmApwjEVK/V8WADovLbEXbo0+maZSTSJ/pZ7RXpVIfIgRTd7X7
         t1DmSuXphkgnhkbkFMJodei7DxSKL9Be4NyQZZvshoFrWmrZeMufOQ2zv0ffkk3Dj0xo
         jmUD36VK/0CoUZ3gI+850bB1Zpa6LgIwDNLZvQiztZ1/eiK2p20GTGNT4rl7xhBFjXCu
         WqLQ==
X-Forwarded-Encrypted: i=1; AHgh+RouqenZxE5eqV/rMTUvn8WuBxvkgWjE5Y6PtChQblIVu0e2Jp0xxUeo3dwBa4q84Z2NFfNZKL2V+qc=@lists.xenproject.org
X-Gm-Message-State: AFuF++kGR75plL4JgyT/dyO/Iij9Q22SMoxZWV11Cfmtl7PoRHGvNq55
	v38H+mmqHaa9y/7sLbD5HgnzOu5UsGfLSdUHousMBoepRRBrO0bRsaICb1rpcl/h0w==
X-Gm-Gg: AR+sD13mYvdaQJxXDcpu2WAIJliiSC4kFx5SkqlsbL/JPRQN6h7XIpR/Xmu3iGKUOSr
	uGxlYMCTKvf8ag2iazS5fucqaOvdd3EGMHfHHbXjuCFl0CtMpg72CTd1Ez1rF8Nlnub8Kpcr25b
	Q6QTCBhVMSYRvb+wCIf0yhkqT3Fjy6eVxOMgAqmkke+5VMj/JMvpOs7Bjycjpdtl0m+mCO4JMst
	HWwZcc0Yth/MNz8ehLAsnTYOTsI2RNAGBVrmafMI/FBsqmNjPzvrKpV1QCAsQtVB01mD8jIaA+7
	KFheL1QLtku8p1a2E1pAe3eWaU4OArNPDzu8+48w3b2+dd6TNSAivR6kIqPhx0b9sKj064Hnobo
	kDsvCvISTomofd8fY3skAwvNOu60HdVWwtEissHoj2iKORuEtvQiFyU6mCKyIeUV34j+FXUmtTx
	LgWHrWP5reqLW4biN8pXBdeGAOQosVEy6js4BHU7IjeLF0orFZd8VOelvGsVrDHZtwZXkDZQ+aj
	6T5qKzzD2JoJpiNRht4DN7NhhaIkx6sI0i5YuwqvJFLyjnmJWAJ
X-Received: by 2002:a5d:5e8c:0:b0:47f:9283:1fbe with SMTP id ffacd0b85a97d-482b1e22ed5mr10476645f8f.0.1787153201393;
        Wed, 19 Aug 2026 08:26:41 -0700 (PDT)
Message-ID: <8fc44fb5-9541-4039-ab01-9db9fc327fb9@suse.com>
Date: Wed, 19 Aug 2026 17:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 06/14] vtd: Remove MAP_ERROR_RECOVERY code path in
 domain_context_mapping_one
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <cover.1763569135.git.teddy.astie@vates.tech>
 <149e3a765a5a55792be7af0a4d9c0ca9fb5098c6.1763569135.git.teddy.astie@vates.tech>
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
In-Reply-To: <149e3a765a5a55792be7af0a4d9c0ca9fb5098c6.1763569135.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787153201-520D5B50-5B79DAB5/0/0
X-purgate-type: clean
X-purgate-size: 918

On 20.11.2025 12:09, Teddy Astie wrote:
> This logic is basically never called as the only possible failures are
> - no memory to allocate the pagetable (if it isn't already allocated)
>   this is fixed in this patch serie by ensuring that the pagetable is allocated
>   when entering this function
> - EILSEQ when there is a race condtion with hardware, which should not happen under
>   normal circonstances
> 
> Remove this logic to simplify the error management of the function.

But this code was added for a reason, yet you (again) don't make clear why
the change you make is correct. Putting in place something else _later_ in
the series isn't really an option. Things need to work at every patch
boundary.

Considering that (long ago) you indicated anyway that you'd work towards
better splitting up some of the large patches here, I think I'll stop here,
waiting for a re-submission.

Jan

