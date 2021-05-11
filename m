Return-Path: <SRS0=u2kx=KG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE774C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 16:51:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B5E61260
	for <xen-devel@archiver.kernel.org>; Tue, 11 May 2021 16:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B5E61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125846.236899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVbQ-0005pB-Lm; Tue, 11 May 2021 16:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125846.236899; Tue, 11 May 2021 16:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVbQ-0005p4-HB; Tue, 11 May 2021 16:51:24 +0000
Received: by outflank-mailman (input) for mailman id 125846;
 Tue, 11 May 2021 16:51:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgVbP-0005or-3K
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 16:51:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcd0cabd-6e70-4295-84d0-b14fd29f103c;
 Tue, 11 May 2021 16:51:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 091D2613C6;
 Tue, 11 May 2021 16:51:21 +0000 (UTC)
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
X-Inumbo-ID: bcd0cabd-6e70-4295-84d0-b14fd29f103c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620751881;
	bh=36FOm/vubAEI0n2qxF3dc7ltKmZVubRWdCsf6LaDk8s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gO6+6kWfZzUSTxw2kbO6cTxuKglMDkF/V6jBMXaPjqGwC1vBJlt8oRXf2y22D/D/f
	 h3ec4bZ36ZUQLYx/+rueldWcwYZZpjBrrmxaP1NLduZWCtgnykKt6u3Tq8Gm1NXu6Q
	 IwjAhx5NWHNz/FkO71dMPx57gAvY1vNnR9hCwcTuaKoclxxteV1TOIbesBucfqhIMl
	 1z6IZRpACDIot0Pg/Rth55+IITCQvd3xDbZdxucxGL2+3QSYBhPzAbTfiSYoRb5nTE
	 1BwXhe9J4XZND5YgTRauuZ4YronUvWPzodXuoWixRNBKwHhMpiAhANdOcQhps6tn8Z
	 Qa6gavxx/4WYA==
Date: Tue, 11 May 2021 09:51:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    f.fainelli@gmail.com, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    linux-kernel@vger.kernel.org, 
    osstest service owner <osstest-admin@xenproject.org>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    iommu@lists.linux-foundation.org
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re: [linux-linus
 test] 161829: regressions - FAIL)]
In-Reply-To: <20210511164933.GA19775@lst.de>
Message-ID: <alpine.DEB.2.21.2105110950580.5018@sstabellini-ThinkPad-T480s>
References: <osstest-161829-mainreport@xen.org> <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de> <alpine.DEB.2.21.2105101818260.5018@sstabellini-ThinkPad-T480s> <20210511063558.GA7605@lst.de> <alpine.DEB.2.21.2105110925430.5018@sstabellini-ThinkPad-T480s>
 <20210511164933.GA19775@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 May 2021, Christoph Hellwig wrote:
> On Tue, May 11, 2021 at 09:47:33AM -0700, Stefano Stabellini wrote:
> > That's a much better plan. It is also not super urgent, so maybe for now
> > we could add an explicit check for io_tlb_default_mem != NULL at the
> > beginning of xen_swiotlb_init? So that at least we can fail explicitly
> > or ignore it explicitly rather than by accident.
> 
> Fine with me.  Do you want to take over from here and test and submit
> your version?

I can do that. Can I add your signed-off-by for your original fix?

