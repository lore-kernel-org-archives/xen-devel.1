Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8717C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:27:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9692E21D93
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9692E21D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61069.107174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN4g-0000Se-7F; Mon, 04 Jan 2021 10:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61069.107174; Mon, 04 Jan 2021 10:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN4g-0000SX-3X; Mon, 04 Jan 2021 10:26:54 +0000
Received: by outflank-mailman (input) for mailman id 61069;
 Mon, 04 Jan 2021 10:26:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwN4e-0000SR-Sa
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:26:52 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11c2f720-1b7c-4c53-8aa2-3f7830a30909;
 Mon, 04 Jan 2021 10:26:51 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AQjBY021663;
 Mon, 4 Jan 2021 11:26:45 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 67E8D281D; Mon,  4 Jan 2021 11:26:45 +0100 (CET)
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
X-Inumbo-ID: 11c2f720-1b7c-4c53-8aa2-3f7830a30909
Date: Mon, 4 Jan 2021 11:26:45 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 10/24] Make libs/evtchn build on NetBSD
Message-ID: <20210104102645.GD2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-11-bouyer@netbsd.org>
 <20201229115243.itpzsuriclqiljs7@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229115243.itpzsuriclqiljs7@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 04 Jan 2021 11:26:45 +0100 (MET)

On Tue, Dec 29, 2020 at 12:52:43PM +0100, Roger Pau Monné wrote:
> On Mon, Dec 14, 2020 at 05:36:09PM +0100, Manuel Bouyer wrote:
> > ---
> >  tools/libs/evtchn/netbsd.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/libs/evtchn/netbsd.c b/tools/libs/evtchn/netbsd.c
> > index 8b8545d2f9..6d4ce28011 100644
> > --- a/tools/libs/evtchn/netbsd.c
> > +++ b/tools/libs/evtchn/netbsd.c
> > @@ -25,10 +25,10 @@
> >  
> >  #include <sys/ioctl.h>
> >  
> > -#include <xen/sys/evtchn.h>
> > -
> >  #include "private.h"
> >  
> > +#include <xen/xenio3.h>
> > +
> >  #define EVTCHN_DEV_NAME  "/dev/xenevt"
> >  
> >  int osdep_evtchn_open(xenevtchn_handle *xce)
> > @@ -131,7 +131,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> >      int fd = xce->fd;
> >      evtchn_port_t port;
> >  
> > -    if ( read_exact(fd, (char *)&port, sizeof(port)) == -1 )
> > +    if ( read(fd, (char *)&port, sizeof(port)) == -1 )
> >          return -1;
> >  
> >      return port;
> > @@ -140,7 +140,7 @@ xenevtchn_port_or_error_t xenevtchn_pending(xenevtchn_handle *xce)
> >  int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port)
> >  {
> >      int fd = xce->fd;
> > -    return write_exact(fd, (char *)&port, sizeof(port));
> > +    return write(fd, (char *)&port, sizeof(port));
> 
> I'm afraid we will need some context as to why {read/write}_exact
> doesn't work here.

It just doesn't exists on NetBSD

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

