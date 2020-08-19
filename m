Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42343C433E1
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 03:44:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 126E7204EC
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 03:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 126E7204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8F1M-0005f7-Pd; Wed, 19 Aug 2020 03:44:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZrp=B5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1k8F1L-0005f2-Ce
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 03:44:15 +0000
X-Inumbo-ID: bbd03ac8-b88b-401b-a345-1002a9f24ea4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbd03ac8-b88b-401b-a345-1002a9f24ea4;
 Wed, 19 Aug 2020 03:44:13 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 07J3hvZP032450
 (version=TLSv1.2 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 18 Aug 2020 23:44:03 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 07J3huQE032449;
 Tue, 18 Aug 2020 20:43:56 -0700 (PDT) (envelope-from ehem)
Date: Tue, 18 Aug 2020 20:43:56 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: fix -Werror=stringop-truncation in
 libxl__prepare_sockaddr_un
Message-ID: <20200819034356.GA29116@mattapan.m5p.com>
References: <20200819020036.599065-1-marmarek@invisiblethingslab.com>
 <20200819020036.599065-2-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819020036.599065-2-marmarek@invisiblethingslab.com>
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

On Wed, Aug 19, 2020 at 04:00:36AM +0200, Marek Marczykowski-G??recki wrote:
> diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
> index f360f5e228..b039143b8a 100644
> --- a/tools/libxl/libxl_utils.c
> +++ b/tools/libxl/libxl_utils.c


>      }
>      memset(un, 0, sizeof(struct sockaddr_un));
>      un->sun_family = AF_UNIX;
> -    strncpy(un->sun_path, path, sizeof(un->sun_path));
> +    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
>      return 0;
>  }

While the earlier lines are okay, this line introduces an error.  If the
compiler complains once the earlier lines are fixed, something might need
to be done about this.

I would be tempted to switch to strlcpy() since this doesn't look like it
needs un->sun_path to be zeroed out.  (note I'm not familiar with this
code, so someone else needs to check me on this)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



