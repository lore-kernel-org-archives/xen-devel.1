Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EAAC4727E
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 08:23:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEDB0208B8
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 08:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NgazHTI+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IOZyUThn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEDB0208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1104.3620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNtsG-0001e8-Mg; Thu, 01 Oct 2020 08:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104.3620; Thu, 01 Oct 2020 08:23:36 +0000
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
	id 1kNtsG-0001e1-Jj; Thu, 01 Oct 2020 08:23:36 +0000
Received: by outflank-mailman (input) for mailman id 1104;
 Thu, 01 Oct 2020 08:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHLv=DI=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kNtsE-0001dw-UI
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:23:35 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b638129b-a334-42ca-ad13-400fce1a8748;
 Thu, 01 Oct 2020 08:22:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VHLv=DI=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
	id 1kNtsE-0001dw-UI
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:23:35 +0000
X-Inumbo-ID: b638129b-a334-42ca-ad13-400fce1a8748
Received: from galois.linutronix.de (unknown [193.142.43.55])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b638129b-a334-42ca-ad13-400fce1a8748;
	Thu, 01 Oct 2020 08:22:56 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1601540555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONHqAv4qT+OTc2BgimstCJPvlJyn9PqWstJJf6uzEpc=;
	b=NgazHTI+SJGDs8egXRGtdo+QGi3xh0JlmycrGchBYrODbgZTjUWPuqO6ut+FnIDPq/gdSJ
	vByj+411k82ifrt2BEVuNPgqX27Y3wm+6Dmn4KcscKE05+QXauqWGac/+IkXdSlflKGPVQ
	gqO3sNFZEbbRG+38SCAe6Uy+7ikGtCs4oqeZOia8yJeiTw1hywgKpiq12HtknxenkgKzRe
	OJrPufOitZDre5pRXFtSqz9yo9w/AoYjWbk8swkUhUsvsq/Dr/oz8+/DUOp6P8ZPNkir9G
	eIp6uHls/G0PP4zrn3niGbMtU2e4Jej+7XYXpi+l/7lKt0TktRFbV900KLGnEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1601540555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONHqAv4qT+OTc2BgimstCJPvlJyn9PqWstJJf6uzEpc=;
	b=IOZyUThnP0eFdoTtp5uGay28riwQzj9H86PK6wCN00tcNvQN7l480emm6WUDFykV9hpp72
	zqYBI/TNYKqiSDAg==
To: Zi Yan <ziy@nvidia.com>
Cc: Wei Liu <wei.liu@kernel.org>, Joerg Roedel <jroedel@suse.de>, x86@kernel.org, iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: Boot crash due to "x86/msi: Consolidate MSI allocation"
In-Reply-To: <A838FF2B-11FC-42B9-87D7-A76CF46E0575@nvidia.com>
References: <A838FF2B-11FC-42B9-87D7-A76CF46E0575@nvidia.com>
Date: Thu, 01 Oct 2020 10:22:35 +0200
Message-ID: <874knegxtg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

Yan,

On Wed, Sep 30 2020 at 21:29, Zi Yan wrote:
> I am running linux-next on my Dell R630 and the system crashed at boot
> time. I bisected linux-next and got to your commit:
>
>     x86/msi: Consolidate MSI allocation
>
> The crash log is below and my .config is attached.
>
> [   11.840905]  intel_get_irq_domain+0x24/0xb0
> [   11.840905]  native_setup_msi_irqs+0x3b/0x90

This is not really helpful because that's in the middle of the queue and
that code is gone at the very end. Yes, it's unfortunate that this
breaks bisection.

Can you please test:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/irq

which contains fixes and if it still crashes provide the dmesg of it.

Thanks,

        tglx


