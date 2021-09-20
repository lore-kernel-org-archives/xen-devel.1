Return-Path: <SRS0=T9jm=OK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F150EC433F5
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 10:34:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7CD760F3A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Sep 2021 10:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7CD760F3A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.190676.340462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGcy-0007HG-Lh; Mon, 20 Sep 2021 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190676.340462; Mon, 20 Sep 2021 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGcy-0007H9-I2; Mon, 20 Sep 2021 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 190676;
 Mon, 20 Sep 2021 10:34:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGcx-0007H3-9r
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:34:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGcx-0004jd-95
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:34:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGcx-0006d7-8I
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:34:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGcu-0005Tu-33; Mon, 20 Sep 2021 11:34:20 +0100
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
	bh=+tKE82eIy0f699InwlfCUc6vRoD1PpPgEdrGJLTDL3Q=; b=srY2peH1G4gWpRNhrcbl3TxKwr
	XqCJ1IyJoUhsxqtscvX2dhVZswsK14I+U6PQP7fp2qV4oBTjCITS5AfAj16U4daPwI8uUwoOt8+Mx
	hP0pCXSHlIq1P4AUjh5KJFjAMSOJc0W5Wj+RgcxSUSJlFm1t0lXw828ZgSYP/LdhX8PA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.25515.842754.402625@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:34:19 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
In-Reply-To: <20210917154625.89315-5-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
	<20210917154625.89315-5-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH 4/6] tools/xenstored: use atexit to close interfaces"):
> Exploiting the talloc clean up routines to close the Xen interfaces
> is cumbersome, specially when atexit can be used to the same effect.

Wait, what ?  Why do we need to do this at all ?  xenstored can't be
restarted so if it exits we might as well leave whatever wreckage.

AIUI the live update doesn't end up calling atexit ?

Ian.

