Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D04CC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 08:44:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB01206A2
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 08:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB01206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2WO-0001I1-VC; Tue, 02 Jun 2020 08:43:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg2WO-0001Hw-1G
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 08:43:44 +0000
X-Inumbo-ID: 2924e14c-a4ad-11ea-abae-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2924e14c-a4ad-11ea-abae-12813bfff9fa;
 Tue, 02 Jun 2020 08:43:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so2451869wrn.11
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 01:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8dypxLySplyxbKkucnutwAQQmF7+T2g+TNYmx/UT01E=;
 b=I9nvrNiDFaCMfJVUODXJumVgW2vRRL8B2O8O7GZvjeC5pzW3sIKIl4yc/5MlXBuAYm
 HlGAyL2jun7mdsqkJJLG/SXPONO0VEtGKyAHYg+p3QTuGH7akzncb1Y4dnOO1ADm9kIj
 0Hg+Ks0Ud+wOg2lDNhlizPv3QkBrXp9wWB0Crj0yASLWYa9p9Z92ExxRH7lnXgqapnpQ
 FUh+WdPnjTNxsneVyGV45J5pYwYINh2wnAVk8096xtJZxkgWLjEfhfyAj4w03/LTH5Cb
 BUY1stgCgnrfmAIE3t6dnaQqMdwQArA8WR77QOs7wFM07boUdU+IB8R6F7WcfZfsWbrF
 SPJQ==
X-Gm-Message-State: AOAM533n4myUb8bfc/HIw1Tmm+sE7DZrXTjmgn8fOqgHWzE46SR6bq5s
 rG97/TqayENbKV1YtO2OVkU=
X-Google-Smtp-Source: ABdhPJw+7eiucoHO/9lp4A4QO/76L3VOoKD9NgQq0M0+mqTLjJ2+MVPIVFIxMLREL0vbGZK9Cwe+pQ==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr24097934wrs.190.1591087421147; 
 Tue, 02 Jun 2020 01:43:41 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g18sm2496143wme.17.2020.06.02.01.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 01:43:40 -0700 (PDT)
Date: Tue, 2 Jun 2020 08:43:38 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] INSTALL: remove TODO section
Message-ID: <20200602084338.a55bbjbhal4gbyvh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200529135303.18457-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529135303.18457-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 29, 2020 at 03:53:03PM +0200, Olaf Hering wrote:
> The default value '/' for DESTDIR is unusual, but does probably not hurt.
> 
> Fixes commit f2b40dababedcd8355bf3e85d00baf17f9827131
> Fixes commit 8e986e5a61efeca92b9b268e77957d45d8316ee4
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Wei Liu <wl@xen.org>

Based on the fact that you're the original author of this documentation.
:-)

Cc Paul.

> ---
>  INSTALL | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/INSTALL b/INSTALL
> index 72dc4b67dd..0d3eb89f02 100644
> --- a/INSTALL
> +++ b/INSTALL
> @@ -365,12 +365,5 @@ make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
>          DESTDIR=/some/path install
>  
>  
> -TODO
> -====
> -
> - - DESTDIR should be empty, not "/"
> - - add make uninstall targets
> - - replace private path variables as needed (SBINDIR/sbindir)
> - - ...
>  
>  # vim: tw=72 et

