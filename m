Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D65C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 17:01:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7342C64DD4
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 17:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7342C64DD4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81381.150348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7i06-0001N9-RC; Thu, 04 Feb 2021 17:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81381.150348; Thu, 04 Feb 2021 17:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7i06-0001N2-Mj; Thu, 04 Feb 2021 17:01:02 +0000
Received: by outflank-mailman (input) for mailman id 81381;
 Thu, 04 Feb 2021 17:01:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7i05-0001Mx-GI
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:01:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7i05-0007oY-Dy
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:01:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7i05-0004JB-C6
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 17:01:01 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7i02-0000FB-6x; Thu, 04 Feb 2021 17:00:58 +0000
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
	bh=QNlvHYRroz6D6/RDu3PyVs6i+A0AYlfH++dbgPh+wDw=; b=3T+R76XiUqpkF9euMsRTNP7a3x
	vTKk9DVl7Sdy+Z7EPQp1hazQOIn5jZLeswPoyNAQMyZCM4CCrWcz09v5r7AT0q8XhKRuU6NDchZPY
	tyeAyWElm7pEOq6CHS3pTm0s5p6RdtSzsakYOKNWZArOy4OMhRzXP5Dz3eQlYPmm4U3s=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24604.10313.939225.448487@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 17:00:57 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Julien Grall <julien.grall@arm.com>,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH for-4.15] libs/devicemodel: Fix ABI breakage from xendevicemodel_set_irq_level()
In-Reply-To: <20210204155850.23649-1-andrew.cooper3@citrix.com>
References: <20210204155850.23649-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15] libs/devicemodel: Fix ABI breakage from xendevicemodel_set_irq_level()"):
> It is not permitted to edit the VERS clause for a version in a release of Xen.
> 
> Revert xendevicemodel_set_irq_level()'s inclusion in .so.1.2 and bump the the
> library minor version to .so.1.4 instead.
> 
> Fixes: 5d752df85f ("xen/dm: Introduce xendevicemodel_set_irq_level DM op")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Sorry for not spotting this earlier.

