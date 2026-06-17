Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E40CD98E4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:24:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340266.1601310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNZ-0006eR-Mb; Wed, 17 Jun 2026 11:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340266.1601310; Wed, 17 Jun 2026 11:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNZ-0006eK-Jr; Wed, 17 Jun 2026 11:24:21 +0000
Received: by outflank-mailman (input) for mailman id 1340266;
 Wed, 17 Jun 2026 11:24:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoNY-0006eE-1A
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:24:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoNX-00Cpbt-62
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:24:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283de-5cb7-0a2a0a5109dd-0a2a450bbf84-38
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:19 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283e2-212f-0a2a450b0019-d1558034c560-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:19 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso48572925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:24:19 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e6a8fsm54072488f8f.37.2026.06.17.04.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:24:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695458; x=1782300258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBocIvoUleMZb+LC/S6F/0Ytgt4h7hzLS/5y+YIK+pg=;
        b=DkPtUucGefwOWNjD5Srdi0qG8RLvY0NN2j0qTBZadKu96s8eHx5GuB3VJcCvWUtGzC
         5XV8JgNMc6yttEtbFEMprXGPuP9ygQxZVRVt+mlV5oCZkV/zoyjpqy0mRdeHMlJXK1O3
         gNI1nrSNJfl62QlvaRNNhWUJCfMk0xeJHnweT7V8AgFuaVriSZLuytoFp30x3T6KL8LQ
         0xvt4KsTEJMS1jYPedhTAQUF7hbtAOgfIvZAnPyWvMBU4s3Ad3AnjgNApMrxv081B3oL
         hBRhvZx4Q9gq8Zp4ubBrmOBfAK2ICRYKS0xP4qij/4k7IksJCU1dYr1ty+cQXhXhFRXf
         LrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695458; x=1782300258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBocIvoUleMZb+LC/S6F/0Ytgt4h7hzLS/5y+YIK+pg=;
        b=ioNEQWFALNJj1D5mlAaId2AjGk9IHxpbkU5ZCn3fl3iamt32CJz6EMTcT1RXMEjfRe
         GgEe0uoEcu3woUt41l2VGG3AjY1wQtJBs4MX2eOYXyP6pcrHf0XfSrLL9ynBbi3iNhjC
         y5WCiK2B/GKPpbftsFN7puoePxVOSJcXp/ftwRALgUmz4oWVFFcQk5eaEdRg/uYraNY3
         Qb8hHjBnDHv3imn1laj//7hht0MzQb+ydZvSSPMb16tEpZwoMtowGyME6TEV+KHyNf4Z
         QfLBR7gKh8L5wgJFGIeaWd5OidBvQRqD9rWDGiYbgpNu9XGFGvtBeDygTzvV/rf9j9AN
         Qt5A==
X-Gm-Message-State: AOJu0YyvLN/3VqfUxFac6dfH7rRdUCUCkXzFtQLN8wv19qfcjPXDmSac
	IjaFNRdm8X9aIcEYTJxQ5Rba3Rkh5sSyQ6QT0MELstme4ggj5dVOcOlJSpsMLA==
X-Gm-Gg: Acq92OEmRcruIl8F9yIKmxlCJ/rGppIfSWk4kTY8B7AurWISuTQqV9nDzeX3zBPeq4x
	ZSi/bl05spnn1bSKLWdfhodmHiBSFQAaxXG4SDXK30eDC1MNfgHlwEOZg2HmC8Divxzrd3Nx1Do
	a2yCp7ZcNYlhepB1MwJsVr4XoZrGVCh73Hy6Is8qv50kbVShDfg9aAPVc7yiCFVvqmM0Hklcmnm
	0wyasAYkn8GXdIXgyqyBDBjKS2DgcKgzV53Mj4tmDBQ6u1CYXITLPrFNXn2l9uphMubyq138/ac
	U/Bp7eCSG74kZXUpRagCiTb6jKNx7etVyV0VgD55lIhvJQ1DgULhNCV3jd8ZwwxVqiCyKZGE/Aa
	7iHhVcdXMKwoAaCaneL0o34/Zlhk6hURRWiIe+gCHo/9t8EwrMpt8YfYJ2JPMPzypdfMdrTnfBg
	rww3EWS+AvsdWN2ipOa3aT7irDrRaggkhldy8RvmPd5dOt7DAkxb973nSoMXdLkjW4Dfk=
X-Received: by 2002:a05:600c:818f:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-492333ba2d8mr66733985e9.5.1781695458375;
        Wed, 17 Jun 2026 04:24:18 -0700 (PDT)
Message-ID: <a6f322e4-f5a6-48e1-bf6f-bb7739e14430@gmail.com>
Date: Wed, 17 Jun 2026 13:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/23] xen/riscv: generate IMSIC DT node for guest
 domains
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781695459-22589F3B-E2EB1D2E/10/73395122804
X-purgate-type: spam
X-purgate-size: 349



On 6/17/26 1:17 PM, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -3,6 +3,8 @@
>   
>   #include <public/xen.h>
>   
> +#define GUEST_IMSIC_S_BASE __ULL(0x28000000)

It should be here _ULL(...) or even _UL().

Sorry for inconvenience.

~ Oleksii


