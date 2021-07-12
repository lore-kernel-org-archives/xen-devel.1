Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D128C07E99
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 16:21:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23EC8611F1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 16:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23EC8611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154626.285686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2ygS-0004Mb-FH; Mon, 12 Jul 2021 16:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154626.285686; Mon, 12 Jul 2021 16:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2ygS-0004MU-CN; Mon, 12 Jul 2021 16:21:28 +0000
Received: by outflank-mailman (input) for mailman id 154626;
 Mon, 12 Jul 2021 16:21:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2ygR-0004MO-P8
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 16:21:27 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34b9795e-e32d-11eb-86f0-12813bfff9fa;
 Mon, 12 Jul 2021 16:21:26 +0000 (UTC)
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
X-Inumbo-ID: 34b9795e-e32d-11eb-86f0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626106886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+f+/RKfGGq3vzgHiXU9QeyQquC+hZBnGdwCm8vZIaeU=;
  b=fjZUS2EK7jSEyYQQ3lsYM6BA01eoQ1NeW+UgOQO+UBQu2tV7r/ceazeY
   Y6yKoES1DyyoQ0jwFnizW5bcUNIPAjk7dxYl25pj7uynhvPUhfPeB7X7g
   d993GemkmcoRhKLyixe9ZloSswnKie1XogoaKFAXh5ThZCLgBq/N8BKEi
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JHecxpWxKWvBNFzMwxdBD9dPNLx1TBJcMZ3st5F02jjSTEBX7krXTan7krk5/qj+C1gkxhjz6r
 3DWHYQvHr1fGG+yXTpmMOEk6rtE0TZgfDbwnumaQv2rWYhzG0AlKYqOOiJZ7DL6tmTEz0l8zvQ
 1b5c2fYSPv4leLMxWbM5AX7b/eEpfgCIP3FTcyR8sUnsZCRkaFL+qnwzgIX/KM0rHrqvAn6xaw
 91nYCcVZJmGxQhb9JS9rqpyTn6JTxuB4zRVq49ObjKgp0WQuRfH8FB2YMiJ80qGUb5+LEw7jMQ
 Mew=
X-SBRS: 5.1
X-MesageID: 49724044
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yblBIa7ehEx687yjQQPXwDLXdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBOPZqAEIcBeOlNK1u5
 0AT0B/YueAcGSTj6zBkXWF+wBL+qj5zEiq792usUuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-IronPort-AV: E=Sophos;i="5.84,234,1620705600"; 
   d="scan'208";a="49724044"
Date: Mon, 12 Jul 2021 17:21:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 15/31] build: move make option changes check
 earlier
Message-ID: <YOxsAjsZd1lbkVN4@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-16-anthony.perard@citrix.com>
 <cb5a783f-36d2-fc73-f71c-4a12e5cf6515@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cb5a783f-36d2-fc73-f71c-4a12e5cf6515@suse.com>

On Wed, Jul 07, 2021 at 05:40:02PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > And thus avoiding checking for those variable over and over again.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> in its present shape since all you do is move existing logic. But I
> wonder if I could talk you into ...
> 
> > +ifneq ($(origin verbose),undefined)
> > +$(error "You must use 'make menuconfig' to enable/disable verbose now.")
> > +endif
> 
> ... doing away with the misleading mentioning of just "menuconfig" here.
> There are various other *config targets, many of which are also suitable
> for the purpose. Personally I've used menuconfig (in Linux) the last
> time perhaps 15 years ago, and hence I have almost forgotten about its
> existence. IOW at the very least I'd see us insert "e.g." everywhere.

Hopefully, no one ever hits those error anymore, it's been 5 years it
seems since the changes has been made.

But I can write instead:
    "You must use e.g. 'make menuconfig' to enable/disable verbose now."
or maybe:
    "You must use Kconfig with e.g. 'make menuconfig' to enable/disable verbose now."
    ?

Thanks,

-- 
Anthony PERARD

