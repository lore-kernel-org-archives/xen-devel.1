Return-Path: <SRS0=L0Gu=IC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BF7C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 18:22:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D37664F60
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 18:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D37664F60
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93362.176274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHsbo-0006sp-8o; Thu, 04 Mar 2021 18:22:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93362.176274; Thu, 04 Mar 2021 18:22:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHsbo-0006si-4I; Thu, 04 Mar 2021 18:22:00 +0000
Received: by outflank-mailman (input) for mailman id 93362;
 Thu, 04 Mar 2021 18:21:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHsbn-0006sd-CC
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 18:21:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHsbn-0000zK-9X
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 18:21:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHsbn-0007up-8N
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 18:21:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHsbj-000614-OY; Thu, 04 Mar 2021 18:21:55 +0000
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
	bh=ND12rZ5Ez5jZl94nI2lObK2kzWuMwdRLYIxcGyq+/lY=; b=MBdUCMIf/Q8uqYUJi7IPvB3YXQ
	8yY0lKlePEBPqj0g3DFAgkbny7UHSa1sPwn3NueOSXXsb8LF9VUmd8SBKapGCkZ5NO6nYGz3jhmrh
	YnVBtY5QRdkrs+oMPDR+B0l5iNzictbD7Od6u8n+10RAAoMXiU83th8zJec0DaJFvPzU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24641.9539.445996.796776@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 18:21:55 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin  Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
In-Reply-To: <YEEcR/Jb5TgI31rY@Air-de-Roger>
References: <20210304144755.35891-1-roger.pau@citrix.com>
	<24640.62938.427877.757656@mariner.uk.xensource.com>
	<YED5Czp+v2xFSCOG@Air-de-Roger>
	<24640.64194.445736.52546@mariner.uk.xensource.com>
	<YEERBL4AO371ZxmP@Air-de-Roger>
	<24641.5419.379341.215528@mariner.uk.xensource.com>
	<YEEcR/Jb5TgI31rY@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed rdmsr behavior"):
> One option we could go for is making this behavior depend on Kconfig:
> enable strict MSR policy for debug builds and fallback to the
> 'relaxed' one for non-debug builds. That might get us some more data,
> but again I fear most people out there will run non-debug builds
> anyway.

Hmmm.

Well, anyway, my R-A for this patch stands.

I wanted to explore our options, but I won't try to insist on a change
to the default configuration if you experts are against it.

Ian.

