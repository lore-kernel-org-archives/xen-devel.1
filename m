Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40C7C5516D
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 18:51:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378449.1623818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVqi-0003Wa-J5; Thu, 30 Jul 2026 18:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378449.1623818; Thu, 30 Jul 2026 18:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpVqi-0003WT-Ev; Thu, 30 Jul 2026 18:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1378449;
 Thu, 30 Jul 2026 18:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wpVqh-0003WN-KO
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 18:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpVqh-000ovV-1D
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 20:51:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a6b9cfe-bab6-0a2a0a5309dd-0a2a450ce1e4-32
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:51:18 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a6b9d25-f479-0a2a450c0019-ac6904fea244-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 20:51:18 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2DA36600C8;
 Thu, 30 Jul 2026 18:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727E81F000E9;
 Thu, 30 Jul 2026 18:51:14 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785437476;
	bh=uL+g8TRymdN2Qu+FrAA+vKroadVYYM5U1shEwR476nI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=btgR0Rl3NCK3Kit+FfK+VzoHISmjvjDhfCQRccYYVXMmKq/Gk+hFg2lZl0yD4WYHs
	 pkkkn/Yelp4NmSXlTLDLfQkSDrazXYCdwnm63ig0jB1zEUjC+Prk9ldNq0OH2aHNSo
	 kQ5/pb14eZB9w8fIgRpB939joihhlZo2d5D1vVUAClU7T3iL7twfc67Q8xpEcXxJ9U
	 novMvPNfT7tHMwAMk6tl5v8w/tXQApOB3YWg0MNjsr96OJ62C2+r7Th4kyuFbjPuUh
	 FVc3cTA1xmC7O56aV0eA466r/wA0xlwMoj+4g4G6V+MS71lRclE/GfQPMdxCwQ00Lg
	 tnckZS1rDsYJQ==
Date: Thu, 30 Jul 2026 11:51:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
cc: Dario Faggioli <dfaggioli@suse.com>, qemu-devel@nongnu.org, 
    philmd@linaro.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    anthony@xenproject.org, paul@xen.org, Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/i386/pc: xen: reinstate the "xenfv" machine alias
In-Reply-To: <amt7j5SAZo07O7xB@redhat.com>
Message-ID: <642c70db-8b59-fbc7-92a2-f27bb56c1206@kernel.org>
References: <20260730162238.3308286-1-dfaggioli@suse.com> <amt7j5SAZo07O7xB@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-600655182-1785437475=:513563"
X-purgate-ID: tlsNG-d25034/1785437478-51F33A5B-9703116F/0/0
X-purgate-type: clean
X-purgate-size: 1332

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-600655182-1785437475=:513563
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Jul 2026, Daniel P. Berrangé wrote:
> On Thu, Jul 30, 2026 at 06:22:38PM +0200, Dario Faggioli wrote:
> > Commit 7d2778dea32a4924a469f1cc5767042c8f5b4eea ("hw/i386/pc:
> > Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines") removed
> > the Xen machine type that was providing the "xenfv" alias. As a
> > consequence, since the tools are apparently relying on such alias,
> > we're getting this, as soon as one tries to start a Xen (HVM) VM:
> > 
> >   qemu-system-i386: unsupported machine type: "xenfv"
> >   Use -machine help to list supported machines
> > 
> > Reinstate the alias and let it point to the only Xen machine we
> > still have.
> > 
> > Fixes: 7d2778dea3 hw/i386/pc: Remove deprecated pc-q35/pc-i440fx/xenfv 3.1 machines
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > ---
> >  hw/i386/pc_piix.c | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-600655182-1785437475=:513563--

