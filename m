Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6ABC00145
	for <xen-devel@archiver.kernel.org>; Mon, 12 Dec 2022 14:46:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.459687.717443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4k4S-00033S-AV; Mon, 12 Dec 2022 14:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459687.717443; Mon, 12 Dec 2022 14:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4k4S-00033L-7O; Mon, 12 Dec 2022 14:46:20 +0000
Received: by outflank-mailman (input) for mailman id 459687;
 Mon, 12 Dec 2022 14:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKCz=4K=chiark.greenend.org.uk=ijackson@srs-se1.protection.inumbo.net>)
 id 1p4k4Q-00033F-8z
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 14:46:19 +0000
Received: from chiark.greenend.org.uk (v6.chiark.greenend.org.uk
 [2001:ba8:1e3::]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9951707-7a2b-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 15:46:16 +0100 (CET)
Received: by chiark.greenend.org.uk (Debian Exim 4.94.2 #2) with local
 (return-path ijackson@chiark.greenend.org.uk)
 id 1p4k4K-0006B5-6L; Mon, 12 Dec 2022 14:46:12 +0000
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
X-Inumbo-ID: b9951707-7a2b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=chiark.greenend.org.uk; s=k.chiark; h=DKIM-Signature-Warning:References:
	In-Reply-To:Subject:Cc:To:Date:Message-ID:Content-Transfer-Encoding:
	Content-Type:MIME-Version:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=AqKxL0fz/H3i4/h6pIR4jD0697WXLyn0NOyLgGfnvew=; b=trRBY0Wn4FKV
	zu35UdbjsP70fKXhsO0M5qRSUIHEtMF0x/L5jzHjH/bXxEKIA8+yyXroCKjJ3WRJXBWpBoTPZF0RG
	PerYInnytxa+sZTEvBalzOMNwk1cpQlIsveTEKqI18FC+Yy81CgjMos5Kh/1WVhO2ai8VZGizaimg
	FnZEfyVaqXtOg6jWsnUfQn3pDN551uXf5O2qpe4lSAGmqr3VZOUMA8B+XuVcb5/pJFWnLzUPEtKvW
	XkMcNK+1KGgKUsRilZv2wV97r7MMz/E/cMbRUtcK/Um8sWpxjsgfq284yN4uJQ/LG8VtY2f5MN0RI
	wq+OXWMfrItWU/K4T5cGew==;
From: Ian Jackson <ijackson@chiark.greenend.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <25495.16052.112087.389313@chiark.greenend.org.uk>
Date: Mon, 12 Dec 2022 14:46:12 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Henry.Wang@arm.com,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] docs/process: branching-checklist: Remove reference to qemu-ijw.git
In-Reply-To: <20221212093410.36289-3-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
	<20221212093410.36289-3-julien@xen.org>
X-Mailer: VM 8.2.0b under 27.1 (x86_64-pc-linux-gnu)
DKIM-Signature-Warning: NOTE REGARDING DKIM KEY COMPROMISE https://www.chiark.greenend.org.uk/dkim-rotate/README.txt https://www.chiark.greenend.org.uk/dkim-rotate/69/69de71400e85a925fa916fcd59931eae.pem

Julien Grall writes ("[PATCH 2/8] docs/process: branching-checklist: Remove reference to qemu-ijw.git"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Per [1], qemu-iwj.git was a clone of QEMU traditional on Ian's computer
> for tagging QEMU trad.
> 
> The next section will provide tag for the official tree. So remove
> the section about qemu-ijw.git.
> 
> [1] 25482.10006.140155.984629@chiark.greenend.org.uk
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Cc: ijackson@chiark.greenend.org.uk

Acked-by: Ian Jackson <ijackson@chiark.greenend.org.uk>

Ian.

