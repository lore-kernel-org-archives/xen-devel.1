Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8BBC61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 13:34:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399937.1635913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzDlx-0004Cz-40; Wed, 26 Aug 2026 13:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399937.1635913; Wed, 26 Aug 2026 13:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzDlx-0004Cs-1E; Wed, 26 Aug 2026 13:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1399937;
 Wed, 26 Aug 2026 13:34:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzDlv-0004Cm-TI
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 13:34:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzDlu-008Z0w-Gy
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 15:34:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8eeb64-2eae-0a2a0a5409dd-0a2a4507bf40-6
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 15:34:30 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8eeb65-b4ea-0a2a45070019-d155a72ae992-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 15:34:30 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5b4740ec30cso810254e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 06:34:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a5d62f7sm508146766b.2.2026.08.26.06.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 06:33:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1787751269; x=1788356069; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVsUp2iFe/J1GYqAnbcpzPHu4UL6ElgwxmStYaLSmkc=;
        b=PThtRjcnQL/k+meaR6O59cbXOSWmQdSwhbRWZVVDyvglHl7kYCkGORDoXSEJ/QeaSB
         Btkztqy9R093DpQMSRBQ/zKhPghiPlvLf+OQBL+YgnDAtsaSwZR1wyA34/XLm47D9IqV
         Q/jkAxn/ZnE4FdBnE2yCJ7P9GnnW9zqRMKI8t5i9JDRmC4gq/ehcSzcc2cWne4J5TWMN
         UoxMMJ6KtmxUDM5Pp1nU2w5i9KxKGE2tWdnXoBTdYB4eEKsDoN5Z8znzv3w1rcQ90Cx6
         ilzPwAks7gWXYCEd7p1eFrnBPczw32PKW5sGC1efXU0zNIRv2VUWjZlzENT4Nos8S2Ff
         h6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751269; x=1788356069;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVsUp2iFe/J1GYqAnbcpzPHu4UL6ElgwxmStYaLSmkc=;
        b=drsVD7ZIoFVFsy2gk1ceBv8gs6ImnqsnLzi0Ku6tMPz1sbAJB4WjSz3Dbdam+bF38d
         SposA38n9Rau5NtoMgwCQA7odx/C/5veYRYSG2wMhfJ44YaWQr2GF4rBrbNA4SSinuIi
         zIPYFKji868gw6GWu14Yb/5akCzrCBuvOvkHBnCCpySxP9lueBk+okOxAC6eO18dWmb0
         Ih35giVQKONPFpKZqmXwXTWwETc4/3VypkHUtng0XaFHavr/6c037uUID7kLlrikWCvs
         Lm5SAZnXZwoM4KfucigVRvPGYr4snWJK+h9TKBrn9kqSurPNgDunxi3vsTVFJCOGqKUR
         XPpA==
X-Forwarded-Encrypted: i=1; AHgh+RqaqnLN1u9jaBkhUxe+yRn8XR0dCnsQVJPT67Dcl3PXah66i4lwoCKDFHlU7dBwehK6n/Mfxc8C6BQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++nxn+v8S8yXjEJOwJ4H5TPUAsBux0MrIvwQ8lKGBfhWRl/fko5C
	i68usPQYzQF8ByGomS7kNgp6h7UDJk4WdYXgbRkyKEp/VvuZ7bmp5xNflOJXykhymZ6p8PHvU79
	5v+IouQ==
