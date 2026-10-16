Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42937CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:45:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452270.1667091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHk7i-0002GH-8b; Fri, 16 Oct 2026 15:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452270.1667091; Fri, 16 Oct 2026 15:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHk7i-0002GA-5b; Fri, 16 Oct 2026 15:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1452270;
 Fri, 16 Oct 2026 15:45:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHk7g-0002Es-D4
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHk7f-001NUb-FO
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:45:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad2467e-8faa-0a2a0a5109dd-0a2a45038696-40
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:45:31 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad2469b-fae8-0a2a45030019-d155802da81e-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:45:31 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso7506905e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:45:31 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd91c55bsm141831455e9.0.2026.10.16.08.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 08:45:30 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792165531; x=1792770331; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wBJ+Wz7x0TcRN8pGJ6i0/qelXS6Ni6K4fvhyr6lhNUM=;
        b=jc97AurgYj6lt1XlX5NLUKcQkJQvt6Sb/8c8720RtwIUHrFzxbxWuaf5+G+OC5TQXl
         htPILUy3NAAMFuxAmT4W32bM8HmD6IW11bKJKBJyg6exDWERMO7xFtYOSzB6D5hnWMT6
         YEPmtKVdpVm4OJitA/b71iC9xl320Hp8B96Qc/hqvonupGdlIeW0TePdQC55h+u/aEfB
         Q51foiIdgRE5bjE9PoB1JQvD13Axn8jS8lO2/XwydJt6aLa02FSHkQ1qlNTSx2IAf/ca
         BEBRiZhKdRrJ6b+RTnPVOlqf+5KYK/RQq+ZDoZkMzdyh0jylFlWQV1qQ0sa6kb/6y9wX
         /+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165531; x=1792770331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBJ+Wz7x0TcRN8pGJ6i0/qelXS6Ni6K4fvhyr6lhNUM=;
        b=F+ix1sORlJArkgD0OxBGk5hNoo6upeluKV3ncsZqjByfEAyRE2hD76ZgcH3CI1zRSc
         biHvSwveUXfnqm00nHKgpGSDNmxW+3NviCGcWtWhitHmOhQZBWgqErdcgD6G1taA4Lsu
         XuDz5n62eQNRmKdI5NmTAjqJk3aojkZIeObVDW1dlxQu5aA3zFxnlfUgW4Wfjr7BGj8m
         WH2t7YmI0jqYlUzI5GnRrY8/dhcgDWrXaTvfWLcsAKXLMxE59jqObX/Jkm7wRjH/80/8
         DHoDa6g7k5OsXQ/6NBg0yG+dpZlKxgfSu4BE0uv1B5SZMBzAG9TJTqJIFADGz6l+MUm0
         nADg==
X-Forwarded-Encrypted: i=1; AKwUvByqUxvz4ypKzzMWOmacGC7XqRsK2QIeVSwwgtUt0HeGVByvfjDk7AB78nkX6lP5/OiXgYN3Dy85Nhs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLKpNrNA/o0RAvXqAiL4M8zlV2mo3Ti+iAO/itI6brAIKngK9pA
	R4PaaO4H83C/LhJ3UJ2DvJDzx9y8GG+MvQGTnG0Vh+r1zFDGwFsmyRH9
X-Gm-Gg: AYBFou3oEQfTXs0Kfj/mtJlUoMrQER+CXhzeuyWeh7zkpALydDrU89mL43+lTxwRgmj
	cVr6HHXLqUf9lbiVkRPXCf03ImjLq10BcNMXDLzNbrlFznRrceNYEERp4NNvQ7WznQ9ZaccA+0H
	96T5r5YYYI2kYJ8ddiDKHuFnUQD425DJT3piCdjEZ7blEkYvoCfoxgCNBSsn5m43IsMwf5r3JhF
	cW2YLJyzL1rnadZ118CMUqmJoR3vAdJvFPM1vD++J9So3MTYNVEX+pZc3sI3fVmFkHDosTA4CDI
	xvapt+2D/hDk+7dmNblkHWN00BE6UBzmbvE81D4r5OB070slai9kVueTKrblHFFVrokRKsh5j7G
	Iji5pmpXC305lGArGQgYL/OVEDCnJESBjKCehH7fJ13zUb+MrZazT9U76W+RJQwWcFpMTx3ClAm
	pJZ2xWDXdMWztngdj3no6/AywDQ/vhJHTDF2H/g2ekmHrAxH88iHy3cOZZWVV3JsRcIgQr/K3LS
	bgxwpjHia9Y4khLLIwzSQmq4PNS5mQ8KWXGJGdGtQVr3Zc=
X-Received: by 2002:a05:600c:a00f:b0:4a1:6d2d:d8bb with SMTP id 5b1f17b1804b1-4a1d760522fmr3635415e9.12.1792165530718;
        Fri, 16 Oct 2026 08:45:30 -0700 (PDT)
Message-ID: <e291e2f5-7286-48b5-b195-cc80a2e19b5b@gmail.com>
Date: Fri, 16 Oct 2026 17:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] xen/riscv: panic if the device tree advertises
 neither Svade nor Svadu
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792164867.8631fc262581453bbf619ec5b2062170.1a14559ab900008425@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1792165531-772F54E9-1859EFD0/10/78276251493
X-purgate-type: spam
X-purgate-size: 1427



On 10/16/26 5:34 PM, Baptiste Le Duc wrote:
> p2m_set_pte_flags() presets the A/D bits of G-stage PTEs only when
> RISCV_ISA_EXT_svade is set, which is correct only if the device tree is.
> 
> The privileged spec allows exactly two schemes for updating the PTE A and D
> bits: hardware sets them on access and on write, or accessing a page whose
> A and/or D bit is clear raises a page fault so that software can set them
> (ratified as Svade). Every implementation uses one of them, but platforms
> designed before Svade and Svadu were ratified, such as the HiFive Premier
> P550, may advertise neither. Xen then cannot tell which scheme is in
> effect, so rather than guess, panic in riscv_fill_hwcap() when the device
> tree advertises neither Svade nor Svadu, so that the device tree gets
> fixed.
> 
> Add Svadu to the known ISA extensions so it can be told apart from Svade.
> The comment above the enum asks for new extensions to go at the bottom to
> avoid shuffling, a leftover from Linux where the IDs were macros with
> explicit values. Nothing depends on the enum values, so have the comment
> say that multi-letter extensions follow the order of riscv_isa_ext[].
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

