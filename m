Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42133F417F3
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 16:21:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249576.1547044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzdLQ-0007li-Ac; Mon, 09 Mar 2026 16:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249576.1547044; Mon, 09 Mar 2026 16:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzdLQ-0007lb-84; Mon, 09 Mar 2026 16:20:36 +0000
Received: by outflank-mailman (input) for mailman id 1249576;
 Mon, 09 Mar 2026 16:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhv8=BJ=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1vzdLO-0007lV-DU
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 16:20:34 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4c14583-1bd3-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 17:20:32 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id 8C61850C34C;
 Mon,  9 Mar 2026 17:20:30 +0100 (CET)
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
X-Inumbo-ID: e4c14583-1bd3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1773073230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgzjjuSkW18P1q0YDVh3ZpT1HB0jbglyqdNQdpVWgeE=;
	b=VpK7xzhfQoQ+vMCEEs3kO2SgpkwemEjaHmVrq/Oh865KYw3PZkz9s58OaLZjfRvfRwDm9d
	jR2pXo9UA6/dXR4Qf4/AM4o1s8c+eGIlGT373VwcjwE/WALMEGrD8skESvC25g+r0SdQGk
	B0bITgR410UOthZfQxqVVfM2M+jF/S/Ezj9FL3rYJqadhVNTga4EGrP3huJy+/oXRPjTGi
	nBodxwyqePQBIVUlEwF8S1yK025KKHGrWEu6Yv9S0d7c7RyGd22KeGROksRRkRliKeIYd/
	ar1LhlRPnlMNifYrDg64SYHIBD55Z4Z1wlYW4BGZNtxrCK31SEVVrDkRFtKEQw==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Juergen Gross <jgross@suse.com>
Subject:
 Re: [XEN PATCH] libxl: Fix device_add QMP calls with QEMU 9.2 and newer
Date: Mon, 09 Mar 2026 17:20:30 +0100
Message-ID: <1983406.eGJsNajkDb@localhost>
In-Reply-To: <aa7d1kCW8HNejCgQ@l14>
References:
 <20251215135124.11410-1-anthony@xenproject.org>
 <2692705.Lt9SDvczpP@localhost> <aa7d1kCW8HNejCgQ@l14>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 9 March 2026 15:48:55 CET Anthony PERARD wrote:
> On Thu, Feb 19, 2026 at 02:29:07PM +0100, Maximilian Engelhardt wrote:
[...]
> > Can this patch be picked for the stable branches? I'm in particular
> > interested in 4.20 which is in Debian stable.
> 
> Done, thanks.

Thanks also.

We meanwhile got two reports in Debian from people running into that issue 
(plus me), so it's good to see it fixed.

We will pull the fix with the next xen update in Debian (but not yet the 
upcoming 13.4 point release), which we always base on the upstream stable 
branch.

Maxi



