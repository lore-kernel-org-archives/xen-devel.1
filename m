Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5089FF885A
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2026 16:18:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1300101.1574665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJw04-0001VL-VT; Mon, 04 May 2026 16:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300101.1574665; Mon, 04 May 2026 16:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJw04-0001VD-SV; Mon, 04 May 2026 16:18:28 +0000
Received: by outflank-mailman (input) for mailman id 1300101;
 Mon, 04 May 2026 16:18:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 1wJw03-0001V7-MC
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 16:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJw02-0032bR-B4
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 18:18:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 69f8c6c1-bab6-0a2a0a5309dd-0a2a450383d6-12
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 18:18:26 +0200
Received: from [79.135.106.104] (helo=mail-106104.protonmail.ch)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Samuel.Montgomery61@protonmail.com>)
 id 69f8c6d1-672d-0a2a45030019-4f876a688269-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 18:18:26 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1777911504; x=1778170704;
	bh=V7sg3EXKpe3ODgXm7r8fn96NbeRoTXzy0BmXoYu5iro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ye0W3KCa++iIUGUF3iIpcsiNqkRul8sSVVRzUwbTh4fbbNz89zM7aGxi1PkC3yjoG
	 d/4zplRy3SZktObsP4VaF30a3spGQFinrF3MG7yZ1mvCyijvnwxcG+OqSvVCHKsEHk
	 0o10G5l7LPQn9wWm82KVtypmIj98ceVh024aJOpkq67e2jPqJ9Us7uPConfkgWO9BM
	 SQ3NE11wuDN3Lan2IPnGYP6a2c9qcLbvpKqiIBsrO/Vwnhn6R9eQu804K1ybQTxyGS
	 VL0B2RNzbEpIAxE70f7EIKgMSSKfH7/9q1+m3+e2xrPCZStZiBOCdJXLNyZRSFegd1
	 zKDX+wGu0dY5A==
Date: Mon, 04 May 2026 16:18:19 +0000
To: Jan Beulich <jbeulich@suse.com>
From: "Samuel.Montgomery61" <Samuel.Montgomery61@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC] Skip boot memory scrub on platforms with full-memory encryption
Message-ID: <v8BgcMuI474dKhLADWT2nMnQYi_m5b1mw7vAZIbRv2ffDY0bh2h_d9Qst_Q-4HUT3DOyYk8WHVpyih_2wlIgvVkbYoLsHY5_jYUPgQnkC1g=@protonmail.com>
In-Reply-To: <8c619af2-0dbd-468f-aa17-c1224d315304@suse.com>
References: <xJXmemuuJ0kqnGWQ9PWwfFn8_KZVhYSbsAyHFGvDeiqpxUK1Q-ar7Lab7ttRPx-tcEHduS26pU9BkIifbhznT1Qc06vyHfovl1-IXC0cWUU=@protonmail.com> <8c619af2-0dbd-468f-aa17-c1224d315304@suse.com>
Feedback-ID: 16446063:user:proton
X-Pm-Message-ID: 4d95ca6219795bd954c22c823b5a6cdcc807f4d1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1777911506-2AD63938-A42898DC/0/0
X-purgate-type: clean
X-purgate-size: 1624

On 04.05.2026 XX:XX, Jan Beulich wrote:
> As you point out, there are issues with default-disabling. We already
> have the "bootscrub=3D" command line option. Is there a reason this can't
> be used here as well? I.e. is there a strong reason to put in (perhaps
> significant) effort to identify and cover all the corner cases
> associated with default-disabling?
=20
A skilled admin could certainly use bootscrub=3Doff today. But I come at
this from the Qubes OS project, where most users expect the system to
work out of the box. Your average Qubes user won't know how or when to
pass a Xen command line option. Having Xen detect encryption and do the
right thing automatically would substantially benefit the project.
=20
I also forgot to mention in my previous email that there's a broader
opportunity with multi-key encryption (SEV, TME-MK). In this case, Xen
could skip runtime scrubbing as well, since a domain's pages become
unreadable the moment its key is destroyed. That's a separate feature,
but I think it makes the case for Xen understanding and acting on the
encryption capabilities of the platform rather than leaving it to users
to set the right combination of options.
=20
I believe the edge cases actually support the case for automatic
configuration, since any user manually disabling the scrub would need
to reason about kexec without a full hardware reset, suspend/resume
restoring the previous key, and firmware writing to memory before
encryption is activated, at very least. Auto-detection could handle
these transparently rather than leaving them to the user.
=20
Sam


