Return-Path: <SRS0=KVmu=PA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F09FC433EF
	for <xen-devel@archiver.kernel.org>; Tue, 12 Oct 2021 13:57:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF57A60E94
	for <xen-devel@archiver.kernel.org>; Tue, 12 Oct 2021 13:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF57A60E94
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.207245.363014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIGy-0004WQ-7t; Tue, 12 Oct 2021 13:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207245.363014; Tue, 12 Oct 2021 13:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIGy-0004WJ-3z; Tue, 12 Oct 2021 13:56:52 +0000
Received: by outflank-mailman (input) for mailman id 207245;
 Tue, 12 Oct 2021 13:56:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maIGx-0004WD-8o
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:56:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maIGx-00027C-75
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:56:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maIGx-00048y-6L
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:56:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maIGt-0004SV-Qw; Tue, 12 Oct 2021 14:56:47 +0100
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
	bh=niPKva7Cuu52jutyU+GIldq4IhhWYHgilMd+nTZ014w=; b=UycMHwzE83BpQh7IUROhjpy6Q0
	rUW1hcuaEaQuVTLlwTqMid8JTYQd5eJPx3NRy7nNBmQaEVIY97wDXlGHe3hzeDp/y3pJ69oycnqQH
	7lbkpoJIPEseBM/c9XRwhPBOMidhuprnSr2xFPoNor4qDnNvYqxsK4tebpR3tKtb3X9Q=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.37919.481655.602107@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 14:56:47 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: [PATCH v6 2/2] tools/xenstore: set open file descriptor limit for xenstored
In-Reply-To: <20211012134148.6280-3-jgross@suse.com>
References: <20211012134148.6280-1-jgross@suse.com>
	<20211012134148.6280-3-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v6 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> Add a configuration item for the maximum number of open file
> descriptors xenstored should be allowed to have.
> 
> The default should be "unlimited" in order not to restrict xenstored
> in the number of domains it can support, but unfortunately the kernel
> is normally limiting the maximum value via /proc/sys/fs/nr_open [1],
> [2]. So check that file to exist and if it does, limit the maximum
> value to the one specified by /proc/sys/fs/nr_open.
> 
> As an aid for the admin configuring the value add a comment specifying
> the common needs of xenstored for the different domain types.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=60fd760fb9ff7034360bab7137c917c0330628c2
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c2d64fb6cae9aae480f6a46cfe79f8d7d48b59f
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>

