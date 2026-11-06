Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF9606A32D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Si9arya
Received: from list by lists.xenproject.org with outflank-mailman.1476560.1682603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPJ6d-0003KJ-Kq; Fri, 06 Nov 2026 12:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476560.1682603; Fri, 06 Nov 2026 12:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPJ6d-0003KC-HX; Fri, 06 Nov 2026 12:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1476560;
 Fri, 06 Nov 2026 12:31:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPJ6c-0003K6-2U
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 12:31:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPJ6b-00CtaJ-FJ
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:31:41 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedc8aa-bab6-0a2a0a5309dd-0a2a45088d9c-10
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 13:31:41 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aedc8ad-f659-0a2a45080019-d1558030e104-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 13:31:41 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so7274255e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 04:31:41 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e1b5d745sm51679815e9.6.2026.11.06.04.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 04:31:40 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793968301; x=1794573101; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VekLoelMDz98u4a3t38Xf/FqPMtqclmZQXjTRdGMY/4=;
        b=0Si9aryadhTqGU9jI2dIlcOYwjfUk4NMNkYMV+A0+K2xZ6HtLYTJ7OToPuQ9C0ixQH
         JV1LNNOpek9ruW171N34TX6jyw5AAh97PlP7mW+AeGtd3u1ZHTG7I1XRJMnswO5QFXl6
         XC5pKzvwuaSKCeg4Kfkf8+ErDk1e4+JrgM/5Y8DkhRcN+GUasjO5qQguw7SjI9GJEWyM
         /YzGdtXwbmob+SBfOlJWpqd/Ywmc2jkZ+3nGSvVPt0Mqhgr/H6lUhIf4s2wWFooR4znS
         efmPW4MDubww0BMee8gKWZuQQQgvjVPVjY0LbX/ioAGXBU4O1EFJxVQjdlxo5DbI4hN8
         Wkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968301; x=1794573101;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VekLoelMDz98u4a3t38Xf/FqPMtqclmZQXjTRdGMY/4=;
        b=Dbx4u/GCo8LC+0K2GZuJyHjSDA4lU0RiLnLS2rfvR1z0cPRWvkB2IouFxGVqfr+7/h
         RMzZiNz7FRx/kczy8BEBLcL/hgEkUvUu8C4SB9OK76CQGoAy9aKoKoD+v4zyn9BMAJWN
         gI/gK3rnqQrJ7HnCjpKh3prX39lrx/r0LDQo86I4Kag8ceqoWpMDkRaM1wjPZcf2jkeb
         TeRrecn+YpVMzhcKvZHoRuM9xhbWBvwT6384NVrO2yd5tRpGpytQKk824RRqwsHtGIgx
         xJVzB/rxnriYhGCt+yUzKLs+OZXy14cOFs9SJKlQh837MDH6DN/FyPDZfbWdWuP7TVOy
         aH/w==
X-Gm-Message-State: APuU4Z9wHSenNzfOLBWoCZMDyQ9JS125H3XvZ+j1VsRnWBS1nY7pJKZc
	mFC2gAXyREVC/lnF00RrCA+zsveX3zq+6Elxef0lBm0TnICHcqbCSWbf
X-Gm-Gg: AYBFou12Nf1TkbhmYtjQGn232EWIVHD6diFV3ocDtSJ8LiPCOr9qQeqZq95jbkCNiZz
	GXhLZPSjfL8snskPoxcDoEnNyHw9fSZjVdG35+TjNQptZht6+6EcPxLtzzxxAFhdeIugvIVsOos
	XU1r6xYFOxZJt+d0pI0Qmyo6Ywlf0M/ay4l+t4y4gjOCtX6JCuzIjSoKQda+pgBwIsNRIXwZkHe
	oSzMSSglwJNvdWPRRE+6nQ2cvd3FT8EQ4zKrrj/zD5OFc+MuoD5z1FU7S8/ORB1kHdmvB+HYo5f
	Gg064/mTAi3Xl8tfIrT194xENbRUDAOLaxxGw8JQRSWRRG1sTlG+S15z26d2X03qBQfsHG8Tbh4
	wgfa4Spj92kqXfkv4ntuJV62NRaqUfZAYRQUTxzBRlepWYlhKWWbQPvhZSvI8MVDli7GN4Wr1MX
	9pNx2Pwy7wpeNHAcSqfcieI1R8G0yvmYmfpNKzx/8qvKg3NA4hCDrOKF+c5aOv10ZVa+HWGvonN
	EitgCtmml1wZwgmPfclqGvqp+SxwMGtSeDeZIqq81frglm3I9IuKkzrcn9ULpcKPiQFSvvmVq+n
	ZjIb/sasDgZyvgKL+Vi0O3NLIGoCvSlBIiFbjrYg2bSxbx0YiDRHT9tN6f6I4vRH8scPjWImKhW
	8
