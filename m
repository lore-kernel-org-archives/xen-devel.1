Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E20BCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 11:39:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440760.1658202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDh2S-0005Zv-BL; Mon, 05 Oct 2026 11:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440760.1658202; Mon, 05 Oct 2026 11:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDh2S-0005Zo-7I; Mon, 05 Oct 2026 11:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1440760;
 Mon, 05 Oct 2026 11:39:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDh2Q-0005Zi-QE
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:39:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDh2P-002YqE-Kx
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:39:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac38c52-8faa-0a2a0a5109dd-0a2a45098662-32
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:39:21 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac38c69-be1a-0a2a45090019-4a7de14ce892-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:39:21 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so874475f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 04:39:21 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622b4685sm2842188f8f.41.2026.10.05.04.39.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 04:39:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791200361; x=1791805161; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmv5cV9J45IzrEmzzApVCv0BACGbAAMXyB5sX0/0UOU=;
        b=OI33iDzjtIi+HyHHEh08iLP3TxuvguwwupbNj3bSPbgYerK5FCzSnqkH6HjR3pB9eY
         XbY6IwX7Du3aAEgSAJ7ABqlgzhKgJ6tqzILXkZBMzzjxUPXJhKNGsdvgrrfOvNwbDByw
         CxyDKrCxK7U7/fFRvRFWUeTtIaZpzX1LsGZ9nL+FZBa+STk8WTlnKFEVNm8UgcVzbEWf
         ivULD4W4dCT2nOz9Wj6TKxL/4tuJ/60NA/SxjjDOgr8oHrdoHgrQRz5dXOP/J/RX9wjB
         iZ+aw0R468NRFAdqQYacUYrm6UWzUZGYw0weNC/bBiCusTtInEo143Rap+BB4JGcVZ9k
         /bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791200361; x=1791805161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmv5cV9J45IzrEmzzApVCv0BACGbAAMXyB5sX0/0UOU=;
        b=dLceVScsn8ZrRZLNMUGMCp5A+TSKytxpqcgGHuXACxWBTv3vhJB3HFSrDK2E7Uh4wW
         RH3fsvYZxb/vSFSuuz/cf6Ad+UGTPvy017gCdK3YLQsBXBG1FCyUSevYt6b63hgzney9
         aZOcEIetK85+AdLla27a1ZRFgwRWdC2inCtXLEJDSJ7ev3X95vlFn59XnlGHLizuYMw5
         j17nXU+TeOdjEBlOv9A+k4PvkaAIXL9ycWbRof5k92W2jiBd5XIqj+c1wuKbdv5ArXz0
         QJVC58mnSHKHAHNhNrXjWDxWcdy1Qzs4Yfhfx3jtuA7L67aWEyXJcInhqET79KSwzCoU
         PK8w==
X-Forwarded-Encrypted: i=1; AKwUvBxd8s3VWMJHZ7ZnNVSykrFaRaxUxkX65Q4ykP3WIXe0FukUioaPIhA059kVAEciPBn2UJims4Nxy+8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLsyzzS+JQU8Ptdv0SxPjeNx28TatU6VMd5sH3Z683XlKywo5it
	bDJuCcQJeVZnscS076oLtFW7VQl3jm+imlBwl2AVWdYWI97o5Vc0kmEp
X-Gm-Gg: AYBFou0wNvp+ikUmDHu5+chG5Z0gnpInj/GASJitC1oN1y1eLCk9RbM+vpj61dCiTIY
	gw8MubebKmXYQWc0MJjttxjrySjsKogqiDHHV0gsiHBc3tcmXc5fRTl+fQCly3uzghKn6oBRy4+
	weHGMbg2Pl4aHWhpnSQNsazPDrHgB4r1WZ/NcYk63yMIQcA14rDGBRYuevIvkayqg2aejIsDcjs
	R6Bg5ct7oFGXxE/TO9yW3FOKam5Ms8kVV8d7wzNonYr5rcB+75Qz8o+uwusDG9iclGQG0EH+4R+
	HZ46gLG3TE1wihY7idsPGM+LnpjNNKMix50XJACjzP5RMJnB9qNVpfqg/9VJpAbL7XqrkV5gfqP
	xQ4BJk6dgiOHmLf+sgNSqaKto8RLtRSbviB98K3P/Gvi62fhaM+NL2+BQXisWBvYxDpMfnc02R3
	pjd6FnM69KlLGplwmol4G6utclgxds6/rVGEze5Mz25V1EPrao7Pr/4jzaNA2hL41dGql+FciRG
	C5GDri8m/vuBOi6wBsdXcc2k1rhvvlhO2uqpNomY2jcbhZEMQ==
X-Received: by 2002:a05:6000:2c0b:b0:487:27f6:a4e5 with SMTP id ffacd0b85a97d-48b1275d69fmr19087354f8f.53.1791200361007;
        Mon, 05 Oct 2026 04:39:21 -0700 (PDT)
Message-ID: <6f23075f-7a75-41e5-b34f-2cbbb3bc66a3@gmail.com>
Date: Mon, 5 Oct 2026 13:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] xen/riscv: fix boot on missing extensions and MMU
 setup bugs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Zheng Zhang <ZhengZhangzhangzheng@iscas.ac.cn>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791200361-39EC6034-B6A7ED15/10/73395122804
X-purgate-type: spam
X-purgate-size: 1243



On 10/1/26 11:04 AM, Baptiste Le Duc wrote:
[...]

> ---
> Baptiste Le Duc (4):
>        xen/riscv: rename PTE "permissions" to "pte_flags"

I think because of this patch is already in upstream/staging (and it is 
small difference in how if()-check is formatted) this patch series can't 
be applied as it is. But it is easy to resolve by just doing git am --skip.

And as a result ...

>        xen/riscv: always preset A/D bits in G-stage PTEs
>        xen/riscv: fix A/D bits in Xen's page-table mappings

... doesn't apply on top of the current staging. Hunk #2 for
xen/arch/riscv/mm.c expects:

                 if ( is_kernel_text(addr) || is_kernel_inittext(addr) )
                     pte_flags = PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;

while the tree has:

                 if ( is_kernel_text(addr) ||
                      is_kernel_inittext(addr) )
                     pte_flags = PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;

It is to resolve but it seems like this patch series needs to be 
re-rebased on top of current staging.

>        xen/riscv: use pte_is_valid() in pte_is_mapping()
After fixing the things in the prev patch I was able to apply the full 
patch series.

~ Oleksii

