Return-Path: <SRS0=7n4I=7S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C96C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 22:30:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C10206F0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 22:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C10206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nerdbynature.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhKqM-0006ya-1W; Fri, 05 Jun 2020 22:29:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgD6=7S=nerdbynature.de=lists@srs-us1.protection.inumbo.net>)
 id 1jhKqL-0006yV-4f
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 22:29:41 +0000
X-Inumbo-ID: 0ad498be-a77c-11ea-ba62-bc764e2007e4
Received: from trent.utfs.org (unknown [2a03:3680:0:3::67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ad498be-a77c-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 22:29:39 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by trent.utfs.org (Postfix) with ESMTPS id 2E6B95FCDB;
 Sat,  6 Jun 2020 00:21:56 +0200 (CEST)
Date: Fri, 5 Jun 2020 15:21:56 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: 5.7.0 / BUG: kernel NULL pointer dereference / setup_cpu_watcher
In-Reply-To: <a467c2db-e72d-9a27-9fbd-9bcf8770de20@citrix.com>
Message-ID: <alpine.DEB.2.22.395.2006051519430.13291@trent.utfs.org>
References: <alpine.DEB.2.22.395.2006050059530.13291@trent.utfs.org>
 <a467c2db-e72d-9a27-9fbd-9bcf8770de20@citrix.com>
User-Agent: Alpine 2.22 (DEB 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 5 Jun 2020, Andrew Cooper wrote:
> PVH domains don't have the emulated platform device, so Linux will be
> finding ~0 when it goes looking in config space.
> 
> The diagnostic should be skipped in that case, to avoid giving the false
> impression that something is wrong.

Understood, thanks for explaining that. I won't be able to edit 
arch/x86/xen/platform-pci-unplug.c to fix that though :-\

Christian.
-- 
BOFH excuse #134:

because of network lag due to too many people playing deathmatch

