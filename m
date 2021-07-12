Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86608C07E9C
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 18:30:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5210961164
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 18:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5210961164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154656.285746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m30gm-000135-Hd; Mon, 12 Jul 2021 18:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154656.285746; Mon, 12 Jul 2021 18:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m30gm-00012y-Ed; Mon, 12 Jul 2021 18:29:56 +0000
Received: by outflank-mailman (input) for mailman id 154656;
 Mon, 12 Jul 2021 18:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aa2W=ME=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m30gk-00012s-W4
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 18:29:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 269accc6-e33f-11eb-86fc-12813bfff9fa;
 Mon, 12 Jul 2021 18:29:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0056761164;
 Mon, 12 Jul 2021 18:29:52 +0000 (UTC)
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
X-Inumbo-ID: 269accc6-e33f-11eb-86fc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626114593;
	bh=96J+P/54PiSdkLBZltfwRuUs97KzYduOedGlhSWmuLE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eexoAoAsXrIivQfGgNwWpRYCcPyaiDXO0/WClkmryPk597BobEGfZUtog+IaN2qD3
	 bBcXx4+muveRVztjRawd02enjGom4hkv0/HX/9kkpjKvMtO8satMgBshEydpeAVeME
	 Xpm8qCI2D/o6/+YonNj6GGBupssJ0yFbllOVBoa5ehylU6YpvVlXqUSSIYV0B0o7he
	 AYy2dKMaVC25XK489xF3spG/WE0PpPMsJ6rE5wRbhpOUc1LTxUDIHs6GIUaLpoiXtn
	 jCXDz+pop3li9yckIywTqK4rupJUtpxmJJT7DRa6AXyrJiEqO+wqJjxFgXw8R2cq9s
	 tbxrzL5vOnapw==
Date: Mon, 12 Jul 2021 11:29:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Julien Grall <julien@xen.org>, committers@xenproject.org, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: gitlab merge request -> list patchbomb workflows
In-Reply-To: <24808.30610.559142.775285@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2107121128410.23286@sstabellini-ThinkPad-T480s>
References: <24808.28606.387467.578829@mariner.uk.xensource.com> <8a40ee32-4141-ddc4-4c19-582334f3b245@xen.org> <24808.30610.559142.775285@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Jul 2021, Ian Jackson wrote:
> Julien Grall writes ("Re: gitlab merge request -> list patchbomb workflows"):
> > I have recently started to use b4 [1] to fetch patches and collect tags 
> > from the mailing list. I am wondering if the tools could be extended to 
> > also allow a quick look through of the review "state" of each patch?
> 
> Cool.  That's interesting.  I need to think about it some more, but I
> think this is a possible alternative to using patchwork for the
> analysis task.
> 
> Also, if a robot wanted to post a v2 it could use b4 to fold the acks
> etc. into the repost, without the submitter having to add them to the
> git branch.

Hi Ian,

I think kernel.org is already working on the same feature, you might
want to ask Konstantin Ryabitsev about it.

Cheers,

Stefano

