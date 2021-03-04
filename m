Return-Path: <SRS0=L0Gu=IC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A630C433DB
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 13:00:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0574364EF9
	for <xen-devel@archiver.kernel.org>; Thu,  4 Mar 2021 13:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0574364EF9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93243.175984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnaS-0005xS-OR; Thu, 04 Mar 2021 13:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93243.175984; Thu, 04 Mar 2021 13:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnaS-0005xL-Kd; Thu, 04 Mar 2021 13:00:16 +0000
Received: by outflank-mailman (input) for mailman id 93243;
 Thu, 04 Mar 2021 13:00:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnaQ-0005xG-U1
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:00:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnaQ-00030t-Qe
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:00:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnaQ-0005kI-O0
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:00:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHnaN-0005GY-CI; Thu, 04 Mar 2021 13:00:11 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=K7KXHwp6Sl8MAn+0wEKK+surykuLXrrgxgWCvRMSCXU=; b=5sYAyCAu/yVd1IxnvG23jB+vAN
	56jqtuGU3++RPs0EOO1QXqqJ/5+qakUmmJOsIH5EgCsuiEkvBV6AZsgVtxFP51ni94XiSf2mu9iQL
	fVVr/8Mwx3IBFG0wycsIjROG5mDWIbiROXRJeC9G+8+C7sAOych21Srh84gYaLUoopgw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.55771.89150.389969@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 13:00:11 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11
In-Reply-To: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
> Clearly neither the 1st nor the 2nd argument have a "source size" of 0.
> 
> --- a/xen/include/crypto/rijndael.h
> +++ b/xen/include/crypto/rijndael.h
> @@ -52,7 +52,7 @@
>  
>  int	rijndaelKeySetupEnc(unsigned int [], const unsigned char [], int);
>  int	rijndaelKeySetupDec(unsigned int [], const unsigned char [], int);
> -void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
> -	    unsigned char []);
> +void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [16],
> +	    unsigned char [16]);
>  
>  #endif /* __RIJNDAEL_H */

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