X-Gm-Gg: AR+sD13wmBlt+mL/3OZgWLcczP7/3YTuNa1Bv6p+UwNnS2GF7d6zukq215mk8+PpB/g
	KhAKSppi00vElqyEtlbNtFKhkACJhtUdWDhxMFRGBeC8X07HnMhAbcqtSo3Nv1fG2UloE+xc/bB
	wu+jhwKaOhL2My63J5FMcM3OPKzL8TDf+VKft+qmiab7hHA38kUF6YHNazDgTgclrBwxJxWpeXi
	Y13BkNfaT75pZM/zqRPXma9Ywiz8LRZzsgSde13nM/k9thGq1DB8aEBSRVK0SpkwESrAx+4G9h+
	6Iz9psh7bKSoWd5fOX6nMU2iWSOB6Nl1FhBN0Y2uXV0g6piMw1iqv2T8PBPHsVGmpcT+FBfvEHE
	YCUXMKqgu9ERw5m/RoJfGDq98Rb27FPCd67FAjJNHuXTUUXxqWmmO1wU6dTir/77nDr6hVLI94N
	zc0rhjTAbXn0D89AAmic8OFlboRGGyGN++hRe1ByEb9ILHVmm0DihaDgvTn+1SYaNHAqA7HGTJr
	rDdQJkbpBHltuxp9bZ3nkZCsiukEOyX2s1PitfbBmxmTex4Ku2J
X-Received: by 2002:a17:907:9349:b0:c19:fb6e:5fec with SMTP id a640c23a62f3a-c250c392a2bmr784069566b.18.1787751234685;
        Wed, 26 Aug 2026 06:33:54 -0700 (PDT)
Message-ID: <d9512f79-a05c-447b-98c5-7dfb14ef5347@suse.com>
Date: Wed, 26 Aug 2026 15:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <88078b2a2eb1f741a39562fc493330e6ee26c61c.1787497752.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <88078b2a2eb1f741a39562fc493330e6ee26c61c.1787497752.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1787751270-35CC7AE4-F941E97C/0/0
X-purgate-type: clean
X-purgate-size: 6241

On 23.08.2026 18:11, Abdelkareem Abdelsaamad wrote:
> On the AMD platforms, allowing a VMRUN instruction with a malformed VMCB has
> debugging complications, security and performance implications. The APM
> volume #2 15.20 (40332-Rev. 4.10-July 2026) states the two possibilities that
> result in a VMRUN exit with VMEXIT_INVALID due to the injected event. These are
> • Reserved values of TYPE have been specified.
> • TYPE = 3 (exception) has been specified with a vector that does not
>   correspond to an exception (this includes vector 2, which is an NMI, not
>   an exception).
> 
> Extend the VMCB validation to check for such inconsistency.
> 
> The collection of the invalid exception vectors are ported from the upstream
> KVM commit
> ("7e79f71bca5c" KVM: nSVM: Add missing consistency check for EVENTINJ). Adjust
> the checks from the commit to align with the APM Volume #2 and Volume #3
> (40332—Rev. 4.10—July 2026) for the X86_EXC_OF and X86_EXC_BR vectors which
> should not be valid on the x86 64-bit (long mode) platforms. The adjustment is
> posted to the KVM mailing commit patch thread
> https://lore.kernel.org/all/20260803225402.2324595-1-abdelkareem.abdelsaamad@citrix.com/
> 
> Injecting the vector X86_EXC_HV is also found to trigger VMEXIT_INVALID with
> the Xen hypervisor. Drop the X86_EXC_HV vector from the permitted vectors.

