Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCFFCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 15:30:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441606.1659206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE777-00029E-3o; Tue, 06 Oct 2026 15:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441606.1659206; Tue, 06 Oct 2026 15:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE777-000297-13; Tue, 06 Oct 2026 15:29:57 +0000
Received: by outflank-mailman (input) for mailman id 1441606;
 Tue, 06 Oct 2026 15:29:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE775-00028v-25
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:29:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE774-00CbYT-Ey
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 17:29:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac513e2-e002-0a2a0a5209dd-0a2a450cb50e-20
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:29:54 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac513f2-f479-0a2a450c0019-d1558029dc62-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:29:54 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so34618355e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:29:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178daa062sm80543095e9.8.2026.10.06.08.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 08:29:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1791300594; x=1791905394; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPM7tKYSfVV9A3TLCFS0unR2J4EGEcNKPYw+N+p8nTU=;
        b=C+3Ry2pKbPKvgdIDVc/BZ8EqYH175MAeEhsNQ0B4xhRyHF07gXbhL4URvTpBp0B2Za
         Lo1wjMICM2YoMnf6m+TQV4gN3XzX1raeiTd6c+1Yfxaxd/faD06wjHN+NaEIdKDL64F8
         MftWxbEJdoiMXusOkmB3RH0OmMyMAToAf3mBCUDzcWW+01BbetNJg4SZvz4itc5QpF7O
         g3UJdchStvJdrkM7gFBMnTaIUzKBVwqvN7V6RUypWKeb4IJQ944yaxp+3LeNRXOi1u8e
         8GG0Hl8+IEI6yn0W/oX2svTRrRnW2iywgSAhpG9jfyRUGxzjiYlIoVFojgLld5zvBCpg
         iifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791300594; x=1791905394;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPM7tKYSfVV9A3TLCFS0unR2J4EGEcNKPYw+N+p8nTU=;
        b=v+pjphd+1PBk1qrRcKvHVXerkqDHJJQjXfEihU+FdADhHXkRLaNGTQ+CUXbYICePXu
         cdd8Q93CT4lkVJE5HG7op1WKcOGNUrHfi0TMXoFIOF4G0aWs6EUPLzPBmvHMUnCc9o3h
         sZeAyNPcLQpPnHjRro79h+hMBLjr4RAdz+805nR5yWBakJ5xVivmYLna/LE+8eNRjdC3
         FFy4Zth4cz8Ix5Q23QtgqhHph/Sm5JDG7wBmXxJrbZ4UqcZBdyJSm6oh+AALsu166Z7H
         +qebH2UbTcgRvzYB1N8LIRLwO3nA+pPZr3K7uH/WedYGzquN8w5oxDR5y+P+LamQjPnh
         dYRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUZ1O+golosXrYiHemL1iQKeBwgphDQiZ01jkVnjBKEMyniGogqTkrriUZWvfu9xYtZsU3Iy3r7wA=@lists.xenproject.org
X-Gm-Message-State: AFuF++mLQrmaEhzbFG7QT6pjhCTr+DnLbS9VHeAfi24+0oEuMyFXvOWH
	8spJrDSlwwd7s9iihX9JuCj5XNoIiiBQ3Vt8iDSVCDmT8VGYqedc12OdpZDRJPr1wA==
X-Gm-Gg: AYBFou3XM2FtIOn4bpMpzy+GOXKPvRG53Gt6GwQojhLu8C+3DEcrht7Mze4zFPA7lSG
	chUzsDpbmp3Rt1Z4sNAT9N0/D8NrG4p5WE1mZna6qdXNDN8vejyxi7JvB+/5Q9LccXmWnLDLzFP
	sFIhHnHV64nFNBJhbQLWbTT4Akg8I8ajYnKKzSQf/VKQgmK+XVc26Mc/0TH+3s42rZ5Yo+ycchL
	wBximGPveXBkMbvD31CSk1vk18190o4yP0ci8BJvdQHVUR6URA55uKnB8Z97q/iq668/uJo9Wju
	2Zkc6L8jHiqv8TsGSUUd41vNEvdkGqpFMJ6E785q9U0U6Vupp5sTEZlxwIri9gkFEKA8qQEGEHA
	xZGHraMPokCgsOFPRSvMgLKIRXBG5qe/5+Je5aFtVsJJ0NLG2t2O39f/8DDX1ZnD7u1FYXdgbRI
	wm0SX/NnDnqQ3lOV2naMxOQaztfnWVv2W9Ajg22BXo0VF11UAk1f1YDk287W4G/4Ipfv4CQ880J
	BdWEhq0zVKrP6VB/kQhRIHMK4lkP1nMpjH+wif7zFB/SSP+B98PEEYHb4Sdm6wsltE0TOj0Fw==
X-Received: by 2002:a05:600d:82e7:b0:4a1:7baa:7303 with SMTP id 5b1f17b1804b1-4a17baa75dfmr31284515e9.7.1791300593802;
        Tue, 06 Oct 2026 08:29:53 -0700 (PDT)
Message-ID: <17bc987f-6624-4580-a8ee-ee593092e051@suse.com>
Date: Tue, 6 Oct 2026 17:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <5d6d418ef2c89c706e220d38f230a351d4266d66.1790779581.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <5d6d418ef2c89c706e220d38f230a351d4266d66.1790779581.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1791300594-016C6A5B-E9663F09/10/78276251493
X-purgate-type: spam
X-purgate-size: 6815

