Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820DEE8FDB3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Oct 2023 20:55:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.612370.952287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmPn-0003AJ-Fp; Tue, 03 Oct 2023 20:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612370.952287; Tue, 03 Oct 2023 20:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmPn-0003AC-D4; Tue, 03 Oct 2023 20:54:47 +0000
Received: by outflank-mailman (input) for mailman id 612370;
 Tue, 03 Oct 2023 20:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnmPm-0003A6-7t
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 20:54:46 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14071368-622f-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 22:54:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8F53CE1A23;
 Tue,  3 Oct 2023 20:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7660FC433C8;
 Tue,  3 Oct 2023 20:54:36 +0000 (UTC)
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
X-Inumbo-ID: 14071368-622f-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696366478;
	bh=hATmF6seIpNQiyzKEKQM/RcZTi14zA7ILIDf7vLwd3M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pW5imLTBfkQ7DAhkd0nWutKjzhUc47MSLA03VZ1PCbVn8HtbkWj18tK6GbwKvD/Rc
	 qJpVWEklsLPe8PKvVkyoW1P8D2QFIUd1HAkNtqusANKf9Fcjhecxo9kK51oiDU3aeR
	 5MXGbvubWFE6C6bgVd1drN9RjXdNO1qCFUpu3dO1blg7lz8+Ctbc2xiJ+9VVr4YKYi
	 oThjEB1gpKobuHMZxzD9QKyAj2pu1vIFmpmDGrFKIVAc0+5QAnFr8aXJLIYZS8aS+L
	 1lM6fp0EhxUQ9w3xO/iWWs8yeDPTACeBaIoDeVn6OzhqwLRB9EfC4wy9JOZWLSJ5x/
	 N+lgJFag3JzLw==
Date: Tue, 3 Oct 2023 13:54:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Henry Wang <henry.wang@arm.com>
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310031354260.2348112@ubuntu-linux-20-04-desktop>
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Oct 2023, Federico Serafini wrote:
> Add missing parameter names and make function declarations and definitions
> consistent. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

