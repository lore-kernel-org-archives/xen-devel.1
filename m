Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E99DCA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:57:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440743.1658184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDgNy-0006Rh-1S; Mon, 05 Oct 2026 10:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440743.1658184; Mon, 05 Oct 2026 10:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDgNx-0006Ra-VC; Mon, 05 Oct 2026 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1440743;
 Mon, 05 Oct 2026 10:57:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDgNw-0006RT-FW
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:57:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDgNv-0027G4-LO
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:57:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac3829a-bab6-0a2a0a5309dd-0a2a4504cdb8-8
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:57:31 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac3829b-b57f-0a2a45040019-d155802de509-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:57:31 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso8242085e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 03:57:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027734b49sm334709605e9.10.2026.10.05.03.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 03:57:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197851; x=1791802651; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTY8bzu+cDTyCDUClH21Sly/rB51hRSymRuDrk9f9/k=;
        b=kqXfu4bGLtwhteJVEiF8eiBjldYcouhxROQpTTK2ETLTmJWop5eivuaX2eyPvbcBIK
         6ZhG49xIy6xd9tfEvtz9CLa/Vciu9jUaKLHrceF6U9hV/W35U/z8Wi+rBFA5n9N4C1ks
         irFVhp7LIJLqiSvlPFkLlPE/cuWkPGnCC06EVsEBlHAavgA5tS5GF8T3di4aQ4ZIfWdT
         5M+0y+dVrMMhkef6THRdTvzaWGSwEruuA8lQGubOdvAVKlUMFjyVHquTwTBkJVmvpJsK
         PW1CSEz3L8tTT3sr4LBfRstfPLof2UlxA/fTE9RWG5Pk20E0ojbtdPdJn4+O7HgTKaJI
         kCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197851; x=1791802651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTY8bzu+cDTyCDUClH21Sly/rB51hRSymRuDrk9f9/k=;
        b=R8p/A70yQezumtOz985VUfMK6qn0/p/AMk1TRrpnJ6pGwhEISn4zqryTWdtl2XkQfH
         qT4pz5+tY9gnvj/JrzU2k+w872YxOlW+PktCIlrjuxGJKEuRbkfwSs4X5kSJVligez0p
         N0UYnxUfwKGpr8zY9cKzkpL8iMUan4HYlss5iOITkjQpxzBKKt/vv2O62sIt08dRKQH+
         QtdvL5LUzt19obtd9yFD3EzN/sO6OL3dPG81cwZv5Ki4+/aD21drLV4Hilywq9wYV9UF
         Le9wda6x+CgPF5aKn7AYBoMHsyjVliUYtw8LpZ58hFwRkWtBGMazmsvvPd+vEJwvDq5Y
         N4FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCWPvMoRwZqlAGpT4om8M2acmzzwYBFtSDm0GQqHYcSVsoBCJk2Nv3XLcoS2nHRoGSorsk9c/pDNI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kkjVEwM+EhIZwUsxn5PkfIKCKWxitprhQ+u4LoMQEiLp8Uu29X
	chOB7C5Ibm4BeG5cemhCMSwtLEGPgeZKZTVvvwygtvGm0htVlukv3oz6
X-Gm-Gg: AYBFou26ITjTjOUCV75lWi+srPjGqWZyi4GcUm+GD7kM4QW4RU4H1ApJJ2mjgdccDhU
	AeEYI92weCvtMCfXZns1L/Mv+KUEZE1IhDrVrCLMxHC6SyPNdANlyvOyshIpbf/Iv/nLwXvrHGH
	dSavVRRPfur/314P01AKMtguPd7+lkT62Va5oq+o/KQwjTtvDepTJ5cDq5jVRiwJeLdVIn6CRLC
	W9KQihvo5TN7LhwKs2ZJouTrBxaxh5WshEtOEytoqjlKiFQ9RkOqExike+gImtqi6IrVrNEDoVZ
	/jotbKSd9UU7FmJZR0q4btfXtQBnE8bLySgmFgYTZNCvAkvtyadoQv/EQ/yN68Fxx1YomPCk35t
	aigs7a1ikvHCelKBtrLAyhrES8eYbSVzfk+z1oAcunNF8Qa6GZryFn7My7pqUlMx2S0jBVg4xJz
	6EMuwS/fHN6s/vzR88c0b2wog3d8fw6SI6fSre/d30OtLfyqX79goZz52kkd1sHblkCJo7OzdEO
	SEMvx2L/CXxHB2CHHPcFDVL1SdNE5GdByFA8Josto+zmF71HUE=
