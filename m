Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED5CC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 17:41:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450969.1666270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHPSI-0000sh-Tp; Thu, 15 Oct 2026 17:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450969.1666270; Thu, 15 Oct 2026 17:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHPSI-0000sa-R6; Thu, 15 Oct 2026 17:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1450969;
 Thu, 15 Oct 2026 17:41:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xHPSH-0000rP-Hc
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 17:41:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHPSH-00000006oJB-29Uj;
 Thu, 15 Oct 2026 17:41:25 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHPSG-0000000DeBz-2AsN;
 Thu, 15 Oct 2026 17:41:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=gDZWlOoDBr+5Z1OlsEHQI+qNCfHIs2r077BENu1ZASs=; b=fqBxhd8ZkUyOI7daYHjhbvf0hc
	1KmbXrJTy7s61SBgCTf1WVnYZaSuU68tEJRpAlYLv7jbLT8CkPY79/jyy56F+mQRq9Ds4UewGTY4l
	OcvIMTrrTggm3WKRPFZaPFG7KjhvjdlXvgNh8mWxYk3irg3o92vxU4mo917bTpeitUus=;
Date: Thu, 15 Oct 2026 19:41:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
Message-ID: <atEQPq2zvmxxEgIY@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>

On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
> @@ -867,7 +1078,7 @@ static int __init pvh_load_kernel(
>          }
>          start_info.modlist_paddr = last_addr;
>          start_info.nr_modules = 1;
> -        last_addr += sizeof(mod);
> +        last_addr += sizeof(*mod);
>      }
>  
>      start_info.magic = XEN_HVM_START_MAGIC_VALUE;

Isn't this still not properly ordered, as start_info address must
strictly be below 4GB (as is passed in a CPU register with the CPU in
32bit mode), yet it is allocated last in pvh_load_kernel()?

Thanks, Roger.

