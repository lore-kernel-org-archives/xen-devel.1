Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9C8606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YMonmTVk
Received: from list by lists.xenproject.org with outflank-mailman.1496352.1694943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU1ji-0004Uc-5u; Thu, 19 Nov 2026 12:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496352.1694943; Thu, 19 Nov 2026 12:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU1ji-0004UV-2n; Thu, 19 Nov 2026 12:59:34 +0000
Received: by outflank-mailman (input) for mailman id 1496352;
 Thu, 19 Nov 2026 12:59:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU1jg-0004UL-To
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:59:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU1jg-004ub7-9o
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:59:32 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afef2a2-8faa-0a2a0a5109dd-0a2a450ae16c-48
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:59:32 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afef2b3-f2d2-0a2a450a0019-d155dd2be87d-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:59:32 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1279383f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 04:59:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a6560962adsm10629253f8f.41.2026.11.19.04.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 04:59:31 -0800 (PST)
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
        d=suse.com; s=google; t=1795093171; x=1795697971; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3nO0fQiTUn6lPGKuyc76MkPJV37WiCZ44FtKDLgAGg=;
        b=YMonmTVkM/gIovrctihS1s0AHW7JdFHc1DJHdRYx/sXpMSZKaLEZOE5CAJUJkEU9W+
         uFb+0GwU9eP6o07HiuDzKING/+36Mc7hGMG1kTAOY4c8trr/TJ80YBhPlonzSlLMuCON
         plCb90AOeK4ljFx/ETWVWnljUJOAOUBL57FknEgmcJ0k/KMaD55tcCcMepdn68j5MFp8
         wjJwegi1hFlvU2+JIJDsQGxnQiPuiwE7jRZokNA2Z9719Jwlss1Gv01y0xh+Krjl15vj
         PNS221AulPwVTJD/tqGz4FMNPAbtZunS7MnfzdDI1iuz/Gmsflv6eE+pZpu/Yo6vQc1z
         ro0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093171; x=1795697971;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3nO0fQiTUn6lPGKuyc76MkPJV37WiCZ44FtKDLgAGg=;
        b=LMIAa/bPezstokDWIYxT8YGLOk9p3gDUUxa9z4kDb2epGasu/TEnqRp19DwtdIiIGF
         bbSfKSo+hTJpB8DUkSTrxo4cYDIzQIyRy1ejYhG09VX6ivQnZK30GOVpkYWSkCphwV5E
         H7XXfbs7AFapkDCzQHGs+KN1pWhI92wKHMiwOCsoEKTWF3qak8MmlcPpn3JKw0CYKNgb
         QdhHKZu0uJKuUKBsgQPWj0Ak2xoSCdl7vA8Mkwsx8ygc0to/fCNF5UBr51P2pS57sn3E
         jf8qGdfeMl8+/awDuq/nDLQxcqaxGy70KpODnW2IbcUom9AX35DzkEkC8RHF+LJoRE/p
         vgxw==
X-Forwarded-Encrypted: i=1; AL+hErH3sOnv3YhaZwbMxUptrx1JUSDAgIQIUHJm41I755gbmIJWIEr1MR+k6RoLlQgqNj7kNqQ54m/ddTg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/e0vmfJmvfHd7KJRnOXDSbC2C70aCtqZeo2ZQsipR+4aPuVjBp
	r98lADlWQKy3jOi+52rO45XVX+A0WS538ARs9vSooEschou04/3lW9LHbwnWBZ+rBQ==
X-Gm-Gg: AZFdTZcuFYbw6ZOIIWAoQQ5r35m5s8kssi+PPRUsaXNna/NSZsISgalqvbvdINVIrxr
	1gWJw0BhMrG2u9WvhZSCsTxqVniL3ipqh/4I1TWPQ2+kLYJK/EcuFRLoA/s9nrghG7LUkuMVYzG
	4YZnftYxvDBnVFQ1BuTLVxRwwcniXlKlXIIZGsRXux4T6AgW3vRsOsK+Qpk+NVBgJVQtMMjDtpy
	Z1jlBA3z811mXpEGgi5IvdO+14nfd3/Qe7Bg40+VBxc9xtj0rWvE/necj4uN9v+Af9lXOErhaam
	bMowaBfxHvnUcbxefy0saOexRZ5ayLoDatNAXTCgMIfEUYNqAT42blVzRVmOoH9aQnNH43ot+Yk
	GY+6mBEf/NP2NE/eAuGp3dp3wuRN6Rj0tA4J16quaS6c/eeaQUpAQxzBstkgY2RwmWAmPB0m5Va
	L0AokMMXCnZPwpIoDFhtgE+SXlZSEGwuhLDXFi6TbkfQEwmNJZMB8kI1wxoQk/oUp/2IcpVfKQI
	SMX9p1SkprglQTRKSTaA+l/to7rK+Dkn+tgv97v1OHdz87lmwWlZRYoEHhpPx/zO3RlMrD5IbfX
	RO8TZJ4g/KkOBLHU7weCUbmDXGd48kqK3iaqZeeblS9VWF0b4us94U73trqjiFdcg5Nb+OS6z9s
	2lpi6TUmfIp7MWCKkgBk=
X-Received: by 2002:adf:e00c:0:10b0:492:b221:ac38 with SMTP id ffacd0b85a97d-4a639ff6751mr9362400f8f.26.1795093171525;
        Thu, 19 Nov 2026 04:59:31 -0800 (PST)
Message-ID: <3e566ae4-1a90-4d0f-8edd-2349a40e0b52@suse.com>
Date: Thu, 19 Nov 2026 13:59:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vLAPIC: only accept interrupts on enabled LAPICs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fcf0446e-3511-4dfc-b1dd-1445f29ec815@suse.com>
 <5458b651-cb26-4b20-b39d-6bb75dfb684b@citrix.com>
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
In-Reply-To: <5458b651-cb26-4b20-b39d-6bb75dfb684b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795093172-53CD3CFC-50B6B682/10/78276251493
X-purgate-type: spam
X-purgate-size: 1005
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 13:49, Andrew Cooper wrote:
> On 19/11/2026 12:18 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
>> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
>> @@ -136,6 +136,6 @@ struct vlapic *vlapic_lowest_prio(
>>  
>>  bool vlapic_match_dest(
>>      const struct vlapic *target, const struct vlapic *source,
>> -    int short_hand, uint32_t dest, bool dest_mode);
>> +    unsigned int short_hand, uint32_t dest, bool dest_mode, unsigned int dm);
>>  
> 
> Even before this change, I was thinking that 3 fragments of ICR were too
> many parameters to be passing, especially as some are bits as per their
> ICR position, but dest_mode is shifted down to bit 0.
> 
> I think passing a real ICR pair will be an improvement both for
> legibility and for code generation.

Are you saying this with just two of the three uses in vlapic.c in mind,
or did you mean to suggest to have all the other call sites end up more
complicated to achieve this goal?

Jan

