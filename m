Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A65606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LnZSoYfP
Received: from list by lists.xenproject.org with outflank-mailman.1500299.1696524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVPan-0007Bb-JK; Mon, 23 Nov 2026 08:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500299.1696524; Mon, 23 Nov 2026 08:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVPan-0007B9-Gj; Mon, 23 Nov 2026 08:40:05 +0000
Received: by outflank-mailman (input) for mailman id 1500299;
 Mon, 23 Nov 2026 08:40:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVPam-0006xg-Lf
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:40:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVPal-00BcO6-Sj
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 09:40:03 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03fbd7-e002-0a2a0a5209dd-0a2a4509e1d2-46
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:40:03 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03fbe3-be1a-0a2a45090019-d155dd30ade1-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:40:03 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4a9be758734so1763009f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 00:40:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6ae2dcf9sm20676115f8f.32.2026.11.23.00.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 00:40:02 -0800 (PST)
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
        d=suse.com; s=google; t=1795423203; x=1796028003; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4V5eMT7CzJ8ael2QRZiei/MC1l61L+lQ8fcSar3tHo=;
        b=LnZSoYfPOAeCo8+8/XPhMGzCLX3VnQXL4B9r+4/sndLivQTaygqXQvrOP1j8JKS2Ub
         Aq2OlzzUf6L0mSXgPuufOIJsOFU622eCRGUIJPOwDv9es5Wxsab4SesjFI1teYVq5Q/A
         Ti3poaNyrODrzxH8HPNLDyR2e6NZpsp0GVOtVTPbyRzhkkZqc94auDLO19eF3nPRCkRP
         CAenv2646Rg5ZCXQZAKHln00lcCzw2SY2mIjdMaQE4MtevKaD64LkTO8ssZBm5MAOCU+
         RzIuUykVCCpfn5oqdXtCjP7xo7Q+MDwfwAPqMVS/5s5umzggCKzW+Pa6B3Hzfb1P9/7Q
         Cj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423203; x=1796028003;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4V5eMT7CzJ8ael2QRZiei/MC1l61L+lQ8fcSar3tHo=;
        b=H/3Ups4rT73l5Z9hlJm8pH6LPwztFKMHWJrD98CF2B+To0Z7NxJcliYWZ0HyUbjXdl
         Kc/Hly3mk1vV1Bhb6hlX3qmtB4SoYB4Nhftvjgx8GYf41byXUP8zdvXUVTqZMfG7m/sC
         CxKFUQbVhuX9VRtz1tpFQom0LjjV/SZCnxDhoU5hnspfKMflfkVb7nYl48xYB880wCq/
         owvBdrU8BcqxMu3idw5ItLeQRCbV1SAycuCd4r7MH+pRdp9h2ONQy1rtgO3cIbMwPWJE
         NNQ/sanEz3c+sq3yrXZ17EpzwPI9GIVCkbk1JEV/cQN4f6ErEoIDtsKpO+09vi+jhLFl
         DLwA==
X-Forwarded-Encrypted: i=1; AL+hErFV3M4qLEddqTJ7/jWuQPSZX6Xk1WhVbOPPoidnkdYqw7lvmcv1BwlL+NEqtDehYAWGeCffw9lvX3o=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Ilk4h++PlOmgEH9v7D2gzguqhE9O2r+oX54gfMnJAwPaSUlgw
	MfaanpZDw4/UsWyNNFuXkfpixNh6cs4s77LhzFy+LlpwlBiHygZQciUvBzUFfRrIOA==
