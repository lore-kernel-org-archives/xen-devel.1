Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB7CD4F54
	for <xen-devel@archiver.kernel.org>; Wed, 27 May 2026 21:39:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1320771.1587931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSLy9-0007to-8V; Wed, 27 May 2026 21:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320771.1587931; Wed, 27 May 2026 21:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSLy9-0007th-5j; Wed, 27 May 2026 21:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1320771;
 Wed, 27 May 2026 21:39:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wSLy8-0007tb-9u
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 21:39:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSLy7-00FqI7-Ls
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 23:39:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a176452-bab6-0a2a0a5309dd-0a2a4502da98-22
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 23:39:15 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6a176482-af86-0a2a45020019-ac6904fec4f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 23:39:15 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C76F3605C1;
 Wed, 27 May 2026 21:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE651F000E9;
 Wed, 27 May 2026 21:39:13 +0000 (UTC)
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
	s=k20260515; t=1779917953;
	bh=Th5FpWk0uCEzs8ns78CFdL3HcGsGRPRpl1Wzv8iVOug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=d6XFrF7tqGMOpNGE3ymh+lFslb9spPfqmt1Q4+YyOxr4tyKz0TTe77rSTtdi8nw/o
	 W9dw1S8lwKG4Qv7e6NvPj5QvEwCEkralbiFHXtJu57VIaFWC/FPsqC8qEGVpft2Cpa
	 F1HNOasaBvsfkcIB4KRO/mbMLICxDcNRRjtI+AUB6J/7WPhtefnS77ON3DquQ2g+rk
	 j8TE9pOYm+i4jIGYMw1XLKBRYnG/ZxMID26jhzc1lXHpzWI3TG9T3QBZIMNEpgCFOh
	 YIA203UkgCusB44wmU5QK4dvjX9HRFlproAjoHZrvoFhWfLkScsGv5lootE1G6JNb8
	 xK2Af2CL3GaPQ==
Date: Wed, 27 May 2026 14:39:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Cody Zuschlag <cody.zuschlag@gmail.com>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, jbeulich@suse.com, 
    julien@xen.org, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v3] docs/process: document AI-assisted patch tags
In-Reply-To: <20260527174528.27903-1-cody.zuschlag@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2605271439060.182011@ubuntu-linux-20-04-desktop>
References: <20260527174528.27903-1-cody.zuschlag@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-720697/1779917955-A9D77161-39C1F47A/0/0
X-purgate-type: clean
X-purgate-size: 373

On Wed, 27 May 2026, Cody Zuschlag wrote:
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches.
> 
> The guidance follows the Linux kernel documentation.
> 
> Assisted-by: ChatGPT:gpt-5.5
> Signed-off-by: Cody Zuschlag <cody.zuschlag@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

