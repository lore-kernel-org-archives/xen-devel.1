Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2983C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:22:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428962.1651882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Ne-0004bq-MG; Tue, 22 Sep 2026 14:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428962.1651882; Tue, 22 Sep 2026 14:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91Ne-0004bj-JO; Tue, 22 Sep 2026 14:21:58 +0000
Received: by outflank-mailman (input) for mailman id 1428962;
 Tue, 22 Sep 2026 14:21:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x91Nd-0004bX-Td
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:21:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91Nd-0001Cp-Ae
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:21:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28ef7-8faa-0a2a0a5109dd-0a2a4502b32a-26
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:21:57 +0200
Received: from [74.125.230.99] (helo=mail-lr2-f35.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28f05-6ca4-0a2a45020019-4a7de66381f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:21:57 +0200
Received: by mail-lr2-f35.google.com with SMTP id
 38308e7fff4ca-3a47f740839so35120691fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:21:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a627d67d9asm6260641fa.23.2026.09.22.07.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:21:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790086916; x=1790691716; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xiUNAhZbzRQt8xbOCQm25lVj86yCf+Eb13dZvBRGfM=;
        b=h62CQ7xHZgloTuPgkRHLZ4RjMhFY4IjLzLCYCSAo7/v58XF1byF7QdAnvf4Sv1Orfu
         /O1KYBwdSlLncnw5GKjiMkJNP7TYsNLor8mERlDwzhrU+nI358oBqJepYEMidOVmJtfA
         wToH9CHTQg0W1oEYYJzBBUPDsvOAUX0oVpX9xrX3mPOlrRM0CerdRWJ16calMaLnxbL2
         I0RCwiSql8vEcap2qlfpgvcJ33h2wBNEyVhA/0EST9o1frSDAexgOnW1qHXni6Y5sUtS
         DvxT+C/nj/y12zUcucWSoeb/c1/6nyVQ3u/dhMkuafJSYAw6IHl19wMZwW4b0XohmD3c
         g/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086916; x=1790691716;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xiUNAhZbzRQt8xbOCQm25lVj86yCf+Eb13dZvBRGfM=;
        b=VW3PamDraBhMz2zrvOEUEmDkocSZQMTQxazpYr4KITbzdAlpZlEzsR8lQT3SgyXBj2
         azWmY5XKPz88mq1/b91dOWQpkCdkgp+jbzfWdhA/vCQQLHJl4klZH+PuUlacz6evxqck
         rg7K64kD3F7n73PnYKKnGTNyVjzq4BeywWWRO7zIhDj+9HqW4iTxjWo4j33ludb/WvUJ
         2N2XnHpSyJNUfHkmLog5xvWoB08Ati/+rDf+K0IeUDoRqv6vTsFGcKBt783qrvpK//Jj
         MuMLTgZvNdeKEkPmHImJY6mR+YjA3UOVG7pYvseluxpmOIOFQhSqtVF8RfFCpek4FIeQ
         8mVw==
X-Gm-Message-State: AFuF++ke4O30aeqU+uy+fzkcY5RHNQG9Xu3JxzsAu1coSKALJhymWudw
	rMUzekGO3xfpdV+ddZw0YmAk+uFOCa1PWIjOSoTxpMoZ9uMgnAheE6wK
X-Gm-Gg: AYBFou0jJa1T2wAaaY1J9NgJ5ba8L220V3h1wzn040DaSy45/Gb3BGVWaiZWOls4TKi
	gLVR8y8wPss4ZhmepteSjTUPHAzCOt5/jO4FOzygRltqUj2seiiZ472UvX40xFgoOMwFRUNBNPc
	hoLD60JDM1bOUMx2r/GARafS2Zn0K+Kxaa4OoLjUN0CLfPavPeoGMMXz3hw4LOwvKjwyLHkarud
	yBEzCaZ1nu8Afjcr/xSbaTuroCQ7gkFohns+GGJTcLmsLG2QIAYrkqrjUjGaJHRk1MB4UMd6MQM
	czXrhVOGBDDeJAYczUpqpM4L3koH7ZAD0f8csuVzdcZv8DKdcbEec4Ye9CEwRbYEQKGBiYhhcK0
	eqY5xnh5/3jGMa24kl/k0uehhNw+1VHoZi6+bwAvrrFzFJmrdApeM5TrOdNaVlDwPw9RxySOnFr
	Ulo4/44JXNkFNMoE1taFcnPLiaq8HgwwVzhRNiNTyX1aLhD/pHeARlrGrH54KPGjUlg0eqcUbTC
	DNP4D1h3ypoDRgZ2EFlc/I7oBJL3tvcPf4U8j8B72cVYDxfmC9mG5ATNTkP
X-Received: by 2002:a2e:bc04:0:b0:3a6:95a:52a6 with SMTP id 38308e7fff4ca-3a6095a5397mr24620721fa.20.1790086916308;
        Tue, 22 Sep 2026 07:21:56 -0700 (PDT)
Message-ID: <1a1d21cb-20c5-4b11-af1e-995d31fd2995@gmail.com>
Date: Tue, 22 Sep 2026 16:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen/riscv: flush speculatively cached Bare-mode
 TLB entries in turn_on_mmu()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Connor Davis <connojdavis@gmail.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789032899.8631fc262581453bbf619ec5b2062170.1a08aaba238000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790086917-315CD2AC-31E02189/10/73395122804
X-purgate-type: spam
X-purgate-size: 1923



On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
> The existing SFENCE.VMA before the satp write only orders the page table
> stores from setup_initial_pagetables() against subsequent implicit reads.
> It does not prevent the CPU from speculatively caching translations after
> the fence retires.
> 
> According to the RISC-V Privileged specification, implementations are
> permitted to speculatively cache Bare-mode identity mappings. Furthermore,
> selecting MODE=Bare (which happens during check_pgtbl_mode_support())
> requires zeroing the remaining fields of satp, causing ASID=0 to be
> actively used in Bare mode. Consequently, the TLB can be polluted with Bare
> identity mappings tagged with ASID=0.
> 
> Once satp is written to enable Sv39 translation, these cached identity
> mappings (tagged with ASID=0) can shadow the true Sv39 translations. This
> would lead to translation failures since turn_on_mmu() jumps to a
> non-identity-mapped linker address.
> 
> Fix this by adding a post-satp-write SFENCE.VMA to invalidate any stale
> translations (including Bare-mode identity mappings under ASID=0) before
> jumping to the virtual address space.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v1:
> - rewrite commit message
> ---
>   xen/arch/riscv/riscv64/head.S | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 9c40512e61..7f6edc972f 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -98,6 +98,7 @@ FUNC(turn_on_mmu)
>           srli    t1, t1, PAGE_SHIFT
>           or      t1, t1, t0
>           csrw    CSR_SATP, t1
> +        sfence.vma
>   
>           jr      a0
>   END(turn_on_mmu)
> 

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


