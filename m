Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E20C624D4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 00:07:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406316.1639668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1uzX-0000UD-Qk; Thu, 03 Sep 2026 00:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406316.1639668; Thu, 03 Sep 2026 00:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1uzX-0000U6-MN; Thu, 03 Sep 2026 00:07:43 +0000
Received: by outflank-mailman (input) for mailman id 1406316;
 Thu, 03 Sep 2026 00:07:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x1uzV-0000U0-Jt
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 00:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1uzV-00GcxU-0f
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 02:07:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a98ba4a-2eae-0a2a0a5409dd-0a2a4506cebe-2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:07:39 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a98ba4a-195a-0a2a45060019-d561b3388a56-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:07:39 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x1uyy-00E6IP-4K; Thu, 03 Sep 2026 02:07:08 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x1uyx-00GOWm-B9; Thu, 03 Sep 2026 02:07:07 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x1uyx-00000005maZ-18xr;
 Thu, 03 Sep 2026 02:07:07 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=cmQEOzLtOK6G3QHIoxlsUO75VfltJ8r34O3qt0LsBwY=; b=Lu3R+Nwe9xNhYiSqjlmIy8VM9n
	xs/JIFHFwMmogdq8SHa/t4oYuVLRDGBgqGYD3CQZAwTMLrDJ50qyUhwkYM/DZ65eoGb2l2LsBHkM0
	dzwK/TXD62oc9glyRER/Q+xxq94qpiLXRNYPSdrYZrmTjQJqCUd0M7DfgkuQLm7aujBmYjaRpGq8z
	eoNAu9gyzQyZ3Jve18b1Ro9whdIdsjptohjZDExoYwt26cC7D+a8qkW9YQby5hynDWRbtvSzxJ93I
	6+dPTx4cxi3Yyajjto+3pJFXeYB9RjyDxolksiSMZO83tKSP7+V0PBomwu0DTaCP+na2cib84j3Qx
	QvlH8vFw==;
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 21:07:07 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Michael Matz <matz@suse.de>, Richard Biener <rguenther@suse.de>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
In-Reply-To: <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
 <05896397667d66a2969259298bcebb7f@igalia.com>
 <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
Message-ID: <c9dd5e5de8484285b71ae62b98610911@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788394059-FCC0777B-40B7EAF7/0/0
X-purgate-type: clean
X-purgate-size: 804

On 2026-09-02 21:01, Borislav Petkov wrote:
> On Wed, Sep 02, 2026 at 10:48:14AM -0300, Mauricio Faria de Oliveira wrote:
>> Boris, I guess this may be added as clarification in the commit message.
>> Would you prefer another version with it?
> 
> Yeah, I'd actually prefer it in the code itself so that we can find it easier.
> This file is as good as any.
> 
> Something like this:
> 
> /*
>  * Summarized explanation that "cc" clobbers don't have a meaning
>  *
>  */
>  
> and leave the "cc" clobber there but commented out:
> 
>  /* "cc" ... */
> 
> so that we can grep for it easier later.
> 
> Thanks!

Sure, will do in the next version.

The rest of this series is OK to you?
I can wait for further feedback and combine it with this change.

Thanks!

-- 
Mauricio

