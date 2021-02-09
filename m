Return-Path: <SRS0=g3ET=HL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C560DC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 17:12:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697E964EC0
	for <xen-devel@archiver.kernel.org>; Tue,  9 Feb 2021 17:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697E964EC0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83351.154881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WZ0-00032H-Or; Tue, 09 Feb 2021 17:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83351.154881; Tue, 09 Feb 2021 17:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WZ0-00032A-Lm; Tue, 09 Feb 2021 17:12:34 +0000
Received: by outflank-mailman (input) for mailman id 83351;
 Tue, 09 Feb 2021 17:12:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WYz-000325-MK
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:12:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WYz-0003Dq-LI
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:12:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WYz-0001U1-KP
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:12:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9WYu-0005ye-P4; Tue, 09 Feb 2021 17:12:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=UpX8S6XRwqpEcQHWjRqxBp4cqcoxZJbg5g6R2fWMqS4=; b=CoIrFO8Bu0JSYTrND2zbuANXwd
	wemzf/ihRaJXNZwRvJ0u9UrEfYTtSxxsViSO3c1eaEZbx44tiuGoy/evOLMVo7b5b81QyOCiVpbFG
	cVSa1XdYDCBe0uJhjjY9OvaFBhbh/L2FQyEgMwO6IzYAq+YijHMsLZWkI48urFySGmyI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.49788.493621.307069@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 17:12:28 +0000
To: Olaf Hering <olaf@aepfle.de>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 4/4] xl: disable --debug option for xl migrate
In-Reply-To: <20210209154536.10851-5-olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-5-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210209 4/4] xl: disable --debug option for xl migrate"):
> xl migrate --debug used to track every pfn in every batch of pages.
> 
> Since commit cfa955591caea5d7ec505cdcbf4442f2d6e889e1 from Xen 4.6 the
> debug flag changed meaning from "verify transferred memory during live
> migration" to "verify transferred memory in remus/colo". At least xl
> will not be able to trigger execution of the verifying code in
> send_domain_memory_live anymore.
> 
> Remove "--debug" from "xl migrate -h" output.
> Remove "--debug" from from xl man page.
> Do not send "-d" as potential option for "xl migrate-receive" anymore.
> Do not pass the flag LIBXL_SUSPEND_DEBUG anymore to libxl_domain_suspend.
> Continue to recognize "--debug" as valid option for "xl migrate".
> Continue to recognize "-d" as valid option for "xl migrate-receive".

It seems to me that something is definitely a bug here but I want to
understand from Andy what the best thing to do is.  I'm hesitant to
release-ack removing this at this stage.

Wouldn't it be better to just fix the docs like in your previously
suggested patch ?

Also, Olaf, please CC Andy on these migration-related patches.

Thanks,
Ian.

