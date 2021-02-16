Return-Path: <SRS0=9fiq=HS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B47FC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 16:27:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D77964DF0
	for <xen-devel@archiver.kernel.org>; Tue, 16 Feb 2021 16:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D77964DF0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85942.160892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3C0-00037h-1x; Tue, 16 Feb 2021 16:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85942.160892; Tue, 16 Feb 2021 16:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC3Bz-00037Z-Tw; Tue, 16 Feb 2021 16:27:15 +0000
Received: by outflank-mailman (input) for mailman id 85942;
 Tue, 16 Feb 2021 16:27:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3By-00037F-OO
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3By-0004US-NY
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lC3By-0005hn-Mh
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 16:27:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lC3Bv-0000p7-Cb; Tue, 16 Feb 2021 16:27:11 +0000
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
	bh=RlSG4wixyrZiUAKT77HPortKpgXFhVgri9OD3UR4GQk=; b=ts4PJI3MlfiAVx0YV76qGLiNV3
	3b7c5GX2w8/Ud/H2+1ACet2PuE4tfKs+L1sRF4mWw+zkt4wTC8N7K8KxFNeLZw+0PDG5NezKUFSKi
	jdWRBgbB/+1apH7rlL7o7Y8an47ynN+Nr8QGusmDSPFGVgMPKJWNQi08kTVqpYsl8e2A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24619.62047.178128.680533@mariner.uk.xensource.com>
Date: Tue, 16 Feb 2021 16:27:11 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 08/10] tools: Check for abi-dumper in ./configure
In-Reply-To: <20210212153953.4582-9-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
	<20210212153953.4582-9-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 08/10] tools: Check for abi-dumper in ./configure"):
> This will be optional.  No functional change.

Reviewed-by: Ian Jackson <iwj@xenproject.org>

