Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE26C43461
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 14:47:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77043207EA
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 14:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="EIkIbna9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77043207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHpl3-0005pf-TV; Mon, 14 Sep 2020 14:47:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lZiK=CX=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kHpl2-0005pa-GZ
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:47:04 +0000
X-Inumbo-ID: e646951b-91af-400e-aadb-c5b48c978d83
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e646951b-91af-400e-aadb-c5b48c978d83;
 Mon, 14 Sep 2020 14:47:02 +0000 (UTC)
Date: Mon, 14 Sep 2020 14:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1600094821;
 bh=RA26LoeMKzQ17zR5atd9Z3Ft/QyFg0P4vMkgURQVIS8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=EIkIbna9xt8GUKUa2bkkLQ52A970H+Iu5SR/jScy9I9snGnuMaNetNmguelj0yH9s
 5leaKmUqd93I7KAIyxjcrhg/xGSxulGMdOcGnaYImDLTM248fSd3cBXknbR3nDwvlJ
 ihhWAh2hFfaTIUXgOEjFN+KpFPVwCojxQT5XJ8Jk=
To: Jan Beulich <jbeulich@suse.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] efi: const correct EFI functions
Message-ID: <GzkAuTpoKeYXGDsEJtlgfK50xky_Z3ipeYUpbKvW9Fu-0uJamNpsRVMR8fIUYpIzoJlzowf-j7pbcoDAmL8qgYRjE2UwZ2wKma0Xm7U5PpQ=@trmm.net>
In-Reply-To: <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
References: <20200914142528.897639-1-hudson@trmm.net>
 <c83fa179-253b-29ba-57d7-c2b5a9b0daee@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Monday, September 14, 2020 10:30 AM, Jan Beulich <jbeulich@suse.com> wro=
te:
> On 14.09.2020 16:25, Trammell Hudson wrote:
> > By defining IN as const, the EFI handler functions become almost
> > const-correct and allow most of the rest of the EFI boot code to
> > use constant strings.
>
> How does this work with combined "IN OUT"? I'm afraid there is a
> reason why things aren't done the way you suggest.

WTF FFS UEFI. They really do continue to find new ways to disappoint me.

So I see three options:

Option 1 is to retroactively modify the C spec to allow us to have
a "nonconst" that will override any prior "const" modifiers
(last one wins, like Duck Season/Rabbit Season).

Option 2 would be to modify the imported header to change
the 30 uses of "IN OUT" to "INOUT" and define that to be an
empty string.

Option 3 would be to write wrappers for the few functions that are
used in the EFI boot path that cast-away the constness of their
arguments (while also silently cursing the UEFI forum for not
writing const-correct code).

--
Trammell

