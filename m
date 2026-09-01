Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FBBC61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 08:40:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404618.1638275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1K2k-00034i-Jl; Tue, 01 Sep 2026 08:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404618.1638275; Tue, 01 Sep 2026 08:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1K2k-00034b-GI; Tue, 01 Sep 2026 08:40:34 +0000
Received: by outflank-mailman (input) for mailman id 1404618;
 Tue, 01 Sep 2026 08:40:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1K2j-00034U-CP
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 08:40:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1K2i-00345U-KQ
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 10:40:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a968f79-e002-0a2a0a5209dd-0a2a4502ea5e-20
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:40:32 +0200
Received: from [209.85.208.41] (helo=mail-ed1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a968f80-6ca4-0a2a45020019-d155d029ade1-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 10:40:32 +0200
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-6a374bea882so276870a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 01:40:32 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a674a188a9sm101195a12.14.2026.09.01.01.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 01:40:31 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788252032; x=1788856832; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veJ9NDTcaU88Dl+3HnTxohs9tGQY8BP7EVcbMA2Q4RQ=;
        b=htl7JNmjV8L+rdLrg9IKRRVa5Aik/rQFzuTv45LUZOxkNnzPxFs1Cpq2kdpqnofPcO
         gmRX6f4R3PeblOrwSABaiQGum767TT8JZjduqU12A2VtWG0VkKc9nWgHXt7OxHPymIOK
         85ah3GvvpkkHE+0UVgUFvQWv1KvNaflUrfZCKHff0fEoeS0si7wx8lJvVBdg/UhbNiQP
         gfnoGMPoRL8k0IEIQ5KdhDIq5xyYjYdHsEPZA+ULEmIvb7Can96u/JNM1lCtYPvYWLEd
         kb+LrWx/MHHkWwfR94WAz51D/hJOQGgFKLCtsk8bRyKR3H8mjf7aUYz41wnlz67/AesV
         G6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252032; x=1788856832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veJ9NDTcaU88Dl+3HnTxohs9tGQY8BP7EVcbMA2Q4RQ=;
        b=QrkF00vdCdZ5KTONFMI+JgocjJaHarS6YSoKSIpTdkIxieFR5IUJAGdt8cj4B3gNVe
         X0/3OwYeambzQHBy01nUU9OPLomJW/Z05Wou0GNCORQ35ZRSM39LNiimLRURBWr91Cv9
         /wx6WCxnckSrdzlmB+OlMMxV5NrmQqPR4t0wz+HzzdD0ewcYHbZ8CIQgNCAemBe7D0cz
         Ga9uNSp9DZI91S7Jl+tWxGJ30+5Hf7T9sIow5F5N0go+WVUROY9GVcdxqrN21OmKcgIm
         X2eeNe3HEBLvk1fz5w/WvF+dkqAh6kPIGbQXnigNxAjrr4O72klEKW33Mhu6BQ1dmKPf
         xTeA==
X-Gm-Message-State: AFuF++mGbKNL4koN7JKOtjorcoZkthgsT58ySmhKCe4UZX0YJPBtccX6
	gPO7cGBxJFuT3x06IxYXnUpau0EXilv1nR8oUZREctNn81aHm7c5Rc9e
X-Gm-Gg: AYBFou0Fn01sxKiRzRLCjAvYCW8mZl7knig4aAtCsvV1GayaZ5W5idCJ8dozljhXeTR
	pTTBxk9QgpQNfKAI14vFjDGlmw9tIyPQKtUlwo2xJaTX5GW39kXzSmyxUZ8P70zNDHMJ3Rl2vx2
	tGoPds3yb3At33HMLQVGnTBCKqzghJhDhkGfBDfC08LcTQI1jtj3PCrsrCX9UV4CmNXnrO/1HB9
	yf3vl+URGxb/T4oz243o3CcHTkrJV7MIa1khx+gduhBVKNGmejgrd6IcmkN5jRrKzNSVqpbdCbp
	PrMs96pIsywVlwWRHvfXtx+SR/G7IBikYVcX3wi4IZZwpKMDq9Dhr6dVw3ZMdYSxuf3TxFRuTC9
	5x9CKc1xtE+ItnUA52sKqTlDiX9XwLsMtbcOM376i9t2vIfHpet5hL2S4URXeqBmOPtqwFwcnUp
	LJMyOtNI5TaUfCcDQ+Js4IToF5z/GqXl7P3uQj9MLOIFqKBRhHzbbFGcM+aeejpMozJ+h2zsFn3
	elaXiah6BCHpSOotsq1SM86+oRXTCqvoOpkQ9YshicIv+iJVtzz
X-Received: by 2002:a05:6402:3245:b0:6a5:f44e:a009 with SMTP id 4fb4d7f45d1cf-6a663a4a9dfmr3601664a12.7.1788252031604;
        Tue, 01 Sep 2026 01:40:31 -0700 (PDT)
Message-ID: <d584a875-8142-4d50-bee6-41b744755d8c@gmail.com>
Date: Tue, 1 Sep 2026 10:40:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/39] xen/riscv: set the guest's XLEN explicitly in
 hstatus.VSXL
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
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a3ae79823e24f2e18cef2fac8ffffe7caa608f32.1787838835.git.oleksii.kurochko@gmail.com>
 <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788180504.8631fc262581453bbf619ec5b2062170.1a057dd1f6a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788252032-F34BE2AC-8D4F7832/10/73395122804
X-purgate-type: spam
X-purgate-size: 1242



On 8/31/26 2:48 PM, Baptiste Le Duc wrote:
>> hstatus.VSXL is WARL, so its reset value is implementation-defined. Xen
>> supports 64-bit guests only, so program it explicitly instead of relying
>> on whatever the hardware happens to leave there.
>>
>> This matters beyond the guest's own view of itself: decoding a trapped
>> instruction depends on the effective XLEN of the guest, as the encodings
>> which exist for XLEN=64 only must not be recognized for a 32-bit one.
>>
> It's not clear which instruction "decoding a trapped instruction" refers
> to without more context. I assume you mean decode_ldst_insn() in
> emulate.c, but the patch introducing that function comes later in the
> series, so this isn't obvious on a first read.
> 
> Please reorder the series so this patch follows the one introducing
> decode_ldst_insn(), or reference it explicitly in the commit message
> (e.g. "load/store trap emulation, introduced later in this series in
> emulate.c, needs...").
> 

I think I can just drop this paragraph from commit message. Even without 
it considering that we are supporting only rv64 guest we should set 
hstatus.VSXL correspondingly and not rely on what hardware will put there.

~ Oleksii


