Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D17C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 13:48:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407201.1640290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27nq-0006qw-JZ; Thu, 03 Sep 2026 13:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407201.1640290; Thu, 03 Sep 2026 13:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x27nq-0006qp-GV; Thu, 03 Sep 2026 13:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1407201;
 Thu, 03 Sep 2026 13:48:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x27np-0006qj-3f
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:48:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x27no-00AfEe-93
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:48:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a997aac-8faa-0a2a0a5109dd-0a2a4509a5ac-0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:48:28 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a997aab-be1a-0a2a45090019-d155dd32a416-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 15:48:28 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-485853f8800so247929f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 06:48:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e80388sm15726191f8f.14.2026.09.03.06.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 06:48:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1788443307; x=1789048107; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpiK7G9MkktIrCD+VTkTCj37snNS+NfQ2NLD1aivW/A=;
        b=Skd8icHcuXTVeXDr6X9aGyMtdXj3boRBL9r8kPr76K80TxP5UTLLxWDZSsqzUfpBb1
         vtyjzHFcicO6ziCEdxSX0aOTWtw0BIr3tOTkbR0MBzTOFA66qs9uuqJFguN4AYPzliyY
         +FARWMpjSxYO67o2qM1qGJRny8gjtSG/SFmUEII0XCe/imMeTUzwY+sE7mXY+iX5LkdC
         cgHpi8KDfVQNuXML3+vbQYRlROtKxXVhZyJd5qzIziafbIP5I7JtnV+Q93PeEOHn4Ygj
         c1JHOjRdsrjdxBi/H+Gv7uHWFSjbQvgZTj3q8kqjU6q2kNRybBr3lCA6SExHwEsy7QKq
         T+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443307; x=1789048107;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpiK7G9MkktIrCD+VTkTCj37snNS+NfQ2NLD1aivW/A=;
        b=jogE7yEG8suaAuR5YUw8VD/OWqi/HFK207rWs40KXL9Zhkmniw1pYQBDMid8OSF1am
         QWD5ENMH2qVKtTIso78udNd7J4M4NCBVoindSIk9bMGA9o9nU7+los1cZq7OUry/Yj6U
         4WWHYHXHi9wyHBvqycYQESHQzQkOQainqyMDGdcuBM8KxWdCWx2AUgqj2VuS94wpwC3N
         P8TEN2Svjqe0KXjalwPb2esGWMxBKbn6edvHCJW2j3rwcTY0VjZC6ejhP6pUzS7jXdrD
         dSaD0J1nwZfCAZskNQ/3hegipKCGMB5ccanaozeqBY1cGSZxfg5uF+l8VS/v2p0RptDU
         5MTg==
X-Forwarded-Encrypted: i=1; AKwUvBzXGLOdeoPwlPIlE1XCx98LcwrHDyy2QWVcxw0enbVTgj0OZiV6OKyFIAa2Y2bCpniELJwYELKshKc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mqoxI98bTwUokAxCNIXA7iSTds7ojVkx7s23i1I2qVTdn/VHlg
	Zf23lWClBLdS6cGFIKIoqLG/K1giJvm/tc4uOQ9cXyM7EsV0jV8v3ydrw/vVpgBUYg==
X-Gm-Gg: AYBFou1Zm7t4Q/GPrOO4I7WTU/9JY6sRDJdjqTFM8GXoJX23pP3ZeZjUIIllZl/+2/5
	pz9eMexbkzvFq5nXUZH4GdrkSOm/jrjB+7r87N2xSy5x2AmDBNeOXkjlU0r89/glm6QODMCyATm
	rlkEsMfTsscB/pr9flHMdfkmjAcVwV4ffFWEywLPHq9hSRQUQt5xYpla7lfFViMYkvj5+c3JJzp
	mr8u4ePv+Rf0NmJ8ztyn7V4mMtiffh30NdnTNh8JSLG5TJj9Pxf5yA/s31LOYpCT+0+ZdJzxFMN
	BSsf4IdbDT3cGM9hX7GoYLQBZ89h0b25XGUzbylzZVcEP/QCmyWH4zVsn1wMS+IebbyeuzmIoqy
	wnDD+DBRwxY1xFgNa+wV+ROwlDG9e3FScKIL/Qt3OOo+jhn4h0MkG+I5/UARiZgK1znk4b6fteT
	PDttuaUvL9OMRfMyCMj7QrWPja+X9o0W9u14A9rrtQwLZe89fneZ4ErTfa6Ce8XLDpo6espmgLg
	MROFgD21u1ps9axOzxtWz+EkxgTwcHUi0wKcSiG/SJwb1BE1AuB
X-Received: by 2002:a5d:64c4:0:b0:485:7d6d:e0e0 with SMTP id ffacd0b85a97d-48582315f07mr4466480f8f.3.1788443307581;
        Thu, 03 Sep 2026 06:48:27 -0700 (PDT)
Message-ID: <e2813a94-f446-4f7c-a74d-6c9e6625da72@suse.com>
Date: Thu, 3 Sep 2026 15:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/svm: Intercept CR0 writes selectively
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
 <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
 <a79edb3f-0ff1-4583-b091-745e38ac2f8e@citrix.com>
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
In-Reply-To: <a79edb3f-0ff1-4583-b091-745e38ac2f8e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788443308-3A6DA034-18FBB66A/0/0
X-purgate-type: clean
X-purgate-size: 1619

On 03.09.2026 15:35, Ross Lagerwall wrote:
> On 9/3/26 2:02 PM, Jan Beulich wrote:
>> On 28.08.2026 16:19, Ross Lagerwall wrote:
>>> Xen does not need to track when the TS or MP bits change so opt to
>>> intercept CR0 writes selectively.
>>
>> Not anymore, which may want expressing here (or else it looks as if this
>> would have been possible from the start).
>>
>>> Aside from potentially reducing a few
>>> VMEXITs, this fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE
>>> and L0 intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so
>>> L1 never sees any CR0 writes.
>>
>> Yet if L1 sets CR0_WRITE, since intercept masks are ORed together (if
>> I'm not mistaken), ...
>>
>>> @@ -2882,7 +2884,8 @@ void asmlinkage svm_vmexit_handler(void)
>>>           break;
>>>   
>>>       case VMEXIT_CR0_READ ... VMEXIT_CR15_READ:
>>> -    case VMEXIT_CR0_WRITE ... VMEXIT_CR15_WRITE:
>>> +    case VMEXIT_CR1_WRITE ... VMEXIT_CR15_WRITE:
>>> +    case VMEXIT_CR0_SEL_WRITE:
>>>           if ( cpu_has_svm_decode && vmcb->ei.mov_cr.mov_insn )
>>>               svm_vmexit_do_cr_access(vmcb, regs);
>>>           else if ( !hvm_emulate_one_insn(x86_insn_is_cr_access, "CR access") )
>>
>> ... we may still see VMEXIT_CR0_WRITE here (i.e. its handling cannot be
>> removed).
> 
> No, it shouldn't get here in that case. If L1 sets CR0_WRITE, it will enter
> nestedsvm_check_intercepts() and then hit the NESTEDHVM_VMEXIT_INJECT case.

Hmm, okay. Yet then I still think the original case label shouldn't be
removed, as we don't exclude the CR2 or CR8 cases either.

Jan

