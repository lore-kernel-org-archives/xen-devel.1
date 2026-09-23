Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66485C98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:48:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430975.1653376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PCw-0006eX-8u; Wed, 23 Sep 2026 15:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430975.1653376; Wed, 23 Sep 2026 15:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PCw-0006eQ-5y; Wed, 23 Sep 2026 15:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1430975;
 Wed, 23 Sep 2026 15:48:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9PCu-0006eF-RC
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PCu-002LPW-85
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:48:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f4bb-bab6-0a2a0a5309dd-0a2a4508980e-24
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:48:28 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3f4cc-f659-0a2a45080019-4a7de14c9dcd-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:48:28 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485933b2522so911451f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 08:48:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488684864c8sm7791217f8f.13.2026.09.23.08.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 08:48:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790178508; x=1790783308; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrcQUm3sMIVns8lk9CG91x+QVKrVrHeCfmAuzpHBQG8=;
        b=sBmBimrpQiE/x1NqPv+jWZ53/NE6ahDM8cjk2D0VV9MG/pyh3EiI3ik5gOhErVuAnf
         ynclKikPTnCb9/wVT3mDr/p8uTwrJBf02RSJJtYe4jDhTgKSnTwJ+6vBQaLCZlinAnR7
         y6oprYjMWUBcNm66yCknVu7Lq/jOkFnGXXTo3Qg5sjfhL0Gc+aBX6viCROMeovqk1hjC
         WXP5Yp3Dqi9p4KUTLK0Ig0yPk7e85Dz7hKTWDai5VP8D5OZDjPN1enO9PODCxpkw8PLA
         9D2od+55tZ89EiaFdUCl91/kN2lj/frXMQKrcVs7wFjfagXmOdx6UnQwoDzMnzzu8zHK
         QjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178508; x=1790783308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BrcQUm3sMIVns8lk9CG91x+QVKrVrHeCfmAuzpHBQG8=;
        b=sL7lxlrc3eaLrS5lA0a6DInqNMMLFFGAl/WvXYt2OD5s0COfHn/hgdioZb9op3TppF
         pih0Hb9CrZw5qvgRv0dVPLl2i4+p6E5CA6Rpeft1/76P3IxI1A529/eTI3rYPKKnYqxo
         SbW9sKq2qSgyZjiFoMrAHOq6h3BhC7AOJwiXEGu2ZAxjgGEeI7eWBLoC0CeNtLT7IrTs
         X3GPDsvERPEqfgh5F8yITst+FDvKycurG4U/LIDbfddO5H4Z5K/TVZZLylwWCtFC0I58
         NdMjvV2Vf3aVWcarmbdDOVvsE76G5kebT1VLp2QXZjUKeG/VutiqFGCjNMWfZnDmxpRq
         xbfw==
X-Forwarded-Encrypted: i=1; AKwUvBwSOKqfThYlTVVSUGJj+rhm2hU042kVlcj16KtWVhvJL8RA1hAldXF1GrEXPD6rJcXKqTa8ePQ6cVQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++kGfYFAVc5sMy/oRF5VPiR+OarG1slmiZM7vjCxeRZC0LYh75v5
	Z7TMjOYRIYgNc0AjTR6pP3sjOvsqXFWB7RzlSMU6+dMOdXe7X9aYl4Sl
X-Gm-Gg: AYBFou2lKS/9k+ss9CoNACQT0/GJO8KAGRXsu27drBnq1k5VhhK+A+sKW74qORhWDSL
	vNM6kkq6oqWZSSAwDygklxaVxt5Qu8OpRg2cSQOW1qN8PE3U6C+xoNoEfIgFGb4nxi7hLzeorwz
	asW2Bcz0svTpbrE5KtV8JKYfUDSgLZfrQwA8mxu/CHfbhSghkNEeb/FKxNv5XMLpsTHrCZte6wE
	Rw2NToC5knKoUw/kVPA022owuR8yG5+W3WfbAZ2W9StvG/IilWpilPUGa4IZ24JNtwaQkpnwXlM
	6OdudwA4/fxbV5/aJoJRy9vn9ZbCRuZ6Uc7QkITm5LcUxYMULQDAQ8BQAZOv+gkNgaTdcMKV+Ke
	PuvpYRpssnHpLiNtOBr0JCEp2+1PFq37dV2l9/A5l2nGm/HQ6XvgfuVwi8/g+hXpP5h04Qqjfps
	0fXpOUGToVb1pZhVv61j9Fhl9mmqqcb7Nu/Rv8+8gxGH6VCwPuAkU8SFFYTi/wyC3qwE/ZmzDOW
	9Qr7hoYwT2R7+XzxEifO3Tgl3b+cfYGIo1Qnea221Q/cCbPwQ==
X-Received: by 2002:a05:6000:2dc9:b0:487:27f9:831 with SMTP id ffacd0b85a97d-488670956f2mr5417466f8f.38.1790178507529;
        Wed, 23 Sep 2026 08:48:27 -0700 (PDT)
Message-ID: <cfa869dd-ef82-4aa1-a86f-f0ada4d6f291@gmail.com>
Date: Wed, 23 Sep 2026 17:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
 <1790177111.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790177111.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1790178508-D5D4887B-9E71D383/10/73395122804
X-purgate-type: spam
X-purgate-size: 572



On 9/23/26 5:25 PM, Baptiste Le Duc wrote:
>  > xen/riscv: remap interrupts to new IMSIC VS-file
> 
> Nit: The next patch uses "restore" in its title, we might want to use
> "save" terminology here for symmetry? e.g.:
>      "xen/riscv: save old interrupt file state to memory"

Not only saving old interrupt file state happens here but also moving of 
all interrupts to new IMSIC VS-file. That why remap sounds okay here to 
me. If it is Nit: and no one else are against that I prefer to still
have the commit subject as it is written now.

~ Oleksii

