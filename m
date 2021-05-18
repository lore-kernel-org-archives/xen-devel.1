Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA92C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 16:02:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 350B4610CB
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 16:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 350B4610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129411.242898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2AW-0006OQ-05; Tue, 18 May 2021 16:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129411.242898; Tue, 18 May 2021 16:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2AV-0006OJ-SG; Tue, 18 May 2021 16:02:03 +0000
Received: by outflank-mailman (input) for mailman id 129411;
 Tue, 18 May 2021 16:02:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xey/=KN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lj2AU-0006OD-TC
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:02:02 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b480e7a-7b96-47b5-bda7-f3403399ee89;
 Tue, 18 May 2021 16:02:02 +0000 (UTC)
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
X-Inumbo-ID: 6b480e7a-7b96-47b5-bda7-f3403399ee89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621353721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcGyOaCqAVUMCBuO1cFrZgtaxJNzh7MpEj13jxmSZN0=;
  b=c/ozoi4dFWpDq/QHQ3GFKn98/Kbs4NMeqFYLKRgtH1HJljxEPDHW8Ejv
   KE2aSN1/HldOnfVEkzx4yBRbpQznoejNnDEOoHDN6gVVIIJtdUHar78vG
   F7v6khNevAbEobLDkvrtw91S3bOwB5zFJhtPC6H2jPFvtbkp+Po8RqAmH
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NJDesJ2glXr5d2tWFnCKXphqs33pM33/jj1Rh6M5/Zt3Y5ob9VSDzBPkS6ZOTsmYcRWvaFMv6/
 YBELsxBTDIQ2jqao6K6pUkYzzhDZtVvYfr5i9UJynTwtMlNEKQMlfMw8Tnex5m66Zyv2GeBsd2
 ZGTqANlBx7SyCw7xIrUETe/DbdLQ6h73fDtjKx9GfZ2pXd40psAVP5MxMx5BPRx/TPke+BYaiW
 T9yYfSRLsE4dr6N0+K20xrlewKGW3dmzO1w0Li5DyIQYIjmz5cTPOpvCUkCiUAtDA37kENOhhk
 utA=
X-SBRS: 5.1
X-MesageID: 44046508
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7KZ50KAJy7qOBQjlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="44046508"
Date: Tue, 18 May 2021 17:01:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] tools/console: Use const whenever we point to
 literal strings
Message-ID: <YKPk9QJJS6kMy6uP@perard>
References: <20210518140134.31541-1-julien@xen.org>
 <20210518140134.31541-3-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210518140134.31541-3-julien@xen.org>

On Tue, May 18, 2021 at 03:01:34PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
> 
> Take the opportunity to remove the cast (char *) in console_init(). It
> is unnecessary and will remove the const.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Acked-by: Wei Liu <wl@xen.org>
> 
> ---
>     Changes in v2:
>         - Remove the cast (char *) in console_init()

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

