Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FB9C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 08:46:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388909.1629875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4aS-0005J3-QB; Wed, 12 Aug 2026 08:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388909.1629875; Wed, 12 Aug 2026 08:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu4aS-0005Iv-Mm; Wed, 12 Aug 2026 08:45:24 +0000
Received: by outflank-mailman (input) for mailman id 1388909;
 Wed, 12 Aug 2026 08:45:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu4aR-0005Ip-77
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 08:45:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu4aP-00DYEO-29
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 10:45:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c3297-bab6-0a2a0a5309dd-0a2a45039c18-18
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:45:20 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c32a0-fae8-0a2a45030019-d1558034c116-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 10:45:20 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so4138665e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:45:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997c94f4c0sm29465275e9.8.2026.08.12.01.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 01:45:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1786524320; x=1787129120; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kv5repWIREELK5z++PzLzQV26AoA6Wk+m6y/goKMkM=;
        b=Jpd/E1k1arWfpHwRNGM4xqRIRXyzh/oYAO5gOStk4GUoHG6rw3t/nbAx3ecFckdWfI
         /Hv4TlsBsJ5+pKZlSadJDt5TwJldrqjK7cU9y5xyJiHrdN3s2I3TfKLnxOVDXMlu4Tb4
         N+DFEIzj0GoDVreual2uZHhtBXmG6c/3LoeVgK9+tiNmf0kuHufohMP5OW2EcBlOYLo2
         NaIz5x9/X8w1LoO8lkHOA6KFJdS1okR0mkgviTT1okedqVZNtwKhI0XZnZcbi5Y6kbnV
         eTajusqxoQT+CRVRvJDYfB54An5SfGLgrP1WuEsvAGBOulDHest71YfA0fYJ3Kto3lgP
         2N3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524320; x=1787129120;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kv5repWIREELK5z++PzLzQV26AoA6Wk+m6y/goKMkM=;
        b=BhaYwLyLSymNCEil0Ib5pmmjhTKSMTvklmiWmt0gmpyZRXUPoJcJj/pCPvuuCqNN9H
         hd5zd4f6rKOtXDi72i9CXNMHAdekTTLWzKeB/Dm2sYUyL3wrzJXnyEYsDD+IC0DDKsCF
         LUA6TB7m4EL7yRNGQ+4D7XgGFTrl380oZffVRkK8mo7eFOkvdJxbVnO1ValJp26CW6+n
         kGsWNeX4DJPcsXdLK9rkHsNU15J4b0E420Gb/tGKVqOha96yg3GmgYO0VVjPJyLTTMnH
         jR6DSiMCstp0vQ6GvmHV2Vr6IKnebcwkc6vmsIFKU/FqtnNc/8ipEWwmxdahgbK610o8
         P1uQ==
X-Gm-Message-State: AOJu0YzWcF7EuYFUF5xuma1arw2X+q7TCpeg5Kv/TPOI6FydI/UW+Mew
	0SY+NPVRLTgsjEgJBaYgKHWtrCedoYeG49X1j2jKWFR29K1Nff1a+uyJbopXQQ8SAg==
X-Gm-Gg: AR+sD11ZoOdrE7AKSs6NmqMbdeCn7jOII9fUN5G+Ge+wWp6BFUEsoJ2woYYrBmWzcYS
	MC/4gare+ttExwKZxb/ur0ZkxHbA9F+1JlDFO4KpSm2M7E3A8QlSOY5lnDxrTWKt9M9Uzb8VbJV
	RZAZqKRt4WJe/h04xjU0yzokjC8W98JDyuvhAF7W2Zlstxfb39n2ng3QE1AVTbVHcXje2obUFDR
	POJODSpjsvRAiIy+Tkvwrafr0iA4zgZ5p/FL35vxAasaDVulgB9+htTJ3xti+E+KrnvCOdF0L21
	tPno1gCZHr2Xyc3Or2oZdKJD6ron3F1lqSwqVptmayNHVnjdXE2dV0SewMbMkBCP1ZC50RU4G9N
	5J2syzLvI/nFQrQe7QdKNxNKw3u279hGfZ73/GwNRy8GG15id1EwTamLXp6EMN/EY4eLOV3YwI0
	gtegDhwBbR2t61QJVYq/001gApamZ0/mMciswGC33mIToeVKqRbYmQdpvTcS7CWT+Hja5BqJcsl
	cezT0zPZrJ2kwLhEz8XorRvqRZSLT5ELTb5LwY7w/MgJqe0UmVt
X-Received: by 2002:a7b:c7d1:0:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4997c1192c0mr28620185e9.7.1786524320350;
        Wed, 12 Aug 2026 01:45:20 -0700 (PDT)
Message-ID: <023ffc4e-ac21-4220-996a-1b7eaa9f2467@suse.com>
Date: Wed, 12 Aug 2026 10:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vvmx: Fix uninitialised writeback to vmcs12
To: =?UTF-8?Q?Johann_H=C3=B6pfner?= <hoepf@cit.tum.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
References: <alfcosYs35pOCslN@cit.tum.de>
 <af5dfcaa-8da8-4bd2-ac30-24bc65e65a6e@suse.com> <anWa8ExGlrqsoxfN@cit.tum.de>
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
In-Reply-To: <anWa8ExGlrqsoxfN@cit.tum.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1786524320-6C4DF4E9-3DF89E4D/0/0
X-purgate-type: clean
X-purgate-size: 1574

On 07.08.2026 11:32, Johann Höpfner wrote:
> nvmx_handle_vmwrite leaves local eight byte variable 'operand'
> uninitialised to be written as an out-parameter by decode_vmx_inst. In
> cases where the operand to vmwrite is a 32 bit memory operand, the
> invokation of  hvm_copy_from_guest_linear leaves the upper half of
> *poperandS uninitialised. The resulting eight byte value is consequently
> written to the vmcs12 leaking the four uninitialised bytes into guest
> physical memory.
> 
> Initialize the stack-space passed to decode_vmx_inst to avoid this
> issue.
> 
> Fixes: 2b2793d3ae44 ("nEPT: handle invept instruction from L1 VMM")
> Fixes: d4c5b9db5a85 ("Nested VMX: Emulation of guest VMWRITE")
> Fixes: 9ccf55307868 ("nVMX: virutalize VPID capability to nested VMM")
> Signed-off-by: Johann Höpfner <hoepf@cit.tum.de>
> ---
> 
>> In any event - why don't you make your proposed change into a proper patch
>> (primary piece missing is your S-o-b, and perhaps we also would want a
>> suitable Fixes: tag)?
> 
> Sorry to have kept you waiting. Here is the formatted patch. I included
> the invvpid case still, though I believe only vmwrite remains after the
> patch you linked is merged, right?

I think so, yes. Andrew, Roger - any chance of coming to a conclusion on that
much earlier work [1]? Imo that wants to go in first, with the patch here then
shrunk to what's actually still needed (at which point only a single Fixes:
would be left as well).

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-06/msg01208.html

