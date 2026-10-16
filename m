Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19051CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:47:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452278.1667099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHk9Y-0002z5-J6; Fri, 16 Oct 2026 15:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452278.1667099; Fri, 16 Oct 2026 15:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHk9Y-0002yy-G4; Fri, 16 Oct 2026 15:47:28 +0000
Received: by outflank-mailman (input) for mailman id 1452278;
 Fri, 16 Oct 2026 15:47:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHk9W-0002ys-A9
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:47:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHk9V-003Nn9-N3
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:47:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad2470d-e002-0a2a0a5209dd-0a2a45039244-0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:47:25 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad2470d-fae8-0a2a45030019-d155802ae03b-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:47:25 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so878175e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:47:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce33155fsm40400185e9.4.2026.10.16.08.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2026 08:47:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1792165645; x=1792770445; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEOTIyI/7iHiVCiArbx4fo1wrJjwQQbrWcpJTd/CzYE=;
        b=V6RzvHcOpTF9+NIFsMj+MiBQEKgRhSh0+Ylp5an6v8roO/lErRQlhb39SOn0tG1Nsd
         HIw9zX7qifNu/0BduTWGCkHf00HZh7pupTlYSYVytbDNYrN67SGqFsk9oivUYwVuxCHn
         YHuDPlToe1pfK6GwZvS9Zj9cLGBdGNFrGU6+5BVlkPSWTNiKeVMAfx0/4K6wkC0Ibob6
         M1Lw9Uhiv4HSpDXiDzDVHp3UYy9cLhKB6TJwNEUO4sxSx0LvqB4XOA4VVTHwI8a7zrvl
         1UWLErrgSnpLm/DAb7Ztx3Nlkf8k7+WUOZP6dPPegbqOcz/+vgeZvG+RcTtThHrCD0IB
         v6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165645; x=1792770445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEOTIyI/7iHiVCiArbx4fo1wrJjwQQbrWcpJTd/CzYE=;
        b=ohF+mcQdFMiZqzLsyYlkFbWSsFO65dOPX4+7Ct2+K/p3JFqU2gPJ4RLI73EoJkunVu
         gimseqIG/pQDNRgLeioXBgu+XzbaSG0xeX3ayzHtMrr5PHgngYFIXdJi15koTi9KAXev
         nYMG3dz/Szih6VJ4Jng/ZJ1ySHsC34jhIXIj6fENCAa0C83V95G/K38V+Ol+S9SRyTdr
         2/PmY9DLTXz1YybNTa2y6gHcBfp07sJpbzLPgocwbm0tPQjUXzDpXYqtawm9aMY5X98+
         FvD3WpABSRGm0I9yHsGQ763vUuw4KU24hrB0ZC2KkB2e9cF/Ce7wlWBgR6odT5ic7AwD
         r32w==
X-Forwarded-Encrypted: i=1; AKwUvBxyyY2Joc96F46g/EBo/S2OFQDUUCM4e3U8OMi10YGXyDpm9FtBow6Co37Pe/vhM4G6yp0ABrLgC3I=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJIbgn/YbJM0yZwkr4IXe7AUdhTWPzCLrXb/RQfcrDbFN4CTehK
	0+xagr+x2AAKHIg8yCay0A4anGIy4xOR1l+oDey5T5sCnnTiPupGBX5L
X-Gm-Gg: AYBFou0Req4SkvSE3D2gH2LtHdi62EzoGVdelxaWIFyW52cq06y88HllV9JZQK0Ws81
	vMCqW/a5q+gFdKgNUL1EmY0LmNguCRjFWwwn8R4TgV1xl+6OGjOHPmut+wT97955fUvjLaJ0FcI
	2dULWQfKaD7D6pn/gUz2/MX1/R6PUS9Bd6IqIGWen8I9LQbYCZwFvhOO1fZtKR7yw/YcGJLxE5q
	Np8XA+Q5ShpUZXMy3d4u2ixpSvtJ3gdCMDDOQhzqIUPp+iM/7pvJNfCzISJQfwF99lrMbz93mBK
	MF+/VNF8/JRk0iHhRUIsaw+uciqqtvIOMGj+dyDc/fR0+QC9vuUbT5Y5hfyDdnBAADZKtuNPhdb
	hWNpyPsYRPzh7cZbyMxLWzSI9zzSfT8kez6tZ41TiPkuvQm5g2vRobapjN2Y6CLSkFWYcsr+045
	zrAJyOcszgcpkFV7yX4RS9VqFOyOoP3NYfUUz00kv3jLdrPxoKR1Bb7/Bko2K966VNdYEPWayMQ
	WjF+X00sUmlnjtUdFiMEvb5P387fEnYgsgfIVXiFFGqNx4=
X-Received: by 2002:a05:600d:864c:20b0:4a1:cdd1:5144 with SMTP id 5b1f17b1804b1-4a1d7616470mr3210175e9.21.1792165645121;
        Fri, 16 Oct 2026 08:47:25 -0700 (PDT)
Message-ID: <016b34db-7c9f-4c85-bf87-2d2d95394e98@gmail.com>
Date: Fri, 16 Oct 2026 17:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] xen/riscv: rework the A/D bits comment in
 p2m_set_pte_flags()
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
 <1792164867.8631fc262581453bbf619ec5b2062170.1a14559acd50008425@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792164867.8631fc262581453bbf619ec5b2062170.1a14559acd50008425@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1792165645-75A814E9-69E463FF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1072



On 10/16/26 5:34 PM, Baptiste Le Duc wrote:
> The comment in p2m_set_pte_flags() quotes the spec at length to describe
> the two A/D bits schemes, and its TODO mixes two things: why A/D are preset
> today (OpenSBI delegates the resulting page faults to a lower privilege
> mode, so Xen would take them with no handler) and what remains to be done.
> 
> Summarize the two schemes as a short list. The reason for presetting A/D is
> not future work, so move it out of the TODO, next to the schemes. The TODO
> now keeps only the later work, handling these page faults instead of
> presetting A/D, which only concerns Svade as A/D page faults cannot happen
> otherwise.
> 
> Also note that presetting the A/D bits is harmless when the device
> tree advertises both Svade and Svadu and the platform uses hardware
> A/D updating.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii

