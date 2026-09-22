Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631EBC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 09:32:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428404.1651165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wr7-0006f4-3f; Tue, 22 Sep 2026 09:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428404.1651165; Tue, 22 Sep 2026 09:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8wr7-0006ex-03; Tue, 22 Sep 2026 09:32:05 +0000
Received: by outflank-mailman (input) for mailman id 1428404;
 Tue, 22 Sep 2026 09:32:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8wr5-0006ep-4P
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:32:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8wr3-007HYj-TC
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:32:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab24b11-8faa-0a2a0a5109dd-0a2a4507a43e-2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:32:01 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab24b11-b4ea-0a2a45070019-4a7de18dca93-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:32:01 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so26669105e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 02:32:01 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862793528sm3070982f8f.36.2026.09.22.02.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 02:32:00 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790069521; x=1790674321; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6txrKKIdewS/4IWM8zB6ZXA+n+6Cw235XWiPcZD5b0=;
        b=Z8oyp1nKygwRFE1hQI8DrstfianxjkJp8Spntpt+o6/ybjJ47EoyJnAUyVKdQ5Z6QM
         JxC7F5y8n4LXNNy8Q0pO/qDF4ot5Ykl7BQDfm0SC6mKwr4NZeLDD95InXM/KCdNQTzp4
         Yg3NtgAFVs8vBLahOaWkSGAfJT6q6+oiK4vzpu9706dBy8FJSGiUPd4LxokfhntOM8QV
         SI+SZ2Yd90zEQC+gYyLX3PIUDCYU82XN2hJyR5WcKaOuYibKLkJl2wk/AA/kO1IZCtkf
         ypYunbUQDiO5hjzE1ySDgeWteYeD0b1MtRGMRGTdlWFxEsyXX4z1zcNc6E+FJmjNreKX
         W7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790069521; x=1790674321;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6txrKKIdewS/4IWM8zB6ZXA+n+6Cw235XWiPcZD5b0=;
        b=eE1EuKnbzLF7WubyRjyOGijLAi+YRlFFuC+4dHMqfSNBHpFjCu9C3aQUQXClCNGWT1
         XBbC2OPO2lBi82l05CP2CRvvg7Pp7XSFNy3VEsOFZTif48zumlE0C667cfNTQW8qtThW
         S0ZTNdCPOqo/F/OOOl7ZzPnXxFzKh8WTekmT43KE0T/f461SJVpo/e944/VlAFHYRF4R
         hmqteog+TDyPnnflXQa/hRaA9vs8ZqeWHNxVmoJCPILyBK2kiasg4AhDGihBlU1hlkiI
         SCBPE+nD/PgQZigmrtilaZ1BFUrkdlMuMKWtd8UPZjVL17lfci9ofWldkIb8QQPJSjaG
         keWQ==
X-Gm-Message-State: AFuF++nykX+MnhNnMzL0ahw0RcSE1K3EYf7BJ/wLaXv2bRbXDjWmhRvX
	ce1yoT+1afGCrTLkbFRO5+pS7xdrKa/sVnum5hlCCbnJ4JIQ4r6zU4N5
X-Gm-Gg: AYBFou1yDcXuzJx1m+V40OI0kkYoK1kVP8JOAXuiwWqd0pNR1Ha3WX+bIct/HFrUWQ8
	C1+tDT/Wmu4fZSQMklPmv9M5gYn7xYb5oEy4tJ0SnIx8OskOZiNWAQAj4G0bBUDo+fGAzqgybbR
	PXZcHYn+J3ssajjIb7uA4q+yHm68nq6gH/FArK+ehBSfGwO4GJtTU2vVaRWzyNWEVIVW/6wFUup
	Ahjw7vCiuFPzana92FMw/kIUk/ONo1vG4axj8l1J8BhBDTdkln1IzGNY+efkEzTL+HQVE4JI1tk
	XH+3BO2IMSxkgaURnSvvmHOq8vO6tWLL5IfM91gAGzC4z/9mRByYlnxn3UkyTba5N9xbsK3FmAE
	lqJN850vw44utf0v4TzepE8khZ/3tsKNsn8FJXtXoKqj1NqC5Bh+V/66zc2VDYX+XGA34DM/HDm
	j7W4bpdO0TsTNyYANpYq+Tsm3nmHkm2hDJzx6IlxqDM3IM9nowoOiD2U3SGN1OSLZRq0oDdl5fk
	XEWD6KW0+1ERpJrf0ivgLNYihNVDBHhTOZYANl3JeD2q4Sjo1Q=
X-Received: by 2002:a05:600c:4e8f:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49fc574c2b9mr197641595e9.31.1790069520632;
        Tue, 22 Sep 2026 02:32:00 -0700 (PDT)
Message-ID: <d75bafde-0b28-478e-8fd0-99535647a640@gmail.com>
Date: Tue, 22 Sep 2026 11:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/39] xen/riscv: look up the exception table for any
 trap taken in Xen context
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
 <c8c767e5932057e1fe3ca7756246ded691adad4f.1787838835.git.oleksii.kurochko@gmail.com>
 <1789721100.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789721100.8631fc262581453bbf619ec5b2062170.1a0b3b0c18000072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790069521-3C411AE4-A8230B4B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2257



On 9/18/26 10:44 AM, Baptiste Le Duc wrote:
>> do_trap() consulted the exception table only for CAUSE_ILLEGAL_INSTRUCTION,
>> which covers csr_read_safe() but not the hlv/hlvx sequences reading guest
>> memory: those fault with load/store (guest) page fault causes and would
>> reach do_unexpected_trap() instead of their fixup.
>>
>> Move the lookup ahead of the cause switch, and gate it on the trap having
>> been taken in Xen context and not being an interrupt:
>>
>> - sepc of a trap taken from the guest is a guest VA/PA, which the
>>    guest can point at an address listed in the exception table; Xen would
>>    then act on that entry and, for EX_TYPE_TRAP_INFO, write through a
>>    pointer fully under guest control. Entries are matched by exact address,
>>    so this needs no more than a numerical collision.
>>
>> - an interrupt taken at an address listed in the table would otherwise be
>>    "fixed up" as if the access itself had faulted, silently skipping it and
>>    handing the caller the interrupt's scause as a fault cause.
>>
>> Returning early skips check_for_pcpu_work(), which is correct: that only
>> runs for traps taken from the guest.
>>
>> With that in place a G-stage fault reaching the switch can no longer have
>> been caused by an hlv/hlvx covered by an entry, so anything left must have
>> come from the guest; assert as much.
> What means `assert as much` here? As you referencing any assert in the code,
> because in this patch, I couldn't find any.

It refers to the BUG_ON(!from_guest) in the guest page fault case of 
do_trap(). That BUG_ON() (and the comment above it) ended up in 
"xen/riscv: add guest page fault handling stub" when the series was 
reordered, so this sentence is stale.

I will drop 'assert as much' from commit message.

>>
>> Cache the "trap came from the guest" test in a local, it is now used four
>> times.
> Nit: By reading this sentence, I would expect to have the introduction
> of `from_guest` local here instead of in patch cc2d3b97e8
> xen/riscv: add guest page fault handling stub
> 

`from_guest` is introduced in "xen/riscv: add guest page fault handling 
stub" so it is a stale part of the commit message.

Thanks!

~ Oleksii

