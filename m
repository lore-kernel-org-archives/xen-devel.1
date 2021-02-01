Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF552C433E6
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:09:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A98964DAF
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 15:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A98964DAF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79953.145868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apQ-0003yG-BA; Mon, 01 Feb 2021 15:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79953.145868; Mon, 01 Feb 2021 15:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apQ-0003y1-4g; Mon, 01 Feb 2021 15:09:24 +0000
Received: by outflank-mailman (input) for mailman id 79953;
 Mon, 01 Feb 2021 15:09:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apO-0003xb-TO
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apO-0004Jf-P5
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l6apO-0004R7-NQ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l6apL-0007k9-FO; Mon, 01 Feb 2021 15:09:19 +0000
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
	bh=dGGSACJOMJZtTzt+/JjXmWZTZXWco5h2qLf96Gs5OkY=; b=HWZ/xrFjDH8npH1gyCWisY86Y3
	F0dcTUH30s9hexmtIiD1WUaORoEfMqL/Hc2LKM9kkIPG1lifYNplZ1hTGvx80KMqqWow3FOmxtanl
	3NoxukuIBZYdGUTDW6cGTvI0YNlnazgkQmr+uOYrnPjXgKafmzzAQ+OGsyPGT6g9HjHA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24600.6559.225650.207177@mariner.uk.xensource.com>
Date: Mon, 1 Feb 2021 15:09:19 +0000
To: Manuel Bouyer <bouyer@netbsd.org>
Cc: <xen-devel@lists.xenproject.org>,
    Wei  Liu <wl@xen.org>,
    Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH v3 1/2] xenpmd.c: use dynamic allocation
In-Reply-To: <20210130182711.2473-1-bouyer@netbsd.org>
References: <20210130182711.2473-1-bouyer@netbsd.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH v3 1/2] xenpmd.c: use dynamic allocation"):
> On NetBSD, d_name is larger than 256, so file_name[284] may not be large
> enough (and gcc emits a format-truncation error).
> Use asprintf() instead of snprintf() on a static on-stack buffer.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I consider this a bugfix, so

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I think Roger's ack got dropped, so I have added it back.#

Ian.

