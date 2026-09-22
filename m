Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9375CC982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:50:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429078.1652018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91p2-0004Ht-CW; Tue, 22 Sep 2026 14:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429078.1652018; Tue, 22 Sep 2026 14:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91p2-0004Hm-8y; Tue, 22 Sep 2026 14:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1429078;
 Tue, 22 Sep 2026 14:50:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x91p1-0004He-9O
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:50:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91p0-00GLD4-MG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:50:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab2959b-8faa-0a2a0a5109dd-0a2a4505e8fe-28
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:50:14 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab295a6-4cb1-0a2a45050019-4a7de14c96fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:50:14 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f633cd78so7832f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 07:50:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862775412sm5638432f8f.10.2026.09.22.07.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 07:50:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790088614; x=1790693414; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlqJcAaLUHpOAKZ2E3y2oDjiN8GgNL8j6yICFQt86Vg=;
        b=JPKosG4FduEInV+o5oUTNRPYqCqcN5ZQ/SKZ3ffZ6Q++vCySHJeXY9Dkaz0SEwiFFZ
         T3h1rlBnadgWSsU+rGDCRY388XPNuAmSMyj3RvHUsgck5vcuE40uLc9+11SruxnofnYN
         q6Bl9luZa5XUuAM3Mq6GvVMhKb4rIm6OqGgLbGuwIQeEe+FUMFzxewYh6hbQT4Pk/xXZ
         ZHy7rinaSBr/3XuJBkcoDbGWZqWneJH8KFrBrpCAnIUFU0APml1/vo+4yz5eCRvaU3KY
         YjGkxYtRs45W9cycQfN5kcjba19zP4sjQllVjbVU1pqIcG17DtxtuslVhFvBvOjxYOn3
         y4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088614; x=1790693414;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlqJcAaLUHpOAKZ2E3y2oDjiN8GgNL8j6yICFQt86Vg=;
        b=g0MnpHJKVxxA6TnjjUZgn7JpFNIW4AiUeYSn958C2iy1pOLOsP38ALtfwArKEck9je
         2Ws6zmdWa/1RrVOeWeR6Cd2PMfULn0uJjo67JAPGxqaVanId8z3rwarS3tIrTzLswz5M
         XiTr1fwFe5QanyXlrgUSI7C5g6nThHBiN4CrI7KRcWXA/YTNbgBnlu8wTxMB/be6tYPO
         cPKVZdCMZBalVupUTNGV/zR7Yi4Oxpm87wYPTgjr16FIy6Pno8LiNC498TVXuPrbYqDW
         CLejyLDijhceuONVXCs/6zogGiYLmcVeUfVBhfs6MJVLaDRfKdGJ16+rrYFQ1PYhdE7o
         pX5w==
X-Gm-Message-State: AFuF++mvcx0EwuLeP/+zmE8WbS5xelcZ9wn4SCMHldiJjyEZY/wlXidg
	z/II8XMqkO47UhX20q2o14IsJVgk9nCNWRC89MlQJxaxX4PkfeYMwqyv
X-Gm-Gg: AYBFou0dOLfcV5hBenfo8QFVEd07A6azxW+sZ9wRzvEzRQf/ZQv7UR8nhnz1W7EmuJy
	a68c7UwOOUsB/LL29acCa4eDksf84JYnqkI+8YF1RAK8E6fCmfXIMNG/Je8lo/YLiEaAwaAz16a
	od2kncNTHKdhSt0QfRAoyPIH/ZQGW+Ki6kAvxpmorD6yhxOK8IKBYv9Kb3QEbw1aPyh1lJH7kuH
	FTHDHShdv2glP2aBnFvRZF0ltsuUrOc53k5dD1HxYH86OFBBCoisPKHHX2Mlk9qwaqTF70hh9Ar
	A1eH8JFAtbEs1Z1fMAXkUDIbs+gxf4WXVJp5IS2zpvKVAuVbqFnXYLoBE+VL/Ix/js7zuH0YL1D
	RpZy7usU9oY0er3Bbv1h9nHfzKLFLKpZBHF3qpo3NvNhA02KVzgWmUwH7l25o60iktCn/NfXwX/
	a+9w2XgzoLiva0mXsBG3SzNREiZQxDopvO9fDkbaLPuTB8RCshxjV+ulFBwiHqVcTBy9gW59DrA
	vKDiYw02G5NNuDMpqgsRYAWRSvkRH7Z+A7GDHv0risKtXtwFg==
X-Received: by 2002:a05:600c:46cc:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49fc566951dmr197506265e9.7.1790088614004;
        Tue, 22 Sep 2026 07:50:14 -0700 (PDT)
Message-ID: <69cdf366-06bc-4989-b060-935c9e0c8a4e@gmail.com>
Date: Tue, 22 Sep 2026 16:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/riscv: make Zihintpause no longer a required
 extension
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Connor Davis <connojdavis@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789032898.8631fc262581453bbf619ec5b2062170.1a08aaba10f000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790088614-73EB92A1-82AD5A61/10/73395122804
X-purgate-type: spam
X-purgate-size: 954



On 9/10/26 11:34 AM, Baptiste Le Duc wrote:
> required_extensions[] panics at boot if Zihintpause is missing, but Xen
> never actually depends on it: cpu_relax() only emits the "pause" hint when
> the extension is implemented, otherwise it emits `0x0100000F`, a legally
> valid FENCE instruction (`FENCE W, 0`) rather than a native NOP. FENCE is
> guaranteed by the RISC-V base ISA, so it never raises an illegal
> instruction fault. With an empty successor set, it enforces no
> memory-ordering constraints and thus architecturally behaves as a NOP.
> 
> Drop it from required_extensions so hardware without Zihintpause
> still boots.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> Changes since v1:
> - rewrite commit message.
> ---
>   xen/arch/riscv/cpufeature.c | 1 -
>   1 file changed, 1 deletion(-)
> 
Please update also booting.txt?

Thanks.

~ Oleksii

