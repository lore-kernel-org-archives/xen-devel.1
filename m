Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F42FEE6B6C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Feb 2026 23:30:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1224016.1531337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voVHf-0007Rz-83; Fri, 06 Feb 2026 23:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224016.1531337; Fri, 06 Feb 2026 23:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voVHf-0007Rs-51; Fri, 06 Feb 2026 23:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1224016;
 Fri, 06 Feb 2026 23:30:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUBK=AK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1voVHd-000784-Sd
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 23:30:41 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d63eecff-03b3-11f1-9ccf-f158ae23cfc8;
 Sat, 07 Feb 2026 00:30:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B414B43EB5;
 Fri,  6 Feb 2026 23:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7968C116C6;
 Fri,  6 Feb 2026 23:30:33 +0000 (UTC)
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
X-Inumbo-ID: d63eecff-03b3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770420634;
	bh=YsE+k9TlfdyetO8KrAuHXjK9Y9/SBHHvYyZvePNvB80=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hzQaETGERC9281HaC24TPuPbXH7cS0rR8h75emTYyIWvOnUqMxLxNcC6hkStuYf+f
	 2Lalt5fME6UxWb1sAIcVOI3n16CMcvq/nDogYv0zSf/e9jx4hxwXlB3lSfb1ox6+Vr
	 9lsz432oKhxKWjCh/5dLZe2RKTww5jJ5Sn8W7vPcT0z69QxU7ZpMoXstJlIS1jzdpf
	 WbE5xNUFEuVPI7LA+68l5tq/1WoLM+WzCjMr8tYDnVXQmvLTU1ZQ7X9ELZv+cNlINr
	 q3W5faaGE9kJZqf7zlnoiHWFLbVuWz4zt3rFHK+mh1L8b0y0PTv4FQbLbW0QroWKD3
	 fAkmyyBoVmWNQ==
Date: Fri, 6 Feb 2026 15:30:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com
Subject: Re: [PATCH] x86/cpufreq: Add Kconfig option for CPU frequency
 scaling
In-Reply-To: <9aef904b-348b-45e9-be44-afaea6d3eb3a@amd.com>
Message-ID: <alpine.DEB.2.22.394.2602061530170.3668128@ubuntu-linux-20-04-desktop>
References: <20260206013222.4081160-1-stefano.stabellini@amd.com> <9aef904b-348b-45e9-be44-afaea6d3eb3a@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Feb 2026, Jason Andryuk wrote:
> On 2026-02-05 20:32, Stefano Stabellini wrote:
> > Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
> > disabled at build time. When disabled, this removes cpufreq code
> > from the build.
> > 
> > Add stubs where necessary.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Actually I missed a couple of stubs, I had to send a v2

