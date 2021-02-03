Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E153BC433DB
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 20:16:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE7E64F76
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 20:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE7E64F76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81046.149051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OZC-0001PY-8A; Wed, 03 Feb 2021 20:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81046.149051; Wed, 03 Feb 2021 20:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7OZC-0001PR-5E; Wed, 03 Feb 2021 20:15:58 +0000
Received: by outflank-mailman (input) for mailman id 81046;
 Wed, 03 Feb 2021 19:58:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAwm=HF=linuxfoundation.org=skhan@srs-us1.protection.inumbo.net>)
 id 1l7OIa-0007TD-3U
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 19:58:48 +0000
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bccb927-4718-42d0-a33e-76dde9e36808;
 Wed, 03 Feb 2021 19:58:47 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id j5so607005iog.11
 for <xen-devel@lists.xenproject.org>; Wed, 03 Feb 2021 11:58:47 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id 14sm1594104ioe.3.2021.02.03.11.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 11:58:45 -0800 (PST)
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
X-Inumbo-ID: 9bccb927-4718-42d0-a33e-76dde9e36808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=cc:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=iBumuQ2xl7PWUunfr+5XCG2wfvDl+oJsEntLHQUnRoM=;
        b=PJYmBRC8/jAuvC7KPetZ+KazUHm905Rkga+lhU7oVaWL37SKwbs2WrYgYOc64tvwLi
         28FbdLAlO0glF5VEYVFO0YesNLN7sNRCvoxYrXN4aGoEG6FF60DGHnarjT1QvnGpaG+g
         yXSrq8lb+smqn4r188pVtEopzCif3Nu73X8pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=iBumuQ2xl7PWUunfr+5XCG2wfvDl+oJsEntLHQUnRoM=;
        b=sWmte8Gk2SBBSQItZIt6nYUNW7qs01jK5glx58YaS6ZeVx1ue9VY2xn2qlFTq3puhm
         DHQmEM1Vj5cfM5jcgOJOqOiq5tFZYZqUM88PdQ64b87BaCKJb3+yCAjOY8rkOYoEeTx+
         wATofBjYITC7kxIvogMAB2zYY8FGWVbrOwfCP5hRznRdryZi2i/6+eoL6GNvs61lAlHK
         DvoYrh3JMqesxAYQRAF20Z8hrGD5p38NKrfdZveERBF3dhB4EWdwuAJZQPlS7lQY6CWX
         1KS7x82OMWsvgdz+rAm5fvsNKhIDTrOGeZJPo2QYXFvUfOMy6xJwyQDVjctrToocg3r5
         ubOQ==
X-Gm-Message-State: AOAM5324vcMVxllytVL5wrjjMdgeUuyAKDTd0hTYAZXRcs1zRjoiVh1d
	ku2vqyF3KHiLk800+jjkrbI2Y8boB1wJWg==
X-Google-Smtp-Source: ABdhPJzgpUqBG5vdviXmVeBBOuvyp8nIPkwGaW3le/t3FUwlPckmjmGnUWHIoLQkBK24H7NGNvzLMw==
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr3774752iov.156.1612382326457;
        Wed, 03 Feb 2021 11:58:46 -0800 (PST)
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 xen-devel@lists.xenproject.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Linux 5.11-rc6 compile error
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Message-ID: <8a358ee4-56bc-8e64-3176-88fd0d66176f@linuxfoundation.org>
Date: Wed, 3 Feb 2021 12:58:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I am seeing the following compile error on Linux 5.11-rc6.
No issues on 5.11.0-rc5 with the same config.

ld: arch/x86/built-in.a: member arch/x86/kernel/pci-swiotlb.o in archive 
is not an object
make: *** [Makefile:1170: vmlinux] Error 1

CONFIG_SWIOTLB_XEN=y
CONFIG_SWIOTLB=y

I can debug further later on today. Checking to see if there are any
known problems.

thanks,
-- Shuah


