Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E067CC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:18:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428680.1651574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yW6-0004zC-Kd; Tue, 22 Sep 2026 11:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428680.1651574; Tue, 22 Sep 2026 11:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yW6-0004z5-Hs; Tue, 22 Sep 2026 11:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1428680;
 Tue, 22 Sep 2026 11:18:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8yW5-0004ys-9J
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:18:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yW4-004FIH-0s
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:18:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab263fe-e002-0a2a0a5209dd-0a2a4508ecf2-22
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:18:28 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab26403-f659-0a2a45080019-4a7de14cec3a-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:18:27 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so1962316f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:18:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488626d29dasm4678663f8f.0.2026.09.22.04.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 04:18:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1790075907; x=1790680707; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzoSu7oz7FIga5JrfzeKognymuNfSo/D3EKCD7/Ye2s=;
        b=fNVP6zj8aDaV5KHfh7JV+rQ6LbcJxStMsSPYB/v+26SFm788OoS/mBs4TJcXKS2h2A
         qLrPl8nNImWXhwSDeZ6Q3kJeBsYWL5hQBzpO2uww4dTyotdIHMGhYwk+yg/CQ+kiiLh5
         PPLrJRZUIpo14Ip5QE4rQ14wanti4QB5353RBND91l8bjn2XC3yj6XEFyHZ6/IDiLsWm
         kIrkgLIGG+KuCgpnNwl/mS9zq79kWrANCxozxgWZK+k5O5DD7MOk9+qD5o3LFmchtRzr
         MJxodW3yur6WM1dE4JDX216FQZkWs6N+Oo0DgNhAv4OUPcNobWncQ0HxKE5FFyTz/Frt
         Ce+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075907; x=1790680707;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzoSu7oz7FIga5JrfzeKognymuNfSo/D3EKCD7/Ye2s=;
        b=GUgXPlvqAYdoFNu1NYrgMjCIb8e+pX5ClOWZsWA6CgSuvKytB6pjLPyu6kY59pv769
         ZPhZvIYRI8yyCHrCTSYMM5RcSuc69sKeHNkoRtno6HwE4f3bX+wHf73b4tXMYzChF7Cf
         29ay1QCj1b8iyMvcQ+iVBHmffx7Sgr+xdK2Mla5mgFTH3VTXRRt2sryW+w4vOFLrsEm9
         19bl9aWd49kNY6syl+OI/UeNFjI5oWqu88ahKptMPmY+/PGX3kSeBNM8iasUzZoyUVEN
         xUZDXk+xK7RP78CPLk2vnIHveepiRLaq9xihjM9XvM6pqbeMR8724i/M89y6NFfF2ZCV
         ctkQ==
X-Gm-Message-State: AFuF++kYCcnbaowgjP9rp0JXQu3/XPLvCeghguLhxbHrTY9mZL9ENJQj
	l3PGupgTV43qUmB4/fjfmql7LMwxFIEU2Tsxk5T7kUqowVW6GCnRrVL5ypHQIBcexw==
X-Gm-Gg: AYBFou3T8AV2GayqqHvHM9h7cCwygxWJnAedkwfjVYZJH4tPwh93rEDsS15fXUEdQA/
	XRIXkVfqpMimAJEsMWJFHwAGHAMEkdhGhwbR+b86SIiEc82nt64isVhqVMvDQ6Bw42wvwP4LxTJ
	repFsyorIJX/1a2EkaGeAP2QEy4D8yO441YANVjaIXShaZMSJmT+5myi2md42WUeSQk9KosC+Lu
	zcdxAEvKrVo7mLT4Ifags2FEUBlb6MRmoZJLQg6Xzge3AF6gpr2MDLc8K83/5P4BkfTbsUs+BZp
	hdJhy4Rr0loz4QlfUGCGoupyxuY3n88K5ubF8JPVv55xRQ6JuhHRMyQ60ab5HApHdMfPl7cVAcd
	CSLp7thsXxsx6t2I6VAVZne+Cm4lhMRV0TeVs4PvjY0e8q7CdSUdUHyWf4vZ2DqFvMjVbmAzsN1
	0QieIJZySCUFVYLHihXsWm4ketxS0og+btGHuyuJjVuTygtq51fI58zh2DfnuH2dFC/EkLCHSZo
	3X28HOIOzXICl5bG/YQz8+HsvpYQ6EoSXFrbLE1uPseg3y3dx3xcQOCycWve20=
X-Received: by 2002:a05:6000:2086:b0:487:662:cb90 with SMTP id ffacd0b85a97d-4871e26949dmr21529963f8f.34.1790075907371;
        Tue, 22 Sep 2026 04:18:27 -0700 (PDT)
Message-ID: <0320daf4-fc62-4b10-a068-0e25f53f3ee9@suse.com>
Date: Tue, 22 Sep 2026 13:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] ELF/notes: use pointer-to-const by default in
 ELFNOTE_...()
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <8fe86787-7590-44f1-be4f-461b61d7669b@suse.com> <87fqz26otq.fsf@epam.com>
 <162997df-6c5f-4f1c-b01f-16f6c2e4e0c6@suse.com> <87pky55z3z.fsf@epam.com>
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
In-Reply-To: <87pky55z3z.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790075907-D437587B-C129F42E/0/0
X-purgate-type: clean
X-purgate-size: 1840

On 22.09.2026 13:01, Volodymyr Babchuk wrote:
> Hi Jan,
> 
> Jan Beulich <jbeulich@suse.com> writes:
> 
>> On 22.09.2026 03:45, Volodymyr Babchuk wrote:
>>> Jan Beulich <jbeulich@suse.com> writes:
>>>> Not doing so results in a number of Misra rule 11.8 (casting away of
>>>> const-ness) violations. We need to allow kexec to use pointer to non-
>>>> const though, so provide a means to override the default.
>>>>
>>>> For ELFNOTE_NEXT() we can do better and simply re-apply the type of the
>>>> incoming pointer.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/common/kexec.c
>>>> +++ b/xen/common/kexec.c
>>>> @@ -6,6 +6,9 @@
>>>>   * - Magnus Damm <magnus@valinux.co.jp>
>>>>   */
>>>>  
>>>> +/* We're producing ELF notes here. */
>>>> +#define ELFNOTE_CONST
>>>
>>> Frankly, it feels backwards. When reading this line of code I am
>>> assuming that you are adding constness to ELF notes because you are
>>> defining ELFNOTE_CONST. And I had to check the elf.h to understand that
>>> you are doing exactly opposite. I am pretty sure that other people will
>>> confused by this as well.
>>
>> Well, that's certainly possible. Yet then you or them are asked to make
>> an alternative suggestion. An option I could think of would be to merely
>> rename what is ELFNOTE_CONST right now, to no longer have the word
>> "CONST" in it. ELFNOTE_MODIFIER maybe, albeit that reads a little clumsy
>> to me.
> 
> Taking into account that we need 'const' to be enabled by default, maybe
> something like that?
> 
> #ifndef ELFNOTE_NO_CONST
> #define __ELFNOTE_CONST const
> #else
> #define __ELFNOTE_CONST
> #endif
> 
> ?
> 
> And then use
> 
> #define ELFNOTE_NO_CONST
> 
> in this hunk

Can do, just without the leading underscores that you did introduce.

Jan

