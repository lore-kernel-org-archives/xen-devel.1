Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE43C4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 14:35:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C222076B
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 14:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C222076B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.771.2578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdCK-000294-5z; Wed, 30 Sep 2020 14:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771.2578; Wed, 30 Sep 2020 14:35:12 +0000
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
	id 1kNdCK-00028x-2r; Wed, 30 Sep 2020 14:35:12 +0000
Received: by outflank-mailman (input) for mailman id 771;
 Wed, 30 Sep 2020 14:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdCI-00028s-Qw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:35:10 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce176d74-8d97-4196-9b3a-1cc9ed152b89;
 Wed, 30 Sep 2020 14:35:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e17so1964471wme.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:35:10 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u12sm3368119wrt.81.2020.09.30.07.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 07:35:08 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdCI-00028s-Qw
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 14:35:10 +0000
X-Inumbo-ID: ce176d74-8d97-4196-9b3a-1cc9ed152b89
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ce176d74-8d97-4196-9b3a-1cc9ed152b89;
	Wed, 30 Sep 2020 14:35:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e17so1964471wme.0
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 07:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rxGb3Z6nBnC5voEXM2x/XeygLCx7i74Aa6YUxbFf84c=;
        b=IhpfQ/WLvL2mfrZqCJkI5ANkK65JW8T0pNbCjHQaeR2so7cSzXbz9I9vweZb3/NSXR
         QY3kYmqr0I0h2lYEP93l+axhsDj0lx3x4pQh6hQtRbrbuYIoIbw1z/5BkCx0JCWm3I3m
         s7V7Oxya1TEZ3JLyebtYoSem1SGkSKQQiP5iK/+9yqAfZUWeSqH/ZYU53//rfqVEPIn2
         Q525wvWodfB1bnU2IXp2rHjouya/FcCEyOk00Zlod8rxyVeIco1srGfZqJ2N1frbzsZT
         R5sVdd8IabuAARdn7FgzuiFEiBIz8WVqiUQQJV+etl4IO1JUO2gIwOaNVJD0gv9MYSdt
         frgA==
X-Gm-Message-State: AOAM530TIkvlJjTd2M4zD8l6A29pVyfjLHXDXLUhRxw4ZGeqFv+1MglV
	aA7t77lpxmPwjt4OIbi2tA0=
X-Google-Smtp-Source: ABdhPJyglIRRX2uxfDO/HVmhrIgfzmR/NUEspmdhof+aMTE6A0OjORyWAumyrDP/ShEktnbQo6zgHw==
X-Received: by 2002:a1c:e082:: with SMTP id x124mr3389617wmg.60.1601476509317;
        Wed, 30 Sep 2020 07:35:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id u12sm3368119wrt.81.2020.09.30.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:35:08 -0700 (PDT)
Date: Wed, 30 Sep 2020 14:35:07 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v9 4/8] docs/specs: add missing definitions to
 libxc-migration-stream
Message-ID: <20200930143507.2p6l2lf4aby4lf7w@liuwe-devbox-debian-v2>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-5-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924131030.1876-5-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 02:10:26PM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The STATIC_DATA_END, X86_CPUID_POLICY and X86_MSR_POLICY record types have
> sections explaining what they are but their values are not defined. Indeed
> their values are defined as "Reserved for future mandatory records."
> 
> Also, the spec revision is adjusted to match the migration stream version
> and an END record is added to the description of a 'typical save record for
> and x86 HVM guest.'
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Fixes: 6f71b5b1506 ("docs/migration Specify migration v3 and STATIC_DATA_END")
> Fixes: ddd273d8863 ("docs/migration: Specify X86_{CPUID,MSR}_POLICY records")

Acked-by: Wei Liu <wl@xen.org>

