Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70024C27C78
	for <xen-devel@archiver.kernel.org>; Fri, 21 Jun 2024 21:39:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.745611.1152752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlyK-0006Pe-Fz; Fri, 21 Jun 2024 21:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745611.1152752; Fri, 21 Jun 2024 21:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKlyK-0006PX-D4; Fri, 21 Jun 2024 21:39:04 +0000
Received: by outflank-mailman (input) for mailman id 745611;
 Fri, 21 Jun 2024 21:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKlyJ-0006PR-5s
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 21:39:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab412570-3016-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 23:39:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 73876CE3CFB;
 Fri, 21 Jun 2024 21:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC45C2BBFC;
 Fri, 21 Jun 2024 21:38:52 +0000 (UTC)
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
X-Inumbo-ID: ab412570-3016-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719005933;
	bh=xvpIthr1f2UFM6VmAjX/dj4nayX6AFVwlpZpoyBW1+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GI2J4Wz8mto6Gbi++JaAcFiuZqpT1r+ssq2kDgdeDtCdlM1AAMFk24QU+gduI4cJS
	 WIpMdxb3AU9GwbASwuGpAa6FQy8zfJnhHo1QrzjMbZQyV2o/VUW/0WWqPYd18fQU6j
	 L/l9BS2wIN5ZrJRpBCAwg+v+Fwf2h69uXOIyOhpX4jnR8hlI8GMeD2rjt6sapSakLm
	 c4GuoWZ6+9l7WAws0jemfh1Le6DX6IMIthuBsNUnOfB4T9ryyAsEBtDHFNEePVPvyR
	 4BlgecaXYoxsFpiCCOkLaIHI/reNbiXkjCi007619sgX406TBAi7Ew+Zvh1Jvz6YSI
	 9VFpSJ0sy/5Ag==
Date: Fri, 21 Jun 2024 14:38:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/2] x86/pagewalk: Address MISRA R8.3 violation in
 guest_walk_tables()
In-Reply-To: <20240621205800.329230-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2406211438440.2572888@ubuntu-linux-20-04-desktop>
References: <20240621205800.329230-1-andrew.cooper3@citrix.com> <20240621205800.329230-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Andrew Cooper wrote:
> Commit 4c5d78a10dc8 ("x86/pagewalk: Re-implement the pagetable walker")
> intentionally renamed guest_walk_tables()'s 'pfec' parameter to 'walk' because
> it's not a PageFault Error Code, despite the name of some of the constants
> passed in.  Sadly the constants-cleanup I've been meaning to do since then
> still hasn't come to pass.
> 
> Update the declaration to match, to placate MISRA.
> 
> Fixes: 4c5d78a10dc8 ("x86/pagewalk: Re-implement the pagetable walker")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


