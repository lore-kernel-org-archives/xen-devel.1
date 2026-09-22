Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0158C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 22:14:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429513.1652342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x98kg-0006X7-Sb; Tue, 22 Sep 2026 22:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429513.1652342; Tue, 22 Sep 2026 22:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x98kg-0006X0-Od; Tue, 22 Sep 2026 22:14:14 +0000
Received: by outflank-mailman (input) for mailman id 1429513;
 Tue, 22 Sep 2026 22:14:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x98ke-0006Wu-DY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 22:14:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x98ka-0048qu-Fl
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 00:14:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6ab2fd88-2eae-0a2a0a5409dd-0a2a4504c0fc-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 00:14:07 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6ab2fdae-b57f-0a2a45040019-d561b338d092-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 00:14:06 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x98k4-005qrI-QL; Wed, 23 Sep 2026 00:13:36 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x98k3-007Hg8-LC; Wed, 23 Sep 2026 00:13:36 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x98k3-00000003pWQ-2v5j;
 Wed, 23 Sep 2026 00:13:35 +0200
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
	bh=QrSu8YGOsu2E9jgIjM8USyvJdljVhVLowKN8872lW1E=; b=DtRscbnaZHf4PSBLM2a5VVIE+r
	ap7ZAz4U5sN/ScaRvrzsqpXlYbFfFlBfaJVzgGX9APtb3XHxiRuS6Ab4zpJ+ps1JO93pKQn3tsNS2
	9YDX0uh5LIo//Vb9bSlwrPPMIrx6EoPSKPIWctZSLYHuASjT0RIBhzEVAYIuP4rsDEzLNkEmoLfku
	paInSpSfda95+QQUSHTnU+uRbIZxlF2J1kLW321YhpPNUeMHo+7zvPUV7twbPpq3ScB3mvMWIPGWm
	wU5WxR0JebnjBOM08fiyiacE43HGRqwq61uL2yiHHJSGHpBTWOiOBAiKqYBinXUIytlmMZOy6At+k
	uwEEPSjA==;
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 19:13:35 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v10 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
 <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
Message-ID: <3ed7ea3908233ef72660ddfa1f92e914@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1790115247-C3CC7B50-A5CCF11B/0/0
X-purgate-type: clean
X-purgate-size: 2198

On 2026-09-22 00:58, Borislav Petkov wrote:
> On Mon, Sep 21, 2026 at 10:36:31PM -0300, Mauricio Faria de Oliveira wrote:
>> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
>> 
>> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
>> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.
>> 
>> The PVH code is required/supposed not to use the KASAN memory access check
>> in the kernel entry point as KASAN has not yet been setup, or an exception
>> is hit and the boot fails.
>> 
>> This was previously described and addressed with __builtin_mem{cmp,set}():
>> - commit 661362e3dcab ("xen, pvh: fix unbootable VMs (PVH + KASAN - AMD_MEM_ENCRYPT)")
>> - commit 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
>> - commit fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
>> 
>> However, even with __builtin the compiler may decide to use the out of line
>> function instead of the inline implementation. So, that does not really fix
>> the issue unconditionally; see details below.
> 
> So, this whole deal doesn't sound to me like we need to backport it to stable
> - it rather looks more like fixing some configs which want to enable KASAN on
> PVH guests.
> 
> In that case, I'll queue this for 7.4.
> 
> If this needs to go to stable, then there better be a pretty good reason for
> it.
> 
> Right?

I think that is fine, yes. Even though it's a boot failure, actually
hitting it depends on all of: CONFIG_KASAN, CONFIG_PVH, booting from the
PVH entry point, _plus_ a compiler version that triggers it.

Nonetheless, this may be picked up for stable due to the Fixes: tags,
but I can provide backports as needed.

BTW, I just realized that the title of patch 4/4 is missing memset().
Would you mind adding it, please? Or I can send v11.
-x86/cpuid: fix unbootable VMs by really inlining memcmp() in
cpuid_base_hypervisor() and xen_prepare_pvh()
+x86/cpuid: fix unbootable VMs by really inlining memcmp() and memset()
in cpuid_base_hypervisor() and xen_prepare_pvh()

Thanks,

-- 
Mauricio

