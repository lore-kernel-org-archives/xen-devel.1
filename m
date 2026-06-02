Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F33CCD6E55
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 00:18:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1324297.1589921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCq1-0007R3-Bp; Tue, 02 Jun 2026 00:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324297.1589921; Tue, 02 Jun 2026 00:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUCq1-0007Qw-8h; Tue, 02 Jun 2026 00:18:33 +0000
Received: by outflank-mailman (input) for mailman id 1324297;
 Tue, 02 Jun 2026 00:18:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wUCpz-0007Qo-Ib
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 00:18:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUCpy-00CKOO-Va
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 02:18:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2134-bab6-0a2a0a5309dd-0a2a4506897e-38
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:18:30 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a1e2155-7371-0a2a45060019-ac6904fedb66-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:18:30 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6168D6001A;
 Tue,  2 Jun 2026 00:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEE21F00893;
 Tue,  2 Jun 2026 00:18:28 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780359509;
	bh=LzwSgJZHGddLSQ2oni+MH43Ye4KlMqf8QB3MoiwHMeQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XpKGir5qo1AmmIm+YNu0Kh6Hb7gXAtMlSrKrOBE4y5tup93n5af7JwHdU+KgdFXrC
	 JyPBT6+kcr7tk7oFKEFKlN/InfipLL64mktvxSORc8HcPVHv9tIiOPuXQ78kcvYiQP
	 C1PlVMOD15rvVbDKY9ZUWGErhqh0EnoA9s5zTIyO0MeFCR1GuPYfjXvw7LENGa8r7h
	 BLe0iDtPbXd/92E51yvTc151YcH9n/EwmZI6ZtuCG74utZ16Z0ne9qmpc5lcqhqMYC
	 UEbrigVeKj4LNyEsM2QEcCv3TNJunuqoW0X2ny/I97zgaCWX0sBkpky0/aCmA7eQjm
	 WmlTf23/DxCiw==
Date: Mon, 1 Jun 2026 17:18:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@ford.com
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    christopher.w.clark@gmail.com, dpsmith@apertussolutions.com
Subject: Re: [PATCH v3 4/6] argo: fixup argo_dprintk()
In-Reply-To: <20260526215823.1452619-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2606011718190.550703@ubuntu-linux-20-04-desktop>
References: <20260526215823.1452619-1-dmukhin@ford.com> <20260526215823.1452619-5-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-16d1c6/1780359510-87170D75-28D8E2F0/0/0
X-purgate-type: clean
X-purgate-size: 380

On Tue, 26 May 2026, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Current argo_dprintk() implementation is a wrapper around raw printk().
> 
> Rewire it through gprintk() to allow for better debugging context
> (such as domain ID).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


