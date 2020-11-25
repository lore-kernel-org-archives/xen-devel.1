Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2EFC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:42:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F50A208B8
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 04:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F50A208B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37239.69487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmct-00040J-Ix; Wed, 25 Nov 2020 04:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37239.69487; Wed, 25 Nov 2020 04:41:55 +0000
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
	id 1khmct-00040B-FJ; Wed, 25 Nov 2020 04:41:55 +0000
Received: by outflank-mailman (input) for mailman id 37239;
 Wed, 25 Nov 2020 04:41:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOsx=E7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1khmcs-000406-42
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:41:54 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27c57388-8b16-46ff-96e8-2cfa3ffb75e9;
 Wed, 25 Nov 2020 04:41:53 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AP4ffo8027973
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 24 Nov 2020 23:41:47 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0AP4feW1027972;
 Tue, 24 Nov 2020 20:41:40 -0800 (PST) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TOsx=E7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1khmcs-000406-42
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:41:54 +0000
X-Inumbo-ID: 27c57388-8b16-46ff-96e8-2cfa3ffb75e9
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27c57388-8b16-46ff-96e8-2cfa3ffb75e9;
	Wed, 25 Nov 2020 04:41:53 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AP4ffo8027973
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 24 Nov 2020 23:41:47 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0AP4feW1027972;
	Tue, 24 Nov 2020 20:41:40 -0800 (PST)
	(envelope-from ehem)
Date: Tue, 24 Nov 2020 20:41:40 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen on RP4
Message-ID: <X73ghKgQEXLv2z2p@mattapan.m5p.com>
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
 <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>

On Tue, Nov 24, 2020 at 08:01:32PM -0800, Roman Shaposhnik wrote:
> On Tue, Nov 24, 2020 at 7:37 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > Presently I'm using a 5.8 kernel with your patches and haven't seen
> > graphical output under Xen with either boot stack.  I've confirmed fully
> > operational graphics without Xen on Tianocore, I've confirmed operational
> > virtual terminals with U-Boot and not Xen.
> >
> > I had been planning to wait a bit before moving to 5.9, but if that is
> > the crucial ingredient I'll move early.
> 
> We're still using 5.4 -- but it seems that the next LTS 5.10 is also functional.
> 
> I can bet $10 whatever it is -- it is DT related ;-)

Given how many of the pieces I'm assembling are alpha or beta level, I
estimate a 50:50 chance on that.  Good odds it is device-tree, but good
odds I grabbed a bad version of $something.

I mostly wanted to know whether I was in completely uncharted territory
and needed to wait for others to catch up, versus merely working in a
situation where support is funky and I'm at an unknown location in
charted territory.

I'll be keeping the Tianocore setup available since Xen on ARM really
/should/ allow ACPI...


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



