Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE7EA7951
	for <xen-devel@archiver.kernel.org>; Thu,  5 Feb 2026 02:13:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1221427.1529688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnori-0003Bh-Q9; Thu, 05 Feb 2026 02:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221427.1529688; Thu, 05 Feb 2026 02:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnori-0003Ba-Mf; Thu, 05 Feb 2026 02:13:06 +0000
Received: by outflank-mailman (input) for mailman id 1221427;
 Thu, 05 Feb 2026 02:13:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnori-0003BU-5t
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 02:13:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnori-003xg6-0B;
 Thu, 05 Feb 2026 02:13:05 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnorh-00HXiz-1R;
 Thu, 05 Feb 2026 02:13:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=lkmfRbS/QtnjJUx5SLebBDTlx29CMpQ2hnCYkU6OZOI=; b=
	mtZ+Giob9KpB9oBChRpl/thWOCLLcivyDBBK3e1cMPko18uMU1hykZ/OAKMe16ce5By1Y+YSYoohm
	ARk36TktoGN5lvRm5WR7Ugdjayzy7/o4UGnkqK2Ys1Q2QaKKi3S2bDA+yQN5QfXLjFe0sb7Dz8NE/
	XpoXTkKOZKrLljshY=;
From: dmukhin@xen.org
Date: Wed, 4 Feb 2026 18:13:04 -0800
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
	anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
	roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com,
	andrew.cooper3@citrix.com, jbeulich@suse.com,
	sstabellini@kernel.org
Subject: Re: [PATCH v10 1/5] xen/console: use ACCESS_ONCE for console_rx
Message-ID: <aYP8sKgWWN6i3T/F@kraken>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-1-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204233712.3396752-1-stefano.stabellini@amd.com>

On Wed, Feb 04, 2026 at 03:37:08PM -0800, Stefano Stabellini wrote:
> There can be concurrent reads and writes to the console_rx variable so
> it is prudent to use ACCESS_ONCE.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

