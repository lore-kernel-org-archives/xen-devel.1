Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CEFC43467
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 12:57:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23F80207DE
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 12:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23F80207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4481.11662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQVTm-0004Of-NK; Thu, 08 Oct 2020 12:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4481.11662; Thu, 08 Oct 2020 12:57:06 +0000
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
	id 1kQVTm-0004OX-K4; Thu, 08 Oct 2020 12:57:06 +0000
Received: by outflank-mailman (input) for mailman id 4481;
 Thu, 08 Oct 2020 12:57:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQVTl-0004OS-8e
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 12:57:05 +0000
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 818b9644-43e8-497a-899d-064f456c8cd1;
 Thu, 08 Oct 2020 12:57:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j136so6413615wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 05:57:03 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id p21sm7030763wmc.28.2020.10.08.05.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 05:57:02 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQVTl-0004OS-8e
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 12:57:05 +0000
X-Inumbo-ID: 818b9644-43e8-497a-899d-064f456c8cd1
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 818b9644-43e8-497a-899d-064f456c8cd1;
	Thu, 08 Oct 2020 12:57:03 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j136so6413615wmj.2
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 05:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bx8RcOnAWmrJ0g8im4xcst7IS35xi9boAGY9ldV69WQ=;
        b=M0gzLqXVdylhfUkJxnjlHL4fIsnq7D/0dS0dJ47QEMCcjovWZwrEvUjzMGv6LzsF/K
         /AGfuSQwy8F2zkqMuk1bE6/Ic/0bCQrAjxojwY9WXjFeEFTfGucnfk+DGvAg8wfasCaj
         85m3LpVcfYxQOQOaQ8hPT0f31hS30j5/3ZdDBeJocnNtukresgaHpbd7mDXhpm0JZ/1Y
         wFtJUPZzBtpNKupNAjRT8vBXF78a/1EqvKs5eiIbZd082O1tw6ItUw5YlFKOd4Uc9HHj
         WJZwNERBS84dr0E2USls60FN4czjtkmHIhsD1T3lOQJjg2kC/Tzfvfqb+n5G53xzsYKd
         MgQA==
X-Gm-Message-State: AOAM533ViiyYiVE8BxJdfFYXE5hS1GbrPrup+zEt3KaXwg3U/6qxlySc
	TewFQq+zoeXzKDrGfJvnSvbsySfX/B0=
X-Google-Smtp-Source: ABdhPJxYJWXOt7cEvb1PS0ExMEo06yFsA2tFEdaZbEiDOE4nKxvH4oH3H8XMxS6UJOTIg3VdLe1Xig==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr9153727wmf.13.1602161822818;
        Thu, 08 Oct 2020 05:57:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id p21sm7030763wmc.28.2020.10.08.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 05:57:02 -0700 (PDT)
Date: Thu, 8 Oct 2020 12:57:01 +0000
From: Wei Liu <wl@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] tool/libs/light: Fix libxenlight gcc warning
Message-ID: <20201008125700.xo7c4ctwdz4chsye@liuwe-devbox-debian-v2>
References: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
 <579cfa6e71a5a1392a5ae40cef358c4e8e3a0901.1602078276.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <579cfa6e71a5a1392a5ae40cef358c4e8e3a0901.1602078276.git.bertrand.marquis@arm.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 07, 2020 at 02:57:02PM +0100, Bertrand Marquis wrote:
> Fix gcc10 compilation warning about uninitialized variable by setting
> it to 0.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Applied.

