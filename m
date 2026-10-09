Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB007CA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 13:30:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444392.1661255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAfb-00033w-6n; Fri, 09 Oct 2026 13:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444392.1661255; Fri, 09 Oct 2026 13:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAfb-00033p-4D; Fri, 09 Oct 2026 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1444392;
 Fri, 09 Oct 2026 13:29:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xFAfZ-00033j-Qf
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFAfY-002mzT-LU
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:29:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8ec50-e002-0a2a0a5209dd-0a2a4507b1c6-4
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:29:52 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8ec50-b4ea-0a2a45070019-d155dd2cbc3d-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:29:52 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso2663425f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 06:29:52 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acc936sm3871405f8f.44.2026.10.09.06.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 06:29:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791552592; x=1792157392; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YUWeuiFsOPNVbMIg8/ULg3P/7iHi93UDzAgRV2VBvgE=;
        b=WTRdnkPQUnVr+Wx4yEF0avaWn0Evk1wl/tM2DOnMq4uhK5hlgDaGVb3Agiie7fc9UN
         IMo1lT+9W8P/x3kYMyeLvl9nrHf0iFoX1XPMZDncn9lO20SqCDflqCSYNq/2yfiVkuRg
         CG7E8jcZgWKAy9cnpNORA+bppFNhfnNfjtlZ3ApUbnQ8WSOOZILAJBWv+egB01fYZnEI
         VJrqJ6Tb9QvEcfsvNkcHwovsrCsWfPpWiDoe61ah5luJ8ltuuY/tpJDr9gNXrW4f4+oo
         x2Gy4DkyvJ9AVBpjbT76j3HXQgjVFNtLqQuPUjjE5ko0JkKdaKQzo39Vr11AIZL8cUTX
         5zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552592; x=1792157392;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUWeuiFsOPNVbMIg8/ULg3P/7iHi93UDzAgRV2VBvgE=;
        b=CdUZCIeCCoDV5rQ3dzMB/3vy16Y1QZ4ztNIIHejJjG77ik0F58DMyJy3HBYRmt1Ow/
         ckuQSHQ/8C+Zp6+0KU3EyWFbEF/RlK8Pt9gj0spTuBpEuYSCRhSqDiYtsQZjOkfMadlQ
         xpA1M/hrR9eE9dHBP0Q+vEM/eTeilxmjSOZUSYawYwuiCYG/S6c88k4ajw9KmcG3lXMX
         NoXE7dIIjtTHPAbQvbQF/95tqCGToRMcPuxMCMLxSl41F1xT0Qr48fQr7uqYmKBhHLgG
         pdONB7fpYsplNdu2NbtQ3fgfHjOMOnLfZTCi0dzWuEXjaNFhU16kdDqbFT30XC5SNt5a
         xGXA==
X-Gm-Message-State: AFq9FYItKQ1GHXEyeeOEHHxRObXziaHeOoJy+ryxUtjQlc/xVCPh4Toc
	G6pBFRD0mLG2ZhOUmhoSelH11cI7gb+dut3ee+V9zNkwVAfA2R8AzlMy
X-Gm-Gg: AYBFou1uwbmA77EwGyif04TJn4sb+I3Yh1nTxFOVozrRvya/nEQgsWCuaz/trmTEisJ
	SiAClF4k8rhdEVPxbeSoFAEdOn428Gh9T8IVnjkKhiC3L8cKMdbBINmuOdk9qqbC+qbrPmrRcxi
	ywbfo8nJ0+T2ytP838mOKf+UtAcpWyHcrK62+xWkMsFIBF6ZWI4jCDQG/V/y1gFKdCIx5TQPx2y
	at4pzsVmhZ+u0CJkCknivzJsZQHADdA6gFZITmyWeLWRWO1fN+aCDB6kfCm9oCP6SQNZQX5Pumz
	0wlbLOwAIFidHXO6Dp7in4pf76O899la8JtVylOYSVVzls6isX3OKFwwQR4KJGZovqlV4wFnYDd
	tP8DuNtszYEmsdD3NWE6LSyNVvjeWQuJeoCCdFipNvx06cOx/zrhZ8CSZPt5TT244hG+hWZHY3+
	qb4UVENHIgrgTe+SMPwtuUQ4/YXnSRdoQS/8sSlfHhvYPBMmF9J0t+pnbTKqa0tZJjWCGFHw8D0
	3fOamgLyPqqsX1q8VnxMNQ/kCl6KgZZLQNWz7XKKfDn7uZc5w==
X-Received: by 2002:a05:6000:454f:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48dbaadb133mr2609638f8f.16.1791552591955;
        Fri, 09 Oct 2026 06:29:51 -0700 (PDT)
Message-ID: <addf6f65-f540-4b6f-a8e7-283969fdeb7f@gmail.com>
Date: Fri, 9 Oct 2026 15:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/39] xen/riscv: introduce csr_volatile_read64()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <af8a07a676749b83cad27332e88bf433f98f22e1.1790779209.git.oleksii.kurochko@gmail.com>
 <1791194530.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1791194530.8631fc262581453bbf619ec5b2062170.1a10b8382510003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791552592-366DAAE4-50FF18AE/10/73395122804
X-purgate-type: spam
X-purgate-size: 677



On 10/5/26 12:01 PM, Baptiste Le Duc wrote:
>> On RV32 a 64-bit CSR is accessed as two halves, <csr> and <csr>H. Reading
> As far as I can tell RV32 can't currently be selected (RISCV_64 is def_bool y,
> no RISCV_32 in Kconfig), so this path can't even be build-tested.

I've tested that manually.

> Is the retry
> loop really needed now, or a least in this patch series?
> 

I think it is worth keeping the retry loop now so that the code is ready 
if RV32 support needs to be added in the future, reducing the changes 
required at that point. It also helps explain why a separate 
csr_volatile_read64() function is needed in the first place.

~ Oleksii

