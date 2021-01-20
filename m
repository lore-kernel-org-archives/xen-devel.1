Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6773EC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 15:13:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2019523381
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 15:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2019523381
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71552.128194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FAm-0004Hi-TM; Wed, 20 Jan 2021 15:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71552.128194; Wed, 20 Jan 2021 15:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FAm-0004Hb-Py; Wed, 20 Jan 2021 15:13:28 +0000
Received: by outflank-mailman (input) for mailman id 71552;
 Wed, 20 Jan 2021 15:13:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FAl-0004HW-Iz
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FAl-00035L-IA
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FAl-0002jf-Ge
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:13:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2FAg-0006E3-R4; Wed, 20 Jan 2021 15:13:22 +0000
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
	bh=1q8aISVIUb6CDFir26qNx0hqwSWhNflHnyQlgIox0L4=; b=0+imwsdN3xgPwWydwbF53+5irO
	BKU87s8teqLV41e6tVt2T/Q1UHadFzCKakJ46bph3F+rJIZ0a2B80lxCwKAbfDr1E++pT1/0Jy5yB
	pfMcn7Gl7wK60QgWigdIXvem/S/Zp02XteclboC7oZF98ml92VXu3y0jTyNEnPfIby54=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24584.18578.623201.789017@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 15:13:22 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
In-Reply-To: <20210104102037.GA2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
	<20201214163623.2127-6-bouyer@netbsd.org>
	<20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
	<20210104102037.GA2005@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> On Tue, Dec 29, 2020 at 12:29:09PM +0100, Roger Pau Monné wrote:
> > I think you want tot CC the tools dev on this one, specially Ian who
> > knows how the Linux one is implemented and can likely give valuable
> > input.
...
> > Seeing the file itself, I don't think there's any NetBSD specific
> > stuff, so we might want to consider putting it in BSD/ instead, so it
> > can be used by FreeBSD also?
> 
> I'm not sure if FreeBSD needs the locking stuff.
> Also, there are certainly differences in block device handling between
> FreeBSD and NetBSD. Both OSes have diverged in this area.

I think most operating systems will want some kind of locking here.

I loooked at the code in the new tools/hotplug/NetBSD/locking.sh.
Unfortunately this area is complex and the available APIs and tools
are awkard, and the field is troubled by broken "traditional"
approaches involving O_EXCL or the moral equivalent, which cannot be
made reliable (if you think reliability implies never being broken due
to stale lock).

I doubt that the code in this patch is correct.  It uses shlock(1)
which is based on link(2) and kill(2) and so on, which I think is
basically an O_EXCL-based approach as I discuss above.  (I don't have
a formal proof of this contention.)  The presence of an invocation of
the "trap" shell builtin in the new NetBSD script is a bad sign - a
reliable locking protocol would need that.

I see from https://man.netbsd.org that NetBSD has flock(1) and
stat(1).  I think this means we could reuse the code in
tools/hotplug/Linux/locking.sh.  Maybe it will need to be lightly
adapted, to NetBSD's flock(1) and stat(1).  Perhaps via some kind of
substitution to avoid all the clone-and-hack.

Regards,
Ian.

