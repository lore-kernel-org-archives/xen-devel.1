Return-Path: <SRS0=XBwx=7A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0294AC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 14:29:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF1A20756
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2020 14:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF1A20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagl8-0005mi-N5; Mon, 18 May 2020 14:28:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jagl7-0005mJ-Gj
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:28:49 +0000
X-Inumbo-ID: e337d0c6-9913-11ea-b9cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e337d0c6-9913-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 14:28:48 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EgIldiut3SCl7ZE3hTfDxMhA9CBwczqu8OsybRG7zMOaqOjZCqeCwlOGijW3vlYDHOYI8PhFKy
 b3Q1tcUtzfgHL0S83zchAlW7VldSd1OHbZ1GH9NZ5AC7r/Q2M5RC2liLFFwD8xYX6YT+ozQXd2
 R1rCx0M5lOR0JtxQDqOLJk87kXqBJJzb0gyBrCYyYyTG70+3ZkgG42YbGWJ58gi6B+6mpf9Zxv
 4BAp5jcNukTD3GKWOTGQYnxTbOsUXv3CTOr3HhNIs+j6q0lcAm+Ts7GKSj80bWcNuPiGhz8yPN
 NWE=
X-SBRS: 2.7
X-MesageID: 18156373
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="18156373"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24258.39835.645941.176515@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 15:28:43 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 00/18] Add support for qemu-xen runnning in a
 Linux-based stubdomain
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v6 00/18] Add support for qemu-xen runnning in a Linux-based stubdomain"):
> In coordination with Marek, I'm making a submission of his patches for Linux
> stubdomain device-model support.  I made a few of my own additions, but Marek
> did the heavy lifting.  Thank you, Marek.

Hi.  I've gone through this version and there is little left to do.  I
look forward to committing this this week...

Ian.

