Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0469606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=P+/CjMWD
Received: from list by lists.xenproject.org with outflank-mailman.1492844.1693099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTLT8-0006pF-9p; Tue, 17 Nov 2026 15:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492844.1693099; Tue, 17 Nov 2026 15:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTLT8-0006p8-78; Tue, 17 Nov 2026 15:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1492844;
 Tue, 17 Nov 2026 15:51:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTLT6-0006p2-Tc
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 15:51:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTLT6-00000002zYE-1gEH;
 Tue, 17 Nov 2026 15:51:36 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTLT6-0000000CxE3-1krl;
 Tue, 17 Nov 2026 15:51:36 +0000
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
	bh=tI7q/WZudb7BZBUftp4iIcuzIl/0RP6Qe/h28mpTnbo=; b=P+/CjMWDrEwJGqOiEZfr8qYCmx
	PG17mWBsm3J3kOOzr5GQ0Lg5ZWTz+Wg4lR+vHLdS9hqMYg/DTYx4xycL4Th7xAQMiVseY/RxBHIap
	O/1eaHVAb1nudstRK2nbf7CwD16an+Nv0TChCvAUibTTFUmZVDSJDZ+Yza3v1WZMss0I=;
Date: Tue, 17 Nov 2026 16:51:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/HVM: off-by-1 in new XEN_DOMCTL_ioport_mapping checks
Message-ID: <avx4Aot4GwbuSWRh@Mac.lan>
References: <16aeb337-d6f3-4f3f-abcf-56fb6340fc6b@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <16aeb337-d6f3-4f3f-abcf-56fb6340fc6b@suse.com>
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 04:41:07PM +0100, Jan Beulich wrote:
> The new checking introduced not so long ago would wrongly reject exactly
> adjacent regions.
> 
> Fixes: fa61af950bb4 ("x86/HVM: more checking for XEN_DOMCTL_ioport_mapping")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, Roger.

