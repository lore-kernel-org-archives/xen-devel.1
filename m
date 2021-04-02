Return-Path: <SRS0=S1im=I7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39F1C43462
	for <xen-devel@archiver.kernel.org>; Fri,  2 Apr 2021 15:21:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8411D61178
	for <xen-devel@archiver.kernel.org>; Fri,  2 Apr 2021 15:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8411D61178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104889.200893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSLbk-0004TO-2z; Fri, 02 Apr 2021 15:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104889.200893; Fri, 02 Apr 2021 15:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lSLbj-0004TC-US; Fri, 02 Apr 2021 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 104889;
 Fri, 02 Apr 2021 15:21:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lSLbi-0004Sg-Ki
 for xen-devel@lists.xenproject.org; Fri, 02 Apr 2021 15:21:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSLbh-00009b-4a; Fri, 02 Apr 2021 15:21:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lSLbg-00050B-Lx; Fri, 02 Apr 2021 15:21:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=te5kaNXq8bksPb82UmeoTorpvM3eU7KlnC/ugaiKlh0=; b=i5VnM/fHHX4xETLMqpi8WbN7dy
	w4RtyLji/syt7qaC2kl3m9Ao9qoVrd8kfXS6KEQNVAj0W1DCzzxBqyOz2gzaGdJf1ESA7TxhswHjW
	CGVQ8JKhNMZBUoQ0/ZeT0HnVFqftOrR6iukqSDh9PO47Z8vQKOWO9FuO/kYg1a9Ymmnk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen/arm: Couple of bug fixes when decompressing kernels
Date: Fri,  2 Apr 2021 16:21:03 +0100
Message-Id: <20210402152105.29387-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

The main goal of this series is to address the bug report [1]. It is not
possible

While testing the series, I also noticed that it is not possible to
re-use the same compressed kernel for multiple domains as the module
will be overwritten during the first decompression.

I am still a bit undecided how to fix it. We can either create a new
module for the uncompressed kernel and link with the compressed kernel.
Or we could decompress everytime.

One inconvenience to kernel to only decompress once is we have to keep
it until all the domains have booted. This may means a lot of memory to be
wasted just for keeping the uncompressed kernel (one my setup, it takes
~3 times more space).

Any opinions on how to approach it?

Cheers,

[1] https://lists.xenproject.org/archives/html/xen-users/2021-02/msg00027.html

Julien Grall (2):
  xen/arm: kernel: Propagate the error if we fail to decompress the
    kernel
  xen/gunzip: Allow perform_gunzip() to be called multiple times

 xen/arch/arm/kernel.c | 8 +++++++-
 xen/common/gunzip.c   | 5 +++++
 xen/common/inflate.c  | 6 ++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.17.1


