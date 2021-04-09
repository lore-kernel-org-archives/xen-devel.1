Return-Path: <SRS0=grGV=JG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D110C433B4
	for <xen-devel@archiver.kernel.org>; Fri,  9 Apr 2021 11:11:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD83161019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Apr 2021 11:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD83161019
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.107771.206004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUp2W-0000KH-4s; Fri, 09 Apr 2021 11:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107771.206004; Fri, 09 Apr 2021 11:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUp2W-0000KA-1V; Fri, 09 Apr 2021 11:11:04 +0000
Received: by outflank-mailman (input) for mailman id 107771;
 Fri, 09 Apr 2021 11:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWvH=JG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lUp2V-0000K5-Bf
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 11:11:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 826aa958-c637-4241-bde8-3d7c6ac4b9b6;
 Fri, 09 Apr 2021 11:11:02 +0000 (UTC)
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
X-Inumbo-ID: 826aa958-c637-4241-bde8-3d7c6ac4b9b6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617966662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mV5wkRhTj1XR3mr5lXH6PkobsVTQTCIQ/d/jDKmZOig=;
  b=EhqMS6x6blwgpdn2w3pj84PZ5EguX9eJWOFA+i272pYUwfRLZ5bPGNJz
   Gn3KEszJLAhkMvzFQWyoWxsd2me8YOhckLyoUoE+ytrVo1G+tvduAmS71
   r8u8zoIGu0pKfB9CIPC6XWGYNhdGEjQRMOfgyOCcuZLYZor5wZm3QPV1X
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vi7MDkjMAv45IhMxTjeXx6J/XnIDuVRnuvgfs9sclh/X1K0sxSyeF4THxvdboaly+NMvFwrPki
 dnGu6GyF93xTdCLg7VWslQRkD1WiCMTW9a7pYgVlUhow7iLrsh/z7gF8zzAJyRRSmVAMllbbAu
 7yQPv0jmwC05HFzSIHPOP/Q1nruI8AqFtGOa+Fg/vmTG9KmFktzDkGfbyuzx6gxoFSY+F0MrJi
 zi4MpFK4eTVZ/UNhxvb8djCmry/JJD0/vIUKvq7fZg397UmZO7Pkg8/ZhevMbLFBvsxClxO6Os
 N0U=
X-SBRS: 4.0
X-MesageID: 41637793
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:N7TN/61kQmel9KuES08l1AqjBAIkLtp033Aq2lEZdDV+WKWj9v
 yGtvIdyBPylXI9WGs4n8qBJamHRhrnhPlIyKMWOqqvWxSjhXChK5ts4ZCn7zrrHSD/8eA179
 YHT4FVDtrsAV9myfvr+QXQKadF/PCr+L2l7N2z815DVgdvApsO0y5YDUKhHlRyVE16A/MCZe
 Ohz+5mgxblRngNdMS8ARA+Lo3+jvnGjojvbxJDJzNP0njssRqS5LT3EweV034lOlslq9of2F
 PInADj6qKov+vT8G6/60bp44lLg9yk89NfBaW3+7AoAw/xgQWlbpkJYd2/lQ0yydvA1GoX
X-IronPort-AV: E=Sophos;i="5.82,209,1613451600"; 
   d="scan'208";a="41637793"
Date: Fri, 9 Apr 2021 11:59:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
CC: Stefano Garzarella <sgarzare@redhat.com>, John Simpson
	<ttr9droid@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: An error due to installation that require binutils package
Message-ID: <YHAzgmeVXHUZrgwd@perard>
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
 <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
 <20210330124646.jl4re5srmbzhkipm@steredhat>
 <2BBB0D5A-87FA-49A7-AA75-08CB20078D49@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2BBB0D5A-87FA-49A7-AA75-08CB20078D49@citrix.com>

On Wed, Mar 31, 2021 at 11:03:55AM +0100, George Dunlap wrote:
> [Dropping some irrelevant cc’s]
> 
> > On Mar 30, 2021, at 1:46 PM, Stefano Garzarella <sgarzare@redhat.com> wrote:
> > 
> > Hi John,
> > 
> > On Mon, Mar 29, 2021 at 09:46:49PM +0300, John Simpson wrote:
> >> Hello,
> >> 
> >> Kindly ask you to have a look at this bug.
> >> Thank you for your replies.
> > 
> > It's already fixed in QEMU upstream and the fix will be released with the 6.0 version next month (the rc0 is already available):
> > https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53
> > 
> > I guess xen-4.14.1 is using an older version, so if you want you can backport that patch in your version, the change should be simple.
> 
> Anthony,
> 
> Is this the kind of thing we could / should cherry-pick onto our qemu-upstream branches (both 4.14 and 4.15)?

Done, I've backport the build fix to both staging branch.

Thanks,

-- 
Anthony PERARD

