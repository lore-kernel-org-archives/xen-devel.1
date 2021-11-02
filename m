Return-Path: <SRS0=WSjk=PV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0255C433FE
	for <xen-devel@archiver.kernel.org>; Tue,  2 Nov 2021 15:55:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63BA060F70
	for <xen-devel@archiver.kernel.org>; Tue,  2 Nov 2021 15:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63BA060F70
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.220384.381649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw7g-0005Fd-Iw; Tue, 02 Nov 2021 15:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220384.381649; Tue, 02 Nov 2021 15:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhw7g-0005FW-FQ; Tue, 02 Nov 2021 15:54:52 +0000
Received: by outflank-mailman (input) for mailman id 220384;
 Tue, 02 Nov 2021 15:54:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw7f-0005FQ-CV
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:54:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw7f-0008Vu-Bi
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:54:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mhw7f-0002kt-Ay
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:54:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mhw7b-0001WU-AP; Tue, 02 Nov 2021 15:54:47 +0000
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
	bh=HkFQ5dhMf2h6AvY/pp4Ir10DcctyUb/rK+PDBMFXrXQ=; b=m1ky6Eo5dM31wffu25hkWKbrsR
	C14uVNodzT9j95qjW2e9e/tVLHGGUkuK9dxDKMEhy/W5jx0/1jqKNL1xUY7CtN1rzMjdxi5nHbnb9
	5XuCk78dnUseavJB0dQzDQBjWJL6CG46zMmU+wZaoD6UkGpDL7o1XyG0R4FOJ97ZH/ng=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24961.24390.111387.517040@mariner.uk.xensource.com>
Date: Tue, 2 Nov 2021 15:54:46 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on
 AMD hardware
In-Reply-To: <1325ff93-5b05-3660-7850-d497b6b9ee23@citrix.com>
References: <20211028232658.20637-1-andrew.cooper3@citrix.com>
	<24959.50965.967784.441954@mariner.uk.xensource.com>
	<0ab2bad5-ad32-06e1-755c-c4fe5cb2bdd3@citrix.com>
	<24959.55804.160431.406023@mariner.uk.xensource.com>
	<1325ff93-5b05-3660-7850-d497b6b9ee23@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on AMD hardware"):
> On 01/11/2021 12:13, Ian Jackson wrote:
> > Andrew Cooper writes ("Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on AMD hardware"):
> >> This path is only taken for a 32bit crash kernel.  It is not taken for
> >> 64bit crash kernels, or they wouldn't work on AMD either, and this is
> >> something we test routinely in XenServer.
> >>
> >> The worst that can happen is that I've messed the lretq pattern up, and
> >> broken transition to all 32bit crash kernels, irrespective of hardware
> >> vendor.
> >>
> >> It will either function correctly, or explode.  If it is broken, it
> >> won't be subtle, or dependent on the phase of the moon/etc.
> > Thanks for this confirmation.
> >
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Thanks.
> 
> Unfortunately, I've made a blunder here.  The code as implemented is
> broken on Intel, and works on AMD.  (I.e. I need to swap Intel and AMD
> in the commit message).  Have done locally, but won't repost just for that.

OK, thanks.

Ian.

