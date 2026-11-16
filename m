Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD54606A32C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dhNPb7jI
Received: from list by lists.xenproject.org with outflank-mailman.1490306.1691249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xStFx-0003vS-Rh; Mon, 16 Nov 2026 09:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490306.1691249; Mon, 16 Nov 2026 09:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xStFx-0003vL-P9; Mon, 16 Nov 2026 09:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1490306;
 Mon, 16 Nov 2026 09:44:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xStFw-0003vE-6k
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:44:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xStFu-00Cb4c-Rc
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:44:06 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afad05f-8faa-0a2a0a5109dd-0a2a4504dc12-26
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 10:44:06 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afad064-b57f-0a2a45040019-d1558030c0c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 10:44:04 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so20649875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 01:44:04 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c81a63b1csm20341117f8f.4.2026.11.16.01.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 01:44:03 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794822244; x=1795427044; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDMCl7mGy0Cc/FV+n40rYUVsxq8H5/3NzhOv4bVlViE=;
        b=dhNPb7jI0yJ1OCbfd3cpesRKlL+L8Iypfc74GT75rrbL4vInbVz7SYC8+Y9WlADBNc
         oZdnffIf+xXgQtbSyZ5bUQWe6LnjYHW1FqHs5MEoIdi1szfjxucfrHAsECgO6QIfLQ/j
         JnsD3SbcFxiqopVv4xOTQD2CVzj0XDTiGvlJSwP51s0t2VgJqxOEa3rCWAdBXQkMebJ9
         zyQs+OC+z3Sc/qrFcDwnqQ0AEhL1hGzo0knxcqNjqxPnPvVwSB2b9EklHFubL/VbUnJc
         1JW3WbyvuAJIdlG9ipK0wsQ6nEJN3RBMQmtOa05n9eK+fc211uyL5T3eqw0HYHAwTZu2
         iCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822244; x=1795427044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iDMCl7mGy0Cc/FV+n40rYUVsxq8H5/3NzhOv4bVlViE=;
        b=ZxE/o0RwksmKD6anVjeB5UIKfwRRKvZ42XBrXBt0fcuw8PobAROap3l8DkMYFh7/8h
         W5Nkdcw6NB9RsN4oozExvvVy9DI2zPmTb+ojHeSYls7ESussfOBWUVoJ6F6DyZ8ml4Fs
         f2uB5sDtJDjwNUdiiftNNqbTVlep6GlK+8NMCq4w3jSR0sMNFi+A1pnN62A59eCRqz1f
         asyt1cG/bQ2vzTx0yMyZATZdVafPCTCG1twe8RAFpzELjpXn8z0AEIWMsn8PMk2+CNpe
         7wVL++y+WwUOc2c28Xxko2aSmbzeBHcXhVre1i173J07+XDXyrb4r6dFerFUU/VzvU0N
         KH+g==
X-Forwarded-Encrypted: i=1; AL+hErEXCvmirq4pdc1fT4zyWPa13SBRdgYAqVP/saQRN3Dik9ZHymhyZ+RS/Lfk4xWggvHySRAfM1JdVFg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/D1h7KbPyO5qhC+g2I0OIu6yoksk3BCedM0YICl2uLuhECeuxZ
	mCftpwCVxMvjDwW30D64iZoRZvKf/41ecCtZdHCh6/nTfIb7Jjd1bAbG
X-Gm-Gg: AZFdTZfR8mV+1MuXWiq5UEvih+abA9s0Fm+aG11z+5ZBljBWMhseWgood0Qn1YGblsk
	FuqVoka80ur13hGrWcSN5gNRd96vEsIRzk9d6t/zNtYAOEXydgFwH99xTXXOR/TSpnP7yMsOY5R
	1L64iKczvA3ag3QPX7yYXEfpsXPlltPJcFCIJLTx7FIHWXM37wyr+u0ORxOVPiwP+HC6roweXCA
	eVSJoPKHbpybzZVbas2ac9iL9NWmtn7saRqgAsKycLt0EJvY4VPA+46/sf5v3Yo1CwROg+UnEfL
	eMeI/TfvpajRIcAD7FX3cwf2UBo5g2TE2VjNi1PpSYFRRjeiKJRBNc/D1kSUft8XxZuMH2gdsFK
	EpgCJxBiGLacork2f7Oi61x1Cwt+VJymcwZQSCM7D40JNtpwQh81i1B/HO8gvQwoxbcofVenvcy
	e1Gbj2CGo2QrRHEJ/pIgJZD5VAfjd1N8zl1+jGBOp6ZewHtfvkMZqyR06x1BQQ9cTizm/PtLM3y
	WTnQVjHDk3cCPFyXe67ud4VDAzylIWkrCEj9Mt5P5KApCLx00zQVVrIB2g7XJmr7Dr5Az+0CFh3
	gUH5/ETSnbzhH81dslJpYU4/hRPoX952zfWnd5TWUEA5OjtyULUKrBjSxm4brX/mTxthL3jmPd0
	NVw==
X-Received: by 2002:a5d:5f91:0:b0:493:d5f0:4e4c with SMTP id ffacd0b85a97d-49c723fc45emr20975581f8f.23.1794822244182;
        Mon, 16 Nov 2026 01:44:04 -0800 (PST)
Message-ID: <610e72a9-10a1-4c27-9bc0-c31b12208ade@gmail.com>
Date: Mon, 16 Nov 2026 10:44:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add R-Car Gen5 PCI host support
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1794817300.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1794817300.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794822244-538C1B50-F928927F/10/73395122804
X-purgate-type: spam
X-purgate-size: 1285
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Mykyta,

On 11/16/26 9:40 AM, Mykyta Poturai wrote:
> Add R-Car Gen5 PCI host support to the existing Gen4 driver. Gen5 uses
> the same DesignWare integration and register layout, so one driver
> covers both.
> 
> Drop the generation number from the driver file and static symbols. Keep
> the rcar4_ prefix on the exported OSID helpers, as the BDF-to-OSID
> registers only exist on Gen4.
> 
> Add the "renesas,rcar-gen5-pcie6" compatible and skip the "app" register
> range on Gen5, as the hardware does not have it.
> 
> Mykyta Poturai (2):
>    pci/rcar: Rename PCI host rcar4 to rcar
>    pci/rcar: Add support for Gen5 PCI host
> 
>   MAINTAINERS                                   |  2 +-
>   xen/arch/arm/pci/Makefile                     |  2 +-
>   .../pci/{pci-host-rcar4.c => pci-host-rcar.c} | 49 ++++++++++++-------
>   .../pci/{pci-host-rcar4.h => pci-host-rcar.h} |  6 +--
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c      |  2 +-
>   5 files changed, 36 insertions(+), 25 deletions(-)
>   rename xen/arch/arm/pci/{pci-host-rcar4.c => pci-host-rcar.c} (81%)
>   rename xen/arch/arm/pci/{pci-host-rcar4.h => pci-host-rcar.h} (88%)
> 

Could you also please add item in CHANGELOG.md if v2 will be needed?

Thanks in advance.

~ Oleksii

