Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B83C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 08:11:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428316.1651042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vbK-00010O-Em; Tue, 22 Sep 2026 08:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428316.1651042; Tue, 22 Sep 2026 08:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8vbK-00010H-As; Tue, 22 Sep 2026 08:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1428316;
 Tue, 22 Sep 2026 08:11:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x8vbJ-00010B-0x
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:11:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8vbH-00Aglh-1B;
 Tue, 22 Sep 2026 08:11:39 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x8vbH-003Y6G-2h;
 Tue, 22 Sep 2026 08:11:39 +0000
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
	bh=X91pxvR+jE8Uqo8RaBUigBsnsZa62rFkSkc2AZXv4wI=; b=E1MRdjswulurd4vmzlJH9z3ZNm
	nbseEQLrwbGpVz0zIujKOOpjpfzbVEZAkZ9p9zQX9kNu5SmbsrDS0i12r8IR0aN2L+GEk1yZ7Nxhl
	Dr493zBjedqcxpToYA06YQrIJ0vHrjw6QTAfsHN55mm08yLNU03drBz0HNnP2qotwAYY=;
Date: Tue, 22 Sep 2026 10:11:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 1/2] symbols: drop _{s,e}extratext
Message-ID: <arI4OcZrnGdXlfw5@macbook.local>
References: <bd5ed50e-e537-4033-b5b9-98167886690a@suse.com>
 <69cbb2b8-8fed-4aa0-b1c6-0cbe135cb062@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69cbb2b8-8fed-4aa0-b1c6-0cbe135cb062@suse.com>

On Tue, Aug 25, 2026 at 04:27:57PM +0200, Jan Beulich wrote:
> We're only about 18.5 years late with this: See Linux commit a3b81113fb66
> ("remove support for un-needed _extratext section"), i.e. from the 2.6.25
> dev cycle.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

