Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D3CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 10:29:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437008.1655692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrYV-0004i4-Hz; Wed, 30 Sep 2026 10:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437008.1655692; Wed, 30 Sep 2026 10:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBrYV-0004hx-Em; Wed, 30 Sep 2026 10:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1437008;
 Wed, 30 Sep 2026 10:28:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBrYU-0004hr-63
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 10:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBrYT-00DvAY-5k
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:28:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abce44f-2eae-0a2a0a5409dd-0a2a450b8774-38
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:28:53 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abce464-b7e8-0a2a450b0019-4a7de163b0e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 12:28:52 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-4888129c46eso2971205f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 03:28:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0175161c2sm51315315e9.4.2026.09.30.03.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 03:28:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1790764132; x=1791368932; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=weKyVNCszXYs+nh2ra6yCBCCMBBa0lVO5gGW+c3b27o=;
        b=HDmgEYgDdrQU7fkVhTu6V7TNkoMT/Q0BkdSc86xmsbrDNdxaSAmimOsL8az27/QUUn
         afYaXu4ronCCbWZ7VnAvi7ZYDPv2Pco37ww9bodIPdkwKyNPMyaVm5MVeYyCXrpij36K
         uvQ9kYmR0jh8T1ZhcKxUUghDKSKMxCl4pb9SRNY6MYQvanu+7boeQD0KyyKm2Um0cEGY
         f+rJdTSEGXEpLfbxQgftfGPsFVsMYaNrnHp87h4liXZAT5KMQBtmECkEMVvPGB09M4cc
         ABh7rSetNNHMXUSIIlCmZnaOfhAU/I4p9EhqhFzikQiGDqUotH5hPFod0B7v844vznya
         zppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764132; x=1791368932;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=weKyVNCszXYs+nh2ra6yCBCCMBBa0lVO5gGW+c3b27o=;
        b=ichFtv395ad4yXnSo+wsiMix1UMqN6vjDqsf7MRyBWJAucSMl1G84i5QauCbfdAkoX
         YvSqRXRqbPX/2A1lD7ucBjTd5JxoZRDak4BVz93EV/XMYRFSN5WX0L4QZdIZ4FFbuxfk
         2Qsl7SqmfaX9IDPxUSgz8I+6QT9oaYhCzAH8YNELWO+9A4JxL7wO2D9EhPP06U90WM5L
         D3ZAzorAkVTQzuBPqUDp7sXFDhp/rBert7yMOmvcim050NgectM3OaHaXLtEseB7wflR
         m9ZsXZJOwpaNX+3Yzj067mJ3EQOLwRDSACdpP7IPDuCh/BkL1/MAAPFt7UrG05teGgU4
         Sy2g==
X-Forwarded-Encrypted: i=1; AKwUvByibw/L5sr+K0qimPXKZ92tkXi+EbPUyJPesYwZuhPlcmOzzZVlY1VTLPmbP2DI+8xaYPhuJtIWMfA=@lists.xenproject.org
X-Gm-Message-State: AFuF++lH9/N8o+En/CJ61FLpWBaVIbmHSmtjR64pfRVZfa3EMX95kF4i
	jd1gMJCCOEPB9O5qn218ldeBr2uRt28aPO738iU3g3k4460OAGcUS97cvV6gLhBIxQ==
