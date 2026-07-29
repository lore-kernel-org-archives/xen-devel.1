Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91186C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 18:22:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376556.1623234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp8uw-0003iW-Kl; Wed, 29 Jul 2026 18:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376556.1623234; Wed, 29 Jul 2026 18:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp8uw-0003iP-Hp; Wed, 29 Jul 2026 18:22:10 +0000
Received: by outflank-mailman (input) for mailman id 1376556;
 Wed, 29 Jul 2026 18:22:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1wp8uv-0003iD-Of
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:22:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wp8uu-00FNc1-2o;
 Wed, 29 Jul 2026 18:22:08 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1wp8uu-003gbN-0o;
 Wed, 29 Jul 2026 18:22:08 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=STOKVkxy2r0lkEGJiNAdPP65nW9fq2OODTF9V606+es=; b=xMmUxXVL5u0/++4Oov7ie4TjRa
	X2PF+5nYx1yyzjLl3mCGgq8kC/PEbBHPzO3CdgYIOSFaWedeFCXzGKNqprpv6ctgCREqGt6+xc0AO
	MNTSeclpJohtiVmTLeEKuRdLL8gG7JBg+nFq15Ucf4bFJM6LOjTmm368bBlYha8wNryQ=;
Date: Wed, 29 Jul 2026 20:22:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 0/2] Final prep
Message-ID: <ampEyLOeoWdl4R4U@macbook.local>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729161529.164017-1-andrew.cooper3@citrix.com>

On Wed, Jul 29, 2026 at 05:15:27PM +0100, Andrew Cooper wrote:
> Andrew Cooper (2):
>   CHANGELOG: Set release date for 4.22
>   SUPPOT: Define support lifetime
> 
>  CHANGELOG.md |  2 +-
>  SUPPORT.md   | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

