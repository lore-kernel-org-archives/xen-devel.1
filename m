Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4A1C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:20:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D3864EF5
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 13:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D3864EF5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89762.169346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGZ7-0001cp-U3; Thu, 25 Feb 2021 13:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89762.169346; Thu, 25 Feb 2021 13:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGZ7-0001ci-Qz; Thu, 25 Feb 2021 13:20:25 +0000
Received: by outflank-mailman (input) for mailman id 89762;
 Thu, 25 Feb 2021 13:20:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGZ6-0001cd-QU
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:20:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGZ6-0000oR-Ph
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:20:24 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGZ6-0004g6-Oy
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:20:24 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFGYv-0001VH-U0; Thu, 25 Feb 2021 13:20:13 +0000
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
	bh=cGXK98OPChZFyUYflc02QgIrr1x6T2w/4JTgHwg57Xw=; b=glgHR9q5R5le5ckkgiZNSm1R9S
	ynIcPDeRi+ZrhZA0d2vQWUGliSVFYr9Q2/o9UflGS745oCtX46o4dVocJTADkrf8yIO11hxA81kpK
	mM1UZ3YOjKAugaVt9yHJ5OZBIt6hI2URFqHYMy6C6WMKjOaZO3EqW0jML1PZFhtRaaK0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.41997.596809.646522@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 13:20:13 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
In-Reply-To: <dae5479e-9974-334b-7f4f-e4194e435aaa@suse.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
	<dae5479e-9974-334b-7f4f-e4194e435aaa@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> As to 4.15: Without this shadow mode simply won't work on such (new)
> hardware. Hence something needs to be done anyway. An alternative
> would be to limit the change to just the guest-no-present entries (to
> at least allow PV guests to be migrated), and refuse to enable shadow
> mode for HVM guests on such hardware. (In this case we'd probably
> better take care of ...

Thanks for this explanation.

It sounds like the way you have it in this proposed patch is simpler
than the alternative.  And that right now it's not a regression, but
it is needed for running Xen on such newer hardware.

> The main risk here is (in particular for the MMIO part of the change
> I suppose) execution suddenly going a different path, which has been
> unused / untested (for this specific case) for years.

That's somewhat concerning.  But I think this only applies to the new
hardware ?  So it would be risking an XSA but not really risking the
release very much.

I think therefore:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

