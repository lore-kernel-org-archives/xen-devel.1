Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B37EC4167B
	for <xen-devel@archiver.kernel.org>; Fri,  1 Dec 2023 02:56:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.645244.1007294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8th0-0001t6-V0; Fri, 01 Dec 2023 02:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645244.1007294; Fri, 01 Dec 2023 02:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8th0-0001sz-Qo; Fri, 01 Dec 2023 02:55:50 +0000
Received: by outflank-mailman (input) for mailman id 645244;
 Fri, 01 Dec 2023 02:55:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8tgz-0001sq-1s
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:55:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2083826e-8ff5-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:55:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 84033B846BF;
 Fri,  1 Dec 2023 02:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C8BC433C8;
 Fri,  1 Dec 2023 02:55:44 +0000 (UTC)
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
X-Inumbo-ID: 2083826e-8ff5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701399345;
	bh=1Zt3Jb2AfeF5d2jjOuG3cQuWM6wKZyAx3qC1sWbmYE4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fkPgdM04Kcchcd1eP4P67gPibAnyBr1XoP9+SwtxQlnByvaoJqiAhR3LFwZAPiraV
	 4FmRLBw531E1XJGbHW+iDOsErzSEomYM4hA/qOBPKoQdiDrhDZou8MQV0ttIKKp2hh
	 rkduq+iEBnUaQ5DeZVMehJ2qA003xZ2sDP1U8DDpn44uNW8UA3GvwXL7Vv4DFkt/3U
	 y895xR5o1iKQNEF3JQaejwihKjVz+b7T+qbf5H/lNsjh7SZBACj0GgyhFCpXj4YR4D
	 o1m4xGa9q8h34mCt2IxggkVkvSuCa1lqO/GUBMwqbYu6eBLh67DsPK72aG5txLdHSi
	 beEpm+NEnRpwg==
Date: Thu, 30 Nov 2023 18:55:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012
 Rule 5.6
In-Reply-To: <4a3bad7cb0a652207b9f86ded3ce3897a7c37f3d.1701246412.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311301855280.110490@ubuntu-linux-20-04-desktop>
References: <4a3bad7cb0a652207b9f86ded3ce3897a7c37f3d.1701246412.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Nov 2023, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the adopted files
> and type "ret_t".
> Update docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