X-Received: by 2002:a05:600c:4453:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a1680f109emr119833595e9.15.1791197850898;
        Mon, 05 Oct 2026 03:57:30 -0700 (PDT)
Message-ID: <81c01b14-e998-443a-a7ee-722acb86dce8@gmail.com>
Date: Mon, 5 Oct 2026 12:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/riscv: always preset A/D bits in G-stage PTEs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
 <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790845649.8631fc262581453bbf619ec5b2062170.1a0f6b802ba0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791197851-C3AC0B50-7E096694/10/73395122804
X-purgate-type: spam
X-purgate-size: 3711



On 10/1/26 11:07 AM, Baptiste Le Duc wrote:
> A RISC-V implementation can manage the PTE A/D bits in one of two ways:
>      1) Update the 'A' and 'D' PTE bits in hardware (ratified as Svadu).
>      2) Generate a page fault when 'A' and/or 'D' is clear, so that software
>         can set them (ratified as Svade).
> 
> p2m_set_pte_flags() presets A/D in G-stage PTEs only when the device tree
> advertises Svade. Platforms that use scheme (2) without advertising Svade,
> such as the HiFive Premier P550, then hit guest-page faults that Xen does
> not handle.
> 
> Always preset A/D in G-stage PTEs so scheme (2) never faults. This is
> harmless with (1): software just does what hardware would have done on
> first access.
> 
> Drop the now-unused svade entry from riscv_isa_ext[], and the TODO about
> handling A/D faults, since nothing uses that information yet.
> 
> Fixes: ff14053983b0 ("xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration")
> Assisted-by: Claude:claude-opus-5

Out of curiosity, what kind of assistance did Claude provide for this patch?

> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v3:
> - always preset A/D bits in G-stage mappings instead of keying off the DT:
>    it may not reflect what the hardware actually does.
> - change commit title/message.
> - drop svade as it is now-unused.
> ---
> Changes since v2:
> - change commit title.
> - preset A/D bits in p2m_set_pte_flags() if (!svadu || svade), instead of
> setting RISCV_ISA_EXT_svade in the riscv_isa bitmap for cases 1, 2 and 4.
> - riscv_resolve_ad_scheme() now only warns when both Svade and Svadu are
> present and SBI FWFT is missing; drop the dead 'svadu && svade' operand.
> - repeat XENLOG_WARNING on each line of the warning.
> - drop ASSERT(svade != svadu) from p2m_set_pte_flags().
> - only add the sbi_probe_extension() declaration to sbi.h.
> - rework the comment in p2m_set_pte_flags().
> ---
> Changes since v1:
> - change commit title
> - expose RISCV_ISA_EXT_svadu so the two extensions can be told apart.
> - move the Svade/Svadu resolution to a new riscv_resolve_ad_scheme(),
>    called once from riscv_fill_hwcap().
> - expose sbi_probe_extension() (was static) to probe for SBI FWFT.
> - stop presetting A/D bits unconditionally in p2m_set_permission(), do it
>    only when Svade is present.
> ---
>   xen/arch/riscv/cpufeature.c |  1 -
>   xen/arch/riscv/p2m.c        | 38 ++++++++------------------------------
>   2 files changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index aaf544d13f..6d3c15a37f 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -199,7 +199,6 @@ static const struct riscv_isa_ext_entry __initconstrel riscv_isa_ext[] = {
>       RISCV_ISA_EXT_ENTRY(smstateen,      ANY),
>       RISCV_ISA_EXT_ENTRY(ssaia,          ANY),
>       RISCV_ISA_EXT_ENTRY(sstc,           NONE),
> -    RISCV_ISA_EXT_ENTRY(svade,          NONE),

I’m not sure we should drop this from riscv_isa_ext[]. I agree that we 
currently don’t have any users in the code that check whether Svade is 
supported, but such users may appear in the future.

Since this line already existed before this patch, keeping it would also 
make the changes in this patch smaller. I also don’t see much harm in 
having the Svade extension listed in this array. If Svade is present in 
the riscv,isa string, it seems reasonable to set the corresponding bit 
in the bitmap for potential future use.

Other changes looks good to me so I just cut them.

[...]

~ Oleksii


