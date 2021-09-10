Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C148C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 15:33:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D4C611C5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 15:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4D4C611C5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184544.333221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOiWP-00074k-1i; Fri, 10 Sep 2021 15:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184544.333221; Fri, 10 Sep 2021 15:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOiWO-00074d-V1; Fri, 10 Sep 2021 15:32:56 +0000
Received: by outflank-mailman (input) for mailman id 184544;
 Fri, 10 Sep 2021 15:32:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiWN-00074X-54
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:32:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiWN-0001So-11
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:32:55 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOiWM-0000xp-WC
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:32:55 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOiWJ-0002ur-Gt; Fri, 10 Sep 2021 16:32:51 +0100
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
	bh=uTOf+LaTavirUm6aGDFAvXM5Dug4UP5qAacs5WI7GxU=; b=BZNYkYB1yhNxLi1TVODm+QI4eO
	8/NWHUzQZ944E+B34vUz+vPFiwNKDgopa1bHEaxdnIJrHlZ2lJ0y4nAMLZyn/lMnR+dVuJO2Urtdn
	23bK5OJLr+ZiFqYOsVhOjp1A4kGpfq1Dnrbppcwe51izLeP00uqR9GYyof5W2ORJOu6A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24891.31395.187330.546856@mariner.uk.xensource.com>
Date: Fri, 10 Sep 2021 16:32:51 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
In-Reply-To: <462de39a-2edc-ee3e-8016-85ce29e7ca59@suse.com>
References: <20210909124924.1698-1-jgross@suse.com>
	<20210909124924.1698-2-jgross@suse.com>
	<24890.2778.780247.724651@mariner.uk.xensource.com>
	<7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
	<24890.12692.44064.995392@mariner.uk.xensource.com>
	<462de39a-2edc-ee3e-8016-85ce29e7ca59@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub"):
> BTW, you probably want to modify OSStest to use configure with:
> 
> --enable-pv-grub --enable-qemu-traditional
> 
> in order to not let the tests fail (applies to x86 only, of course).

I think it might be better to disable those tests.  What do people
think ?

Ian.

