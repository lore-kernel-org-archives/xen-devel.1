Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B34C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:37:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 855E964F44
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 855E964F44
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81266.149862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cwn-0005Id-1O; Thu, 04 Feb 2021 11:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81266.149862; Thu, 04 Feb 2021 11:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cwm-0005IW-UT; Thu, 04 Feb 2021 11:37:16 +0000
Received: by outflank-mailman (input) for mailman id 81266;
 Thu, 04 Feb 2021 11:37:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cwl-0005IR-FZ
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:37:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cwl-0001dD-Em
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:37:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7cwl-0005QN-E8
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:37:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7cwd-0007q4-O0; Thu, 04 Feb 2021 11:37:07 +0000
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
	bh=KtZuaYcnWedO8ua6vfd0PO2TnW6WxivSXjOsz5iVxjc=; b=NPUlz/1ppP+Cq9PXipw9EzBAOT
	Ph/gyeIk1JnSRphZxYQTbFxUOu2H7OpTeRFj99AW6gPojfMUbJGuaZuH1yyJpya6iVx0MBUbAM24s
	umKcwnxyUt4Ijno+WBSLZQtuPEgr6PzMlfuLFsTesO8dD4nU7iUZ/BVlqhmsMiokqYdI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24603.56419.517594.411675@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 11:37:07 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.15] autoconf: check endian.h include path
In-Reply-To: <YBvQ4/mFiiVJNvaA@Air-de-Roger>
References: <20210204093833.91190-1-roger.pau@citrix.com>
	<26522f21-4714-c29d-5ca4-baf012c51ac8@suse.com>
	<YBvFbbnje+Dt7CfD@Air-de-Roger>
	<0e3576d3-4565-9898-e954-4a888b21d92f@suse.com>
	<YBvKwNiIopKKZx/F@Air-de-Roger>
	<10e334fe-eb02-e771-8404-cbcda9534383@suse.com>
	<YBvQ4/mFiiVJNvaA@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH for-4.15] autoconf: check endian.h include path"):
> On Thu, Feb 04, 2021 at 11:32:41AM +0100, Jan Beulich wrote:
> > On 04.02.2021 11:21, Roger Pau Monné wrote:
> > > I think having to replicate this logic in all places that include
> > > endian.h is cumbersome.
> > 
> > Right - I would further encapsulate this in a local header.
> 
> IMO encapsulating in configure achieves the same purpose.

I like the way Roger has done it.

> > >> And which one is to be the first one? IOW how likely is it that
> > >> on a system having both the first one is what we're after vs
> > >> the second one?
> > > 
> > > Not sure, but the same will happen with your proposal above: in your
> > > chunk sys/endian.h will be picked over endian.h.
> > 
> > Oh, sure - the two points are entirely orthogonal. And I'm
> > also not certain at all whether checking sys/ first is
> > better, equal, or worse. I simply don't know what the
> > conventions are.
> 
> I'm not sure either. For the specific case of endian.h I would
> expect only one to be present, and I think we should first check for
> top level (ie: endian.h) before checking for subfolders (ie: sys/), as
> top level should have precedence.
> 
> I really don't have a strong opinion either way, so if there's an
> argument to do it the other way around that would also be fine.

I don't think it matters much here, but in general I would say that
checking the more general location first is a good idea.  Checking the
more specific location might in some cases find us a file that's
actually an implementation detail.

Ian.

