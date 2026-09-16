Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C0C88E75
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 00:53:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422191.1647713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6dtU-0004K8-43; Wed, 16 Sep 2026 00:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422191.1647713; Wed, 16 Sep 2026 00:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6dtU-0004K1-1Q; Wed, 16 Sep 2026 00:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1422191;
 Wed, 16 Sep 2026 00:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x6dtS-0004Jv-IZ
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 00:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6dtR-003zlu-1w
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 02:52:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa9e854-8faa-0a2a0a5109dd-0a2a450cdf9c-16
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 02:52:56 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa9e867-f479-0a2a450c0019-d561b338c222-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 02:52:56 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x6dt7-002hsb-93; Wed, 16 Sep 2026 02:52:37 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x6dt6-0088ZL-81; Wed, 16 Sep 2026 02:52:36 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x6dt6-00000002AJn-1CbL;
 Wed, 16 Sep 2026 02:52:36 +0200
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
	bh=71+5XpzCocajiTsiXQeY++69HYCLAtrxNkPLeB+bShA=; b=BbWB8poqLP8OS5CNwejIh0tZCt
	WbwFW81FEfVr5PrfZvomEx1IQF9+zetaBpiX6cr02wx2nv93e5R73XLzotWF5VBcViKnSPQCsJK3s
	I34X4jHK1Lh4JAT9tgjyz9z2qLExHSpfIImNjAmt4HnzFuRcDEVhrz4hCN4ZXO/kUaZrKSe2Dx/cv
	f8F/eM6voT+vU9lSl6KR5fo7bLdFQFk0lra6qJVcyFIzPI26l7UJLOIZAgCGETREp533wvAGFUhVb
	gflVwxkGWo/m8rlZDr+EvRPLMDcX9VOv9CeYVvsNI4dZ9CuKRn3Tg5rTff1FSm7KMD/Wl15OZHHra
	bTD6PZ/g==;
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 21:52:35 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
In-Reply-To: <20260916000432.GDaqndEGBGiL2IUPrG@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
 <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
 <20260915154853.GAaqlo5YxQ9ALlhjbF@fat_crate.local>
 <9086138f2dcaffe30622438b7e825ae7@igalia.com>
 <20260916000432.GDaqndEGBGiL2IUPrG@fat_crate.local>
Message-ID: <6092a255f6fd5ccbc7945b4df0ecc88f@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789519976-766DEA5B-13BDFEB4/0/0
X-purgate-type: clean
X-purgate-size: 1174

On 2026-09-15 21:04, Borislav Petkov wrote:
> On Tue, Sep 15, 2026 at 08:49:27PM -0300, Mauricio Faria de Oliveira wrote:
>> IMO a fix in the source file is clearer, less obfuscated than in a
>> Makefile (and the source file has to be changed anyway).
> 
> No, with the build option you only need to touch the Makefile which contains
> the build directives for the objects which contain hypervisor_cpuid_base() and
> xen_prepare_pvh().

IIUIC, the source file would also be touched for changing
__builtin_memcmp() into the open-coded comparison suggested earlier, no?
(the 3x u32-based comparisons.) And that is the code which would require
-fno-builtin-memcmp in a Makefile.

>> It also has the potential advantage that, if the Makefile change slips in
>> a future change/refactor, the issue shouldn't reappear.
> 
> Yes, that is possible.
> 
>> Either way, please let me know and I can certainly change the patch.
> 
> Ok, let's do the explicit thing - the difference between the solutions is not
> that earth-shattering.

Ok, I think this closes the feedback and discussion so far; I'll send
v10.

Thanks again,

> 
> Thx.

-- 
Mauricio

