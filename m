Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE40CD3427
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2026 13:58:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300711.1575212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGI4-0004S3-2j; Tue, 05 May 2026 13:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300711.1575212; Tue, 05 May 2026 13:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKGI3-0004Rw-VD; Tue, 05 May 2026 13:58:23 +0000
Received: by outflank-mailman (input) for mailman id 1300711;
 Tue, 05 May 2026 13:58:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <x1917x@gmail.com>) id 1wKGI2-0004Rq-FV
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:58:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKGI1-00GkKu-Sf
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:58:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <x1917x@gmail.com>)
 id 69f9f775-bab6-0a2a0a5309dd-0a2a4501a872-16
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:58:21 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <x1917x@gmail.com>)
 id 69f9f77d-c1f2-0a2a45010019-d155dd36c1d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:58:21 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so2793569f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 06:58:21 -0700 (PDT)
Received: from LinuxLaptop ([45.157.112.12]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45052a48c04sm4745130f8f.15.2026.05.05.06.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 06:58:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Organization:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777989501; x=1778594301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rcd/XwGBASe92ZYjhmrOH2A7MkePWFvJvn9PtnkzL7c=;
        b=HXaudp+DO6MwuUs+bytwF7pjRTQXSlkUKDc27T/W1Sm5Md72hSWZ56jgA7tFu8IQO1
         +rlnh+asfew8fdiUYwXIy3vjgqm/CsQwHOfatPqQivpAtB1VpxIbm7kVZzLaVpQZIafg
         VydWVwcEhz6nm1Jkxe4fbk21xXKReZBCjJnAzmvYXS+CHsegckmWJf+7wlDzSaae8NWO
         dakbsiKgXPjDq9PCZS+Oyxi68gWLEZIJDwPufBa4QdZgLCII6K5ebxNS0JdmqmCI+FKu
         qRplvT5U4G9SW7y2xD/TCSvxxl9Tu6rgRXFqBxjet1xk+nzn6Zpb+VgijqiPaiTBgqnJ
         nh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989501; x=1778594301;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcd/XwGBASe92ZYjhmrOH2A7MkePWFvJvn9PtnkzL7c=;
        b=DGshtauPgt8+tsHbWwneTDN1AuHsGLHRGS9WoNtEl1V0g2DYB7VFgIYesLH05e7ecb
         gQEd4IRZ1DPYHLrkJO6pNc2pvKdyZHzoINw39xE5A3cw+vy2/017chC2Wc803vlbG6rH
         UOYS0CPRofZWiQixhrana9Us8Qe9afzfdkdqbPIMnbIosoTIBIsU0aeTFepRf3shrjEQ
         Vc6VRUiXghgTx9mpaKd9be03ngLto1jMnNFkPQfPWo3pcfBul9yJRYLP5hcsdtlNVZxD
         StS1y7jTAhnnfnNlfG+v1PNygZWz5x0O4rZoL1dW7UUDFhvxAlW4jxGzSGi1a6aHfaQN
         kkqg==
X-Forwarded-Encrypted: i=1; AFNElJ91l+/l9m2taJbE1YmlJxvfr6F6yznL++NXX+8gfVNajwDvDi2SJLQryY0vFG3UdUtsdZIqBlR6DhI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIFB3MquxbscDVMQeUOiTxEXnf87N7Qr5/CqUeyjtRaXT0CA4a
	xdvpbWA3WLOSkHCyO4icVRulewAWRBqAnU+qnvIGnw6lEyLGCD8S/X6A
X-Gm-Gg: AeBDieu91j6IRIO+qco1AKNfisM1PAwWtKy/wFebHej6cy+ZCfCYuVtlSjodKHEgKOr
	i7MnjfZc5Xo3huBw5i4UAl3EXJolwYARnX8UvQxbHek6vVDeIAXCoivyGd3UcnndWB/1BqIaQlR
	4CHojHiV5bWG3Uy6MIkBFbCLPT+kPDakm5SfmXTI1PNKQnzmvH+CZHnvUCqnTATs91VREU4z00y
	9nR/7N4ZCRXDQxVn9MeDcRRiwOqqg6W99vl1qyVdk2IvfREgjQttQjlRWn1lCPQCx9y+qRrLrfX
	mpzOYTO8GScHJCogU+K4lBied9rQaJQtaRqgUAP/ZsgWm6QRRmgzN3DF3PqS9QW0FgpIN5aamwx
	bo0gH0CkeuSfurPNEDX5pGOydTrdxiB5xhxyV8irUyLML0cwGN4oCVpk46cJlTM/uwejzBfY+ez
	RmS817qCKLKbRpFVcfUJHulpjyNYk=
X-Received: by 2002:a05:6000:228a:b0:441:1c18:f779 with SMTP id ffacd0b85a97d-44bb6ab18ccmr22594291f8f.37.1777989501010;
        Tue, 05 May 2026 06:58:21 -0700 (PDT)
Date: Tue, 5 May 2026 15:58:16 +0200
From: Alexey G <x1917x@gmail.com>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>
Subject: Re: [PATCH 04/17] hvmloader: add ACPI enabling for Q35
Message-ID: <20260505155816.0f8ad76d@LinuxLaptop>
In-Reply-To: <afCQd2rTmiGpR_bk@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
	<20260313163455.790692-5-thierry.escande@vates.tech>
	<afCQd2rTmiGpR_bk@macbook.local>
Organization: none
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1777989501-B526DFF4-2B8134B1/0/0
X-purgate-type: clean
X-purgate-size: 2336

On Tue, 28 Apr 2026 12:48:23 +0200
Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wrote:
>On Fri, Mar 13, 2026 at 04:35:05PM +0000, Thierry Escande wrote:
>> In order to turn on ACPI for OS, we need to write a chipset-specific
>> value to SMI_CMD register (sort of imitation of the APM->ACPI switch
>> on real systems). Modify acpi_enable_sci() function to support both
>> i440 and Q35 emulation.
>>=20
>> Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
>
>Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
>It's not great to add more stuff into hvmloader when we want to move
>out of it, but it's also not helpful to tie the Q35 addition to the
>removal of hvmloader.

I'm afraid the only option to get rid of hvmloader is to move its
responsibilities back into the firmware (SeaBIOS/OVMF). But if I
understand it right, the whole idea of introducing hvmloader originally
was to delegate Xen-specific parts of HVM guest initialization from
firmware to a component managed by Xen itself.

So, to some extent hvmloader can be considered as a part of the firmware
itself as it does things like PCI BAR allocation etc which are normally
done by the guest firmware, but with more knowledge of Xen specifics.

I guess this hvmloader/firmware split model was introduced to have more
freedom/maintainability/control - I suppose it's much faster and easier
to integrate Xen-specific changes to hvmloader directly then to
upstream them to SeaBIOS/OVMF codebases.

But other than moving hvmloader's responsibilities to the firmware we
can't do much I think - HVM guests expect to have full freedom over the
emulated platform. Among problems are non-standard (chipset-specific)
devices which also need to have assigned resources like MMIO ranges -
and Xen doesn't know anything about these devices and their resource
requirements (left alone how to configure them), yet they still need to
have correct BARs assigned with no conflicts with other PCI devices and
to contribute to MMIO hole sizing. This is something which cannot be
solved on the toolstack level unless Xen emulates the whole chipset and
knows about all emulated chipset devices - we limit ourselves to
MMCONFIG now but there are more configurable ranges like this.