On 30.09.2026 17:50, Abdelkareem Abdelsaamad wrote:
> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
> debugging complications, security and performance implications. The APM
> volume #2, Section 15.20, Event Injection, states the two possibilities that
> VMRUN will immediately exit with VMEXIT_INVALID due to the injected event.
> These are
> • Reserved values of TYPE have been specified.
> • TYPE = 3 (exception) has been specified with a vector that does not
>   correspond to an exception (this includes vector 2, which is an NMI, not
>   an exception).
> 
> Furthermore, reading through the APM shows that the exception vector validity
> can also depend on the guest mode, the CPU generation and the
> microarchitectural constraints. Some vectors are only valid starting with the
> specific CPU generation that introduced the corresponding feature, the guest
> mode or whether the guest opted-in for specific CPU capability. The Upstream
> KVM introduced a similar consistency check that reflects on this dependency
> with the commit
> 7e79f71bca5c ("KVM: nSVM: Add missing consistency check for EVENTINJ").
> However, the KVM implementation did allow the Overflow (X86_EXC_OF) and the
> BOUND Range (X86_EXC_BR) vectors injection in 64-bit mode. According to the APM
> Volume #2, Section 15.20, Event Injection and Volume #3, Chapter 3,
> General-Purpose Instruction Reference (INTO Interrupt to Overflow Vector),
> injecting these exceptions while the guest is in 64-bit mode is invalid and
> triggers an immediate VMEXIT_INVALID. This architectural mismatch in the KVM
> implementation was reported here:
> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
> 
> To verify the hardware behaviour with the various vectors, A case-by-case
> testing on 64-bit mode Windows guest is performed. The hardware exception event
> is manually injected at the end of svm_vmexit_handler and the consequence
> is observed:
>  - If VMEXIT_INVALID is triggered, the injection is invalid.
>  - If a guest triple fault is triggered, the event passed the hardware checks
>    and completed the event delivery. It is valid.
> 
> Extend the VMCB validation to check for the VMCB event injection inconsistency.
> 
> While at it, extend the svm_vmcb_isvalid usage to the non-nested VMEXIT_INVALID
> debugging.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> ---
> Changes in v6:
> - Replace APM revision numbers with section titles in the commit message and
>   in the comments.
> - Review and Correct the testing matrix
>   - Correct the swapped Naples/Genoa entries in the testing matrix.
>   - Add the missing X86_EXC_MC, X86_EXC_XM along with the other missing
>     vectors.
> - Combine #BR and #OF exception vectors handling.
> - Change the vmcb_valid_event_inj_types_mask type to unsigned int.
> - Drop the logging of the exception type from the invalid vector error log.
> - Drop the clean up of the svm_vmcb_isvalid function.

Code changes themselves look good now, yet of course only as far as we
have reached agreement. The remaining open issues (#XM, #MC) are
attempted to be covered by the testing matrix, yet I remain unconvinced.
I'd therefore make ack-ing this change dependent on buy-in by other
x86 maintainers.

> ---
> Testing:
>  - Using a locally developed XTF nested virt setup, I manually tested VMRUN
>    instruction handling with a malformed VMCB:
>    1) Inject event with the type (7).
>       The hypervisor logs show the message
>       (XEN) [  645.155609] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
>             Injected Event Type: 0x7.
>    2) Inject event with the exception value (3) and the vector value (2) for
>       NMI. The hypervisor logs show the message
>       (XEN) [  645.157277] d2v0[nsvm_vmcb_prepare4vmrun]: eventinj: Invalid
>             exception vector: 0x2.
>    3) To perform more detailed bare-metal testing, I set up a testing matrix
>       using a XenServer Windows 10 64-bit VM and manually injected the
>       various events according to the testing matrix below:
>  ----------------------------------------------------------------------------
> | Ex. Vector |    AMD Naples    |     AMD Genoa    |    Testing Conditions   |
> |------------|------------------|------------------|-------------------------|
> | X86_EXC_OF | VMEXIT_INVALID   |  VMEXIT_INVALID  | - Verified that 64bit   |
> | X86_EXC_BR |                  |                  | mode is active before   |
> |            |                  |                  | injecting the event.    |
> |------------|------------------|------------------|-------------------------|
> |            |                  |                  | - Verified that the     |
> |            |                  |                  | Genoa host does not have|
> | X86_EXC_CP | VMEXIT_INVALID   |Guest Triple fault| guest_cr[4] X86_CR4_CET |
> |            |                  |                  | set and the VMCB does   |
> |            |                  |                  | not have CR4 X86_CR4_CET|
> |            |                  |                  | set                     |
> |------------|------------------|------------------|-------------------------|
> |            |                  |                  | - APM states only valid |
> | X86_EXC_HV | VMEXIT_INVALID   |  VMEXIT_INVALID  | to inject into VMSAs    |
> |            |                  |                  | that execute with       |
> |            |                  |                  | Restricted Injection.   |
> |------------|------------------|------------------|-------------------------|
> | X86_EXC_DE |                  |                  | - Verified that hosts   |
> | X86_EXC_DB |                  |                  | do not have guest_cr[4] |
> | X86_EXC_UD |                  |                  | X86_CR4_OSXMMEXCPT set  |
> | X86_EXC_NM |                  |                  | and the VMCB does not   |
> | X86_EXC_DF |                  |                  | have CR4                |
> | X86_EXC_TS |                  |                  | X86_CR4_OSXMMEXCPT set  |
> | X86_EXC_NP |Guest Triple fault|Guest Triple fault| with the vector         |
> | X86_EXC_SS |                  |                  | X86_EXC_XM.             |
> | X86_EXC_GP |                  |                  | with the vector         |
> | X86_EXC_PF |                  |                  | X86_EXC_MC.             |

This continues to be odd: I can't help the impression that the start of the
last sentence was lost. With #XM and #MC being somewhat special anyway, I
wonder whether they wouldn't have deserved their own separate cells.

Jan

