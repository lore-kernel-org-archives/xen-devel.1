Return-Path: <SRS0=/WvL=K4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA03C47080
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 02:12:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A14160200
	for <xen-devel@archiver.kernel.org>; Wed,  2 Jun 2021 02:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A14160200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.135389.251508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loGN4-0007Dc-6k; Wed, 02 Jun 2021 02:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135389.251508; Wed, 02 Jun 2021 02:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loGN4-0007DV-2Y; Wed, 02 Jun 2021 02:12:38 +0000
Received: by outflank-mailman (input) for mailman id 135389;
 Wed, 02 Jun 2021 02:12:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loGN3-0007DP-Oh
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 02:12:37 +0000
Received: from mail-oi1-x236.google.com (unknown [2607:f8b0:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af84e1cf-2d66-4811-909f-af108e70e65e;
 Wed, 02 Jun 2021 02:12:36 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id b25so1354076oic.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jun 2021 19:12:36 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id r124sm3862947oig.38.2021.06.01.19.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 19:12:35 -0700 (PDT)
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
X-Inumbo-ID: af84e1cf-2d66-4811-909f-af108e70e65e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qiax4dzC13hXpfyVrKthMe6RnI1vPDDz06KGbQaGmCo=;
        b=M6GLrjh2DRluOqmkGcz1SJvxYUo8AtrRlwfh3tnr6cV6RZY5eZV39OSj1d6HxIKIn9
         +ewZw7TcwWop0f7tdz1XhqWk60DEfPu/h7Nk4JwVuHGQtXleHbjDcuNX2bN4Yo/wBb4v
         Jcc55rtjwIqX4T1n+ph2AM7+mBzwZZuwW2Zx1GT3w5SfHF8mnT5FoKMEFHIbwRV7xCcf
         kW/7zh+xcdPD8NxyBq7RsYsSmznVX8FARZ2x6z1JVVYjcVIBaKMzvu75dQvM/S67J4qP
         EpkH3kmIwzyG4CY/WmEwCxOfqTwNr2aMB2V0OyBFyQOgxjhEZqSbVw8Lps5O0pCfqqA7
         aM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qiax4dzC13hXpfyVrKthMe6RnI1vPDDz06KGbQaGmCo=;
        b=aE/TnscQ6mziWC+Bz+Ap29EM2WG1IC7GOCjd6RmUlXOSE4GG2Ehcjqzj7YhYZk27eU
         yrxoEw/PrLtOpLCeges0aG21bnG1T7RiMD3GbNMQPJiwbdDVg1sYNdfaj1TYuPqjQB7/
         uCoBzhUhzbwutvbYJJVFP1wImDcJEe/u2TQ00K4DvLKf70kIZrDOw2mOmxUuwpmwMyxH
         WMU+Ze5IGH52nH6VzFXefkekcIf8iSlG7NEhhNRWVtyKOQfUSzT2Qqc6jbkSOTcA9Y/D
         6QKcSOPWV2kDyKFdQhWH5huRqgP8ZkURSA11H7SDotNRX5XG2WCRIuXkrbRwuaOR6odP
         GG0Q==
X-Gm-Message-State: AOAM531/DPN7W0SUB6FLs5Mu3jAlSIkoRJCdDolbgt+wKDsBrGLE+SAh
	LD/e2YlD3VrhZsGjjkvP9i/gziE6WUrqdQ==
X-Google-Smtp-Source: ABdhPJzV8uhvTXDUsZMazleK7Leik3kBYYOwD1DuzHPuBKdmx4SHtccMtSrPc8GiLys1IjNKRREIRQ==
X-Received: by 2002:a54:438e:: with SMTP id u14mr714911oiv.126.1622599956120;
        Tue, 01 Jun 2021 19:12:36 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] xen: Add files needed for minimal riscv build
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621712830.git.connojdavis@gmail.com>
 <88ca49cea8dc0c44604957d42722388bb3d9e3ff.1621712830.git.connojdavis@gmail.com>
 <0f7192ec-5e50-c4b9-774c-febcade90288@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <2ba8a930-2795-0fc5-eaab-15ddc5a3c67f@gmail.com>
Date: Tue, 1 Jun 2021 20:12:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <0f7192ec-5e50-c4b9-774c-febcade90288@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/1/21 12:11 AM, Jan Beulich wrote:
> On 24.05.2021 16:34, Connor Davis wrote:
>> Add arch-specific makefiles and configs needed to build for
>> riscv. Also add a minimal head.S that is a simple infinite loop.
>> head.o can be built with
>>
>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen tiny64_defconfig
>> $ make XEN_TARGET_ARCH=riscv SUBSYSTEMS=xen -C xen TARGET=head.o
>>
>> No other TARGET is supported at the moment.
> Just to confirm - an actual (even if not functioning) xen binary can't
> be linked yet? I ask because that would be the prereq for me to set up
> routine (cross) build testing, just like I do for Arm.

That's right. The consensus was that targets and files should be added
incrementally, so I stopped at head.o for now.

Thanks,
Connor

