Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70102C79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 07:23:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412620.1643016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Cdm-0004Fg-LC; Wed, 09 Sep 2026 07:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412620.1643016; Wed, 09 Sep 2026 07:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Cdm-0004FZ-Gn; Wed, 09 Sep 2026 07:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1412620;
 Wed, 09 Sep 2026 07:22:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4Cdl-0004FT-Jq
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 07:22:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4Cdh-006KpL-3A;
 Wed, 09 Sep 2026 07:22:38 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4Cdi-007L4p-1V;
 Wed, 09 Sep 2026 07:22:38 +0000
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
	bh=FE1URNGmNGeJXKw7trSii6LEWHPhb09jYiVQReAtcio=; b=iVg88/ll3nU9wxuqSZfGDc239L
	SGAsw4S+QLVZmetr1TUjCy8hutM5OYKXo91zdSTvNJCMlYgwRGMp7Q7YNN/85piyAxHiQa8o+AyIQ
	k1g+OcFXYVX7q1Ogm0EuSe1GZtE8ES5vLYlKn0s3run7jTn/7YUVAHA4FFNOdjAVD0FI=;
Date: Wed, 9 Sep 2026 09:22:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 4/3] x86/PCI: use pci_sbdf_t also for pci_dev_base()
Message-ID: <aqEJNI6lTc0YbvML@macbook.local>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
 <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2ed324f-3a52-42b1-8b26-b3ae53ab2ead@suse.com>

On Wed, Sep 09, 2026 at 09:16:46AM +0200, Jan Beulich wrote:
> No need to pass three arguments when both callers already hold SBDF in
> their hands.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

