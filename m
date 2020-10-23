Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B006C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 13:30:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7267208E4
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 13:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="OW7Zd/lY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7267208E4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10988.29166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVx9H-0004gE-Jc; Fri, 23 Oct 2020 13:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10988.29166; Fri, 23 Oct 2020 13:30:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVx9H-0004g7-Gb; Fri, 23 Oct 2020 13:30:27 +0000
Received: by outflank-mailman (input) for mailman id 10988;
 Fri, 23 Oct 2020 13:30:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuJs=D6=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kVx9G-0004g2-31
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:30:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f5d3a22-5a3c-4198-bbd8-329b7d92ef3c;
 Fri, 23 Oct 2020 13:30:25 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kVx9F-00040F-1f
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:30:25 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kVx9F-0005yE-0t
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:30:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kVx9B-0007sr-Sp; Fri, 23 Oct 2020 14:30:21 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UuJs=D6=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kVx9G-0004g2-31
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:30:26 +0000
X-Inumbo-ID: 5f5d3a22-5a3c-4198-bbd8-329b7d92ef3c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5f5d3a22-5a3c-4198-bbd8-329b7d92ef3c;
	Fri, 23 Oct 2020 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=f3328DQndh6pgsRQk5BdExZnwN+spqoLKrPSfDlYn4c=; b=OW7Zd/lYX2vE/cd3aOPxIn7aBJ
	fETzneocVpImFwfzfP4/fzVPb8HlVF2OYOe9k/pG1SzyCSH+5KuAe+cXvwVNMYFg0O9oZp5DGdVeU
	imuDhFLsWl1YRNRjywUqVBPgc2/ZI/QJ8AKn5n1uOTKODroAio1kjk4+M0i3xxPoJhoI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kVx9F-00040F-1f
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:30:25 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kVx9F-0005yE-0t
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:30:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kVx9B-0007sr-Sp; Fri, 23 Oct 2020 14:30:21 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24466.56045.693953.101465@mariner.uk.xensource.com>
Date: Fri, 23 Oct 2020 14:30:21 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/2] maintainers: correct some entries
In-Reply-To: <20200909115944.4181-1-jgross@suse.com>
References: <20200909115944.4181-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH 0/2] maintainers: correct some entries"):
> Fix some paths after reorg of library locations, and drop unreachable
> maintainer.

Thanks, both

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

and committed.

Ian.

