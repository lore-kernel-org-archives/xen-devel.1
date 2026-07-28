Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2601C54F4D
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:03:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374786.1621987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojKh-0001gF-BR; Tue, 28 Jul 2026 15:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374786.1621987; Tue, 28 Jul 2026 15:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojKh-0001g8-80; Tue, 28 Jul 2026 15:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1374786;
 Tue, 28 Jul 2026 15:03:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wojKf-0001g2-Vt
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:03:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1wojKf-00DTlH-0t;
 Tue, 28 Jul 2026 15:03:01 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger.pau@citrix.com>) id 1wojKe-007zid-29;
 Tue, 28 Jul 2026 15:03:00 +0000
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
Date: Tue, 28 Jul 2026 17:02:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 2/4] time: shorten year determination loop
Message-ID: <amjEnux2uyhYL-pu@macbook.local>
References: <79d50725-3892-4643-b854-bfec9c0c0d79@suse.com>
 <7bed7164-9a53-4e53-9fc1-7af68108bdf8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7bed7164-9a53-4e53-9fc1-7af68108bdf8@suse.com>

On Thu, Jul 02, 2026 at 11:30:11AM +0200, Jan Beulich wrote:
> For dates very far into the future (the MC146818 RTC's century byte can go
> up to the 99th century), the present year-wise loop would become somewhat
> inefficient (taking perhaps several thousand iterations). Prefix that loop
> with a 400-year granular calculation (somewhat like the earlier loop does
> for dates in the past).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

