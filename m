Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BE5C2BBCA
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:03:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A5922509
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 16:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A5922509
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54369.94418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCnl-0008OA-AG; Tue, 15 Dec 2020 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54369.94418; Tue, 15 Dec 2020 16:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCnl-0008O3-79; Tue, 15 Dec 2020 16:03:49 +0000
Received: by outflank-mailman (input) for mailman id 54369;
 Tue, 15 Dec 2020 16:03:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCnk-0008Nw-7b
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:03:48 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77f90baf-5a0a-4be8-858f-52affeb32876;
 Tue, 15 Dec 2020 16:03:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 190so7118269wmz.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:03:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id l1sm37788545wrq.64.2020.12.15.08.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:03:46 -0800 (PST)
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
X-Inumbo-ID: 77f90baf-5a0a-4be8-858f-52affeb32876
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/XS+iYso1pLvM2m44w9x3fZSoxfXT53+l9cFnhg15RY=;
        b=p0rtbXqHLDsWBcmz+/XCZdpZqLTqfVzOL537uEWU2wBL/VhQ1svYzdVV/46XcL8TRL
         NQFj5Vf6VMNvJPUip8xxQvrm3fWgOFdNWcdHJY29KZ5bSqkE3TDwR1/BuYuQawQ69NPV
         VFC65vPhXHNS+1orjnqIjCES/ta2PcWWUO7hksEN0R6a8ndM7LuvrPb2MwXBKRHhlARX
         8nw5fY142OfCzsYAFUdNtkN25VNWWyRv3KQLMVgicBCRgFbS6V1/GM0wuqWgSxlAT2/i
         i6SD6YPprgfQGh+EbHG+ImTf0tSFGPotCs/Z4LWbOELa3TCRO6CQdklE7VIovvedrNSS
         8yPg==
X-Gm-Message-State: AOAM532S3zsE3xBMmRCtxXVKaaZ9IH63APB8sQqrySt3yfsncYXokVw/
	yDiRsb/Ml5IUMvlGM4EqK+8=
X-Google-Smtp-Source: ABdhPJyo/9Njv2vs85nX4cq/IsXRnEE7iT/+fLW+8A5VW5kWQ2EyeNQ3fJUy5Pzl8ioT6/V5BgXcXQ==
X-Received: by 2002:a1c:dd07:: with SMTP id u7mr17937542wmg.51.1608048226859;
        Tue, 15 Dec 2020 08:03:46 -0800 (PST)
Date: Tue, 15 Dec 2020 16:03:44 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 23/25] xl: support naming of assignable devices
Message-ID: <20201215160344.4j333d23wj6egmyq@liuwe-devbox-debian-v2>
References: <20201208193033.11306-1-paul@xen.org>
 <20201208193033.11306-24-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208193033.11306-24-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 07:30:31PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch converts libxl to use libxl_pci_bdf_assignable_add/remove/list/
> list_free() rather than libxl_device_pci_assignable_add/remove/list/
> list_free(), which then allows naming of assignable devices to be supported.
> 
> With this patch applied 'xl pci-assignable-add' will take an optional '--name'
> parameter, 'xl pci-assignable-remove' can be passed either a BDF or a name and
> 'xl pci-assignable-list' will take a optional '--show-names' flag which
> determines whether names are displayed in its output.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