Is this matched by anything in the PM? There is "#HV is only allowed to be
injected into VMSAs that execute with Restricted Injection." Which suggests
#HV can be injected, but only under a certain condition. Following what
Teddy said towards v3, this may want expressing by a separate case block
also returning false, but having a comment.

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -320,6 +320,44 @@ void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb)
>      svm_dump_sel("  TR", &vmcb->tr);
>  }
>  
> +static bool is_valid_injected_exception_vector(const struct vmcb_struct *vmcb,
> +    uint8_t vmcb_injected_vector)
> +{
> +    switch ( vmcb_injected_vector )
> +    {
> +    case X86_EXC_DE:
> +    case X86_EXC_DB:
> +    case X86_EXC_BP:
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

Is #MC valid to inject without CR4.MCE set?

> +    case X86_EXC_XM:

As before: Doesn't #XM (AMD: #XF) require CR4.OSXMMEXCPT to be set?

> +    case X86_EXC_SX:

Again as before: Is #SX really permitted without any constraints? You did
reply to both comments on v3, but that outcome isn't reflected here. The
more that what you said there could equally apply ...

> +        return true;
> +
> +    case X86_EXC_OF:
> +    case X86_EXC_BR:
> +        return !(vmcb_get_efer(vmcb) & EFER_LMA) || !vmcb->cs.l;
> +
> +    case X86_EXC_VC:
> +        return vmcb_get_sev_es(vmcb);
> +
> +    case X86_EXC_CP:
> +        return vmcb_get_cr4(vmcb) & X86_CR4_CET;

... e.g. here. That is, if a CR4 (or other) check is needed here, but not
for #XM (or #SX), that's surely worth (briefly) commenting upon. The more
that, afaics, none of this is spelled out in the PM.

> @@ -330,6 +368,12 @@ bool svm_vmcb_isvalid(
>      unsigned long cr4 = vmcb_get_cr4(vmcb);
>      unsigned long valid;
>      uint64_t efer = vmcb_get_efer(vmcb);
> +    uint8_t vmcb_injected_type = vmcb->event_inj.type;
> +    uint8_t vmcb_injected_vector = vmcb->event_inj.vector;
> +    uint8_t vmcb_valid_event_inj_types_mask = (1 << X86_ET_EXT_INTR) |
> +                                              (1 << X86_ET_NMI) |
> +                                              (1 << X86_ET_HW_EXC) |
> +                                              (1 << X86_ET_SW_INT);

The absence of X86_ET{_PRIV,}_SW_EXC likely wants a brief comment, as that's
a peculiarity of SVM. Alternatively how about introducing X86_ET_SVM_ALL (or
some such) as a #define somewhere?

> @@ -392,6 +436,20 @@ bool svm_vmcb_isvalid(
>          PRINTF("eventinj: MBZ bits are set (%#"PRIx64")\n",
>                 vmcb->event_inj.raw);
>  
> +    if ( !vmcb->event_inj.v )
> +        PRINTF("eventinj: valid bit is not set (%#"PRIx64")\n",
> +               vmcb->event_inj.raw);

I understand the parentheses in the log message here. Yet ...

> +    if ( !((1 << vmcb_injected_type) & vmcb_valid_event_inj_types_mask) )

If vmcb_injected_type really could take all possible uint8_t values (see
below), this shift would be at risk of becoming UB. And uint8_t is a
stronger hint that all possible values may appear than unsigned int is.

> +        PRINTF("eventinj: Invalid Injected Event Type: (%#"PRIx8")\n",
> +               vmcb_injected_type);

... what purpose do they serve here (and below)?

As to the use of PRIx8: Imo that's unnecessary to use. We assume
sizeof(int) >= 4, and every type smaller than that will be promoted to
int. Just %#x will hence do here (and below), improving readability.
Furthermore, the use of fixed-width types here is in conflict with
./CODING_STYLE anyway. I'm willing to accept it for variables holding
vector numbers (albeit longer term they will apparently need to widen
anyway), but the other two should be unsigned int.

> +    if ( (vmcb_injected_type == X86_ET_HW_EXC) &&
> +         !is_valid_injected_exception_vector(vmcb, vmcb_injected_vector) )
> +        PRINTF("eventinj: Invalid exception type: (%#"PRIx8") vector: "
> +               "(%#"PRIx8") for the platform\n",

Does "for the platform" really add any value? With it dropped, the
whole format string could also go on a single line (which we generally
prefer).

One more check would likely be worthwhile doing: We have X86_EXC_HAVE_EC,
and vmcb->event_inj.ev could also do with checking.

Finally a more general comment: svm_vmcb_isvalid() is used solely out of
nestedsvm.c. I hence think it would better move there, and such moving
would better come ahead of adding more code (which would then also need
moving).

Jan

