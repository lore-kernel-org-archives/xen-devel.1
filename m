Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D7DCD98DA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 09:59:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338095.1599115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ46V-0003Ls-8H; Mon, 15 Jun 2026 09:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338095.1599115; Mon, 15 Jun 2026 09:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ46V-0003Ll-5O; Mon, 15 Jun 2026 09:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1338095;
 Mon, 15 Jun 2026 09:59:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZ46U-0003LW-GP
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 09:59:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ46T-00Bky1-T4
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:59:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2fcd07-bab6-0a2a0a5309dd-0a2a4501a90e-18
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:59:37 +0200
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2fcd09-c1f2-0a2a45010019-d155da2bf057-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 11:59:37 +0200
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-bef47b1ac01so416985166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 02:59:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb44208f8sm451717966b.10.2026.06.15.02.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 02:59:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781517577; x=1782122377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvOnrflD88+bJrA67PceZQyJiHR1Tr9BIneJe/Mfpw8=;
        b=Y7YXXJHjb2Aalqq8DTPCwgdw9dGUXDieYGQS5334t85EbbF7Ph8+phsenNI1SCA16k
         wvKrnaFsfac4kkSJQRk/vQvGQ5ef3Tw3WWqzTttQhvVvER02g1Z3PleW3GD2TWhpylca
         oqz0CCSNdjFnJKrtrcWuAqTUorGTVqVAwWBP9YoW6/q/2F+9owl8ns4AnK1ZLyxAIzTr
         oc/IF1CMMaSmdv6b6ijwaGPEBxzPx5IUyEAqvbsoUNHHELgBqh32qvtObe2uq23uHERS
         pfJ6Uf9KfPAcT57LmBd4GupSmOgzjYlQfxPM2Qb0A4qSc6bDtKqUbD31Mjw15Qel+ryt
         iHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517577; x=1782122377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvOnrflD88+bJrA67PceZQyJiHR1Tr9BIneJe/Mfpw8=;
        b=sgzNxpBOCZdgsI5lzDlqosumMezbUvQsCYptb0FPkvP5KCWCyRhhUvuczGoqy1rWwp
         9M+gx2vltqEDaLiBV7epgzrp+VDh53q5GiDFtO3Kkc/NaAdk5Muq7EZFr2I57i3yuLOu
         Bn9zAw1YWsKBpvv0gEXDjYNDNaPwa61Vgo3tZYOQlEATgcFLlGc+9V770GaFMb1wUTtw
         5qgSzPOGai2niCAFeKLQ6Ob/GpNyVTrebk+I7EVQRcFYvSQi0n1/bBFPm91ympCW13Bk
         q5IXpxZX4uAZBc+D29j4IcYuaNJCGi6UqnHIRQ3db0yu2J2qxMDd8LXSyOTj9mxLgg/y
         6NFA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZW1WBraub/skvlETHXMVTmTKze5hNjOao2XYHVxUtbxdPeLl0NpgwRrjZcCmddm6Vbln+82+Athg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxC3s6WkkFhlmvObZ6IfDAEbTi/8MKC9LkK+ggn1hSPyrhPljIV
	josgBTMHro11pirk4Umvr95VsxqwEdXaJ8DmIedwrkizodntR8tZyNIz
X-Gm-Gg: Acq92OFJ0gEfHGh+MCpzFkYmh3opZBE2U2pYFFDRE1cqT1a2JmeW7NDCf8pmwWLdJcu
	cUoTsn9ecpMc5AnNBo3ZVXy5fmUlFJtw5ez5cxjX8cfLd8YjmsnGrdM0Pb63zN46L8Z/jKykLOP
	bqNJvGZ9icH8Ulwyw3BaQucOv1a5ppsG2u76PBBYHCk5BgKQ16XW1BRgQVPixXe0Ta5r8xmQ27p
	8T2/3Is/ViNLQQ5M796wuNY5dWQzyTbjZWvUeZU7O5SFjg1Agm7vDbXPJEy4XCyHopN5emooWO3
	7EurRU2LcCBjxKRTlhL3BffF2hCIvYywECtONs2M8iVdGshqQ2mjNttZcpEl9ZfOG/DUO+1KzRg
	EfjzZtm41UdpsLNpcyFP6zOsz4BCdhEhR71kIobVAPpRWt75L0rpcvKgkfvAGMbst1Y00k8KJVa
	AGp15SDoZ0GEaOtTnDLV+sYFlmM40R+bytWRgSDNvol+TRLUS0SymcXVJ9+93jPYT1Uo6/nHXBz
	I6fwQ==
X-Received: by 2002:a17:907:e11a:b0:bfe:ed16:2840 with SMTP id a640c23a62f3a-bfeed1638ffmr326200266b.52.1781517577071;
        Mon, 15 Jun 2026 02:59:37 -0700 (PDT)
Message-ID: <7756d00b-756e-4b50-bda6-89540428f6c6@gmail.com>
Date: Mon, 15 Jun 2026 11:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] CI: Use more specific Xilinx runner tags
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20260612180341.3152136-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260612180341.3152136-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781517577-B675CFF4-96957400/10/73395122804
X-purgate-type: spam
X-purgate-size: 1058



On 6/12/26 8:03 PM, Andrew Cooper wrote:
> In order to avoid serialising the testing on both boards, the runner
> configuration is being adjusted.
> 
> Have the .xilinx-arm64 and .xilinx-x86_64 templates choose the board directly
> using a more specific tag.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Victor Lira <victorm.lira@amd.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.22, and for backport to all branches including security-only.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2597755162
> showing all the Xilinx jobs still running fine.
> ---
>   automation/gitlab-ci/test.yaml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

