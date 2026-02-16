Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952F3E83820
	for <xen-devel@archiver.kernel.org>; Mon, 16 Feb 2026 18:37:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1234481.1537729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs3SY-0005ou-8b; Mon, 16 Feb 2026 18:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234481.1537729; Mon, 16 Feb 2026 18:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs3SY-0005on-4l; Mon, 16 Feb 2026 18:36:38 +0000
Received: by outflank-mailman (input) for mailman id 1234481;
 Mon, 16 Feb 2026 18:36:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDeG=AU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vs3SX-0005oh-Gv
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 18:36:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69226db0-0b66-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 19:36:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B1D7F40B5C;
 Mon, 16 Feb 2026 18:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FE8C116C6;
 Mon, 16 Feb 2026 18:36:27 +0000 (UTC)
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
X-Inumbo-ID: 69226db0-0b66-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771266989;
	bh=QRv2RNDiDu27KKeWxAQIcWuH/Q4/aQSzGkg6+PP/rcA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WcC0nr1Ra/bOfB+zxY1lm4HYjMoRZoHzOvkX3/DsWizUm0B7RyvFJIejP3oizhkvv
	 utEu+Hes+VWUJPZpcIcZCg8DZ8Gl/rY6K5+n6aJAcTOThDpg2u/N3XavWXKS2/wOsB
	 moyPWPu8qIe2DIqNc+4be5jn6C31QLTiR5pUyvl+0XrqSPbholeiQxvKsORD/wnLbE
	 UEmVyaxAQxtCYofnnTH3e065/wOKn3WLOvWB8ymN31RajvvvmHfYVr7IKMFKVDDTNQ
	 LHTPanD94SJR7uCIdIkUOiDWsTtYx9PeMlGEr/Y0XF+2/ajseHf1kSAd3F4M86W3t2
	 1afBYioIUtpJg==
Date: Mon, 16 Feb 2026 10:36:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dominique Martinet <asmadeus@codewreck.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jgross@suse.com, v9fs@lists.linux.dev, 
    ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com, 
    sstabellini@kernel.org
Subject: Re: [PATCH v2] 9p/xen: protect xen_9pfs_front_free against concurrent
 calls
In-Reply-To: <aZGOHNhDe1PPJCRO@codewreck.org>
Message-ID: <alpine.DEB.2.22.394.2602161036160.359097@ubuntu-linux-20-04-desktop>
References: <20260129230348.2390470-1-stefano.stabellini@amd.com> <aZGOHNhDe1PPJCRO@codewreck.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 15 Feb 2026, Dominique Martinet wrote:
> Stefano Stabellini wrote on Thu, Jan 29, 2026 at 03:03:48PM -0800:
> > Changes in v2:
> > - move priv->rings check above the loop
> > - replace list_del_init with list_del
> 
> It looks like I didn't reply a couple of weeks ago but I did
> pick it up and just sent to Linus now.
> Thanks!

Thank you!

