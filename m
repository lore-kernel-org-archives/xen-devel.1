Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BABDC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 15:45:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A540B64DAE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 15:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A540B64DAE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82926.153416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98iy-0008H5-1S; Mon, 08 Feb 2021 15:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82926.153416; Mon, 08 Feb 2021 15:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98ix-0008Gy-Uh; Mon, 08 Feb 2021 15:45:15 +0000
Received: by outflank-mailman (input) for mailman id 82926;
 Mon, 08 Feb 2021 15:45:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98iw-0008Gt-Dk
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:45:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98iw-0006ix-CY
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:45:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98iw-0004aR-AS
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:45:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l98it-0002oQ-0b; Mon, 08 Feb 2021 15:45:11 +0000
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
	bh=imAIVGAbMRtohXVh0DCBXS75lbPtg3FidXOUa4gct/4=; b=TFs444O0CcpFXUDxTl3vPcJA8m
	UwuuAK7/jgMoYV2EXdP4JqTLURB9FZW6D75vpUxV/sFpDHebkKMlqH7mQYEfqPDcBzZ9KSPtLIpcK
	FB+KokFSVFOP+lHdDh919qtPMuENF3prOTOFrUU/7UQgCJX5CrniiAgKEMdMBDf3LNH4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.23686.678193.814785@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 15:45:10 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Anthony PERARD <anthony.perard@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 04/39] docs: substitute XEN_CONFIG_DIR in xl.conf.5
In-Reply-To: <20210111174224.24714-5-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-5-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 04/39] docs: substitute XEN_CONFIG_DIR in xl.conf.5"):
> xl(1) opens xl.conf in XEN_CONFIG_DIR.
> Substitute this variable also in the man page.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

This is docs.  Worst risk is slight chance of breaking the build.

Ian.

