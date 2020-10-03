Return-Path: <SRS0=xDj+=DK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5751DC41604
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2020 14:33:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3FE5206C3
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2020 14:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3FE5206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2553.7344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOib9-0004oS-6q; Sat, 03 Oct 2020 14:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2553.7344; Sat, 03 Oct 2020 14:33:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOib9-0004oL-2q; Sat, 03 Oct 2020 14:33:19 +0000
Received: by outflank-mailman (input) for mailman id 2553;
 Sat, 03 Oct 2020 14:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a7Ix=DK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kOib8-0004oG-Ae
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 14:33:18 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 601600c8-62cc-4ae4-a01d-c7bad4098dd5;
 Sat, 03 Oct 2020 14:33:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x23so4366797wmi.3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2020 07:33:17 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u8sm5516615wmj.45.2020.10.03.07.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:33:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a7Ix=DK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kOib8-0004oG-Ae
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 14:33:18 +0000
X-Inumbo-ID: 601600c8-62cc-4ae4-a01d-c7bad4098dd5
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 601600c8-62cc-4ae4-a01d-c7bad4098dd5;
	Sat, 03 Oct 2020 14:33:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x23so4366797wmi.3
        for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2020 07:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5W0mBf5cSyEzSR4NyeVbtidTD9BwgrQSkD8xcXhRsuo=;
        b=sI6Lk6PqDc4MO0qAGhFzG62V/vXxDLhrw4IikO5pbZbDGbags7EqSLx06VPkJ4Ffr6
         JVsgaqvH5yKX/gi9TNRCeGlgUK8UDaOSgEpvYx1+i2g1OuBCKldIZpJjKma9tP4kVksK
         2zjDhqwzpKFd3fCM6gmvwJ74eMu6+Yq8+ec2OX293x5J/60tnZCbHBbfZRH8I0kI0z6I
         7U/VpwsLbqaKKleyAdWkE+Uznk/XeeWyfqTroh8WlmVqVkFtcNNxV4R9VYueuSg2gdqE
         kDfkr3fQsmhKRh/8nuFCUlFZFG/c43fZ4EwTPKu6wKISKpgymytU5InY8lS7bnNde2/g
         BhqA==
X-Gm-Message-State: AOAM5336rTcHsZoFDhnWuVGwsBlAb3xLRSf+CYohQPT5XlHTjiJGOB+T
	PrYGwbNaH2IDE9z2cqhvWy4=
X-Google-Smtp-Source: ABdhPJx/b+JmNuoUlxWgCeR7GA3GaqLXAEggfmbFSpXPg4k667nKinWX86r31HWV7koYb3N8jQef1g==
X-Received: by 2002:a05:600c:2053:: with SMTP id p19mr7984264wmg.50.1601735596576;
        Sat, 03 Oct 2020 07:33:16 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id u8sm5516615wmj.45.2020.10.03.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 07:33:15 -0700 (PDT)
Date: Sat, 3 Oct 2020 14:33:14 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	Paul Durrant <pdurrant@amazon.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 1/8] xen/common: introduce a new framework for
 save/restore of 'domain' context
Message-ID: <20201003143314.vtviqi2mur5ajobd@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-2-paul@xen.org>
 <2e51a5cb-df0c-d564-2a7b-5f2abbb5872c@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e51a5cb-df0c-d564-2a7b-5f2abbb5872c@citrix.com>
User-Agent: NeoMutt/20180716

On Fri, Oct 02, 2020 at 10:20:18PM +0100, Andrew Cooper wrote:
[...]
> P.S. Another good reason for having extremely simple header files is for
> the poor sole trying to write a Go/Rust/other binding for this in some
> likely not-to-distant future.

For Rust the header is going to be generated by a tool called bindgen.
It doesn't like nested macros, so I would be all for a simpler C header
file if we can help it.

Wei.

