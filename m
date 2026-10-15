Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F26CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:48:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450155.1665669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHI4I-0003fg-6c; Thu, 15 Oct 2026 09:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450155.1665669; Thu, 15 Oct 2026 09:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHI4I-0003fZ-2w; Thu, 15 Oct 2026 09:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1450155;
 Thu, 15 Oct 2026 09:48:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHI4H-0003fR-2g
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHI4G-0022FU-FX
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:48:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0a145-2eae-0a2a0a5409dd-0a2a450aa79a-34
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:48:08 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad0a158-f2d2-0a2a450a0019-d155dd35b492-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:48:08 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48af27fe287so172543f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 02:48:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac52d3sm17480853f8f.43.2026.10.15.02.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 02:48:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1792057688; x=1792662488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7y/7UezrENK+mL3tcIPSUv8DLzW7wwpglchcvQSHjRM=;
        b=c4kBkLg4XiExkQMW1sUF6Gz7CDyE26AugK3edaaOr/aLfgXVj+D7gxS2CD1uYvauNC
         Aj8KqcuSg4nLOlGMWc08ZHaX6sa0z9s4QJxEVFBTflvOsmsZI9SPpOi44F2Yc73iWD2P
         srqIhXc+HDZd757pFYHmNTQr0gU5x+9PKu8GGthSIPvXhZXLxfhCIJJ/H2sxpNXv/SIL
         NeDB17xCsH5+wha++d+k8Nll9mJoGdzgquNJUpYipyovqQnKx6Pl/tdkVjBQFndGIrwn
         VnLtUuhPN0O9AI5TXSYFiHxX+Lr+u697EH2VB8riwTDgkTaizJxnhHvcaXNg2tsVtQww
         Pc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057688; x=1792662488;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7y/7UezrENK+mL3tcIPSUv8DLzW7wwpglchcvQSHjRM=;
        b=cA7/mSJbQVDIBfw09Hh8dzFF6/3jfkMBXNUjnvlPN7eAo9Wf1OjrQb9Po8y02FV4W6
         sy8KxpYKG7t2GX8FhJ9yrGge72HkVhboplZwzFsQZo/fMp7UQLHDvUL53/s/DITyjL6q
         eqH/Ji4AkKxBkk8sxx2yCdGF8I2S561RC5crANTVCOxdM50W1moJiVRecjUXCpftgHYu
         Sj+NHQlGhDLYpKZPkzVKG7WMFAT54ggc1vjo6RKxfNEY0K6u8Q85DEIbCDIE13omRH46
         qdy8IM2zOqPhxX3eWWX5caYrBIF6uX29xodLsB8xo68Qrq3CVbiuKqPpBOh53rZRpWGH
         FpHA==
X-Forwarded-Encrypted: i=1; AKwUvBw3upERch9JXAjCQYRQUOI8aMfM5eiZBenzmD2cZBFt4KCm8MDTY/Njrfo4LZY/A1rdme09XDustT8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKypw3eBeKZa96s0+K4cR2EBC9EYuTuIPEYooRajWqPxwWpnxX5
	U7/DulkqG9QCWJ+6rD5JeS6kS7DNOZFwbL+aCuWJQEoxZzNfiJ4DegaeXi34kEb4jA==
X-Gm-Gg: AYBFou0iVh94b7F04OJblYXGFpFzO6KVBIq3NKi8kuU48IlEBH6tgbWE6L1EEpsN71/
	4r8q7CMo/Eic9nWsMGOrgCanlBZM7SsEZaNBInOHJzAcxLhuBMDyV81A43pud4KjitWYB2C4uCI
	pL+7AVR5BvQ+KnaFt6FdI+wSSlTFPM7cWArLCNzWPN+R0oVI/PCd3amhpLudCPJH1FkkaBoUPeI
	y9qb0fm+fPEMSrbL/zIBDFMzbuvBfIYNRQoq0NsRTZIk21AtXpHrie4rcFVgJVxLW47rIJ1vYg7
	mAm8B6xVDcY5A+Sjv3RmbZbAwFnYf7BPe+nM/SFUa6+1mvI2F2ZLR6ZTBb4thtq8E1Q3kYDss5y
	JTDE1TKmiazUWAN7rnYLLGBj/4S306z+wXkDqNqA1cjdZuZiv8bpJ15sbNz6cQQ6Xsjkh1yceXw
	EdKyolMiygblO3gIi8d4YNaiMV1jzLR8muza2OpjIRsG2suGl3+pCkVz6Si2VrCO3UPY5/+7Q8O
	Bf3rKDNykvwk+/WfSzC5Bw57EVkT4GfbmAByA21KbPXGlYGpY0lxzGmZohkqIM=
X-Received: by 2002:a05:6000:4816:b0:48a:f3c6:7bfa with SMTP id ffacd0b85a97d-48dbace50d8mr37190252f8f.52.1792057687671;
        Thu, 15 Oct 2026 02:48:07 -0700 (PDT)
Message-ID: <ca3f136a-d444-4fe5-a895-c8c9d501dfab@suse.com>
Date: Thu, 15 Oct 2026 11:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/nestedsvm: write back V_NMI and V_NMI_MASK on
 nested #VMEXIT
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261015074512.221777-1-chunjie.zhu@citrix.com>
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
In-Reply-To: <20261015074512.221777-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1792057688-50ECACFC-EF120E3F/10/78276251493
X-purgate-type: spam
X-purgate-size: 1504

On 15.10.2026 09:45, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> With V_NMI_ENABLE set, the processor clears V_NMI and sets V_NMI_MASK when
> it takes the virtual NMI, and writes both back to the VMCB on #VMEXIT
> (APM vol.2 15.21.10).
> 
> nsvm_vmcb_prepare4vmexit() only propagated V_TPR, V_IRQ and (conditionally)
> V_GIF from the L2 shadow VMCB into vmcb12. V_NMI and V_NMI_MASK were never
> copied back, so L1 kept seeing whatever it had last written, regardless of
> what happened in L2.
> 
> Copy both back when L1 has enabled vNMI for its guest.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1027,12 +1027,18 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>      /*
>       * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
>       * 15.6); the remaining fields do not change.  Copy vGIF back only if
> -     * enabled in L1.
> +     * enabled in L1.  With vNMI enabled, #VMEXIT also writes back V_NMI and
> +     * V_NMI_MASK (APM vol.2 15.21.10).

... the section title used here. As said recently in other contexts, if you
also want to name the section number, then that wants accompanying by the
doc revision (to disambiguate). Same for the patch description, obviously,
but in code comments that's yet more important.

Jan

