Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB504C4742C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 14:32:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B5A920786
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 14:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="DRmw9/KI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B5A920786
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19826.45235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kagJF-0006Qs-HP; Thu, 05 Nov 2020 14:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19826.45235; Thu, 05 Nov 2020 14:32:17 +0000
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
	id 1kagJF-0006Ql-E0; Thu, 05 Nov 2020 14:32:17 +0000
Received: by outflank-mailman (input) for mailman id 19826;
 Thu, 05 Nov 2020 14:32:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xUX6=EL=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kagJF-0006Qg-2g
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 14:32:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ee3bf18-3bb5-49ec-a471-00b6932875b9;
 Thu, 05 Nov 2020 14:32:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kagJD-0001dL-LY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 14:32:15 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kagJD-0002U9-IA
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 14:32:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kagJA-0003gA-2A; Thu, 05 Nov 2020 14:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xUX6=EL=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kagJF-0006Qg-2g
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 14:32:17 +0000
X-Inumbo-ID: 4ee3bf18-3bb5-49ec-a471-00b6932875b9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4ee3bf18-3bb5-49ec-a471-00b6932875b9;
	Thu, 05 Nov 2020 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=FWf/ST26ihLwGN6j28QWXa9Y+j9p543ZO7qTuQScjWU=; b=DRmw9/KI0AKDNKzFZ85SIvzi2o
	Wr2NvmacBuf48Cb1O5w4bNqWtZmvb03j9XAi20lSyv+oP7mcUa/1XX3xqA9hW08HP9z7O5bYx0NY6
	65w1koRA+yiTcSe9V9FEa/pAlx13trLbLWyM4N884zDvRdBEVt+w5QdyotQTFy93viLY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kagJD-0001dL-LY
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 14:32:15 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kagJD-0002U9-IA
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 14:32:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kagJA-0003gA-2A; Thu, 05 Nov 2020 14:32:12 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24484.3307.827094.796027@mariner.uk.xensource.com>
Date: Thu, 5 Nov 2020 14:32:11 +0000
To: committers@xenproject.org
CC: xen-devel@lists.xenproject.org
Subject: osstest downtime for hardware work
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

We think we have all the pieces now for a bunch of long-awaited
hardware work in the Massachusetts colo.

There will be several days of complete stoppage.  If anyone has
opinions about good or bad times, please let me know.

Ian.

