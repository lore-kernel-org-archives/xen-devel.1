Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8946FC433E6
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 16:28:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1717F64D87
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 16:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1717F64D87
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82961.153511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99Ok-0004op-5N; Mon, 08 Feb 2021 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82961.153511; Mon, 08 Feb 2021 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l99Ok-0004oi-2I; Mon, 08 Feb 2021 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 82961;
 Mon, 08 Feb 2021 16:28:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99Oj-0004od-6w
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99Oj-0007zg-3c
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:28:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l99Oj-0008Mt-2S
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 16:28:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l99Of-0002zQ-QR; Mon, 08 Feb 2021 16:28:21 +0000
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
	bh=5K2ndahwpF8pR9I8HDBgw7p9a+OU6Usg6qzOnE7hlL4=; b=f+xxwRaQO589PXHjXZhYWudkga
	vZp2RXQMRzQxBXhYM6oGUj60wucvv8gODudVy4KqncYXvLAUFrRzad2PjiVYpZl8fkv5jovwz56iJ
	FCXqoMqogROAcO9KF3eY9mEQ6vA0pBeR3n7MxvlUnMGulDvp2K0Pb2AkGks3D5Tr7CcM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24609.26277.574330.875381@mariner.uk.xensource.com>
Date: Mon, 8 Feb 2021 16:28:21 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210111 32/39] tools: remove tabs from code produced by libxl_save_msgs_gen.pl
In-Reply-To: <20210111174224.24714-33-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
	<20210111174224.24714-33-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("[PATCH v20210111 32/39] tools: remove tabs from code produced by libxl_save_msgs_gen.pl"):
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Personally I think this is busywork but I am happy to take the patch.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>
Acked-by: Ian Jackson <iwj@xenproject.org>

Release risk is clearly negligible since it's a whitespace change.


