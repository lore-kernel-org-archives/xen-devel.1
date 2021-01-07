Return-Path: <SRS0=InXR=GK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB492C433DB
	for <xen-devel@archiver.kernel.org>; Thu,  7 Jan 2021 18:18:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92364207C8
	for <xen-devel@archiver.kernel.org>; Thu,  7 Jan 2021 18:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92364207C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63054.111929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZrz-00056Y-Ti; Thu, 07 Jan 2021 18:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63054.111929; Thu, 07 Jan 2021 18:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxZrz-00056R-Qe; Thu, 07 Jan 2021 18:18:47 +0000
Received: by outflank-mailman (input) for mailman id 63054;
 Thu, 07 Jan 2021 18:18:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wsBJ=GK=redhat.com=jpoimboe@srs-us1.protection.inumbo.net>)
 id 1kxZrx-00056M-TO
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 18:18:46 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e8ebaf73-61fa-4668-93ea-5a747e833197;
 Thu, 07 Jan 2021 18:18:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-2ue6GNs7N0CujjnsvCMULQ-1; Thu, 07 Jan 2021 13:18:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D848959;
 Thu,  7 Jan 2021 18:18:38 +0000 (UTC)
Received: from treble (ovpn-120-156.rdu2.redhat.com [10.10.120.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9D210013BD;
 Thu,  7 Jan 2021 18:18:37 +0000 (UTC)
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
X-Inumbo-ID: e8ebaf73-61fa-4668-93ea-5a747e833197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610043524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jmwdppp4KSdjSBui+pFcX3CZuLo5H+3bgjVupL0lUBE=;
	b=h6VrVYcm0wTvN6rRYwKVfR8VGTpuZrJ31zEBBz7WW86s5nksIPzuYJR3LrWc1firePPlLM
	FoeWF8f6ACwEFgvavRVFvKfFk5QToM+QgoEUlnKfDrF9rwlWluj9TjbcIMoA+F1TEWZzEh
	RSy2TKch/cCv0YMigBjfDllA33KhZEI=
X-MC-Unique: 2ue6GNs7N0CujjnsvCMULQ-1
Date: Thu, 7 Jan 2021 12:18:35 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [PATCH 3/3] objtool: Support stack layout changes in alternatives
Message-ID: <20210107181835.rc7lutdqujf4mead@treble>
References: <cover.1608700338.git.jpoimboe@redhat.com>
 <9f78604e49b400eb3b2ca613591f8c357474ed4e.1608700338.git.jpoimboe@redhat.com>
 <alpine.LSU.2.21.2101071417440.31250@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2101071417440.31250@pobox.suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

On Thu, Jan 07, 2021 at 02:22:27PM +0100, Miroslav Benes wrote:
> On Tue, 22 Dec 2020, Josh Poimboeuf wrote:
> 
> > BTW, another benefit of these changes is that, thanks to some related
> > cleanups (new fake nops and alt_group struct) objtool can finally be rid
> > of fake jumps, which were a constant source of headaches.
> 
> \o/
> 
> You may also want to remove/edit the comment right before 
> handle_group_alt() now that fake jumps are gone.
> 
> Anyway, I walked through the patch (set) and I think it should work fine 
> (but I am not confident enough to give it Reviewed-by. My head spins :)). 
> I even like the change.
> 
> Also, 1/3 is a benefit on its own, so if nothing else, it could go in.

Thanks for the review!

That comment is indeed now obsolete.  I can squash something like so:

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 81d56fdef1c3..ce67437aaf3f 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -958,21 +958,8 @@ static int add_call_destinations(struct objtool_file *file)
 }
 
 /*
- * The .alternatives section requires some extra special care, over and above
- * what other special sections require:
- *
- * 1. Because alternatives are patched in-place, we need to insert a fake jump
- *    instruction at the end so that validate_branch() skips all the original
- *    replaced instructions when validating the new instruction path.
- *
- * 2. An added wrinkle is that the new instruction length might be zero.  In
- *    that case the old instructions are replaced with noops.  We simulate that
- *    by creating a fake jump as the only new instruction.
- *
- * 3. In some cases, the alternative section includes an instruction which
- *    conditionally jumps to the _end_ of the entry.  We have to modify these
- *    jumps' destinations to point back to .text rather than the end of the
- *    entry in .altinstr_replacement.
+ * The .alternatives section requires some extra special care over and above
+ * other special sections because alternatives are patched in place.
  */
 static int handle_group_alt(struct objtool_file *file,
 			    struct special_alt *special_alt,


