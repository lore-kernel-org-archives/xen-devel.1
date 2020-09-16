Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51C0C43461
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 15:04:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C43722403
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 15:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="5eJHyzVJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C43722403
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIYyd-0006Rf-LD; Wed, 16 Sep 2020 15:04:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csaV=CZ=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kIYyc-0006Ra-ET
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 15:04:06 +0000
X-Inumbo-ID: 69158728-f5c0-4a32-94d0-3fcb0de10446
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69158728-f5c0-4a32-94d0-3fcb0de10446;
 Wed, 16 Sep 2020 15:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=RZTA1BkhWGQwrnoJyJesNUdbkKbSk19GywKSQlDMBRM=; b=5eJHyzVJ9It8pH3bjIrZzfYmJ+
 rlNM6onQUb0GbQZpIOmh8kQdaKE71yu8focFvJrGrpowD5zbIYLBdFJq1ALxM/iT3js6dlxbgS9DL
 +vUZysOKqcdrup3wPRV7cBNK+mhPedoz/wrkI067+SuEn+zJz6ANdEdbbue5K0YGhvDQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kIYyb-0000ki-5k
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 15:04:05 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kIYyb-00083o-3V
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 15:04:05 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kIYyX-0002Kd-LK; Wed, 16 Sep 2020 16:04:01 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24418.10593.304303.155165@mariner.uk.xensource.com>
Date: Wed, 16 Sep 2020 16:04:01 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Juergen Gross <jgross@suse.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools: Delete XEN_DOMCTL_disable_migrate
In-Reply-To: <20200911190618.14708-1-andrew.cooper3@citrix.com>
References: <20200911190618.14708-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH] tools: Delete XEN_DOMCTL_disable_migrate"):
> It is conceptually wrong for this information to exist in the hypervisor in
> the first place.  Only the toolstack is capable of correctly reasoning about
> the non-migrateability of guests.
> 
> This hypercall has only ever existed to control the visibility of the
> Invariant TSC flag to the guest.  Now that we have properly disentanged that
> and moved ITSC into the guests CPUID policy, delete this hypercall.
> 
> Furthermore, this fixes a corner case where Xen would override the toolstacks
> choice of ITSC for a xenstore stubdomain.  That said, init-xenstore-domain
> doesn't currently ask for ITSC, and MiniOS doesn't know what ITSC is either,
> so nothing actually changes in practice.

For the tools parts,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

