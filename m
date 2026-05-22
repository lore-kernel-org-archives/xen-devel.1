Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28045CD5BB1
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 09:23:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316504.1585902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQM5x-0007CN-5s; Fri, 22 May 2026 09:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316504.1585902; Fri, 22 May 2026 09:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQM5x-0007CG-2v; Fri, 22 May 2026 09:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1316504;
 Fri, 22 May 2026 09:23:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1wQM5v-0007CA-NP
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 09:23:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1wQM5q-000cnf-0T;
 Fri, 22 May 2026 09:22:58 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1wQM5p-0013S3-2X;
 Fri, 22 May 2026 09:22:57 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=H31lC0eOpJY3qpXcHt0ef1xE5sHfYgrP7GJ9jWjLaBM=; b=aIS3u1/YrQnynD3MWM5lo3Grvi
	njtBsTFVWlhv2GJbtcKW204PpT1cUkRi9bXpXPIxXu2Klsh/4FXgQpt13XWzdmOFDPMcHNDA9HDUx
	Us8NJzc/o5rUs69dvx/jLnVk4c8qiJhP8ZeWNGFEjvjOG7p6LsiPRdwbbzGj3Yxu5pL4=;
Date: Fri, 22 May 2026 11:22:55 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org,
	pierrick.bouvier@oss.qualcomm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 10/39] MAINTAINERS: Drop bad F: in "X86 Xen CPUs"
Message-ID: <ahAgb1shN3tLrK_h@l14>
References: <20260521080511.999266-1-armbru@redhat.com>
 <20260521080511.999266-11-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521080511.999266-11-armbru@redhat.com>

On Thu, May 21, 2026 at 10:04:42AM +0200, Markus Armbruster wrote:
> include/hw/block/dataplane/xen* does not exist.
> hw/block/dataplane/xen* does, and is covered.  Drop the bad line.
> 
> Fixes: fcab2b464e (xen: add header and build dataplane/xen-block.c, 2019-01-08)
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony PERARD <anthony@xenproject.org>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Anthony PERARD <anthony@xenproject.org>

Thanks,

-- 
Anthony PERARD

