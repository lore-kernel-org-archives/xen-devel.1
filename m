Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8ECCC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448011.1663980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeGh-0006hU-Jz; Tue, 13 Oct 2026 15:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448011.1663980; Tue, 13 Oct 2026 15:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeGh-0006hN-HM; Tue, 13 Oct 2026 15:18:19 +0000
Received: by outflank-mailman (input) for mailman id 1448011;
 Tue, 13 Oct 2026 15:18:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGeGg-0006hH-7U
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:18:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGeGg-00000003R6B-0phX;
 Tue, 13 Oct 2026 15:18:17 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGeGf-00000002fpb-0rYJ;
 Tue, 13 Oct 2026 15:18:17 +0000
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
	bh=VwgG761bOOp97QQD14h/MFuJjQoVe+hzCUaTx729ri0=; b=YgdOWLyHusiGoUYvzIC7xLzrG0
	VhLkOkAbWS8ezgH67pWLc6593bLprGzZHvmrw+G7FUItaVGUIoIQhnL6LltBahVI3V/w69+xIRUj1
	BfcKRkS96ZTj7WEcqoLn/bSlslfOGSVSqr6/QgnaWAOjdNo59BYwhqoDAlA99NCSeRaI=;
Date: Tue, 13 Oct 2026 17:18:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
Message-ID: <as5LtzGZjLbb3Kpi@Mac.lan>
References: <7549daf9e0de3420198913f6f91c16c929a31834.1791404375.git.dmytro_prokopchuk1@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7549daf9e0de3420198913f6f91c16c929a31834.1791404375.git.dmytro_prokopchuk1@epam.com>

On Wed, Oct 07, 2026 at 08:39:52PM +0000, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
> essential type".
> 
> bar_write() and guest_mem_bar_write() added the boolean 'hi' to a
> pointer difference when printing the ignored BAR index. These handlers
> are registered only for the memory BAR registers, so print
> (reg - PCI_BASE_ADDRESS_0) / 4 instead. The expression has type
> unsigned int, so use %u.
> 
> No functional changes.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

