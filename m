Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A914C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 15:42:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F69864DAE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F69864DAE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82922.153387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98fe-0007zo-9m; Mon, 08 Feb 2021 15:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82922.153387; Mon, 08 Feb 2021 15:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l98fe-0007zh-5y; Mon, 08 Feb 2021 15:41:50 +0000
Received: by outflank-mailman (input) for mailman id 82922;
 Mon, 08 Feb 2021 15:41:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98fc-0007zc-6t
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:41:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98fc-0006en-5W
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:41:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l98fc-0004Bk-2y
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 15:41:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l98fY-0002n3-Ld; Mon, 08 Feb 2021 15:41:44 +0000
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
	bh=WtvNeMrjPRzqBOw1NgxBVExmQBEb1f2sUfKr7JqjWio=; b=gOq4nNbxWgxW/BB6Eknp+ZR39n
	HKDGuMgQN/aEucfVBCEUgOoZZYqiS7ryzoxBq6qHRIg0s4th19Et4nhPHGMgtbsaNLBvqEaVD0s+3
	NtsWdwrrieUlZR/mR6MZrQypNwmKR+Kk8KPsqnobvjgpI8AUKiRJZARWlZQgES9urP7A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.23480.412380.988668@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 15:41:44 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v20210111 03/39] docs: remove stale create example from xl.1
In-Reply-To: <20210111174224.24714-4-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-4-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 03/39] docs: remove stale create example from xl.1"):
> Maybe xm create had a feature to create a domU based on a configuration
> file. xl create requires the '-f' option to refer to a file.
> There is no code to look into XEN_CONFIG_DIR, so remove the example.

This series seems to contain a number of patches which seem to have
slipped through the net before the freeze, despite some having reviews
even :-/.

I'm going to go through them and look at the status of each and hope
to commit and/or review and/or release-ack as many of them as
possible.

Ian.

