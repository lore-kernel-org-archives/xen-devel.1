Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7365C433E9
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 16:23:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FF064E87
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 16:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FF064E87
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82956.153475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99JU-0004RR-1H; Mon, 08 Feb 2021 16:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82956.153475; Mon, 08 Feb 2021 16:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99JT-0004RK-U9; Mon, 08 Feb 2021 16:22:59 +0000
Received: by outflank-mailman (input) for mailman id 82956;
 Mon, 08 Feb 2021 16:22:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99JS-0004RF-Fs
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:22:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99JS-0007sw-BX
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:22:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99JS-00081I-9Q
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:22:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l99JO-0002wy-Ua; Mon, 08 Feb 2021 16:22:55 +0000
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
	bh=nbpjJ9Oiix6NlDk6bi3vd6dG2ssISm2wUkze8i4tfmA=; b=gAV66YWTIpEGomF6esyKHVoBPl
	+o9tChSxgl9/CP1Y2rpNjr4aAFcaf/yLBptiSeNbSfl0mb2xWoMS3hyE6yYwbTFdOI9iYw7mEpIk8
	8aJPg5pSbnAs4RGSy3lcWjjk06d1dCGcE6R4BIFly5Ow2ZpXZnHYTJ3sgFxJfUkzogZ0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.25950.629059.164010@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 16:22:54 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 07/39] xl: optionally print timestamps during xl migrate
In-Reply-To: <20210111174224.24714-8-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-8-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 07/39] xl: optionally print timestamps during xl migrate"):
> During 'xl -v.. migrate domU host' a large amount of debug is generated.
> It is difficult to map each line to the sending and receiving side.
> Also the time spent for migration is not reported.
> 
> With 'xl migrate -T domU host' both sides will print timestamps and
> also the pid of the invoked xl process to make it more obvious which
> side produced a given log line.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

This is from October and ought to have been reviewed much sooner.
Sorry.

With my maintainer hat on: this is a useful development but I am not
sure about the choice of -T, and the choice to make this a
migrate-specific option.  Most unix things that have an option to
print timestamps use `-t`.  But we have already stolen `-t` as a
global option for "prinht CR as well as LF".  Hrmf.

Under the circumstances -T for migrate seems a plausible and
conservative choice.  I think maybe we should maybe add a global -T
later.

Reviewed-by: Ian Jackson <iwj@xenproject.org>



Now I have to decide what to do about it for 4.15.

The downside risks I see from reading the patch are:

* The CLI API choice is being made in a hurry.

* We might break something.  This actually seems quite unlikely since
  I have reviewed the code changes in detail.


I wonder if I can get a quick second option from someone on the API
question.  Using up a single letter option is something I don't want
to just rush into.

Ian.

