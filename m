Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52656C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 15:26:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10D664EC4
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 15:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10D664EC4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89395.168337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEw2w-0005z8-BA; Wed, 24 Feb 2021 15:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89395.168337; Wed, 24 Feb 2021 15:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEw2w-0005z1-7r; Wed, 24 Feb 2021 15:25:50 +0000
Received: by outflank-mailman (input) for mailman id 89395;
 Wed, 24 Feb 2021 15:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEw2u-0005yt-OH
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEw2u-0008VU-L5
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:25:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEw2u-0002KD-II
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:25:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEw2r-0007FN-DC; Wed, 24 Feb 2021 15:25:45 +0000
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
	bh=vT0V/nBbFysqrIXy7cxIeUMkTZqRkdZEUb07V9dNfbA=; b=y9Cxd9Wm863VTIvOMtaGunzOMn
	rmk9Ohrwiwr1I1KxwxWAmy5hgeRetU0c1PiMDzj2p3YcGr8S2RhiwpZOB4gjBMQkVEseoS+Owy9Ov
	q1sZZ6BFVJmk03kfY6meUPMNs+nLvyJRJWqpY/T8dAngCzfCBbMU7N9ti6WQe0/XEwog=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24630.28665.162235.719938@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 15:25:45 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] elfstructs: add relocation defines for i386
In-Reply-To: <20210224145856.94465-1-roger.pau@citrix.com>
References: <20210224145856.94465-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] elfstructs: add relocation defines for i386"):
> Those are need by the rombios relocation code in hvmloader. Fixes the
> following build error:
> 
> 32bitbios_support.c: In function 'relocate_32bitbios':
> 32bitbios_support.c:130:18: error: 'R_386_PC32' undeclared (first use in this function); did you mean 'R_X86_64_PC32'?
>              case R_386_PC32:
>                   ^~~~~~~~~~
>                   R_X86_64_PC32
> 32bitbios_support.c:130:18: note: each undeclared identifier is reported only once for each function it appears in
> 32bitbios_support.c:134:18: error: 'R_386_32' undeclared (first use in this function)
>              case R_386_32:
>                   ^~~~~~~~
> 
> Only add the two defines that are actually used, which seems to match
> what we do for amd64.
> 
> Fixes: 81b2b328a26c1b ('hvmloader: use Xen private header for elf structs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

