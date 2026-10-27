Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7763606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ZFbGjFGs
Received: from list by lists.xenproject.org with outflank-mailman.1462212.1673251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhqg-0002y9-ND; Tue, 27 Oct 2026 14:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462212.1673251; Tue, 27 Oct 2026 14:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLhqg-0002y2-Kh; Tue, 27 Oct 2026 14:08:22 +0000
Received: by outflank-mailman (input) for mailman id 1462212;
 Tue, 27 Oct 2026 14:08:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xLhqf-0002xw-KA
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 14:08:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xLhqf-0000000GREW-2D3G;
 Tue, 27 Oct 2026 14:08:21 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xLhqf-000000031qU-0ZSF;
 Tue, 27 Oct 2026 14:08:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=/IFxrvO/QyB13axdXdeqAsYL0qIlyGHknuq2EgtFIPk=; b=ZFbGjFGse6I3+0SvE74nvag96W
	uj/+FvwldTVNuEZlXYLXlfeSso+e8QEZ8p7A0hwanD7qKWAZd7coileStsba1PqhHHXkOu/KRMHqH
	smJI6aJHm0qHegXuKV9h8Jj8qlTG9ux8aAuF3SCHdDiVlXZsDZvZ+y2mmMgBDtAlg5xw=;
Date: Tue, 27 Oct 2026 15:08:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/kexec: Annotate more noreturns
Message-ID: <auCwUpu3MhZHj1QZ@Mac.lan>
References: <20261006105445.511099-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006105445.511099-1-andrew.cooper3@citrix.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 06, 2026 at 11:54:45AM +0100, Andrew Cooper wrote:
> kexec_reloc() does not return.  Plumbing this property upwards lets us mark
> machine_kexec() and machine_reboot_kexec() noreturn too.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

