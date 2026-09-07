Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136C0C79F89
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 09:52:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410764.1641566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3W1J-0001ON-Qz; Mon, 07 Sep 2026 09:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410764.1641566; Mon, 07 Sep 2026 09:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3W1J-0001OG-Np; Mon, 07 Sep 2026 09:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1410764;
 Mon, 07 Sep 2026 09:52:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x3W1I-0001N3-RR
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 09:52:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3W1H-0038uo-0V;
 Mon, 07 Sep 2026 09:52:07 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x3W1H-008oZa-24;
 Mon, 07 Sep 2026 09:52:07 +0000
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
	bh=p78z3h/AnlFLx6eQ+HL1StCn11CfHHPV9pA0iQ+2uns=; b=zCirJZdH0Gf3jWfIsp5JVg9n8m
	q1lIEgb3kPApupz00qJG3aVNolQWe5rMSyVV1gLOZuWk5QpH6w42jFchOhEKXp5jNn2ud19ZFMYuy
	EsBRS2aBeTuzlCNP3MmmPmSDMkVSUhq+k4WJrwBl+DPrhMeCD2VcxWH1Upp4JhQxlTSQ=;
Date: Mon, 7 Sep 2026 11:52:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] libacpi: drop mk_dsdt's -d / --debug option
Message-ID: <ap6JRN-o71Gcey_L@macbook.local>
References: <13ebb85c-62c2-477b-87ff-377bbe3cfc6a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13ebb85c-62c2-477b-87ff-377bbe3cfc6a@suse.com>

On Mon, Sep 07, 2026 at 11:48:12AM +0200, Jan Beulich wrote:
> Recent Clang complains about the "debug" static variable only ever being
> written to. Drop it and the command line option controlling it.
> 
> Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

