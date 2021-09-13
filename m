Return-Path: <SRS0=KcSv=OD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC3DC433F5
	for <xen-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:59:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E84661A02
	for <xen-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E84661A02
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.185700.334390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmUP-0002fx-Qp; Mon, 13 Sep 2021 13:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185700.334390; Mon, 13 Sep 2021 13:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPmUP-0002fq-NR; Mon, 13 Sep 2021 13:59:17 +0000
Received: by outflank-mailman (input) for mailman id 185700;
 Mon, 13 Sep 2021 13:59:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPmUO-0002fi-M3
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:59:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPmUO-0006Fk-LB
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:59:16 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mPmUO-0008Bg-KE
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 13:59:16 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mPmUG-0002qd-RU; Mon, 13 Sep 2021 14:59:08 +0100
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
	bh=K/4rukjrq3TiHD+P6XMnltI0voVS9nKVYs0qzADhDJU=; b=DjdReweRMLEE2zgaRULMcxzrF1
	QWBQbG42GEiNSrYTKrD0MHH3sXi4QB20BBYW4Lb6/SJ3dqDQcxWc9sGGqHiYb8oI3jq+JrPDxDdC+
	QZQUylNWvMIZG/zrANMUP6s8iZuLsNnZbTYvXbjHbRuOmap0mtxpEcPZTtcLJOvxv2g8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24895.22828.592096.976681@mariner.uk.xensource.com>
Date: Mon, 13 Sep 2021 14:59:08 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Julien Grall <julien@xen.org>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
In-Reply-To: <ea834f80-45ce-821a-bb2b-4a56dddff156@suse.com>
References: <20210730122643.2043-1-jgross@suse.com>
	<20210730122643.2043-3-jgross@suse.com>
	<24836.28.655841.510063@mariner.uk.xensource.com>
	<81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
	<6ced9858-d425-887c-0045-1aad8521b826@suse.com>
	<c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
	<9352f82a-1b43-4bf6-8b0a-5916627b7537@citrix.com>
	<24878.15168.981558.748531@mariner.uk.xensource.com>
	<ea834f80-45ce-821a-bb2b-4a56dddff156@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> On 31.08.21 16:22, Ian Jackson wrote:
> > ISTM that the following scheme is in the intersection of everyone's
> > requirements:
> > 
> >   * The limit will be adjusted/imposed in the startup script.
> >   * An /etc/{default,sysconfig} parameter will be provided to
> >     adjust the setting.
> >   * The default should be `unlimtied` since we cannot calculate
> >     a safe upper bound for all configurations.
> >   * Systems like Citrix Hypervisor (XenServer) which can calculate
> >     a safe upper bound can do so, and adjust the default, enabling
> >     them to spot fd leaks.
> 
> Makes sense for me.
> 
> So this would mean:
> - the sysconfig parameter will no longer be "number of domains", but the
>    fd limit of the Xenstore daemon
> - default should be "unlimited"
> - the comment should mention the current number of fds needed per domain
>    (5 for HVM, 2 for PV/PVH) plus some headroom in dom0 (without any
>    guest running on my test system 21 fds are active, so I guess a value
>    of 50 seems appropriate)
> 
> Is this okay?

Sounds good to me, thanks.

Ian.

