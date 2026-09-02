Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B7C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:06:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405291.1638810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fyu-0005eo-US; Wed, 02 Sep 2026 08:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405291.1638810; Wed, 02 Sep 2026 08:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fyu-0005eh-Ro; Wed, 02 Sep 2026 08:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1405291;
 Wed, 02 Sep 2026 08:06:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x1fyt-0005eD-DF
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:06:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1fyt-001oFT-0f;
 Wed, 02 Sep 2026 08:06:02 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x1fys-0016Gb-29;
 Wed, 02 Sep 2026 08:06:02 +0000
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
	bh=5Iv8qcbaMigfgrYoHiQAAMpbrvJwOscs+sTql6iwyoc=; b=Z3xdl1IoQ4ycffshEc66PkPeiO
	jN59XSUglqwC9gEz9wIg/EKrxwEimsNiaGQJEKKEVQPmLn8AGHznmrRbE8te6wfDusiCnudK03FKc
	vLMFFRxiW0+a4ndiULB569Y/EUlryoXxBHAmYfheScmcXL0f2NCPkkkT9L1rebnkA7Kw=;
Date: Wed, 2 Sep 2026 10:05:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 3/4] x86/vRTC: the use_timer field is a boolean one
Message-ID: <apfY5Sh-8m63J5O-@macbook.local>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <f8c7271e-db76-4dd0-af5f-6ed11f9be8aa@suse.com>
 <ammwHx-mfJPLivgz@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ammwHx-mfJPLivgz@macbook.local>

On Thu, Jul 02, 2026 at 11:30:44AM +0200, Jan Beulich wrote:
> ... and hence wants to be of bool type.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