X-Gm-Gg: AYBFou0SOkC9u/NkBpbhOCzwDjESE8Um2HeyusRruwsWPmlqOJ68j5giEsooaSvgePl
	7wH7N5tyZbysrwE1RAgyApT56xqgEZUT9VmYAi64ZBoo1HRYJ0lv3EtM8oHFO4mpETN0YCixZM3
	od2yVQRMGFscqccrTOOXesb0JtKVqR1noeeXBruJtb/GH0+Yn2W2KyYFrGojM13/uvqJxN1C7zE
	gbgNg36STpyebpxZV1jUhHn9rZl/Z6AK6j14eBIhS41U1MF2u/TXkmpLsFPyRYoNrUeGPSyCVMq
	DZSJ9OStJtC2Bqve6n714YdkDT25/Eqx+Dl0wSDOffpVoeXCZlPIPgrt9UbMtjkjNo0kqqGSZv9
	YuAc/lO0GSEZyYnPIosCzaVPfRBSRfWmGxifX7MbXK1bXPyIX+LOLK6Qzom0Owh8btp0rXOF+7W
	AkgfadkdUVUkcD2DTe5bK0bu6IrWYQ1I/FH4jfdI2B3osx/b9+NrU8A5mNpHZjDZQt7F7wGq3/q
	y/2NcQTFvVsly3ryhyokCPJRxNSz6ts3WWGxHUnkQ1X7druT6lNF98JBI8oRuo=
X-Received: by 2002:a05:600c:6815:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a01b004e5bmr16401235e9.12.1790764132232;
        Wed, 30 Sep 2026 03:28:52 -0700 (PDT)
Message-ID: <a472b7db-5f87-4945-b354-dbeacce00155@suse.com>
Date: Wed, 30 Sep 2026 12:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <216f0de990dd180c8336837e86bf5860e37b9c50.1790326132.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <216f0de990dd180c8336837e86bf5860e37b9c50.1790326132.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790764132-AACDF9EA-AD140FE6/10/78276251493
X-purgate-type: spam
X-purgate-size: 13954

On 25.09.2026 11:38, Abdelkareem Abdelsaamad wrote:
> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
> debugging complications, security and performance implications. The APM
> volume #2 15.20 (40332—Rev. 4.10—July 2026) states the two possibilities that

Here and elsewhere: While doc rev plus section number are sufficient to
identify the section that is meant, that's still not very practical if
the reader only has some other revision to hand. Far in the past we did
establish that the main thing to mention is the section title. Those
tend to change very infrequently, if at all.

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
> Volume #2 and Volume #3 (40332—Rev. 4.10—July 2026), injecting these exceptions
> while the guest is in 64-bit mode is invalid and triggers an immediate
> VMEXIT_INVALID. This architectural mismatch in the KVM implementation was
> reported here:
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
> debugging. Clean up svm_vmcb_isvalid by dropping the unused `verbose` parameter
> and by correcting the misleading boolean return value to properly reflect the
> validation status.

The dropping of that parameter wants splitting out. That's likely
uncontroversial. The new use of the function also would better be split
out (without folding with the parameter removal). And the polarity
inversion of the function's return value wants to be a separate patch,
too (arguably making the dropping of the parameter a secondary change
there might be okay).

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
>             exception type: 0x3 vector: 0x2.
>    3) Inject event with the exception value (3) and the vector value (21) for
>       the X86_EXC_CP (Control-Flow Protection).
>       Without the changes included:
>           On the Naples host, where the vector was not yet known to the
>           hardware. VMRUN immediately triggers VMEXIT_INVALID.
>    4) To perform more detailed bare-metal testing, I set up a testing matrix
>       using a XenServer Windows 10 64-bit VM and manually injected the
>       various events according to the testing matrix below:
> -----------------------------------------------------------------------------------
> |Exception Vector|     AMD Naples    |     AMD Genoa    |    Testing Conditions    |
> |----------------|-------------------|------------------|--------------------------|
> |  - X86_EXC_OF  |  VMEXIT_INVALID   |  VMEXIT_INVALID  | - Verified that 64bit    |
> |  - X86_EXC_BR  |                   |                  | mode is active before    |
> |                |                   |                  | injecting the event.     |
> |----------------|-------------------|------------------|--------------------------|
> |                |                   |                  | - Verified that the      |
> |                |                   |                  | Genoa host does not have |
> |  - X86_EXC_CP  | Guest Triple fault|  VMEXIT_INVALID  | guest_cr[4] X86_CR4_CET  |
> |                |                   |                  | set and the VMCB does not|
> |                |                   |                  | have CR4 X86_CR4_CET set |
> |----------------|-------------------|------------------|--------------------------|
> |                |                   |                  | - APM states only valid  |
> | - X86_EXC_HV   |  VMEXIT_INVALID   |  VMEXIT_INVALID  | to inject into VMSAs that|
> |                |                   |                  | execute with Restricted  |
> |                |                   |                  | Injection.               |
> |----------------|-------------------|------------------|--------------------------|
> | - X86_EXC_DE   |                   |                  | - Verified that hosts    |
> | - X86_EXC_DB   |                   |                  | do not have guest_cr[4]  |
> | - X86_EXC_UD   |                   |                  | X86_CR4_OSXMMEXCPT set   |
> | - X86_EXC_BP   |                   |                  | and the VMCB does not    |
> | - X86_EXC_NM   |                   |                  | have CR4                 |
> | - X86_EXC_DF   |                   |                  | X86_CR4_OSXMMEXCPT set   |
> | - X86_EXC_TS   | Guest Triple fault|Guest Triple fault| with the vector          |
> | - X86_EXC_NP   |                   |                  | X86_EXC_XM.              |
> | - X86_EXC_SX   |                   |                  | with the vector          |
> |                |                   |                  | X86_EXC_MC.              |
> |----------------|-------------------|------------------|--------------------------|
> | - X86_EXC_CSO  |                   |                  |                          |
> | - X86_EXC_SPV  |                   |                  |                          |
> | - X86_EXC_VE   |  VMEXIT_INVALID   |  VMEXIT_INVALID  |                          |
> | - X86_EXC_VC   |                   |                  |                          |
>  ----------------------------------------------------------------------------------

