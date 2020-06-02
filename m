Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48285C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 08:52:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21BEE20734
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 08:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21BEE20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2el-0002AZ-RB; Tue, 02 Jun 2020 08:52:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg2ek-0002AU-4P
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 08:52:22 +0000
X-Inumbo-ID: 5eb059b2-a4ae-11ea-81bc-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eb059b2-a4ae-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 08:52:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r15so2246806wmh.5
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 01:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AXfrBNb20l0kugH4AbqVdXHLCoJGjbhs7pF82Rmx8cU=;
 b=MLN+qrzGlc708D0vPX0kykFmPuQocTwFs5cjFbPgDkZ2THTSmhJRa4NVKsXzB5spYY
 lskt7MCUFTzhMh13rLyFKgPBw/L6okT8SSMZCU2HfGPp2hOaewCjMzFolTk0BXzTlz+g
 pfkFW6HJ073kBHM///MzESey83LiW+1Y38zyQuqbGDlzEjMnJTTNzTbQxfZe6jomNrT6
 SRNBwQ8QSy+5gU95VSApuYhpIf9k2a/nLtPuU0/J64kGCZh8dU30wq6ycKWIRb5SJvo/
 itMAugzi9CJvT5qpeXHYb3AywMUj7B/tnuuRmbX/FaxtX4cbPnB84OVwtICDuIxbGJNz
 ipiA==
X-Gm-Message-State: AOAM530K6VCD6NuravsEO1cSRd7eZCHhVJ6KTbqZjf1mHg9NHvLl0OBS
 BeaKQq8/uFOBFhoElsmTYtE=
X-Google-Smtp-Source: ABdhPJyazCE9fYV3sfsQOtAyu0l6qmM0AU5cTVF80Sg2d+jFkkA6x84g6haLXSpF2Ph6jlgPoP5H/Q==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr3357344wmh.31.1591087940338; 
 Tue, 02 Jun 2020 01:52:20 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g82sm2488098wmf.1.2020.06.02.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 01:52:19 -0700 (PDT)
Date: Tue, 2 Jun 2020 08:52:18 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.14 0/2] tools: some fixes for the hypervisor file
 system
Message-ID: <20200602085218.btmbixmkrbnx2btq@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200602060021.23289-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602060021.23289-1-jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 08:00:19AM +0200, Juergen Gross wrote:
> Juergen Gross (2):
>   tools: check return value of asprintf() in xenhypfs
>   tools: make libxenhypfs interface more future proof
> 
>  tools/libs/hypfs/core.c             |  2 +-
>  tools/libs/hypfs/include/xenhypfs.h | 31 +++++++++++++++++------------
>  tools/misc/xenhypfs.c               | 10 ++++++++--

Good improvements.

Acked-by: Wei Liu <wl@xen.org>

>  3 files changed, 27 insertions(+), 16 deletions(-)
> 
> -- 
> 2.26.2
> 

