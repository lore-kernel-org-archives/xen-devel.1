Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A936C433E6
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 13:43:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B02C65009
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 13:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B02C65009
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93714.176848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAjp-0000jo-9W; Fri, 05 Mar 2021 13:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93714.176848; Fri, 05 Mar 2021 13:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAjp-0000jh-48; Fri, 05 Mar 2021 13:43:29 +0000
Received: by outflank-mailman (input) for mailman id 93714;
 Fri, 05 Mar 2021 13:43:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAjn-0000jc-T3
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:43:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAjn-00073C-QO
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:43:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAjn-00033f-Nu
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:43:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAjj-0008Sq-Fn; Fri, 05 Mar 2021 13:43:23 +0000
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
	bh=ouQnAMoWXtR27g+cqZQHKPWR3HTi9bKIkcaxOUt0/is=; b=PGCXC6/zsjNV9Zc25r5cApDcQn
	gfce5EoYZzyXHuQiTglpJ83gZlwzEXR71AG5V4fJQRnW3mrv+LcqC3L87J9OKGIey3KqTfYPwx7Q5
	nrWaliSYwRGoa/bmteFjUg6naoCH/BQq9748essX3QkT6wj6dFuaUO1CpUFS0X2YLcm8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.13691.227259.144604@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:43:23 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] tools/libs: Fix headers.chk logic
In-Reply-To: <291c999a-19aa-2863-8154-4acc1774b4b8@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
	<20210305124949.6719-4-andrew.cooper3@citrix.com>
	<291c999a-19aa-2863-8154-4acc1774b4b8@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH 3/3] tools/libs: Fix headers.chk logic"):
> On 05/03/2021 12:49, Andrew Cooper wrote:
> > c/s 4664034cd dropped the $(LIBHEADERSGLOB) dependency for the headers.chk
> > rule, without replacing it.
> >
> > As headers.chk uses $^, a typical build looks like:
> >
> >   andrewcoop@andrewcoop:/local/xen.git$ make -C tools/libs/devicemodel/
> >   make: Entering directory '/local/xen.git/tools/libs/devicemodel'
> >   for i in ; do \
> >       gcc -x c -ansi -Wall -Werror
> >       -I/local/xen.git/tools/libs/devicemodel/../../../tools/include \
> >             -S -o /dev/null $i || exit 1; \
> >       echo $i; \
> >   done >headers.chk.new
> >   mv headers.chk.new headers.chk
> >
> > i.e. with an empty for loop, and checking only the $(AUTOINCS).
> >
> > Reinsert a $(LIBHEADERS) dependency.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

