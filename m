Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7206FC432BE
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:26:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4180761A40
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4180761A40
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161178.295946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N67-0006Fk-Kl; Tue, 27 Jul 2021 13:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161178.295946; Tue, 27 Jul 2021 13:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8N67-0006Fd-Hr; Tue, 27 Jul 2021 13:26:15 +0000
Received: by outflank-mailman (input) for mailman id 161178;
 Tue, 27 Jul 2021 13:26:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N66-0006FX-Qx
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:26:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N66-00062p-Q8
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:26:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8N66-0007fL-PV
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:26:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8N63-0002WP-L0; Tue, 27 Jul 2021 14:26:11 +0100
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
	bh=Rdg/ah9/lYobn+NtYvGOxKV1GjMUkPW64HRwDXpHGuI=; b=HX+wAck9eWsVxpsPGGJRRZ8Jv4
	FaOngQHWcHXKkbHO4SRFCKQim6EuxFAH36G/68nO0CM8A3duJxIVaNf7fQxUgdnVZIek0dR8yR6O4
	sSurPxnAvb7k6B0III7nYdbnHmasLWF0pvW0GAtH5mzmThyZ9X/rj4vcuCGH5jYcpR+k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.2419.470241.159863@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:26:11 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: Ping: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file if
 exist and update OVMF
In-Reply-To: <YP6s5q/hAbupbB/S@perard>
References: <20210719134845.681725-1-anthony.perard@citrix.com>
	<YP6s5q/hAbupbB/S@perard>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("Ping: [XEN PATCH] tools/firmware/ovmf: Use OvmfXen platform file if exist and update OVMF"):
> On Mon, Jul 19, 2021 at 02:48:45PM +0100, Anthony PERARD wrote:
> > A platform introduced in EDK II named OvmfXen is now the one to use for
> > Xen instead of OvmfX64. It comes with PVH support.
...
> Can we commit this soon? Thanks.

Acked-by: Ian Jackson <iwj@xenproject.org>

and queued.  Sorry for the delay.

Ian.

