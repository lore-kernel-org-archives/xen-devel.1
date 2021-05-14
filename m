Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB28C43460
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 05:34:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DB7610F8
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 05:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DB7610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127224.239051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhQSw-0005LX-QB; Fri, 14 May 2021 05:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127224.239051; Fri, 14 May 2021 05:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhQSw-0005LQ-NI; Fri, 14 May 2021 05:34:26 +0000
Received: by outflank-mailman (input) for mailman id 127224;
 Fri, 14 May 2021 05:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjOs=KJ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1lhQSv-0005LK-5k
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 05:34:25 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 253116a6-17f3-4e4e-a67c-36d38d4489f2;
 Fri, 14 May 2021 05:34:24 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 14E5Y6Yx074385
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 14 May 2021 01:34:12 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 14E5Y56K074384;
 Thu, 13 May 2021 22:34:05 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 253116a6-17f3-4e4e-a67c-36d38d4489f2
Date: Thu, 13 May 2021 22:34:05 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Connor Davis <connojdavis@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 1/5] xen/char: Default HAS_NS16550 to y only for X86
 and ARM
Message-ID: <YJ4LzUcajOJncKUP@mattapan.m5p.com>
References: <cover.1620965208.git.connojdavis@gmail.com>
 <3960a676376e0163d97ac02f968966cdfaccbf75.1620965208.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3960a676376e0163d97ac02f968966cdfaccbf75.1620965208.git.connojdavis@gmail.com>

On Thu, May 13, 2021 at 10:17:08PM -0600, Connor Davis wrote:
> Defaulting to yes only for X86 and ARM reduces the requirements
> for a minimal build when porting new architectures.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  xen/drivers/char/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index b572305657..b15b0c8d6a 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -1,6 +1,6 @@
>  config HAS_NS16550
>  	bool "NS16550 UART driver" if ARM
> -	default y
> +	default y if (ARM || X86)
>  	help
>  	  This selects the 16550-series UART support. For most systems, say Y.

Are you sure this is necessary?  I've been working on something else
recently, but did you confirm this with a full build?

If you observe the line directly above that one, `_if_ARM_`.  I'm pretty
sure this driver will refuse to show up in a RISC-V build.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



