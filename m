Return-Path: <SRS0=bW6+=HB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE66CC433E0
	for <xen-devel@archiver.kernel.org>; Sat, 30 Jan 2021 01:42:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8751E64E02
	for <xen-devel@archiver.kernel.org>; Sat, 30 Jan 2021 01:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8751E64E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78610.143073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5fHY-00010E-Of; Sat, 30 Jan 2021 01:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78610.143073; Sat, 30 Jan 2021 01:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5fHY-000107-Kk; Sat, 30 Jan 2021 01:42:36 +0000
Received: by outflank-mailman (input) for mailman id 78610;
 Sat, 30 Jan 2021 01:42:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybww=HB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l5fHX-000102-AQ
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 01:42:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a17ff76-08f2-41ec-a893-1c0edbbde65d;
 Sat, 30 Jan 2021 01:42:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3824764E00;
 Sat, 30 Jan 2021 01:42:32 +0000 (UTC)
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
X-Inumbo-ID: 0a17ff76-08f2-41ec-a893-1c0edbbde65d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611970952;
	bh=h/LeJYMJ3mIuW/sjtwYHqUdYdHwVRcudYPwbNZPGpWo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DxazaksHpSQXTCBr91SLRDM3SQkcmO+MUoFauxyE/8MMSiGyuOwnI6KMhA6xDUM9H
	 gRv2ScHn4orTiGPmXQKViLyiytTzJcupijELJikFExZDNvsDBmBINO4Pf7QVRe6wAM
	 ST95zLRljtVxp/vUz72Z8McXCy9ebBd09BBlQzLgJRFuagdzZ1RYPCnHupXeO4nxbp
	 0O3Rf67NQdDwRTuTuypPqEnGU1ouTSoBY3JXYwM0/ubPSuBO1iS0rKo1dL3sgFP8m/
	 Y3RYPS7VP/ja/IRxSC9O5ACmeDiTesqMDl0Hgh3fiIrnXIwGoijDwMvdgOSDbuWEI2
	 RtpzecN9KdJ0A==
Date: Fri, 29 Jan 2021 17:42:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <alpine.DEB.2.21.2101271707570.9684@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2101291740190.9684@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com> <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com> <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com> <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s> <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <alpine.DEB.2.21.2101271707570.9684@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Jan 2021, Stefano Stabellini wrote:
> FYI I have just ordered a micro HDMI cable so I might be able to provide
> more useful feedback in the following days.

What did you use to setup the graphic environment? Is it Ubuntu or
Raspbian? I am having issues setting up a distro with a "startx" that
works.