Hmm, #XM and #MC don't appear in the leftmost column. They're mentioned in the
rightmost one, albeit there looks to be some corruption there.

Also, nit: The leading dashes in the leftmost column don't add any value, and
may hence better be omitted. Uniform leading padding there would further avoid
the (visual) impression that there's something wrong with the contents.

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -327,20 +327,91 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>      svm_dump_sel("  TR", &vmcb->tr);
>  }
>  
> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
> +    uint8_t vmcb_injected_vector, const struct vcpu *v)

If you indent the 2nd line like this, the first argument wants to also move
off of the 1st line:

static bool is_valid_injected_exception_vector(
    const struct vmcb_struct *vmcb,
    uint8_t vmcb_injected_vector,
    const struct vcpu *v)

Additionally, as shown, it is then also better to have one line per parameter
(albeit we may not be consistent there).

Alternatively:

static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
                                               uint8_t vmcb_injected_vector,
                                               const struct vcpu *v)

> +{
> +    switch ( vmcb_injected_vector )
> +    {
> +    case X86_EXC_DE:
> +    case X86_EXC_DB:
> +    case X86_EXC_UD:
> +    case X86_EXC_NM:
> +    case X86_EXC_DF:
> +    case X86_EXC_TS:
> +    case X86_EXC_NP:
> +    case X86_EXC_SS:
> +    case X86_EXC_GP:
> +    case X86_EXC_PF:
> +    case X86_EXC_MF:
> +    case X86_EXC_AC:
> +    case X86_EXC_MC:
> +    case X86_EXC_XM:
> +    case X86_EXC_SX:
> +        return true;
> +
> +    /*
> +     * Exception vectors 3 and 4 may not be injected into SEV-ES guests.
> +     * If this is attempted, the VMRUN will fail with a VMEXIT_INVALID
> +     * error code.
> +     * See the APM Volume #2 15.35.8 (40332—Rev. 4.10—July 2026).
> +     */
> +    case X86_EXC_BP:
> +        return !vmcb_get_sev_es(vmcb);
> +
> +    /*
> +     * If the VMM attempts to inject an event that is impossible for the
> +     * guest mode (e.g., a #BR exception when the guest is in 64-bit mode),
> +     * the event injection will fail... VMRUN will immediately exit with
> +     * VMEXIT_INVALID.
> +     * See the APM Volume #2 15.20 (40332—Rev. 4.10—July 2026).
> +     */
> +    case X86_EXC_OF:
> +        return ( (!(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l) &&
> +                 !vmcb_get_sev_es(vmcb) );

Nit: Blanks immediately inside parentheses are to be used only in for(),
if(), etc.

> +    case X86_EXC_BR:
> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;

I'd like to suggest to combine #OF and #BR handling (to also better fit
commentary), e.g.:

    case X86_EXC_OF:
        if ( vmcb_get_sev_es(vmcb) )
            return false;
        fallthrough;
    case X86_EXC_BR:
        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;

> +    case X86_EXC_CP:
> +    {
> +        unsigned long guest_valid_cr4 = hvm_cr4_guest_valid_bits(v->domain);
> +        return guest_valid_cr4 & X86_CR4_CET;
> +    }

I continue to disagree. While this tries to match what the table says, it
still isn't correct to key this to the bits a guest _might_ set. Imo AMD
have screwed up there, and #CP shouldn't have been valid to inject on
pre-CET hardware. For our purposes, consider a guest migrating from a
Naples host to a Genoa one: It'll suddenly observe different behavior (if
#CP injection was attempted in the first place).

This will then also fit the returning of "false" in the default case.
Prior to the introduction of #CP and CR4.CET the handling of vector 0x15
would also have ended up there, after all. Such a hypothetical "old" Xen
would have behaved uniformly on CET-incapable and CET-capable hardware.
(The same obviously is true for any new exception types we may get to see
down the road.)

Also, nit: Blank line please between declaration(s) and statement(s).

> +    /*
> +     * X86_EXC_HV vector is reserved for SNP guests use. Only allowed to be
> +     * injected into VMSAs that execute with Restricted Injection.
> +     * See the APM Volume #2 15.36 (40332—Rev. 4.10—July 2026).
> +     */
> +    case X86_EXC_HV:
> +    default:
> +        return false;
> +    }
> +}
> +
>  bool svm_vmcb_isvalid(
> -    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v,
> -    bool verbose)
> +    const char *from, const struct vmcb_struct *vmcb, const struct vcpu *v)
>  {
> -    bool ret = false; /* ok */
> +    bool ret = true; /* ok */
>      unsigned long cr0 = vmcb_get_cr0(vmcb);
>      unsigned long cr3 = vmcb_get_cr3(vmcb);
>      unsigned long cr4 = vmcb_get_cr4(vmcb);
>      unsigned long valid;
>      uint64_t efer = vmcb_get_efer(vmcb);
> +    unsigned int vmcb_injected_type = vmcb->event_inj.type;
> +    unsigned int vmcb_injected_vector = vmcb->event_inj.vector;
> +    /*
> +     * Represent the nonreserved and accoridngly valid guest exception or
> +     * interrupt type.
> +     * See the APM Volume #2 15.20 (40332—Rev. 4.10—July 2026).
> +     */
> +    unsigned long vmcb_valid_event_inj_types_mask = (1 << X86_ET_INTR) |
> +                                                    (1 << X86_ET_NMI) |
> +                                                    (1 << X86_ET_HW_EXC) |
> +                                                    (1 << X86_ET_SW_INT);

Why unsigned long when unsigned int would do? There's also no need for ...

> @@ -399,6 +470,15 @@ bool svm_vmcb_isvalid(
>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>                 vmcb->event_inj.raw);
>  
> +    if ( !((1ul << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )

... a ul suffix here (which btw would want to be UL for Misra's sake, if a
prefix was necessary in the first place).

> +        PRINTF("eventinj: Invalid Injected Event Type: %#x\n",
> +               vmcb_injected_type);
> +
> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
> +         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector, v) )
> +        PRINTF("eventinj: Invalid exception type: %#x vector: %#x\n",
> +               vmcb_injected_type, vmcb_injected_vector);
Logging vmcb_injected_type here isn't very useful: It's known to be
X86_ET_HW_EXC.

Jan

