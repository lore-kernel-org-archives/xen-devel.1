Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5837CC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 16:22:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FC820757
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 16:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7FC820757
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76249.137507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nZn-0000NI-Nv; Wed, 27 Jan 2021 16:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76249.137507; Wed, 27 Jan 2021 16:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nZn-0000NB-Ki; Wed, 27 Jan 2021 16:21:51 +0000
Received: by outflank-mailman (input) for mailman id 76249;
 Wed, 27 Jan 2021 16:21:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nZl-0000N6-Pr
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:21:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nZl-0001v9-OO
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:21:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4nZl-0004ns-Nl
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:21:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4nZZ-0001kq-9M; Wed, 27 Jan 2021 16:21:37 +0000
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
	bh=uyz5GAJiX4Rev7iBr0pKBfQtrB+6vZqWD1OpxRWB+34=; b=dTcxZULq+5yRlhBjxrvMA49nTs
	M690HrlTccbL0XE/EPXQVk52BhHtv5/rhz7brSEhFhsWe4cnS8onQYbyVLza7h3uR9YWTGVnRJfGV
	0NsX8LjyAFXiu8ZIvCcmQ1p0/PNLCF/HA/zmlbKarXC3o1+/UdE1zfhCpMQ5J/EGHrkQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.37649.81543.442376@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 16:21:37 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    xen-devel@lists.xenproject.org,
    Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more
 messages]
In-Reply-To: <d3796603-20a7-2c81-a446-0d0a75cd52d5@suse.com>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
	<574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
	<20210114122912.GA2522@antioche.eu.org>
	<1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
	<20210114141615.GA9157@mail.soc.lip6.fr>
	<20210126174415.GA21858@mail.soc.lip6.fr>
	<24592.22685.67161.585056@mariner.uk.xensource.com>
	<2452d5cb-90ba-a4c4-a5e4-3070c5a676d2@suse.com>
	<27ec4834-ebf2-2121-47f7-470083d03a3f@suse.com>
	<24593.28738.216430.891500@mariner.uk.xensource.com>
	<d3796603-20a7-2c81-a446-0d0a75cd52d5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH] Fix error: array subscript has type 'char' [and 1 more messages]"):
> I don't think I've ever come across that part of a platform
> API/ABI spec. Instead my understanding so far was that good
> platform headers would be ignorant of the user's choice of
> char's signed-ness (wherever compilers offer such a choice,
> but I think all that I've ever worked with did). At the very
> least gcc's doc doesn't warn about any possible
> incompatibilities resulting from use of -fsigned-char or
> -funsigned-char (or their bitfield equivalents, for that
> matter).

Well, I've considered this and I still don't think changing to
-funsigned-char is good idea.

Are you OK with me checking in the current patch or should I ask the
other committers for a second opinion ?

Thanks,
Ian.

