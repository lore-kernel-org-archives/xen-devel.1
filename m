Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27079E8B364
	for <xen-devel@archiver.kernel.org>; Wed,  4 Feb 2026 02:56:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219808.1528666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnT3K-0006Gv-1K; Wed, 04 Feb 2026 02:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219808.1528666; Wed, 04 Feb 2026 02:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnT3J-0006Gn-RJ; Wed, 04 Feb 2026 02:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1219808;
 Wed, 04 Feb 2026 02:55:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vnT3I-0006Gh-KX
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 02:55:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnT3G-002Mva-0U;
 Wed, 04 Feb 2026 02:55:33 +0000
Received: from [140.209.201.102] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vnT3F-00GDbF-1q;
 Wed, 04 Feb 2026 02:55:33 +0000
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
	:Subject:Cc:To:Date:From; bh=BjkKDM8fENKGt52Vxx+M3eeohZOF5rdjqIS54yPudmw=; b=
	QD2Aul0HpoOB/5KLr/LTX6zU1mSvJdT93BtDdIzNlUAkWxIL1k8kLihPlTea4F5mI5/old5uC5WgB
	g/sXhKYp3fKL7GKs+JruiCXKqjy/4Rea3eocLRqq7QPXmV3e5gQLpzT8S8e8lZUkqdHDmIKKLuR2U
	uJfncYeNy7Y57E93Q=;
From: dmukhin@xen.org
Date: Tue, 3 Feb 2026 18:55:32 -0800
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v1] automation: align XTF qemu parameters across
 achitectures
Message-ID: <aYK1JFwsfEpj2W4Q@kraken>
References: <20260202193230.21412-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2602021540100.2599007@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2602021540100.2599007@ubuntu-linux-20-04-desktop>

On Mon, Feb 02, 2026 at 03:40:16PM -0800, Stefano Stabellini wrote:
> On Mon, 1 Feb 2026, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > It is handy to have 2 CPUs and more RAM for smoke testing a hypervisor
> > change via XTF.
> > 
> > Align x86 QEMU configuration with Arm for XTF tests: 2 CPU and 2G of RAM.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Please provide a link to the successful pipeline. With that:

CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2304311308

> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks!