X-Received: by 2002:a05:600c:8b01:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4b6dff841afmr40066665e9.28.1793968300840;
        Fri, 06 Nov 2026 04:31:40 -0800 (PST)
Message-ID: <9611989e-a1ef-4bf7-af80-b96d6c3a68ca@gmail.com>
Date: Fri, 6 Nov 2026 13:31:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
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
 <fa5788d0133c98ae3feac474da325239d27ed153.1790779209.git.oleksii.kurochko@gmail.com>
 <1793804802.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793804802.8631fc262581453bbf619ec5b2062170.1a1a71918bf000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793968301-D654487B-EE2C8A66/10/73395122804
X-purgate-type: spam
X-purgate-size: 2725
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/26 4:06 PM, Baptiste Le Duc wrote:
>> Introduce imsic_vsfile_attach() to give a vCPU a working guest
>> interrupt file.
>>
>> A guest (VS) interrupt file has to be backed by one of the hardware
>> guest interrupt files of the pCPU the vCPU runs on, so that pCPU has to
>> be known first. arch_vcpu_create() is therefore not a suitable place:
>> the pCPU assigned to a vCPU can still change before the vCPU is first
>> scheduled, which would mean taking another file and remapping the
>> guest's IMSIC page to it. Call imsic_vsfile_attach() from
>> continue_new_vcpu() instead, i.e. when the vCPU is scheduled for the
>> first time; as that isn't an __init context, neither is
>> imsic_vsfile_attach().
>>
>> Giving a vCPU its first file shares most of the steps with moving it to
>> a new one on migration, so move the body of imsic_migrate_vcpu() to
>> imsic_vsfile_move() and use it for both. Its first_attach argument skips
>> the part which moves the interrupt state out of the old file: the vCPU
>> has never run at that point, so the freshly acquired and zeroed file is
>> all the interrupt state it has, and hstatus.VGEIN can be pointed at it
>> right away.
>>
>> vAPLIC target registers are reconfigured on the first attach as well: a
>> target the guest writes for a vCPU which has no h/w guest interrupt file
>> yet only updates the stored copy, which reaches the h/w at this point.
>>
> Nit: I didn't quite understand this paragraph, "only updates"
> leaves out that the h/w APLIC write is skipped, because there is no file
> to point the target at yet. Maybe something like:
> 
>      The guest may program a vAPLIC TARGET register for a vCPU which has
>      not run yet. That vCPU has no h/w guest interrupt file yet, so
>      vaplic_mmio_write() only stores the value. imsic_vsfile_move() then
>      writes it to the h/w APLIC on the first attach, pointing to the newly
>      acquired file.
> 

Agreed, I'll reword it along those lines, naming vaplic_target_write(),
which is where the value gets stored, and vaplic_reconfigure_target(),
which is what writes it to the h/w APLIC on the first attach:

```
The guest may program the vAPLIC target register of a h/w source for a
vCPU which hasn't run yet. That vCPU has no h/w guest interrupt file
yet, so there is nothing to point the h/w target register at, and
vaplic_target_write() only stores the value. Hence imsic_vsfile_move()
calls vaplic_reconfigure_target() on the first attach as well, which
writes the stored value to the h/w APLIC, pointing it at the newly
acquired file.
```

> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 

Thanks for the review!

~ Oleksii


