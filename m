Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1A1C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:49:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89D5A22202
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GtrR9229"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D5A22202
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20915.46967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb3zJ-00033W-I8; Fri, 06 Nov 2020 15:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20915.46967; Fri, 06 Nov 2020 15:49:17 +0000
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
	id 1kb3zJ-00033P-FA; Fri, 06 Nov 2020 15:49:17 +0000
Received: by outflank-mailman (input) for mailman id 20915;
 Fri, 06 Nov 2020 15:49:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+KtV=EM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kb3zH-00033K-L6
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:49:15 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id acd985ab-8337-43f6-a668-ebadfcc2b01c;
 Fri, 06 Nov 2020 15:49:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+KtV=EM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kb3zH-00033K-L6
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:49:15 +0000
X-Inumbo-ID: acd985ab-8337-43f6-a668-ebadfcc2b01c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id acd985ab-8337-43f6-a668-ebadfcc2b01c;
	Fri, 06 Nov 2020 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604677753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yz5DFGKpaiVNHL3RvlNotFBzT5VQDrG5Fw/aH/1VkuM=;
  b=GtrR9229rKDSd8IeTUrNNxoLfQo5R/7JivDBFMVg65KvUC4TBCJyNoO4
   /n5RnRilDVNNgUJGxcWMgDEBiZwbIDiMBp7jVNuae8aEOfnFSN7SNDLeJ
   3z/ZDrHvSAsbx2JQPES8yRIfmobFVm/D90jWp75rmZjmLE7t1SkWeyu/Z
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: kqXxJxKBs1V0rMqwAnGP/wWmjBvus9Rfa5oQBZhWA5ToUBXnxoOgAhgcho7HUqowRQbhjDmoL3
 RY3wDrwsONsSfeTB9JRvFsdwXSstVHkQSmrEg8FwHXIMoAXUvF6uvGrMPaOKUTwwSqdeykgGLM
 yJK0b1BBvd3vNROwKAWc3qTcKWES+DvCZENrPfeyvxh4GgwXL5pk+C3E9R3qEV/RoVdU7yFGM0
 US517zCDPnPXPyaMrtlUWh+dWofnxMI4d2JV8tdbMGH+Ce0vD8SMvTzD7Nf+AuurITlFrVmKA9
 3k4=
X-SBRS: None
X-MesageID: 30674195
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,456,1596513600"; 
   d="scan'208";a="30674195"
Date: Fri, 6 Nov 2020 15:49:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Michael Young <m.a.young@durham.ac.uk>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: Xen 4.13.2 released
Message-ID: <20201106154908.GN2214@perard.uk.xensource.com>
References: <ed219f15-479b-5d06-c835-eb4f4c64db3a@suse.com>
 <a391cfd1-be4a-add6-cd36-8bb254f9b43f@austen3.home>
 <a3dfec9d-bb32-c1c5-c00e-ea95c62c9bde@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a3dfec9d-bb32-c1c5-c00e-ea95c62c9bde@suse.com>

On Wed, Nov 04, 2020 at 08:47:57AM +0100, Jan Beulich wrote:
> On 04.11.2020 00:55, Michael Young wrote:
> > On Tue, 3 Nov 2020, Jan Beulich wrote:
> >> I am pleased to announce the release of Xen 4.13.2. This is available
> >> immediately from its git repository
> >> http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.13
> >> (tag RELEASE-4.13.2) or from the XenProject download page
> >> https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-2/
> >> (where a list of changes can also be found).
> > 
> > Is the entry for XSA-335 correct on the download page? That was a qemu 
> > patch but I don't think it was included in 4.13.2.
> 
> Interesting, thanks for pointing this out. The qemu-trad part,
> albeit "just" a SUPPORT.md update, didn't even make it into
> staging yet afaics. While this can perhaps be viewed as benign,
> I'm concerned that the qemuu fix also doesn't look to have
> landed in any of the branches yet, despite the version bump on
> the staging/master branches just 5 days ago. Anthony, Stefano?

I've pushed the fix now, to qemu-xen trees.

Maybe George's script could check qemu-xen trees as well? Or someone in
the security team could push the patchs or tell me about XSAs involving
QEMU, otherwise that's going to happen again.

Cheers,

-- 
Anthony PERARD

