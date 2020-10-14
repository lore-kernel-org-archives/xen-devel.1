Return-Path: <SRS0=XJfI=DV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271A3C433E7
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 14:21:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF1122201
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2020 14:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF1122201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.6761.17790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSheK-0000nE-Ui; Wed, 14 Oct 2020 14:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6761.17790; Wed, 14 Oct 2020 14:21:04 +0000
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
	id 1kSheK-0000n7-Rh; Wed, 14 Oct 2020 14:21:04 +0000
Received: by outflank-mailman (input) for mailman id 6761;
 Wed, 14 Oct 2020 14:21:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWa3=DV=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kSheJ-0000n2-4d
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 14:21:03 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 574d0ff8-c528-4fcd-b50d-0fad4f5f1a99;
 Wed, 14 Oct 2020 14:21:00 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09EEKpgL004693;
 Wed, 14 Oct 2020 16:20:51 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 09EEKpIN010168;
 Wed, 14 Oct 2020 16:20:51 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id E932570CD; Wed, 14 Oct 2020 16:20:50 +0200 (MEST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jWa3=DV=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
	id 1kSheJ-0000n2-4d
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 14:21:03 +0000
X-Inumbo-ID: 574d0ff8-c528-4fcd-b50d-0fad4f5f1a99
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 574d0ff8-c528-4fcd-b50d-0fad4f5f1a99;
	Wed, 14 Oct 2020 14:21:00 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09EEKpgL004693;
	Wed, 14 Oct 2020 16:20:51 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
	by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 09EEKpIN010168;
	Wed, 14 Oct 2020 16:20:51 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
	id E932570CD; Wed, 14 Oct 2020 16:20:50 +0200 (MEST)
Date: Wed, 14 Oct 2020 16:20:50 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
        Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
Message-ID: <20201014142050.GA11721@mail.soc.lip6.fr>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
 <20201014141620.GS19254@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201014141620.GS19254@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 14 Oct 2020 16:20:51 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Wed, Oct 14, 2020 at 04:16:20PM +0200, Roger Pau Monné wrote:
> [...]
> Would this result in a regression for NetBSD then? Is it fine to see
> #UD regardless of the platform? It's not clear to me from the text
> above whether this change will cause issues with NetBSD.

AFAIK this should not cause any issue. If I understand it properly,
SYSCALL in a 32bit context would not work in any case on Intel CPUs.
The patch just makes if fail on AMD cpus the same way it fails on Intel.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

