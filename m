Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397D606C1BB
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ba/e4VxO
Received: from list by lists.xenproject.org with outflank-mailman.1486881.1689344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRn06-0006nb-Vg; Fri, 13 Nov 2026 08:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486881.1689344; Fri, 13 Nov 2026 08:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRn06-0006nU-Ss; Fri, 13 Nov 2026 08:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1486881;
 Fri, 13 Nov 2026 08:51:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRn05-0006nO-Qv
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:51:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRn05-009OSf-3w
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 09:51:13 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6cf7d-bab6-0a2a0a5309dd-0a2a4504d370-12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:51:13 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6cf80-b57f-0a2a45040019-d1558031f17a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 09:51:12 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso8994105e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 00:51:12 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb571f2c40sm19997195e9.2.2026.11.13.00.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 00:51:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559872; x=1795164672; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVEmrzfZYuTsQKFXwL0Wdz4FXTMK6FUZ63mABXLVX4c=;
        b=ba/e4VxOK92UjEgvS+J0JeTKtAK8zbAE8bZkvrwA5oafLjImoiKuJPML6C18TlridJ
         Z+dUBuNzSDGfKca5DI9RpPZmnJn6j9omLMxpRl4jhaLuDzFngxD+KXW/ZQ41fsZm4CJ4
         Zd35F4eP7J39FnMr/aX/RjQ4saGe5LzvSBEoKW+d/LfjV80t6GpyksNsZ0IMvQ0K+TSn
         qzeTAAcAKFgMEjlYU6RE933VC+99iqTajyc9YjTjCqVxgaidSc9rtVFOQap2Pcy6G7DB
         FCuw0ry7xvAU8q3cyc/g4gXFtKkvw7yIxMNiXJoPqfLpIdrTT0qYr4MYLXgezRTwuTQM
         AxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559872; x=1795164672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVEmrzfZYuTsQKFXwL0Wdz4FXTMK6FUZ63mABXLVX4c=;
        b=duw6bTp/7/KCFre6XXyYusb3BooFZAEtBydeqIjjpQRXuqEJojH6PCi+YvkCQHXOBz
         A0F8f8KApqVID3Jxcm4tXIqSDx5B4qnP/3EwGa8XnFM0XQHxUf2hkhv7ggYKb9TMk50m
         FKuJo3f+Zc/Co20tEyI0PL+h6uADKHHyopMFKCOsBjqlH6PuunDPQvyNSjE0ykOVPGos
         nJGnOSz+/uvOnevTOpRk+c9FzCQ/Xv4cGADZ2gNU7L31SBesD8wEuc9ciQhHgm/lxbij
         2JaeBDgUJj35YCa3/q5k6yUoPbE02vXjgUC46/hCUyns7UIum8KznwfX8f6fQgB4CKbk
         LnzQ==
X-Forwarded-Encrypted: i=1; AL+hErGgPMVVSZ3NeKftGI+pv7MIkj3ALk4YMbOnDCNyYuJcs2ZRgQAPjfcLafd2UghX5qgYtlNt+AMpDMU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+iVjV+naN++78A1ZvFC/v5kfMv2pojM6dyXO1WovtkEby+5Ksf
	WqUcuH8LIhZQb9+ONV+NAy+0UrnLtDiGRTYJuaEsgzPDJ3p0Fss5vmBe
X-Gm-Gg: AYBFou1JQr8hc4yyrLiJfsCYrGglgasWmeWsXO8NQ//me0X6YS5/YdKphTItlfAtYHV
	jGtLncM3uejNHxLgIcZoeYKmaZhooz98x3CirI48pkM54ZjZUva7zj2aX620KjQeO4B6Ax6G3yf
	RgK/dgalcLoRqewgi6QkZmArtAhIuhD++qKlAeYFq2+/6DQU7SrE8Q/MreNK6S7jlT0lnokraue
	q9sXUTNwLje+aGSJjbuWn3XkD/lQx3xT3n1BlkfH1Jyc59CClSbFj+EJHTxmMI+TcoDRm+fza7o
	mvLqCPTl0FCALxIQoYjBDUiGYb7U/ss4KmIxIqona1RXxqd3DDcVHruLkZO3/0F1Sfec018LzxW
	cX6VyRoxBryws2O6WgxUjguoTboW/zihMUOOuVNmR+CB+rUO6OC5RAgNxkQqYn+IO7NDymErLUj
	pcWLTPGGhaG1mEZAWtqJU19WPOhbbqcSCYv0QBWYi5nk78V+PUZLd067eOINNB41OQD1T9B/rn6
	nqchqa6p/jIFnyMHPHvn6F1L97h0jhj0QmdNrU1UTjuAS+E1sdEnmTMI11zEqISLiSYjvwcXYDx
	35dtPPEeTwHBTpl3fWbdrdNJOsnbOZjutengJCeDZpGNK9ddrUicqnawr6ggejSduSxny1utsFT
	hqg==
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr25079855e9.34.1794559872194;
        Fri, 13 Nov 2026 00:51:12 -0800 (PST)
