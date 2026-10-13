Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E610DCC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:13:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448006.1663971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeBf-0005tb-VA; Tue, 13 Oct 2026 15:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448006.1663971; Tue, 13 Oct 2026 15:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeBf-0005tU-SK; Tue, 13 Oct 2026 15:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1448006;
 Tue, 13 Oct 2026 15:13:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGeBe-0005tO-8G
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:13:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGeBd-002TVt-DI
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:13:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace4a80-8faa-0a2a0a5109dd-0a2a4503b990-2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:13:05 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace4a81-fae8-0a2a45030019-d1558032a5f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:13:05 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a1af482519so6057835e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:13:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea0f1csm534357255e9.9.2026.10.13.08.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 08:13:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1791904385; x=1792509185; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8bGDKcmFJN/P6emYCz6cM3orxP/FzSRMb/dLvTdpyk=;
        b=SsQCacplTF++Y9FxstkGxePGpgxp2QWSnyvT/OXLgEzz502Aa2uqjYSVvRMROLj2qr
         0RkUkEI0dyYeC4Jruqzr32E9uImIeXwVE1+HxjEJyQBfruoqqOWSa7yW4XLWdD4MJE88
         j6vLGSy7Lxn8X4/alJztXg8kfOWwOmSN/fgawiSJavFZjmty46d4C//aMNxMdxvznM10
         EnAUJfWnbJwNhMsP9Rufc5LuQepWMK9A5sCnKJRFkaEY0QTBgPnARBAcPRxPXvHRQWKM
         HC8vNbgJFAWE0sUumAmIg4IOzEg3wEALAaEUEPhBhpIFz8lHyE0I2S6dPHsAJYopfHpt
         hxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904385; x=1792509185;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8bGDKcmFJN/P6emYCz6cM3orxP/FzSRMb/dLvTdpyk=;
        b=d2AfQFMts5JrkqGHy0r9eVPrBkElngrdWbsKNxSpJae+GxZt/CObkw774/VMg8hvmF
         wAYwXMtCk0Z/TurBS+f9ZQIyc7DBEh+GFyBR8ksLqKpmwJTz2XxLibDEGo3w9s0+gEGt
         OQlqFiOWi9uxk9DF0HOnsrf4frhpVWY3wxIr7AMteK8LE6L3sjCfQPprcQ2wUBLOrMSf
         Vz12nJrwqKQu03Pov5/OHA3wOSd1XroWjopPiY3xYiSl8E/fAjdZqkVg4HKlZb6/hwQ7
         VirAGjSrLxVu8sPz4Q1uubghipzty0p34YaNsYsvmi+hwDrYzAPuGnWgsdDFUn9B3uum
         1d9g==
X-Gm-Message-State: AFq9FYI5WmoIqWD6kYY3OcD5fpLLLs0jkCNFjKd+OCr/1oidqm1YZ1wF
	/MyL51FktoREQvGBklZxe2E7xmcedKoiX+vo4XtqGcEigR17O+nn7jGrYOyzMw0ySA==
X-Gm-Gg: AYBFou0LV1tFJpJeLycA2NY8rYRNXiDGF/7gEHdHx9Olg8p6Oi8braWuQSy2XW5snJT
	OKzq+9fSB6XqdwPT1mftiz8KOebkPmqLHIhKBKZDOGaSs2KUwdSu66tYAWU9blkfVdkXL9+jMRM
	3Mxbp/msUc+jJs3ICtAS0ZDmcq02xXdvHBZb5nYW+uAr0poqX8k+u7m/myU4H2fbG05YCilexDS
	dbjoOIvYEv1BiLBJLT7PiKwXZNzNN2bdQkVw6A1mDzDFSOP1fTF8uis2eF9jFD5vT36F5gDHehc
	EX7Pj7Lkz4d/bP79aYucRfxg7X0bZ2PR2t2yGhx+38pX+mj9LD5sO51VfsFyQKVBnETO53L00qv
	197HVSinM6odolibt64DyXN+JhIUSk1Ov5hgd5j4x+wuaFJu2Doc1jorzx7DLU/BatKK5ZtGp/c
	Qq98uY5FKfYkLeJWhJ45yd70uHbbIk0IuDes05nE43vduGxzQds2MwwpIsQtPTjC9zzsAb5wjCB
	q8yPV31yDYN8GP9RA1juagQHSTAAAwSnnuIrAwdNEQezFiET6zVDG8PlcfaQ8A=
