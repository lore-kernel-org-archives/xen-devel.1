Return-Path: <SRS0=c7Nm=N6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03778C433F5
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 11:44:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DCD60F92
	for <xen-devel@archiver.kernel.org>; Wed,  8 Sep 2021 11:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0DCD60F92
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.181798.329107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNw0D-0001Ed-CU; Wed, 08 Sep 2021 11:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181798.329107; Wed, 08 Sep 2021 11:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNw0D-0001EW-9I; Wed, 08 Sep 2021 11:44:29 +0000
Received: by outflank-mailman (input) for mailman id 181798;
 Wed, 08 Sep 2021 11:44:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNw0C-0001EQ-7C
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:44:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNw0C-0003dY-3k
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:44:28 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mNw0C-00027L-2m
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:44:28 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mNvzw-00032p-8M; Wed, 08 Sep 2021 12:44:12 +0100
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
	bh=JDArQN2Fi8ETRRDga4y+qn+1GcKXiOotD1ShURS9fiU=; b=IzCMJz7hDCG1qM3Wf7K4wE09pV
	GFw8W0j9XPOgV0PdRYRbB6PpYsuirC7+cmon39IsfsU8csIQPcbqo7tVpHMQAcaCzyfxlY0g+iSTZ
	IKVIK5KKb+vNGLVO9lM5l7bRlDqbep3kmSZjVyPddTZWUloheapGEWqqZNdECfdg81Is=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24888.41483.762554.171248@mariner.uk.xensource.com>
Date: Wed, 8 Sep 2021 12:44:11 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    "Tim  Deegan" <tim@xen.org>,
    <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a
 single .c file
In-Reply-To: <YTibMaayiWlJwcZ/@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
	<20210824105038.1257926-6-anthony.perard@citrix.com>
	<e633af0e-a34c-3c11-49ba-1e2c6f544613@suse.com>
	<YTibMaayiWlJwcZ/@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Re: [XEN PATCH v7 05/51] x86/mm: avoid building multiple .o from a single .c file"):
> On Tue, Sep 07, 2021 at 08:14:14AM +0200, Jan Beulich wrote:
> > Hmm, when replying to 00/51 I didn't recall I gave an R-b for this one
> > already. I'd like to restrict it some: It should be taken to stand for
> > the technical correctness of the change. Nevertheless I'm not really
> > happy with the introduction of the various tiny source files. I've
> > meanwhile been wondering: Can't these be generated (in the build tree,
> > as soon as that's possible to be separate) rather than getting put in
> > the repo?
> 
> Do we really need to generated those never to be change tiny source
> file? Do we really need to make the build system a lot more complicated?

I'm not an x86 maintainer, but my 2p anyway:

I think the handful of tiny source files is probably better than some
contraption in the build system.  Much less risk of something funny
and confusing going on.

We could reduce the number of copies of the same text by making the
copies of guest_walk*.c in hap/ be symlinks to ../guest_walk*.c.

> Can't we commit this patch as is? What kind of issue is there with those
> tiny source files? Should we add a warning in those tiny source files,
> something like "No modification of this file allowed, it's part of the
> build system." ?

I don't think we need any such warning.  No-one is going to take that
tiny file and try to edit it to put functionality in it, and if they
do it will be spotted on review.

Thanks,
Ian.