X-Gm-Gg: AZFdTZczuHQ9KAJ/q220gFaP1mXm8cAJPPuCR/zH8c3/2/YapI2e8q53bAdxhnyG8Vb
	YucbOmT8LQtTYIiMIK6CC2ZTldKYSDFROb6l5ASL4nxLbXcSl5Bm9yotVUlGZrixsZSQ+9lG0h7
	XSerEkQuBhxExI5Zd2nFQqR4SluSZVUDdJlK+q4K2Vv3Nv+97BryeCnTiic+nRUZ/QIu9JoKFo5
	xM2WoK5E3n+PnIEV78cANWvkTD6hntg/tw1y8lBf4IvbYN47Q0P4pZdKNcZmlyZO1cjClkV9OQX
	g6FxBJ3OuPWKsIRlrvMtm9BESML2z0sboDQCw4V+Sw88PpMul+zbPrMKYhPhKIprTXCTGc1j4eS
	ZWXhMrtlTvCW8pJt68wQZtsAkmGdK4o64a1JavyxbDNO1mG4J62faMmzYu3qveS56bpkepV5o15
	y0VJ+65xqJY5SAFsHzuOMNMF/qGGUP3jiUudRFc3k4/Q5+O4pS1exGzgdiXPoNLUcmiR8LlVhD3
	pIyN9ft6IuEOQZotiXavr6gSlXhnGkERAXcbabpD7eHuh546TYSNsXdGCz/N5WMn8NrA02DLG/Q
	5q4ofWAZl0V6wrId8B1DvmFFwpVja/JTURL5CwAKALR/bIaJ/Jg0fmHdl0IcF5UHeXmlumAzj8t
	uvy/U6f2io7f/nt1B
X-Received: by 2002:a05:6000:4808:b0:4a9:760f:1843 with SMTP id ffacd0b85a97d-4abb0d51e12mr20823655f8f.27.1795423203128;
        Mon, 23 Nov 2026 00:40:03 -0800 (PST)
Message-ID: <eab1d2f1-1367-45a4-863e-3e7ba9b49e60@suse.com>
Date: Mon, 23 Nov 2026 09:40:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vLAPIC: only accept interrupts on enabled LAPICs
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fcf0446e-3511-4dfc-b1dd-1445f29ec815@suse.com>
 <5458b651-cb26-4b20-b39d-6bb75dfb684b@citrix.com>
 <3e566ae4-1a90-4d0f-8edd-2349a40e0b52@suse.com>
 <c21c3ecf-4ab5-7efb-b8a3-002d1c1ffc49@kernel.org>
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
In-Reply-To: <c21c3ecf-4ab5-7efb-b8a3-002d1c1ffc49@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795423203-BCAC8034-03AB8B7C/10/78276251493
X-purgate-type: spam
X-purgate-size: 2173
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.11.2026 22:44, Stefano Stabellini wrote:
> On Thu, 19 Nov 2026, Jan Beulich wrote:
>> On 19.11.2026 13:49, Andrew Cooper wrote:
>>> On 19/11/2026 12:18 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
>>>> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
>>>> @@ -136,6 +136,6 @@ struct vlapic *vlapic_lowest_prio(
>>>>  
>>>>  bool vlapic_match_dest(
>>>>      const struct vlapic *target, const struct vlapic *source,
>>>> -    int short_hand, uint32_t dest, bool dest_mode);
>>>> +    unsigned int short_hand, uint32_t dest, bool dest_mode, unsigned int dm);
>>>>  
>>>
>>> Even before this change, I was thinking that 3 fragments of ICR were too
>>> many parameters to be passing, especially as some are bits as per their
>>> ICR position, but dest_mode is shifted down to bit 0.
>>>
>>> I think passing a real ICR pair will be an improvement both for
>>> legibility and for code generation.
>>
>> Are you saying this with just two of the three uses in vlapic.c in mind,
>> or did you mean to suggest to have all the other call sites end up more
>> complicated to achieve this goal?
> 
> Only the IPI paths have an ICR, and even there the destination has to be
> decoded in the sender's mode first. The vIO-APIC, MSI and passthrough
> callers would have to build a fake ICR.
> 
> On the patch itself:
> 
> 
> default: needs fallthrough;

Oh, yes, just that it wants to be break.

> In _hvm_dpci_msi_eoi() if the guest EOIs after disabling its LAPIC in
> software, the match now fails and the physical EOI is left to eoi_timer.
> This is a change compared to existing behavior, was this intended?

Yes, it was intended, yet I wasn't quite sure of the (supposed) behavior
there. I should have added a remark, and I've now done so:

"What correct (or maybe merely "best") behavior is in _hvm_dpci_msi_eoi()
 isn't quite clear to me: SDM section "Local APIC State After It Has Been
 Software Disabled" doesn't cover the EOI register's behavior in that mode.
 Nor does APM's "Local APIC Enable" section. Do we perhaps need a fake
 APIC_DM_EOI mode which would then also only check HW-disabled?"

Jan

