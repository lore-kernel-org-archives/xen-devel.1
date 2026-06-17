Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE16CD98F0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:24:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340270.1601319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNw-00073s-Ub; Wed, 17 Jun 2026 11:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340270.1601319; Wed, 17 Jun 2026 11:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoNw-00073l-Rf; Wed, 17 Jun 2026 11:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1340270;
 Wed, 17 Jun 2026 11:24:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoNw-00073Y-0v
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:24:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoNv-00FQkN-Cf
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:24:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283e2-2eae-0a2a0a5409dd-0a2a4501e52e-28
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:43 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3283fb-c1f2-0a2a45010019-d1558035c128-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:24:43 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so40865095e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:24:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa510e7sm183139075e9.7.2026.06.17.04.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:24:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695483; x=1782300283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMmTDZAZQ5CYBrZ84kNhUKDDllyUx8mmPG2Ey5EmUQw=;
        b=JuRpvAtIKrjGIRq8YHu/T/yi8GHZ8i8E6uRbIPJZQg5OKAiC4zJ3i4SKGqquleBJNO
         bQbY7V4KgGz6ZlpKVhQxEng1WNUO3Lkzianl2yROluq7TX0HVnOq4nbQy7C7fU457qYA
         RUNqBFWuJLSdQSNan9iRXgxD8gHG6s3eoHuFgUXPkxdk4v7DlVHGyMlJ+T/F/1qLDdaK
         ovTAm3NYoQq90l3vNKG26if/r7bVWee+57ciZaOiGxCPk5bQAAINdz2paWiwjRFMx0MP
         uz46tzBS/6OH6k9fLx3YJWsfC+1pLS5XOPYde+bFRKk3KhrU1cMUdI390PVlCnO4rPki
         EeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695483; x=1782300283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMmTDZAZQ5CYBrZ84kNhUKDDllyUx8mmPG2Ey5EmUQw=;
        b=KZUOo9Bv4PbqHEptGB6io4CFJ7hILPDRerD/CMt6W2Tv5noTVgLrtOpIUi5W0fDQIC
         Lu96B0YC8ydGKQjAHYx+oacl86huFGub6YgjI7bpPeDF7HTuxgeSVCR2lSEF5ZaDgjPZ
         Y3Fa87duJ8bkgGwYRVSKCIADw/vf1Lv/it4Ws+qxQIItmelBOrrTgPFi6WzdnAFLlx/k
         UMGsiY+UxQsWZInDAOvE8e3qvrtnq/ugrXi8MoE3KzzdiEcK91a03aCqdwMN8suSDHCm
         rlQ2eO07j016JhlmrhktCDxbdio+1CrKZwG4678gRq/NTcz7yfBBFjFzyqH3guyFqyl3
         Rlhg==
X-Gm-Message-State: AOJu0Yx8K10aj3meEA5kqW1XrEMWuHG3hQdU/DbKsrzM9nCj0j7RDn3D
	Ak9gygJFv+yjcJ82tSJcn2sIRwAJAb8xDBNYdbF1/u8QYePC2vsfepv6cxqRcw==
X-Gm-Gg: Acq92OGB+2t+0P/GgclLomg0BspuD1JvUufh0nuStB1B6bkrc4iqtz8oERIPSUk7gFw
	h2HNXE42bm1j/LczbKZszWPSlsMr3of1blvpmm0tY5rtVBBOggdh0Z2ZONqtfBtPXJlFf4NOm5/
	vmZN4O0joqDMmcl+ETKrYD+zZTX9cNDksHaSRtP3uCgL4ykZW1CcXsAff18yPyfdns1fbEi7foL
	fxJknOGb4eHNONhdl+MXRaWPuL3tvL4y0GY33kXgJLSVZrQFTFt1rOEkrZ/W0NkuFOGWbJWAIlY
	QZhLboTVB4U2fP9lAQIUQr9ZETvMaN/K+yOZ2ylwZ9v60iqh47qSVIlIgEoX5Q1UKN+Ualk5xVh
	+tjlnLrj5zxU137r4mBfyKs0Py+ZyHcPoOmO8UemMlWwdC1xQ1eqB57chPTbeNHIkJqE18PYb0V
	z1kZyCr1QGedcQWca7nD32VkwNsE+1JWC0vES1aBIm2MnZvnr23ry8GFmRg7ESINsqGZzjnNP9+
	K8ZVw==
X-Received: by 2002:a05:600c:3541:b0:492:1f06:ec9b with SMTP id 5b1f17b1804b1-4923412f3bemr46205235e9.24.1781695482521;
        Wed, 17 Jun 2026 04:24:42 -0700 (PDT)
Message-ID: <ce811c62-3fb4-4389-b51b-1e01a1c0f0b5@gmail.com>
Date: Wed, 17 Jun 2026 13:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] xen/riscv: create APLIC DT node for guest
 domains
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0b034d584b7aaec54b70e9e575c727b07930d2ed.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781695483-AC457FF4-891315CC/10/73395122804
X-purgate-type: spam
X-purgate-size: 353



On 6/17/26 1:17 PM, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -3,6 +3,8 @@
>   
>   #include <public/xen.h>
>   
> +#define GUEST_APLIC_S_BASE __ULL(0xd000000)
> +

It should be here _ULL(...) or even _UL().

Sorry for inconvenience.

~ Oleksii


