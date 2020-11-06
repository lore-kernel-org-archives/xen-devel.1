Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD79C63697
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:12:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE92722203
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="f9bZiGe0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE92722203
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20894.46924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb3PA-0008U4-1c; Fri, 06 Nov 2020 15:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20894.46924; Fri, 06 Nov 2020 15:11:56 +0000
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
	id 1kb3P9-0008Tx-U6; Fri, 06 Nov 2020 15:11:55 +0000
Received: by outflank-mailman (input) for mailman id 20894;
 Fri, 06 Nov 2020 15:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+KtV=EM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kb3P8-0008Ts-Dj
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:11:54 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be185ddf-45ef-4ad9-afc7-f30327d238c2;
 Fri, 06 Nov 2020 15:11:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+KtV=EM=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kb3P8-0008Ts-Dj
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:11:54 +0000
X-Inumbo-ID: be185ddf-45ef-4ad9-afc7-f30327d238c2
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id be185ddf-45ef-4ad9-afc7-f30327d238c2;
	Fri, 06 Nov 2020 15:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604675513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xdbHo+p5BgdyP73xJIcQGHCSKtTjksyd3+brh7VTRP8=;
  b=f9bZiGe0KRujBi3Kmm+q57BifNJB7xgafz49GD0m9vxZgwRFPDzry7OD
   SnWkGIqqmpKx5c5otJQe8yRVHo/vNmTpqErXDEtpEyZTt6zF3eUOWVh5U
   8hLArUlwjfRHOI8c38vMWgqm1YkAs33L7p3CL7yyDmA57t54l8ra0WeKD
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jxpGl2hMit/nW6dP7MUyVjLk8NgXAR/2qZ8hJag6uXV3Ce8daN/Qtil5kziv3tY3M3yD7dWXYQ
 MJ+JNIRjdhUXkqOGUtHqo9b7j2Aih7UnmW76ONnUm65NZEtXzCZfVgzYXyoqVj+oBURa9kcUyF
 YAXh8Y/5sFvUH3l4xyjzdG/+/iR7wtQH+Kb9DiSuZYzKOdEbfOfTWARtfsbjNonKeyUYRdmUeY
 PIdSRrVJseEuT1TZ6VeFz6dmrHrR+lr3zuQqI8vrjcjjPKNc+oekG8PWMowXKRGIsaeuujW9+N
 epM=
X-SBRS: None
X-MesageID: 30976882
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,456,1596513600"; 
   d="scan'208";a="30976882"
Date: Fri, 6 Nov 2020 15:11:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <takahiro.akashi@linaro.org>,
	<alex.bennee@linaro.org>, <masami.hiramatsu@linaro.org>,
	<ian.jackson@eu.citrix.com>, <wl@xen.org>
Subject: Re: [PATCH] libxl: set vuart_gfn in libxl__build_hvm
Message-ID: <20201106151146.GM2214@perard.uk.xensource.com>
References: <alpine.DEB.2.21.2011051312120.2323@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2011051312120.2323@sstabellini-ThinkPad-T480s>

On Thu, Nov 05, 2020 at 01:15:05PM -0800, Stefano Stabellini wrote:
> libxl: set vuart_gfn in libxl__build_hvm

The subject is written two times ;-)

> Setting vuart_gfn was missed when switching ARM guests to the PVH build.
> Like libxl__build_pv, libxl__build_hvm should set state->vuart_gfn to
> dom->vuart_gfn.
> 
> Without this change, xl console cannot connect to the vuart console (-t
> vuart), see https://marc.info/?l=xen-devel&m=160402342101366.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
> index f8661e90d4..36fe8915e7 100644
> --- a/tools/libxl/libxl_dom.c
> +++ b/tools/libxl/libxl_dom.c
> @@ -1184,6 +1184,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
>          LOG(ERROR, "hvm build set params failed");
>          goto out;
>      }
> +    state->vuart_gfn = dom->vuart_gfn;
>  
>      rc = hvm_build_set_xs_values(gc, domid, dom, info);
>      if (rc != 0) {

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

