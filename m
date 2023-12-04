Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664E5C4167B
	for <xen-devel@archiver.kernel.org>; Mon,  4 Dec 2023 01:03:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.646468.1008762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9xM8-0005yN-P8; Mon, 04 Dec 2023 01:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646468.1008762; Mon, 04 Dec 2023 01:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9xM8-0005yG-Lt; Mon, 04 Dec 2023 01:02:40 +0000
Received: by outflank-mailman (input) for mailman id 646468;
 Mon, 04 Dec 2023 01:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3Bv=HP=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r9xM7-0005yA-WC
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 01:02:40 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf1e3e46-9240-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 02:02:36 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3B4126RQ094753
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sun, 3 Dec 2023 20:02:12 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3B41249I094751;
 Sun, 3 Dec 2023 17:02:04 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: cf1e3e46-9240-11ee-9b0f-b553b5be7939
Date: Sun, 3 Dec 2023 17:02:04 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
        xen-devel@lists.xenproject.org,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZW0lDEso5c+GUAQr@mattapan.m5p.com>
References: <ZT/Cs+MsBPibcc9D@mattapan.m5p.com>
 <ZT_LWjKgQxOE9lpj@macbook>
 <ZUqRfgAmzJRImW4O@mattapan.m5p.com>
 <hqj6xjxb7r5lb52biejbzzue2jth3rcth3bouadya4jwarll4l@oswerq2ejbli>
 <ZVgp0wshHg3ZQ/Md@mattapan.m5p.com>
 <81f6bbd5-0487-461a-af1a-dbb6ead47cab@citrix.com>
 <ZV1Rz+FmmyWFHiM9@mattapan.m5p.com>
 <ZV8d2ZiiiBBNySgc@macbook>
 <ZWFKtrBl2kpdvjBC@mattapan.m5p.com>
 <ZWRS5qUTjkoD22MF@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWRS5qUTjkoD22MF@macbook>

On Mon, Nov 27, 2023 at 09:27:18AM +0100, Roger Pau Monn
> On Fri, Nov 24, 2023 at 05:15:34PM -0800, Elliott Mitchell wrote:
> > On Thu, Nov 23, 2023 at 10:39:37AM +0100, Roger Pau Monn
> > > On Tue, Nov 21, 2023 at 04:56:47PM -0800, Elliott Mitchell wrote:
> > > > It was insisted that full logs be sent to xen-devel.  Perhaps I am
> > > > paranoid, but I doubt I would have been successful at scrubbing all
> > > > hardware serial numbers.  As such, I was willing to post substantial
> > > > sections, but not everything.
> > > 
> > > Can you please point out which hardware serial numbers are you
> > > referring to, and where are they printed in Xen dmesg?
> > 
> > I didn't confirm the presence of hardware serial numbers getting into
> > Xen's dmesg, but there was a lot of data and many hexadecimal numbers.
> > With 4000 lines of output, checking for concerning data is troublesome.
> 
> 4000 lines of output from Xen dmesg seems quite suspicious.  Xen dmesg
> on a fully booted box is ~400 lines on my local box.  That might get
> quite longer if you have a box with a lot of memory region, or a lot
> of CPUs.

That was from 4 boots with differing settings.  Since it was full console
log, it also had the initial Linux kernel boot messages.  Each log was
~1000 lines.

> > There was enough for alarms to trigger.
> 
> That's fine, but without pointing out which information is sensitive,
> it's very unlikely such concerns will ever get fixed.
> 
> Could you at least go over the log and point out the first instance of
> such line that you consider contains sensitive information?

I would have been more comfortable with getting some guidance on which
portions were desired or which could be left out.  No need for Linux's
boot messages, what would cut things down by half.  No need for the
memory map, lots more goes.

It is easier to be comfortable with 40 line sections than 1000 line
sections.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



