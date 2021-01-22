Return-Path: <SRS0=o5zc=GZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3278C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 14:23:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B6B23A54
	for <xen-devel@archiver.kernel.org>; Fri, 22 Jan 2021 14:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B6B23A54
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.72799.131144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xL7-0002RI-Pc; Fri, 22 Jan 2021 14:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72799.131144; Fri, 22 Jan 2021 14:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xL7-0002RB-Ma; Fri, 22 Jan 2021 14:23:05 +0000
Received: by outflank-mailman (input) for mailman id 72799;
 Fri, 22 Jan 2021 14:23:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2xL6-0002R5-Gi
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:23:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2xL6-0000oF-Ft
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:23:04 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2xL6-0002eA-Eg
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:23:04 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2xL1-0003wJ-RV; Fri, 22 Jan 2021 14:22:59 +0000
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
	bh=5w/CgaGaiT5VdM6bvPwv18DuOZ1c4urYTk6eKrKXmCA=; b=Rd8/PZ8Ei+wHJ/pOKtVow9QSxm
	fyUG4yfeNRcm4/oHOBW1F2P3tr9vwYprHSDGfJcBmxEADx9l7NbA3/XWVqRedhLnsFCS3oIIDNa4Z
	MkeNMlFoG7ojQ3uR35ZDQYN8oTHVP7pQcLYIXOnBip0E741JFJUEn7lSW2AXHM96sIfA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24586.57283.613836.976947@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 14:22:59 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>,
    <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] xl: use proper name for bash_completion file
In-Reply-To: <391d3d0b-0c07-b3e0-47ea-e9918f591587@citrix.com>
References: <20201020123928.27099-1-olaf@aepfle.de>
	<391d3d0b-0c07-b3e0-47ea-e9918f591587@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH v1] xl: use proper name for bash_completion file"):
> On 20/10/2020 13:39, Olaf Hering wrote:
> > Files in the bash-completion dirs should be named like the commands,
> > without suffix. Without this change 'xl' will not be recognized as a
> > command with completion support if BASH_COMPLETION_DIR is set to
> > /usr/share/bash-completion/completions.
> >
> > Fixes commit 9136a919b19929ecb242ef327053d55d824397df
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> This obviously fell through the cracks, but definitely matches how
> systems are typically set up.

Technically speaking this might need a release-ack as it's enabling a
feature that was previously defeated by a bug.  I think it's fine at
this stage, so:

Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Ian.

