Return-Path: <SRS0=nsPS=EK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4F6C2D0A3
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 19:03:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3728206D9
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2020 19:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3728206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19516.44685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaO3z-0005aF-B3; Wed, 04 Nov 2020 19:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19516.44685; Wed, 04 Nov 2020 19:03:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaO3z-0005a8-7N; Wed, 04 Nov 2020 19:03:19 +0000
Received: by outflank-mailman (input) for mailman id 19516;
 Wed, 04 Nov 2020 19:03:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kZ++=EK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kaO3y-0005a3-FV
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 19:03:18 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 088a0cd9-35c6-4f53-9ba3-0485f02a93c2;
 Wed, 04 Nov 2020 19:03:17 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0A4J34pJ002460
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 4 Nov 2020 14:03:10 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0A4J34rm002459;
 Wed, 4 Nov 2020 11:03:04 -0800 (PST) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kZ++=EK=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kaO3y-0005a3-FV
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 19:03:18 +0000
X-Inumbo-ID: 088a0cd9-35c6-4f53-9ba3-0485f02a93c2
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 088a0cd9-35c6-4f53-9ba3-0485f02a93c2;
	Wed, 04 Nov 2020 19:03:17 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0A4J34pJ002460
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 4 Nov 2020 14:03:10 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0A4J34rm002459;
	Wed, 4 Nov 2020 11:03:04 -0800 (PST)
	(envelope-from ehem)
Date: Wed, 4 Nov 2020 11:03:04 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
Message-ID: <20201104190304.GB1647@mattapan.m5p.com>
References: <20201022014310.GA70872@mattapan.m5p.com>
 <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org>
 <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s>
 <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org>
 <alpine.DEB.2.21.2010230944090.12247@sstabellini-ThinkPad-T480s>
 <bf3b65d2-2642-f1f6-39f1-2f88433e9901@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf3b65d2-2642-f1f6-39f1-2f88433e9901@xen.org>

On Mon, Oct 26, 2020 at 09:19:49AM +0000, Julien Grall wrote:
> On 23/10/2020 17:57, Stefano Stabellini wrote:
> > On Fri, 23 Oct 2020, Julien Grall wrote:

> >> I am sort of okay to remove EXPERT.
> > 
> > OK. This would help (even without building it by default) because as you
> > go and look at the menu the first time, you'll find ACPI among the
> > options right away.
> 
> To be honest, this step is probably the easiest in the full process to 
> get Xen build and booted on Arm.
> 
> I briefly looked at Elliot's v2, and I can't keep thinking that we are 
> trying to re-invent EXPERT for ACPI because we think the feature is 
> *more* important than any other feature gated by EXPERT.

Yet might that statement in fact be true?

Most of the features currently controlled by CONFIG_EXPERT are relatively
small tweaks which enable less often used features.  Some of those are
very high value in certain environments, but they're unimportant in
common environments.  Changing the scheduler might get you an extra
10-50% performance improvement in a special environment.

ACPI support isn't like this.  I'm unaware what Masami Hiramatsu's system
does if a CONFIG_ACPI=n Xen build is tried.  I haven't actually tried
such a build on mine, but from the code it looks like Xen would panic if
built that way.  No output of any sort.  Simply panic with the device
appearing to go inert.

> In fact, all the features behind EXPERT are important. But they have 
> been gated by EXPERT because they are not mature enough.

> But I don't think ACPI is mature enough to deserve a different 
> treatment. It would be more useful to get to the stage where ACPI can 
> work without any crash/issue first.

The difference is the severity of failure if the option is off, but needs
to be on.  Most CONFIG_EXPERT options will merely be performance
reductions or security situations unacceptable to some users.
CONFIG_ACPI=n on the wrong system could be a panic with *no* output.


Tainting sounds reasonable.  Messages in `dmesg` make sense.  A message
plus 10 second pause on boot seems reasonable.  I think if CONFIG_ACPI is
off, there should be code to try to detect ACPI and emit a warning if
anything is detected.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



