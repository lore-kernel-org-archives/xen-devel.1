Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E91C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:28:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C622E64E9C
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C622E64E9C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79980.145993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b8B-0007Xc-7I; Mon, 01 Feb 2021 15:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79980.145993; Mon, 01 Feb 2021 15:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b8B-0007XV-4C; Mon, 01 Feb 2021 15:28:47 +0000
Received: by outflank-mailman (input) for mailman id 79980;
 Mon, 01 Feb 2021 15:28:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6b89-0007XQ-Qv
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:28:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6b89-0004gO-PV
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:28:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6b89-00065H-O8
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:28:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6b86-0007pj-GS; Mon, 01 Feb 2021 15:28:42 +0000
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
	bh=HqB98nLbZIIhhuBMHm87xXko2EUVIbeNy11RSKhULm0=; b=xHpppG0XgBfYrc/fUADHYOZK+z
	lSjz9fOUKjFQq519JD++koPSAvPaCqQfYaa6T3+Yo/Q42TmC7eqsDfhhKnl30P5Ep4huIaVP+CD54
	NyCIYcnsYc0uwi+WwXn80V4lubqtTAtSq7pZCtR7IX01zi173W0usW7aJHHfgNIwERK8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24600.7722.256518.556806@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:28:42 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?=  <roger.pau@citrix.com>,
    Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s
 [and 1 more messages]
In-Reply-To: <aed2dfba-3b1c-7e54-7996-766b100375f9@suse.com>
References: <b3b57f6b-3ed9-18f6-2a87-6af3304c6645@suse.com>
	<0cbbdb3a-5681-10df-aeee-ac185d7033cc@citrix.com>
	<24600.6974.503961.950273@mariner.uk.xensource.com>
	<aed2dfba-3b1c-7e54-7996-766b100375f9@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] x86/build: correctly record dependencies of asm-offsets.s [and 1 more messages]"):
> Oh, this used to be different on prior releases once we were
> past the full freeze point. Are to intending to allow bug fixes
> without release ack until the actual release (minus commit
> moratorium periods, of course), or will this change at some
> (un?)predictable point?

> >    Friday 29th January    Feature freeze
> > 
> >        Patches adding new features should be committed by this date.
> >        Straightforward bugfixes may continue to be accepted by maintainers.
> > 
> >    Friday 12th February **tentatve**   Code freeze
> > 
> >        Bugfixes only, all changes to be approved by the Release Manager.

I will send a proper announcement.

Ian.

