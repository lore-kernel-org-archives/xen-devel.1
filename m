Return-Path: <SRS0=CNy3=IV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95956C433DB
	for <xen-devel@archiver.kernel.org>; Tue, 23 Mar 2021 13:37:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A5B61994
	for <xen-devel@archiver.kernel.org>; Tue, 23 Mar 2021 13:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A5B61994
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100693.192008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOhDb-00070f-8f; Tue, 23 Mar 2021 13:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100693.192008; Tue, 23 Mar 2021 13:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOhDb-00070Y-5D; Tue, 23 Mar 2021 13:37:11 +0000
Received: by outflank-mailman (input) for mailman id 100693;
 Tue, 23 Mar 2021 13:37:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhDZ-00070M-MZ
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:37:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhDZ-0007Fb-KY
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:37:09 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOhDZ-0001xy-IB
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 13:37:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOhDU-00027d-VK; Tue, 23 Mar 2021 13:37:04 +0000
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
	bh=5wg9s2wOhu6IIp6KgyIMxJ/OPzSPZgHZv+ZPEXrYQFA=; b=IfEzEUnTfzp1yz8O4jDmyXn0br
	FZn05loBYZEEBl68EFHTDfda63byKmJRrqWw4N254OP9rOA8+ArSF8xGam0QZToKprxtDzVgAWGG2
	TKsO5TX9O85dl4QcjJ1Y128k5H1yftkslIkctmZ74wrkB4o78eOI0JqkiZH6MQ6A09l8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24665.61184.783407.462294@mariner.uk.xensource.com>
Date: Tue, 23 Mar 2021 13:37:04 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "Tian\, Kevin" <kevin.tian@intel.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections
In-Reply-To: <35150558-6a4a-d6bb-b51a-4e2bf37e5ae5@suse.com>
References: <c19fe2b5-b682-374c-d30f-83fb8b367286@suse.com>
	<MWHPR11MB1886A8DBD8B93A612A1B09958C649@MWHPR11MB1886.namprd11.prod.outlook.com>
	<35150558-6a4a-d6bb-b51a-4e2bf37e5ae5@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 0/4][4.15?] VT-d: mostly S3 related corrections"):
> Thanks Kevin. Ian - what are your thoughts here towards 4.15?

I looked at these four patches.

In general I am not sure of the implications.  There are two important
sets of implications: (i) upside: what is the bug this fixes and how
severe is that bug *in its actual impact on users of Xen* (ii) what
possible problems might there be and how have we made sure that the
patch is right ?

I want look at this not from the point of view of technical details
but in terms of user impact.  User impact is harder to predict but it
is what we actually care about.

For one of the patches it seemed obvious to me that there was very
little downside risk and the upside is not corrupting something
(perhaps something important).

For the others, all I could see, besides the general statement that
these aren't regressions, there was a lot of intensive discussion in
the commit messages of the specific technical details.  Frankly, that
all went quite over my head.

I would be prepared to give a release ack for the others if I can be
convinced of satisfactory answers to my questions (i) and (ii).  For
an idea of what kind of answer I'm looking for, see the kind of thing
Roger has been putting in his 4.15-targeted patches.  The more complex
and to-me-impenetrable the underlying technical details the more
sceptical I will be :-).

I hope that makes sense.

Thanks,
Ian.

