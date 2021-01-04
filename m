Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B634C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:47:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E633221D93
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 10:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E633221D93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61099.107234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNOX-0002hl-0T; Mon, 04 Jan 2021 10:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61099.107234; Mon, 04 Jan 2021 10:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNOW-0002he-SY; Mon, 04 Jan 2021 10:47:24 +0000
Received: by outflank-mailman (input) for mailman id 61099;
 Mon, 04 Jan 2021 10:47:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwNOV-0002hZ-1G
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:47:23 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf65ef68-c004-4cd6-aa77-c25e6006f85a;
 Mon, 04 Jan 2021 10:47:22 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AlIjG006597;
 Mon, 4 Jan 2021 11:47:18 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 0B91D281D; Mon,  4 Jan 2021 11:47:18 +0100 (CET)
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
X-Inumbo-ID: bf65ef68-c004-4cd6-aa77-c25e6006f85a
Date: Mon, 4 Jan 2021 11:47:18 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 16/24] Switch NetBSD to QEMU_XEN (!traditional)
Message-ID: <20210104104718.GH2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-17-bouyer@netbsd.org>
 <20201229141914.wqj2h5ber7vgdxbk@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229141914.wqj2h5ber7vgdxbk@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 04 Jan 2021 11:47:18 +0100 (MET)

On Tue, Dec 29, 2020 at 03:19:14PM +0100, Roger Pau Monné wrote:
> On Mon, Dec 14, 2020 at 05:36:15PM +0100, Manuel Bouyer wrote:
> > ---
> >  tools/libs/light/libxl_netbsd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/libs/light/libxl_netbsd.c b/tools/libs/light/libxl_netbsd.c
> > index e66a393d7f..31334f932c 100644
> > --- a/tools/libs/light/libxl_netbsd.c
> > +++ b/tools/libs/light/libxl_netbsd.c
> > @@ -110,7 +110,7 @@ out:
> >  
> >  libxl_device_model_version libxl__default_device_model(libxl__gc *gc)
> >  {
> > -    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL;
> > +    return LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
> >  }
> 
> All libxl supported OSes will now be using upstream QEMU as default,
> maybe it's best to just move libxl__default_device_model into
> libxl_dm.c instead of having 3 equal copies in OS specific files.

I guess it would be better, yes. But I'll let the Xen developpers decide :)

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