X-Received: by 2002:a05:600c:3146:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a18e4a7cb9mr254138635e9.14.1791904384553;
        Tue, 13 Oct 2026 08:13:04 -0700 (PDT)
Message-ID: <f63c5a7d-5037-48e9-aae9-7b7de92d5b36@suse.com>
Date: Tue, 13 Oct 2026 17:13:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] x86/PVH: lift E820 alignment requirement
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <a28959f9-a832-45ae-9c81-350e43f23c91@suse.com> <as5HU6-tCy9YPWlM@Mac.lan>
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
In-Reply-To: <as5HU6-tCy9YPWlM@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1791904385-6E2D04E9-B9939B82/10/78276251493
X-purgate-type: spam
X-purgate-size: 3560

On 13.10.2026 16:59, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:22:28AM +0200, Jan Beulich wrote:
>> Before reordering things (to move in particular pvh_steal_ram()
>> invocations ahead of the pvh_populate_p2m() one) drop an undue (and as it
>> turns out unnecessary) assumption: find_memory() doesn't really depend on
>> E820 regions to end on page boundaries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Really the assumption towards the start of regions doesn't look to be
>> relevant either, yet I thought I'd limit the change to the minimum needed.
>> (In fact the statement immediately ahead of the assertion arranges for
>> page alignment, so the check is dubious altogether.)
>>
>> We also could consider whether kernel_end really needs rounding up to a
>> page boundary: Technically there's no need, but the question is whether it
>> would be a good idea to have the tail of the kernel region share a page
>> with metadata (or, as things still are at this point of the series, the
>> initrd).
> 
> I think it would a bad idea to have this kind of page-sharing.  The
> guest might use NX for metadata page-tables (ie: initrd), so it
> sharing a page with the kernel could be problematic.

Okay, will not pursue this then.

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -365,6 +365,9 @@ static __init void pvh_setup_e820(struct
>>           * that's the minimum granularity of the 2nd stage translation. Since
>>           * the p2m code uses PAGE_ORDER_4K internally, also use it here in
>>           * order to prevent this code from getting out of sync.
>> +         *
>> +         * Note that this is only for pvh_populate_p2m().  Subsequent uses of
>> +         * pvh_steal_ram() will break the length part.
> 
> Maybe because I'm too familiar with this code, but the previous
> comment mentioning the 4K alignment being required for the 2nd stage
> translation kind of implies this is the reason for it?  I guess you
> want to make it clear there is no further logic depending on that
> alignment.

To me it seemed as if the other comments / assumptions were (at least in
part) building on what's said here. I.e. yes, I meant to verbally break
any such connections people may have memorized. If you think I'm going
too far with this comment addition - getting rid of it again is easy.

>> @@ -506,8 +509,8 @@ static paddr_t __init find_memory(
>>      unsigned int i;
>>  
>>      /*
>> -     * The memory map is sorted and all RAM regions starts and sizes are
>> -     * aligned to page boundaries.
>> +     * The memory map is sorted and all RAM region starts are aligned to
>> +     * page boundaries.
>>       */
>>      for ( i = 0; i < d->arch.nr_e820; i++ )
>>      {
>> @@ -519,7 +522,7 @@ static paddr_t __init find_memory(
>>  
>>          start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
>>  
>> -        ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
>> +        ASSERT(IS_ALIGNED(start, PAGE_SIZE));
> 
> I would remove this altogether - as you noticed start is clearly
> aligned by the code in the line just above.

Will do. I kept this part because it wasn't really the first time round
that I had noticed the check being pointless. I.e. there still was that
chance that I might have been missing something.

Alternatively I could drop the ROUNDUP() from the assignment of start.
Else I think the comment ahead of the loop may want altering further.

Jan

