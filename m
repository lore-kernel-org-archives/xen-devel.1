Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A6C8303C
	for <xen-devel@archiver.kernel.org>; Mon,  7 Jul 2025 11:08:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1035489.1407790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYjhP-0000ij-TT; Mon, 07 Jul 2025 11:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035489.1407790; Mon, 07 Jul 2025 11:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYjhP-0000ic-R0; Mon, 07 Jul 2025 11:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1035489;
 Mon, 07 Jul 2025 11:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paoO=ZU=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uYjhO-0000iW-89
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 11:07:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9d87ebfd-5b22-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 13:07:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F018D15A1;
 Mon,  7 Jul 2025 04:07:34 -0700 (PDT)
Received: from PWQ0QT7DJ1 (unknown [10.57.86.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 943703F694;
 Mon,  7 Jul 2025 04:07:46 -0700 (PDT)
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
X-Inumbo-ID: 9d87ebfd-5b22-11f0-a316-13f23c93f187
Date: Mon, 7 Jul 2025 12:07:44 +0100
From: Hari Limaye <hari.limaye@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm32: Tidy up setup_mm()
Message-ID: <vx4hmknx5qhwa5uqb7bf7fvldlnaf7sg2fqwvvu5wtn7egv3ya@6mbr3nbfx4vn>
References: <20250704090831.45804-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704090831.45804-1-michal.orzel@amd.com>

Hi Michal,

> On Fri, Jul 04, 2025 at 11:08:31AM +0000, Michal Orzel wrote:
> The current look and feel of setup_mm() leaves a lot to be desired. The
> scope of variables is not the best, many variables are not really needed
> while some others are set but not used. The first iteration of membanks
> is split from the loop for no reason. Tidy up this function for better
> readability.
> 
> No functional change.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
Tested-by: Hari Limaye <hari.limaye@arm.com>

LGTM! Tested (compilation) via Arm AArch32 build.

Many thanks,
Hari