Message-ID: <66c8bb12-1139-4689-99a0-3bef189ba5e9@gmail.com>
Date: Fri, 13 Nov 2026 09:51:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Don't separate .data.read_mostly from .data
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261112185824.3302712-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794559872-C1CD7B50-66B15CBE/10/78276251493
X-purgate-type: spam
X-purgate-size: 4533
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/12/26 7:58 PM, Andrew Cooper wrote:
> This appears to be an error in x86 which got copied into all other
> architectures.  .data.read_mostly is an internal detail, and none of the
> similar sections get exposed externally.
> 
> Simply place .data.read_mostly in .data.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> CC: Timothy Pearson <tpearson@raptorengineering.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> This is to simplfy the script checking that xen.efi's section
> attributes/alignments are correct for UEFI SecureBoot.
> ---
>   xen/arch/arm/xen.lds.S   | 8 +++-----
>   xen/arch/ppc/xen.lds.S   | 8 +++-----
>   xen/arch/riscv/xen.lds.S | 7 ++-----
>   xen/arch/x86/xen.lds.S   | 4 +---
>   4 files changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index d1bb6c62d208..8d0954c90afd 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -86,16 +86,14 @@ SECTIONS
>         __ro_after_init_end = .;
>     } : text
>   
> -  .data.read_mostly : {
> -       *(.data.read_mostly)
> -  } :text
> -
>     . = ALIGN(SMP_CACHE_BYTES);
>     .data : {                    /* Data */
> -       *(.data.page_aligned)
> +       *(.data.read_mostly)
>   
>          HYPFS_PARAM
>   
> +       *(.data.page_aligned)
> +
>          *(.data .data.*)
>          CONSTRUCTORS
>     } :text
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index cddb70855307..b2159279169c 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -77,16 +77,14 @@ SECTIONS
>           __ro_after_init_end = .;
>       } :text
>   
> -    DECL_SECTION(.data.read_mostly) {
> -        *(.data.read_mostly)
> -    } :text
> -
>       . = ALIGN(PAGE_SIZE);
>       DECL_SECTION(.data) {                    /* Data */
> -        *(.data.page_aligned)
> +        *(.data.read_mostly)
>   
>           HYPFS_PARAM
>   
> +        *(.data.page_aligned)
> +
>           *(.data .data.*)
>           CONSTRUCTORS
>       } :text
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 250ee3f36f4f..d1c5ce59c90d 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -84,16 +84,13 @@ SECTIONS
>           __ro_after_init_end = .;
>       } : text
>   
> -    .data.read_mostly : {
> -        *(.data.read_mostly)
> -    } :text
> -
>       . = ALIGN(PAGE_SIZE);
>       .data : {                    /* Data */
> -        *(.data.page_aligned)
> +        *(.data.read_mostly)
>   
>           HYPFS_PARAM
>   
> +        *(.data.page_aligned)
>           *(.sdata .sdata.*)
>           *(.data .data.*)
>           CONSTRUCTORS
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 925848980219..99802aed4e13 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -295,13 +295,11 @@ SECTIONS
>   
>     __2M_rwdata_start = .;       /* Start of 2M superpages, mapped RW. */
>     . = ALIGN(SMP_CACHE_BYTES);
> -  DECL_SECTION(.data.read_mostly) {
> +  DECL_SECTION(.data) {
>          *(.data.read_mostly)
>   
>          HYPFS_PARAM
> -  } PHDR(text)
>   
> -  DECL_SECTION(.data) {
>          *(.data.page_aligned)
>          *(.data .data.*)
>     } PHDR(text)

The ordering is preserved, but the alignment between the two isn't.
Today the ALIGN() before .data sits between .data.read_mostly and
regular .data.  After this patch it sits before .data.read_mostly, and
the only thing separating it from *(.sdata/.data) is
*(.data.page_aligned), which has no inputs on RISC-V, PPC or Arm with
CONFIG_MPU. So the tail of .data.read_mostly will share a cache line
with ordinary .data, which is the false sharing __read_mostly is meant
to avoid (IIUC).

Could you add ". = ALIGN(SMP_CACHE_BYTES);" after HYPFS_PARAM, so the
separation doesn't depend on whether an arch has any
.data.page_aligned?

~ Oleksii



