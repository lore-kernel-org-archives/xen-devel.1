Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CB2C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 16:13:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5051464E04
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 16:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5051464E04
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91770.173117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlAm-0000Yo-Hk; Mon, 01 Mar 2021 16:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91770.173117; Mon, 01 Mar 2021 16:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlAm-0000Yh-Ek; Mon, 01 Mar 2021 16:13:28 +0000
Received: by outflank-mailman (input) for mailman id 91770;
 Mon, 01 Mar 2021 16:13:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlAk-0000Yb-Um
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:13:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlAk-0003ml-U0
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:13:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlAk-0001fQ-T2
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:13:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGlAh-0004no-Kd; Mon, 01 Mar 2021 16:13:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=GAKFCH2OxcmAQyqGrVGrYsO3iFQuMNHTtj7p+hjdfyI=; b=hP9hHYGklTz28eDSx3d87M2mbi
	YvzIXi8p/hHUfEBbszaf6iwl0XdSo1qlkm66Ma7MATWJ/GiIib1abr6v/ejdFsVKEomFrYJ+zIwi5
	yYpqBMROZo1rkAonCkS5uPdMSP1ZaLAPbsBkw0V9AfFQe+7HYNhOKvPEYSUCdyHMZOQo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.4771.419064.686112@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 16:13:23 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] tools/firmware: Build firmware as -ffreestanding
In-Reply-To: <20210225203010.11378-3-andrew.cooper3@citrix.com>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
	<20210225203010.11378-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 2/3] tools/firmware: Build firmware as -ffreestanding"):
> firmware should always have been -ffreestanding, as it doesn't execute in the
> host environment.
> 
> inttypes.h isn't a freestanding header, but the 32bitbios_support.c only wants
> the stdint.h types so switch to the more appropriate include.
> 
> This removes the build time dependency on a 32bit libc just to compile the
> hvmloader and friends.
> 
> Update README and the TravisCI configuration.

> For 4.15.  Build tested in Travis (Ubuntu) and XenServer (CentOS) - no change
> in the compiled HVMLoader binary.  I'm currently rebuilding the containers
> locally to check Arch, Debian and OpenSUSE, but don't anticipate any problems.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Reviewed-by: Ian Jackson <iwj@xenproject.org>

