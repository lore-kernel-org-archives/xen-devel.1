Return-Path: <SRS0=InXR=GK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D10C433E0
	for <xen-devel@archiver.kernel.org>; Thu,  7 Jan 2021 13:22:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B202065E
	for <xen-devel@archiver.kernel.org>; Thu,  7 Jan 2021 13:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B202065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.62887.111537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVFI-0006UX-I5; Thu, 07 Jan 2021 13:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62887.111537; Thu, 07 Jan 2021 13:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVFI-0006UO-9j; Thu, 07 Jan 2021 13:22:32 +0000
Received: by outflank-mailman (input) for mailman id 62887;
 Thu, 07 Jan 2021 13:22:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qbmk=GK=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1kxVFG-0006UJ-V4
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 13:22:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c491b5c-e0a6-4996-bff5-172ff0752b20;
 Thu, 07 Jan 2021 13:22:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79E18B716;
 Thu,  7 Jan 2021 13:22:28 +0000 (UTC)
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
X-Inumbo-ID: 3c491b5c-e0a6-4996-bff5-172ff0752b20
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Date: Thu, 7 Jan 2021 14:22:27 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Josh Poimboeuf <jpoimboe@redhat.com>
cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH 3/3] objtool: Support stack layout changes in
 alternatives
In-Reply-To: <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com>
Message-ID: <alpine.LSU.2.21.2101071417440.31250@pobox.suse.cz>
References: <cover.1608700338.git.jpoimboe@redhat.com> <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Dec 2020, Josh Poimboeuf wrote:

> BTW, another benefit of these changes is that, thanks to some related
> cleanups (new fake nops and alt_group struct) objtool can finally be rid
> of fake jumps, which were a constant source of headaches.

\o/

You may also want to remove/edit the comment right before 
handle_group_alt() now that fake jumps are gone.

Anyway, I walked through the patch (set) and I think it should work fine 
(but I am not confident enough to give it Reviewed-by. My head spins :)). 
I even like the change.

Also, 1/3 is a benefit on its own, so if nothing else, it could go in.

Regards
Miroslav

