Return-Path: <SRS0=okQV=DB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545BDC4363D
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 10:14:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEAEF21D24
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2020 10:14:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Il0jhs33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEAEF21D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOGJ-0003ds-Uf; Thu, 24 Sep 2020 10:14:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3L7=DB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kLOGJ-0003dH-6B
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:14:03 +0000
X-Inumbo-ID: 53d2a7d8-f9c9-4de6-a1a4-56dc2e0807e1
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53d2a7d8-f9c9-4de6-a1a4-56dc2e0807e1;
 Thu, 24 Sep 2020 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600942437;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Dxq6kcZuD1yLhz83BdQaDBswf+r7H5Cw763TEiIA5Ks=;
 b=Il0jhs334bOK10DoEpusXfBPn17ZpuBu0s49b+IO38UC2Nst4woelFBN
 Kx21FFBQXQm6CKaMhTl9eY64+XmHP8UBVwEasemw82W3dZCh4rVSRUgOv
 i57VK9S8xsmUxzuN+tTcdIiIiYrWD8zVBU3fP5tPz3t7oOCWdnJvLCdS0 s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aa9Yc5uXsNyZc4a3xJjI0PKxAR/Q972NX44zik2KmyXqKIBIwfskdtuxoCOTkpDzQqtPG5Ik68
 mWzavWg3o5Ena2knokLLhk07n2q6itSyIjuGpZBNMC3du2eDTN9uB00bOIIh2lBQEtzJ0KYZrC
 806XnxjNuw18wsK3GcVFFzAObva5+PihDMkZ8n3kuZIOl1MVqq6xhCLdv2LRIU4QPsAHgSTzXI
 dI7U6/tY5qSKfc4zjw+ra9KETYu+azT3zprazSO+RJqQzET1XibyqxZUlS635Pb+nk46w8yis4
 J6U=
X-SBRS: None
X-MesageID: 28460264
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,297,1596513600"; d="scan'208";a="28460264"
Date: Thu, 24 Sep 2020 12:13:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: SeongJae Park <sjpark@amazon.com>, SeongJae Park <sjpark@amazon.de>,
 <axboe@kernel.dk>, <aliguori@amazon.com>, <amit@kernel.org>,
 <mheyne@amazon.de>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Message-ID: <20200924101344.GN19254@Air-de-Roger>
References: <20200922070125.27251-1-sjpark@amazon.com>
 <20200923200930.GB11767@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200923200930.GB11767@char.us.oracle.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 23, 2020 at 04:09:30PM -0400, Konrad Rzeszutek Wilk wrote:
> On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> > From: SeongJae Park <sjpark@amazon.de>
> > 
> > Persistent grants feature provides high scalability.  On some small
> > systems, however, it could incur data copy overhead[1] and thus it is
> > required to be disabled.  But, there is no option to disable it.  For
> > the reason, this commit adds a module parameter for disabling of the
> > feature.
> 
> Would it be better suited to have it per guest?

I think having a per-backend policy that could be specified at the
toolstack level would be nice, but I see that as a further
improvement.

Having a global backend domain policy of whether persistent grants are
enabled or not seems desirable, and if someone wants even more fine
grained control this change is AFAICT not incompatible with a
per-backend option anyway.

Roger.

