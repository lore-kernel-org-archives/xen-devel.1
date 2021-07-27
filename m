Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73F7C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 10:18:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9196E615A6
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 10:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9196E615A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161104.295809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8KA9-0000Rf-33; Tue, 27 Jul 2021 10:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161104.295809; Tue, 27 Jul 2021 10:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8KA8-0000RY-Va; Tue, 27 Jul 2021 10:18:12 +0000
Received: by outflank-mailman (input) for mailman id 161104;
 Tue, 27 Jul 2021 10:18:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o+S4=MT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m8KA7-0000Qa-9I
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 10:18:11 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efb02432-eec3-11eb-96e0-12813bfff9fa;
 Tue, 27 Jul 2021 10:18:07 +0000 (UTC)
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
X-Inumbo-ID: efb02432-eec3-11eb-96e0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627381087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVJnfAaShrFRUk1Bx1Xy/Im8Ddw3Fq7DeH5JNkApbwo=;
  b=PCNCjYjjY1XbBgfndbPIjh+xldUSqtOxy+dhvpKCqgCeQRnRi3KtPZdJ
   I+MdexBVPpwD78dZ41ATuIJ10rAG6QiPl9akfd75zGO3TGYE/2wxOpuPx
   DRXSaRfy/73C+vJ+o+/donuAuVviFnDpSaeYw3kK1xogDcU3bK1D1TVy3
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7D07wCVF/g+gifeQPuBoUFHFA4ixGUtUcxcCPRq82f8b9WO6pSq+Ec/Qbyc8fB1wu7ANuN6p2h
 4b8U9IQ7imKLEvN3qJjSdVY5qml1yGuUapYXUh8KcllMSbR9WGN3I/DdJsiEKignTafWQIMC6+
 cdz68e3MsajoSWEDjd784iUFAAVIAwSDtAUs9bvA3vbFjuBSRjXowdoGg4aFf+fiv+p3IW7BS+
 heIR42rI1C6RAsXPWcnSQ6RINHLJ7Ku3Mgq3gb3z6y6yNquIFV6/x4TBvzUL5LbQCw69+3KrMH
 usayzfugOxG9LfiWYGdJTaqX
X-SBRS: 5.1
X-MesageID: 49166899
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qQcOm6moePqokcJ0lvg1nkYLwFHpDfNeiWdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdS9qADnhOJICOgqTPmftWzd0gqVxe5ZnPLfKlHbak/DH6tmpN
 1dmstFeZzN5DpB/L7HCWCDer5Krbn3k5xAx92utEuFJjsaD52Imj0JbDpzZXcGIzWua6BJca
 a0145inX6NaH4XZsO0Cj0uRO7YveDGk5rgfFovGwMnwBPmt0Lq1JfKVzyjmjsOWTJGxrkvtU
 LflRbi26mlu/anjjfBym7o6YhMkteJ8KoAOCXMsLlRFtzfsHfuWG1TYczFgNnzmpD31L8eqq
 iJn/7nBbUq15qeRBDvnfKn4Xie7N9n0Q6d9bbfuwqineXJAAsgDcxPnIRYdQacxXYBkbhHof
 929lPcjoFQCxzYmiT7+pzvbDFF0mSJgVdKq59Is5R4ObFuN4O5abZvoH+9Wa1wbB4T5O0cYZ
 hTJdCZ6/BMfVyAaXfF+mFp3dy3R3w2WgyLW04Yp6WuonJrdV1CvgMlLfYk7zw9HVMGOu15zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCYhv22tLKyaRw4PvvdI0DzZM0lp
 iEWFREtXQqc0arDcGVxpVE/h3EXW34VzXwzcNV4YR/p9THNffWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umNmfqEZYh5Xy2Z3CTEwhpbCQxgKd1Z7ujmLO4FmTajJ2tTB+IHsufLd8NYBKLPk
 c+
X-IronPort-AV: E=Sophos;i="5.84,273,1620705600"; 
   d="scan'208";a="49166899"
Date: Tue, 27 Jul 2021 11:18:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Alan Robinson <Alan.Robinson@fujitsu.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libxl: add missing blank in message
Message-ID: <YP/dW2trNx1camFQ@perard>
References: <20210727074703.19865-1-Alan.Robinson@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210727074703.19865-1-Alan.Robinson@fujitsu.com>

On Tue, Jul 27, 2021 at 09:47:03AM +0200, Alan Robinson wrote:
> Add missing blank giving "an emulation" instead of "anemulation"
> while making the text a single source line.
> 
> Signed-off-by: Alan Robinson <alan.robinson@fujitsu.com>
> ---
> 
> Changed since v1:
>   * text as as single line, requested by Juergen
> 

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

