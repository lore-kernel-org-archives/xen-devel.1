Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72059C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:30:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C2721D93
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C2721D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61075.107186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN7e-0000e2-NV; Mon, 04 Jan 2021 10:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61075.107186; Mon, 04 Jan 2021 10:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN7e-0000dv-Jc; Mon, 04 Jan 2021 10:29:58 +0000
Received: by outflank-mailman (input) for mailman id 61075;
 Mon, 04 Jan 2021 10:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwN7d-0000dg-3x
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:29:57 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 638fc4fa-b65b-4d4e-9c51-e36179a7eefb;
 Mon, 04 Jan 2021 10:29:56 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104ATp7s005726;
 Mon, 4 Jan 2021 11:29:51 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id E2792281D; Mon,  4 Jan 2021 11:29:51 +0100 (CET)
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
X-Inumbo-ID: 638fc4fa-b65b-4d4e-9c51-e36179a7eefb
Date: Mon, 4 Jan 2021 11:29:51 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 12/24] Implement gnttab on NetBSD
Message-ID: <20210104102951.GE2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-13-bouyer@netbsd.org>
 <20201229111601.x5gmbcai4d7ex5yd@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229111601.x5gmbcai4d7ex5yd@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Mon, 04 Jan 2021 11:29:52 +0100 (MET)

On Tue, Dec 29, 2020 at 12:16:01PM +0100, Roger Pau Monné wrote:
> Might need some kind of log message, and will also required your
> Signed-off-by (or from the original author of the patch).
> 
> On Mon, Dec 14, 2020 at 05:36:11PM +0100, Manuel Bouyer wrote:
> > ---
> >  tools/libs/gnttab/Makefile |   2 +-
> >  tools/libs/gnttab/netbsd.c | 267 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 268 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/libs/gnttab/netbsd.c
> > 
> > diff --git a/tools/libs/gnttab/Makefile b/tools/libs/gnttab/Makefile
> > index d86c49d243..ae390ce60f 100644
> > --- a/tools/libs/gnttab/Makefile
> > +++ b/tools/libs/gnttab/Makefile
> > @@ -10,7 +10,7 @@ SRCS-GNTSHR            += gntshr_core.c
> >  SRCS-$(CONFIG_Linux)   += $(SRCS-GNTTAB) $(SRCS-GNTSHR) linux.c
> >  SRCS-$(CONFIG_MiniOS)  += $(SRCS-GNTTAB) gntshr_unimp.c minios.c
> >  SRCS-$(CONFIG_FreeBSD) += $(SRCS-GNTTAB) $(SRCS-GNTSHR) freebsd.c
> > +SRCS-$(CONFIG_NetBSD)  += $(SRCS-GNTTAB) $(SRCS-GNTSHR) netbsd.c
> >  SRCS-$(CONFIG_SunOS)   += gnttab_unimp.c gntshr_unimp.c
> > -SRCS-$(CONFIG_NetBSD)  += gnttab_unimp.c gntshr_unimp.c
> >  
> >  include $(XEN_ROOT)/tools/libs/libs.mk
> > diff --git a/tools/libs/gnttab/netbsd.c b/tools/libs/gnttab/netbsd.c
> > new file mode 100644
> > index 0000000000..2df7058cd7
> > --- /dev/null
> > +++ b/tools/libs/gnttab/netbsd.c
> 
> I think this is mostly (if not equal) to the FreeBSD version, in which
> case we could rename freebsd.c to plain bsd.c and use it for
> both FreeBSD and NetBSD?

I can't see why they won't diverge in the future ...
I prefer to keep them separate.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

