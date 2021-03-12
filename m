Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD09C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 14:14:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8591B64F09
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 14:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8591B64F09
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97148.184388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiYZ-00085f-Tn; Fri, 12 Mar 2021 14:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97148.184388; Fri, 12 Mar 2021 14:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiYZ-00085Y-Qg; Fri, 12 Mar 2021 14:14:23 +0000
Received: by outflank-mailman (input) for mailman id 97148;
 Fri, 12 Mar 2021 14:14:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiYY-00085T-PE
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:14:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiYY-00015e-KB
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:14:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiYY-00013h-Fb
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:14:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKiYV-00046q-8v; Fri, 12 Mar 2021 14:14:19 +0000
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
	bh=612xe5D1gQNvP67L9NWPxnl64xExgmv8QNuIAJBrNxA=; b=3hY92iGAcEMH6UYuKhRubJJrHP
	SE2/38geWjr3GDNp3K9DJt+dqTh/6oCxNO9F6K14Is7mZuqh5fTZdtJZw+IzIArocIrP3KGyYrO4U
	BU91yGmZ+4IAXxjrykLcwJlA/9MJJ28f65p75iEfTaZqSo7QTTsfKp4QoULIoav3FkG4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.30523.7483.695534@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 14:14:19 +0000
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    <jbeulich@suse.com>,
    <andrew.cooper3@citrix.com>,
    <roger.pau@citrix.com>,
    <wl@xen.org>,
    <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.15] vtd: make sure QI/IR are disabled before initialisation
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <2937df62c72f48cf81af9e12b33e13c6@FTLPEX02CAS03.citrite.net>
References: <2937df62c72f48cf81af9e12b33e13c6@FTLPEX02CAS03.citrite.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Igor Druzhinin writes ("[PATCH for-4.15] vtd: make sure QI/IR are disabled before initialisation"):
> BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
> partially configured state. In case of x2APIC code path where EIM is
> enabled early in boot - those are correctly disabled by Xen before any
> attempt to configure. But for xAPIC that step is missing which was
> proven to cause QI initialization failures on some ICX based platforms
> where QI is left pre-enabled and partially configured by BIOS.
> 
> Unify the behaviour between x2APIC and xAPIC code paths keeping that in
> line with what Linux does.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

