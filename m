Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C8CC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 10:54:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D6764ED1
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D6764ED1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89259.168000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEro8-0002oE-Jm; Wed, 24 Feb 2021 10:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89259.168000; Wed, 24 Feb 2021 10:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEro8-0002o7-GJ; Wed, 24 Feb 2021 10:54:16 +0000
Received: by outflank-mailman (input) for mailman id 89259;
 Wed, 24 Feb 2021 10:54:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEro7-0002o2-SI
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:54:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEro7-0003cg-QG
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:54:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEro7-0006AS-Ox
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 10:54:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEro4-0006bf-Bl; Wed, 24 Feb 2021 10:54:12 +0000
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
	bh=9JN2optW0yIzKfa1RJQdHleQKv352qScGmZsEaZTUng=; b=zeaMmBIDmhmrwjhtIEz/bNcOvb
	c5R9Hpp3qzH12mU2/v4JcWWe7o79XmyqujmvBk0eP9amJSs691pWsAa27oaDOFuYXulD+Uog3zmU/
	BnFIL9Sx8FMyoqBX9ytoeY8TQ1hljYZY9Oa/Sn1Gv9pphSRQnxNMIPqeYljvD6vtcN3U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24630.12372.139290.270183@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 10:54:12 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
In-Reply-To: <20210224102641.89455-1-roger.pau@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH 0/2] hvmloader: drop usage of system headers"):
> Following two patches aim to make hvmloader standalone, so that it don't
> try to use system headers. It shouldn't result in any functional
> change.

Both patches:

Reviewed-by: Ian Jackson <iwj@xenproject.org>

Given its status as a build fix,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

