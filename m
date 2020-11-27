Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAA7C64E75
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 14:24:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7947521D7A
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 14:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="FMWqw4gh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7947521D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39479.72400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiefX-0007NG-TX; Fri, 27 Nov 2020 14:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39479.72400; Fri, 27 Nov 2020 14:24:15 +0000
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
	id 1kiefX-0007N9-QS; Fri, 27 Nov 2020 14:24:15 +0000
Received: by outflank-mailman (input) for mailman id 39479;
 Fri, 27 Nov 2020 14:24:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dHZ=FB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kiefX-0007N4-3C
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:24:15 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 547d2cd6-08e4-4161-80ff-43340c591949;
 Fri, 27 Nov 2020 14:24:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0dHZ=FB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kiefX-0007N4-3C
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:24:15 +0000
X-Inumbo-ID: 547d2cd6-08e4-4161-80ff-43340c591949
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 547d2cd6-08e4-4161-80ff-43340c591949;
	Fri, 27 Nov 2020 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606487054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D5L4R48jTaqMmWokScSU3RSjvbXkKn0bwvjerOZsofs=;
  b=FMWqw4gho2sUxs0mH13DIWvOaf47BqLp72ttAveQfJgXtDQrouI+nt7t
   tEJb6PT4bKeYQ0SZMg3c1/2zYHKTTGxFLWgdMUcL2G/jglvg2xXW8VgJr
   AK0UiUDHQ6OnvRKt10bRr9LH2unLsg1zHBYKy86+cG2UtPTerzcBHXY/4
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W0cOlhBUV4DnLGq2gDEc1NCNhR932tcp5/Y+YsLB7PwiA8cKThwaunpOtSNhWvvlp5Wr6rLx0F
 W2A18XP4E+SFvNMbcDIqoFsA4rf8dtsH4TL9yXaFrrFH1MY6T9k+w5DO6EuuuB1iXU8eslcR2N
 m6wk86nEHJPn2dYAz4ylRzw9v5yDJMwX4oH24xGdKijsByCPUrzurAL43d/D35A8rF4J5j6yP4
 Mybi2pSan9LhqBlpgr3JpuYkUOSf1dfwmue4oPmVjLLwGtjQzf47vwySVbSX/o3SMYpwKnpnbc
 r18=
X-SBRS: None
X-MesageID: 32019534
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,374,1599537600"; 
   d="scan'208";a="32019534"
Date: Fri, 27 Nov 2020 14:24:07 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Eduardo Habkost <ehabkost@redhat.com>
CC: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	<qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Igor Mammedov
	<imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Wainer
 dos Santos Moschetta" <wainersm@redhat.com>, Aurelien Jarno
	<aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Aleksandar Rikalo
	<aleksandar.rikalo@syrmia.com>, Richard Henderson <rth@twiddle.net>, "Fam
 Zheng" <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS
 7)
Message-ID: <20201127142407.GC2098@perard.uk.xensource.com>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
 <20201126173824.GB2098@perard.uk.xensource.com>
 <20201126174559.GP2271382@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201126174559.GP2271382@habkost.net>

On Thu, Nov 26, 2020 at 12:45:59PM -0500, Eduardo Habkost wrote:
> On Thu, Nov 26, 2020 at 05:38:24PM +0000, Anthony PERARD wrote:
> > Is `make check` going to do something useful with the Xen support? Or is
> > it going to need more work in order to test the Xen support of QEMU?
> > (Like starting an actual Xen guest.)
> 
> I don't think it will test Xen support, but we still want to at
> least check if --enable-xen doesn't break anything else.

That sound good.

> Is there any public CI system anywhere where Xen support is
> tested today?

Yes, we have osstest which regularly test Xen with QEMU from upstream.
Result are sent to xen-devel. But that might not be very useful for
qemu-devel.

We also have a GitLab CI which does some Xen tests, but I don't think
QEMU is tested there.
https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=automation/gitlab-ci/test.yaml;hb=HEAD
https://gitlab.com/xen-project/xen/

Cheers,

-- 
Anthony PERARD

