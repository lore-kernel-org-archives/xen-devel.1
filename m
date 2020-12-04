Return-Path: <SRS0=weQ1=FI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A44C4361A
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 11:29:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC22F22581
	for <xen-devel@archiver.kernel.org>; Fri,  4 Dec 2020 11:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC22F22581
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.44524.79785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9HS-0002GX-Al; Fri, 04 Dec 2020 11:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44524.79785; Fri, 04 Dec 2020 11:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9HS-0002GQ-6i; Fri, 04 Dec 2020 11:29:42 +0000
Received: by outflank-mailman (input) for mailman id 44524;
 Fri, 04 Dec 2020 11:29:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9HR-0002GK-O7
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:29:41 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02bb77cf-4717-440a-b2fe-70309c1b974e;
 Fri, 04 Dec 2020 11:29:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 3so6677568wmg.4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:29:41 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g11sm3327683wrq.7.2020.12.04.03.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:29:39 -0800 (PST)
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
X-Inumbo-ID: 02bb77cf-4717-440a-b2fe-70309c1b974e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j1UO5S+/1hWYytAEZdsFJhC3rqMIBogTXlWIVsZnxZ0=;
        b=TQ/SSMne55cuKvfvwY8S3DQ6AtnjSqZl+HIe9kSEZxNVZB2ZUYWX600bC2f7kKtDuk
         UXK5D5tAw70qxUbx5b+okIGTVhbeJHGbJMC16Uf+ITJhkVi074kMGMLKJgD56PVEfXf8
         h97kN2OyfxQfRn8TEztFzM+ysxiujDaHGYSigWqt5d2MjQcz+T8DW/42fxhM3Xf/6Bkx
         fUFBMD0yhaAArXHQ6NlaJxM6ZX/t53iQ7MWz4hcgeBExHyf5tmfIjyzphoxvq2R4APr4
         k1BUaigXcnrzBIgE7pCj7uxMLubkb4miXCr20JSxR85ozW4zisgpqvSU34EQqkZOCk9n
         wqbQ==
X-Gm-Message-State: AOAM533Niz54y/fT2zU0t7jA1t/PZjHBlGuM7ERfSf9k5nfNEe/t2lRH
	ZyRvH7QHzMbE3AxU6RJsDjw=
X-Google-Smtp-Source: ABdhPJyB3J/RCfgVhRMC+8GVN1AI7qLnwiWXE61G0n5OhbjHoFiYqQ1VIYy4mXJ8S4yK8P8fjWN+EQ==
X-Received: by 2002:a1c:9dd8:: with SMTP id g207mr3686418wme.15.1607081380368;
        Fri, 04 Dec 2020 03:29:40 -0800 (PST)
Date: Fri, 4 Dec 2020 11:29:38 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 13/23] libxl: use COMPARE_PCI() macro
 is_pci_in_array()...
Message-ID: <20201204112938.mjbjwyew2kkrmfwj@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-14-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-14-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:24PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... rather than an open-coded equivalent.
> 
> This patch tidies up the is_pci_in_array() function, making it take a single
> 'libxl_device_pci' argument rather than separate domain, bus, device and
> function arguments. The already-available COMPARE_PCI() macro can then be
> used and it is also modified to return 'bool' rather than 'int'.
> 
> The patch also modifies libxl_pci_assignable() to use is_pci_in_array() rather
> than a separate open-coded equivalent, and also modifies it to return a
> 'bool' rather than an 'int'.
> 
> NOTE: The COMPARE_PCI() macro is also fixed to include the 'domain' in its
>       comparison, which should always have been the case.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Acked-by: Wei Liu <wl@xen.org>

