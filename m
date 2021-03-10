Return-Path: <SRS0=92qd=II=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB45C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 15:15:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EFA464F4E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Mar 2021 15:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EFA464F4E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96181.181748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0YC-0006zH-7W; Wed, 10 Mar 2021 15:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96181.181748; Wed, 10 Mar 2021 15:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0YC-0006zA-33; Wed, 10 Mar 2021 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 96181;
 Wed, 10 Mar 2021 15:15:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0YB-0006z5-6k
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:15:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0YB-0004PV-1n
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:15:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0YB-0003hi-0h
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:15:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lK0Y7-0006XG-OH; Wed, 10 Mar 2021 15:14:59 +0000
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
	bh=udJnr+Ah07Tgqjp3r46mOigwVDrWqWV0YEwaKv/gyLk=; b=q/H1eOOqZKwMuUjCYBEdAFRcX6
	LOpDA1GxKg0VoR6wxnTcPntjuR5Zuz38mmE8ZZIwRd1oIwGkXgdyIaeEBsVvYR2aJINfqQVxtdPD6
	FdYh3jp5Rimat9l5cVf/HDs6K3xPT1/He/jkZw1YIEGvZDV4IujBlGvse6e2AJLZIwwY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24648.57971.488443.593050@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 15:14:59 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API
In-Reply-To: <20210310150722.27194-1-andrew.cooper3@citrix.com>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
> Exactly as with c/s f40e1c52e4, this is inappropriate for a stable library.
> 
> That change actually broke the build with:
> 
>   include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
>        ioservid_t *id);
>        ^
> 
> as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
> nothing noticed because the header.chk logic is also broken (fixed
> subsequently).
> 
> Strip the guard from the public header, and remove compensation from
> devicemodel's private.h.  Fix the dmop design doc to discuss both reasons
> behind the the ABI design.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> v2:
>  * Patch dmop.pandoc as well.
> 
> For 4.15.  This is a build fix, even if current staging can't spot the
> breakage.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I am going to stop giving acks for this kind of thing fairly shorty.

Ian.

