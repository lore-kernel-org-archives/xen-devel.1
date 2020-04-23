Return-Path: <SRS0=af7b=6H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BCFC54FCB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2020 11:28:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342B12077D
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2020 11:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="c+BLPLxm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342B12077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRa1R-0007j6-D7; Thu, 23 Apr 2020 11:28:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGxR=6H=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jRa1Q-0007j1-9H
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 11:28:00 +0000
X-Inumbo-ID: 7c5174c4-8555-11ea-b58d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c5174c4-8555-11ea-b58d-bc764e2007e4;
 Thu, 23 Apr 2020 11:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587641279;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=epYsrRI3SN9UsY22t+MtrUz4boIt6VnJq+06AUnbSDU=;
 b=c+BLPLxmKpsX3RtG3dKSpd7gT6gxKYsAzjJ76tP3rAqXs+g+nR/TRgJh
 8kqB8FigjaV4D+i1WXIwluKBfK9slTgjzi4gF30xiOXlhH3aBL26tOkYC
 ugIYE0I5OxEmy133ahm6Mn6LtSbhWGMI6L2oCF71BdYWFnZi1bqtA9Gkk s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b3KJVDqcyVy26IVT8xd9WBH1tz0vpN3cooNmdKCUdsXLE5+iZPfaxQqSIGPliBKmyt6424Zsf9
 HcCfeexE5Z+o7eZLDEefMCcW32tb37Na3x10H5nrWIeeKlyRPsxKieEcC7l0TENo0bIFWaxZOQ
 wXg66lE4Hjr5PYx/n97bKlgzR6hBWOfHB9qNk7tCF5etxU3rDz2p1x9vwgaDI2QA4188AloJdu
 3XGvVIwCUZX8hR2nCInXOX13D9BAfvtXefi6mnbBWFZRJkWZkOcA5DkMbwRM8FR5Tv+cVLwkzX
 e14=
X-SBRS: 2.7
X-MesageID: 16522853
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16522853"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24225.31669.536258.56822@mariner.uk.xensource.com>
Date: Thu, 23 Apr 2020 12:27:49 +0100
To: George Dunlap <George.Dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: Golang Xen packages and the golang packaging  system
In-Reply-To: <24225.31493.220592.722565@mariner.uk.xensource.com>
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <24225.31493.220592.722565@mariner.uk.xensource.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("Re: Golang Xen packages and the golang packaging  system"):
> This is quite unpleasant.  In particular, it makes a git tree out of
> output files.  What will we do when someone sends us patches to the
> bindings ?

Also, anyone who redistributes your proposed golang package is
violating our licence unless they ship a copy of xen.git[1] too, since
the golang package is not source code.

[1] Technically, a copy of the relevant parts will do.

Ian.

