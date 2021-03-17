Return-Path: <SRS0=alo8=IP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E011CC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 15:13:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7210764F73
	for <xen-devel@archiver.kernel.org>; Wed, 17 Mar 2021 15:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7210764F73
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98743.187486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXr3-0008PO-6F; Wed, 17 Mar 2021 15:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98743.187486; Wed, 17 Mar 2021 15:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMXr3-0008PH-3M; Wed, 17 Mar 2021 15:13:01 +0000
Received: by outflank-mailman (input) for mailman id 98743;
 Wed, 17 Mar 2021 15:12:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXr1-0008PC-Jr
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:12:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXr1-0000Ay-Hn
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:12:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lMXr1-0006Lk-Fo
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 15:12:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lMXqw-0002KP-Pd; Wed, 17 Mar 2021 15:12:54 +0000
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
	bh=Aw4H8mLfFfZz4bs1vDAoFr4gYg/s4oCojpI5o2UkSjU=; b=BWWCcrFenpzxAxGMuB1DABADVs
	i3ByjaDtLZghGcMtU0vEvYZJ/jdcV/vVbhjf/JbGVxHRExxNsNEdQAqrL2/xlwIZ4giwwBqiCS999
	U/lsuFugoOPSUOi8zgWbIJZF95XEusKzTir9V1TM70y7J8Fh/veWlHoj8gNYUILy7AiQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24658.7286.533794.293151@mariner.uk.xensource.com>
Date: Wed, 17 Mar 2021 15:12:54 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
    Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: libxl / xen-pciback interaction [and 1 more messages]
In-Reply-To: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>,
	<fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
	<fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("libxl / xen-pciback interaction"):
> while trying to test a pciback fix for how SR-IOV VFs get placed in the
> guest PCI topology I noticed that my test VM would only ever see the 1st
> out of 3 VFs that I passed to it. As it turns out, the driver watches
> its own (backend) node, and upon first receiving notification it
> evaluates state found in xenstore to set up the backend device.
> Subsequently it switches the device to Initialised. After this switching,
> not further instances of the watch triggering would do anything.

This makes it sound like this driver does not support hotplug.

> While doing this it also occurred to me as odd how "num_devs" is
> actually used: It's not really a "number of devices" indicator, but
> instead a "next device has this number" one: libxl reads the present
> value and increments it by one for every new device. Destroying
> (hot-unplugging) of devices doesn't have any effect on the value.

But this makes it sound like the driver *does* support hotplug.

How does what libxl is doing differ from a setup, immediately followed
by a hot-add ?

>   If addition / removal of a device happens a number of times for a
> VM, quite a few leftover, no longer used entries would accumulate
> afaict.  This isn't only consuming space in xenstore for no good
> reason, but also means pciback has to do an increasing amount of
> processing every time a reconfigure event happens.

I'm kind of surprised that num_devs is used this way by the driver.  I
guess the obvious approach of just listing the directory to find the
devices would often be accidentally-quadratic in the number of
simultaneous PCI devices but that hardly seems like a problem.

I wonder if there is some race/reuse hazard that would prevent libxl
knowing when to reuse a dev number.

Ian.

