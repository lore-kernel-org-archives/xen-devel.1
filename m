Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C0DCA5FFE
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 05:56:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441224.1658779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDy9n-0000ev-Cy; Tue, 06 Oct 2026 05:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441224.1658779; Tue, 06 Oct 2026 05:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDy9n-0000en-7s; Tue, 06 Oct 2026 05:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1441224;
 Tue, 06 Oct 2026 05:56:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDy9l-0000eh-Qp
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 05:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDy9k-00Ap3c-GP
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 07:56:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac48d72-2eae-0a2a0a5409dd-0a2a4509ebd4-4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 07:56:04 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac48d73-be1a-0a2a45090019-d1558029d1ad-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 07:56:04 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so7839075e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 22:56:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03fef5950sm257815415e9.2.2026.10.05.22.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 22:56:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1791266163; x=1791870963; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYWr8LUjX7sHqSBoQ3PHPB1NX62Vz51QOO188a9KB1U=;
        b=ZV3lacdDBkGHEy9PnQM4sVk6NdtxPoKsqzbPiscqVtkMnLO0r/9mMtPAJW8ZfQirpi
         UvikTl8TjU+CrgJFrmiGj7s9Hf92PACO7XiU/ihxDAEnMQcmfAh31wnYWh7l1GtXhf/v
         X+FIzV5yeOFiePG4ScHB3VdI+rz3zjT3Y5fbymEhBjKMjr0p+0LnaQ3+ecyH0gBQ+R1z
         EIXdHU0h9k3CJXx3ISjjkiYWXzqw5pToWEqboVUuP25ekRgr/YMSi9inWghp2UjjVYmx
         YlQXERGOLqnwLCsPXN0PCCjWHl45JbDgFesrHODoVkb+beb7yczB7YiQ/txh8QFG/UnN
         +N5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266163; x=1791870963;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYWr8LUjX7sHqSBoQ3PHPB1NX62Vz51QOO188a9KB1U=;
        b=HOV7h/DlYUmhtEn0rolYZc/5nh6Cn3/0CG/LGc1lp6Q2FmyH1mReMbKPykFYYD1MJR
         1Q1hXknpwnIlq3lrXCRv2DS3e5Z6bPD4pqAT58bVdRIVNKTufB9lxT7LS9RIfxGUAaqF
         /jkHCx0shsxX8fA8iSUSCsXC7BKsFO9EJRCJVcZlab6xIvYNLmBktpranEW/VXj2k8u1
         aIX3Qli1WUt7u8FNXKK8IiNkarKHfN8zAS3cBG8OttX67kBxOPQUkjbZC0ICD+fKtkTY
         XkUWXK0xBxdbsp0utfKU2CPraCY3AvbZgrd4hCjaCTk74ZngCXNHWC+feYTvMLns64GF
         M6Aw==
X-Gm-Message-State: AFuF++mRxBHyww9WFz5IAjqzAmNGZ1iw0B2vi3nBNUz2Uz7i1gvOzDe6
	lt9RRbzs7PEMH16fmj8YMmOnRmhxTBEL5kY2+LmDFdyjo/F9iUhiShaxAThPqBhbzw==
X-Gm-Gg: AYBFou3LtgKh/Wh7p6lfUG5GkkrdODEmyxfaCMlpk/LF6mr1N+uGWWFKkZGozGmm6IS
	8sRO4oYhF5txCjXnxxLn6QuxDAu+tTHFgSHghtztt7fbUDGqtkM61ndXPfJoiic2HQhGMN+zGX0
	cDDZJphwLt86GIplYAmzHxHGO4V2WaljGpXBQ4apBGPo/nvrmI75RR1LuKZU9n9IBeoB7q+KXR5
	IV8P5Xk6y52yBDaTKBmiR/xNSmMlbODDZRjjub2VLQMCInSL/TxATezyfTk9f0Oimb6KYOXSm0L
	Ky6/6Om+piTcgExoORDX+ls1pNxCk7+zIGlL0E3BWZqxDdkaLWB4iPM0qPLTHt7pNQlaYw1yTzY
	lQpkULwhAZ62XkJNcWT1LAzvTwzhxZN4kQhbm+vrqWS9TIToFZ40cvatFCA9agUNhs4tCcekUzV
	cPPj2yH/jzJzMOKLBWTNWLuZ9Tp6WO6x16dqHySGLDrEhRKRV5eFUj6q8ishhZs0qkpoVLAgh5r
	PIWpqveiUgK+IEKnE6rlXWGIUGCkSpLxnjyFMM2dJbhT1ejLJ84EsZrv3JPBjY=
X-Received: by 2002:a05:600c:b8d:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-4a17b548f86mr4946235e9.14.1791266163542;
        Mon, 05 Oct 2026 22:56:03 -0700 (PDT)
Message-ID: <8dcf88f1-a5c9-495d-9110-45a14dfd573e@suse.com>
Date: Tue, 6 Oct 2026 07:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: correct PVH Dom0 E820 region merge
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <012de89f-000c-45b3-a600-544114346e5b@suse.com>
 <asPOHwUrYdlFJ3nx@Mac.lan>
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
In-Reply-To: <asPOHwUrYdlFJ3nx@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791266164-BC6CA034-9ED3FD9C/10/78276251493
X-purgate-type: spam
X-purgate-size: 1013

On 05.10.2026 18:19, Roger Pau Monné wrote:
> On Mon, Oct 05, 2026 at 06:01:34PM +0200, Jan Beulich wrote:
>> Folding with an immediately successive region can't be done by merely
>> lowering the start of the region. The size of the region needs increasing
>> as well.
>>
>> Fixes: 5427134eae81 ("x86: populate PVHv2 Dom0 physical memory map")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> My bad...
> 
> Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -229,6 +229,7 @@ static int __init pvh_add_mem_range(stru
>>          if ( rs == e && d->arch.e820[i].type == type )
>>          {
>>              d->arch.e820[i].addr = s;
>> +            d->arch.e820[i].size += e - s;
> 
> I think it would be simpler as:
> 
> d->arch.e820[i].size = re - s;

Perhaps, but the way I have it the compiler may figure that it can fold
the tail of this path with the next if()'s body.

Jan

