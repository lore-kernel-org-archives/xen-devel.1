Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF21C982FF
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:22:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428697.1651592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ya5-0007Am-E4; Tue, 22 Sep 2026 11:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428697.1651592; Tue, 22 Sep 2026 11:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8ya5-0007Ad-B5; Tue, 22 Sep 2026 11:22:37 +0000
Received: by outflank-mailman (input) for mailman id 1428697;
 Tue, 22 Sep 2026 11:22:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8ya3-0007AQ-Br
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:22:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8ya2-002glK-Ov
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:22:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab264fa-8faa-0a2a0a5109dd-0a2a4509a09c-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:22:34 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab264fa-be1a-0a2a45090019-4a7de18cacce-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:22:34 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912df756so27768855e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:22:34 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdace76e8sm58810405e9.1.2026.09.22.04.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 04:22:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790076154; x=1790680954; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuQGbY5+Oh09G0KsH/4qhh0PfmkZHq19MkHek5qZnME=;
        b=ouggmz/9C5vaTG6MzwDd/nd096+ju1vioAJeOyalrz62Epw1w3Tavlkgk624il9DCg
         VclHa5+sBjZ/0kz+y87dkT+UiiE/Ia7FjN5Vpsr0t329meICtcipwartAvHpi8H0ZMqa
         IeIioLTYr3rMRmDakmqvhV7glbJF+rlYOByjMAdzk4bYwPIdhpGqq2vRTuv/aK7St3el
         8QqPNtYzWs7uCmj+hTYzxYo1LI3zWBNyFCkET3ar3rEFioSortSkPkMQlbolWfPqWWk3
         +sfjDfu7ea/o6SiPaN8pJvPZeag54b4MjKF0ic3pV+fLqgi/zqU/rW84UMV7F18Fxsi7
         YDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076154; x=1790680954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuQGbY5+Oh09G0KsH/4qhh0PfmkZHq19MkHek5qZnME=;
        b=0UxXyBveKMImutpSrWlaST08Yw7o61wn9Ra0eqD2OUrhxAcPOwDNAvDaIXNCH3GMS0
         SNf2sa2S09+ylTmlfamDfOCEdbbvnol1NYrtCRhLojn6R+5UDXKOZp6nRj8oSqUDuGxk
         Nxukn76hsDmBuC8c8Vo1f5bjMMHMALGPIdt/I04snxyVljuQSJ0eF0Z5hXxGkTNbiXvE
         Vq7Kb5BXm4DdyK7EfJ3dnTOnUDlOGHueE1vzDfZPmynhk2mEtcFJR0WAtKAEgsdfnzvc
         rnZeUZ+LRl/A9EOw+u9py10sj/gGsclrrQ/0oTnqVkQvVBYwpfHlh/8ouzamqAMCKOL1
         Z7iQ==
X-Gm-Message-State: AFuF++le33ri04fBLkqONKNMkhSiqXSRDrcR0v83ezUHeMDv6oHB89LN
	F1BVVqXggGMGyRSbDuY6EGLhaEVaIrW6ogZlHtSvGgeBfyxEfdM8KnR7
X-Gm-Gg: AYBFou0/IbzmfAfW0yQHPuiVY5ZGxcpLTzCBr06NengECdeDyGzJBGpwjVdOVWcbkiO
	GZekKLoFuEyjuzgul09zqJG7UPpmL80ATuQ8B2TRAkG8P1M9sFxJgwST4lvCh0+oRzIow1hOsNl
	1SmpfKk37Rov/CALaiiek2vj1dCqEp4bzjVqrs0qWTUPWSEQmyrGyVvzETVN6nhkIlN/iKs+j2e
	PMYjwn8bpISNOMGnSa+ApCXjt7llwBYpLYNwiU8aPJiFOnpDBD/WeHafyOG9Tl96v19tQm4/KHT
	MvLmcP+WUsGHQdIJIDBagXciKNzcrA7fF9qFOBrLUcB7TWDpKDd5cBYTGLxuGWGz6q1SC8aF8ZG
	NwMVo0XbWVj80Qqqr0AqK8TaJT9Lm2UmYAOmN6yc4uctlhNb63QRQhjlN6xCi4HNkMV4Sl3VfrZ
	51dZMjP+Ycr8umvJxeM9Wh+ORSEvIiCnKdUYvWhg9p+yVEi6EA4kJ6jwVWm+dWeB0ymji66oooQ
	oML/ZaPwKRAuCj2U1DmAC7fzkDUYgA7nW55w3TKf+DE89SXaw==
X-Received: by 2002:a05:600c:474e:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49fc5743c69mr183916215e9.29.1790076154219;
        Tue, 22 Sep 2026 04:22:34 -0700 (PDT)
Message-ID: <f4cf7ca5-f4ac-413e-9c06-7e9fe97aa158@gmail.com>
Date: Tue, 22 Sep 2026 13:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/39] xen/riscv: add guest load emulation for trapped
 MMIO accesses
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
 <7cf3203f8f826eefa1b24bb2dedbd76c0b611dc1.1787838835.git.oleksii.kurochko@gmail.com>
 <1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde12700072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1789723009.8631fc262581453bbf619ec5b2062170.1a0b3cde12700072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1790076154-3A2C4034-A6A77DFC/10/73395122804
X-purgate-type: spam
X-purgate-size: 533

>> @@ -179,8 +178,7 @@ static void resolve_faulting_gpa(struct guest_fault *gf)
>>    * Relies on x0..x31 being laid out at the start of struct cpu_user_regs in
>>    * architectural register-number order; see the comment there.
>>    */
>> -static __maybe_unused unsigned long *guest_gpr(struct cpu_user_regs *regs,
>> -                                               unsigned int reg)
> Could we unified this function with regs_get_gpr()?
> 

I think it could. I will try to do in the unified way.

Thanks!

~ Oleksii

