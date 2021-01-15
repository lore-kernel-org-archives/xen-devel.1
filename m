Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1808C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 15:13:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 101262388B
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 15:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 101262388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68255.122156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qmq-0007nc-I4; Fri, 15 Jan 2021 15:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68255.122156; Fri, 15 Jan 2021 15:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qmq-0007nV-F6; Fri, 15 Jan 2021 15:13:16 +0000
Received: by outflank-mailman (input) for mailman id 68255;
 Fri, 15 Jan 2021 15:13:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1JM=GS=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l0Qmo-0007nQ-MS
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:13:14 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f12a42e8-d9e8-4e55-a7e8-426b2ba2e877;
 Fri, 15 Jan 2021 15:13:12 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10FFD7F5028120;
 Fri, 15 Jan 2021 16:13:07 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10FFD7Fc025783;
 Fri, 15 Jan 2021 16:13:07 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id D44567218; Fri, 15 Jan 2021 16:13:06 +0100 (MET)
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
X-Inumbo-ID: f12a42e8-d9e8-4e55-a7e8-426b2ba2e877
Date: Fri, 15 Jan 2021 16:13:06 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD: Fix lock directory path
Message-ID: <20210115151306.GA8765@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-2-bouyer@antioche.eu.org>
 <20210115150919.dolwtbqwbochgp2v@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115150919.dolwtbqwbochgp2v@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 15 Jan 2021 16:13:07 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Fri, Jan 15, 2021 at 04:09:19PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:22PM +0100, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > On NetBSD the lock directory is in /var/run/
> > 
> > Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

thanks
I already asked, but ...
should I resend the patch with this tag, or will the commiter add it itself ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

