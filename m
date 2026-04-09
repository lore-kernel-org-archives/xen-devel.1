Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B937AE9DE6A
	for <xen-devel@archiver.kernel.org>; Thu,  9 Apr 2026 08:36:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1276843.1562146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAks0-0005s9-2J; Thu, 09 Apr 2026 08:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276843.1562146; Thu, 09 Apr 2026 08:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkrz-0005s2-Vi; Thu, 09 Apr 2026 08:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1276843;
 Thu, 09 Apr 2026 08:36:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wAkry-0005rf-QI
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:36:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkrx-007wdz-Ns
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:36:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d764f0-2eae-0a2a0a5409dd-0a2a4506b65e-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:36:09 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d764f9-0df0-0a2a45060019-d155dd31a848-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:36:09 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo302771f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 01:36:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e56fesm62221514f8f.27.2026.04.09.01.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 01:36:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775723769; x=1776328569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoHwRrmPG1RIIsDIVpcVPIC7uCM2nxHpY8sIp6n5sjc=;
        b=Gy8VDADLMWUQm+t+87u5v+XgXQFJB+TBJw+gcIXnuaYpIdS5SfkXtngLMYlrIekWc/
         +1tO5PSrsPUZHGomwrdZGz+qwWIyR7s0/59bHqUflNajFKAGdBpT1IMCfab3/JNEi+gq
         AYbtXoL2tdvWkKG3NNl+2FfwP/X0XVAZWg4rwZxAlsACWpjkQP54R7Vn0ku26LLPCfMj
         YRKO7WkLlMZvq/WG4h5psr7xkz+IWC6JaLXgzXrT9IsLI+6ioYfpH02b0gEiL9/WgV/A
         er9tKU4tyFtVIRjPFuPxAazJpevr/890KBdjRRogoaAVK5y3UM1l27WImShMZKKV09iL
         1vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723769; x=1776328569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoHwRrmPG1RIIsDIVpcVPIC7uCM2nxHpY8sIp6n5sjc=;
        b=k7ZGYR1orjjP9dea84gfWx0k0wMuAJ7KyYuOmZNi3mqB49/LINaCldLkgl4Le1rRWF
         XK/xnK2gfWpI8h/WH70cZPUcq8uIVIgdGPDxYEyk0u3+OAPArNrG+zcpzOp7fpbp85oo
         Q+kj0Mlapdl/g5cp/UV8LSmfNgkuUtTX7vT1BayN8TqCumOnHylQleclOBpN0PP3ihj1
         IcIygZ3NCpzJAd3FaXaMzkdl09NfEOTetK9S6LEun0tQGdlc9NU5/To2Lrds3CV77L6h
         /SywsTJsJgH4K0NmGAuz0xce+Ua7mjwX5TOpy3tFMSJQfFeTrXJrK3AbmVxjvuAOe6FA
         F6Og==
X-Forwarded-Encrypted: i=1; AJvYcCXhx+gin0mcw28qeGH5di2Www1lG3bHx5F+aeGbP7RQgDnhvBPp1LdvjaFSEU+s/VUA5mvBsl3+CQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzgy12gfnT8zm00kmHoVa1VFqs9By/UgDYyDvjqX54Z71YPyFf2
	IJeemPddd++Cz45ohZvy5HRHCZvfdeEYQzXyBqlsusgCMGggXNVdDhHT
X-Gm-Gg: AeBDieuj19w/4i/X9+vOAWr/WmfPLWWoDC7suUY3uxF0ED5eqcoBkyjkX+ElwaokuW7
	VuDxhYsGwgf2nYDHAsuVvHsit1aAwaHK5SUsjvzaj7OTXg+qWlXyn03Fyr7g/HKT1WUwIJw95vU
	qhrMg3eBfQl5I7/urMRHEL25VA0cBAt2VP3oNT6LSnrCjgTxMESb9aD+B0lxJvvcJPNC4liuL0H
	G8jwAa9LbC0rM10gHRwTa9VIj2oX18SZ4gAdoRU/Qpdjj1tdYWT8vEoyN+xKuV0jez8y5vEFXQw
	B9gNdSZLNPVCIXhbeXHuc2okN/97p5gNIyu4SFiC8R59lEhLlZZ+aZClOCXdTY7AM3csQ32xUj8
	PzNEJMQR/i8sSYH6ZyIUKqwO0SNCBvAEH4g9IeEj5udPJvF+KNZLuxvGTJzG/x8XzVJUIiIylZO
	EwCYtDoTTmZKi51ySSgXnka7Ed0mg2/0be16UgGicYP7Ljyr+bTcFdetkhZzJ5xR3yGEjecY2um
	ws=
X-Received: by 2002:a05:6000:220f:b0:43c:cda2:4f2a with SMTP id ffacd0b85a97d-43d5956c25bmr3974121f8f.4.1775723768817;
        Thu, 09 Apr 2026 01:36:08 -0700 (PDT)
Message-ID: <73640145-c214-4904-a195-107b2400e519@gmail.com>
Date: Thu, 9 Apr 2026 10:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] make ioremap_attr() common
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1775723769-5F3373D8-55BEEB50/10/73395122804
X-purgate-type: spam
X-purgate-size: 624



On 4/8/26 2:07 PM, Jan Beulich wrote:
> This core backing function is uniform; what varies across architectures
> are the attributes passed and hence the wrappers around it. Yet of course
> extra checking or special handling may be needed per arch, so introduce a
> suitable hook.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---

RISC-V part LGTM:
   Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # riscv

I've also tested on my test cases this patch and the next one and it 
works fine:
   Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # riscv

Thanks.

~ Oleksii


