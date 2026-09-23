Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1BBC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 12:42:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430330.1652819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MIw-00013Z-IL; Wed, 23 Sep 2026 12:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430330.1652819; Wed, 23 Sep 2026 12:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MIw-00013Q-FK; Wed, 23 Sep 2026 12:42:30 +0000
Received: by outflank-mailman (input) for mailman id 1430330;
 Wed, 23 Sep 2026 12:42:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x9MIt-00013K-5u
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:42:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MIr-007njs-6I
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 14:42:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6ab3c91e-e002-0a2a0a5209dd-0a2a4501b06a-46
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 14:42:24 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6ab3c92e-5984-0a2a45010019-d561b3388ce2-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 14:42:23 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x9MIN-0068Yz-Pt; Wed, 23 Sep 2026 14:41:55 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x9MIL-008BYe-T3; Wed, 23 Sep 2026 14:41:55 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x9MIL-00000003yOG-3zlc;
 Wed, 23 Sep 2026 14:41:53 +0200
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
	bh=g9B2VaeeRiExoRvqu5OhmbVwC5+5bS3UNUKe+fIyEUo=; b=I1KHWuoqWH71gb7QuhhwJvbB7B
	stuwG2ZQ1gEXCknmr0LlbVOX2Sn92AHnY67LFjl4iy/+q/PAoC4XAOiuqCyiOhZFAVdqyi2xSjR3D
	CBVRECGZeJ/n6E0w4Uh9sUOTOLGqqr/3Ez5aJx0+1hhC2zl5EuhLOGqz/VM/4WrY83oubYIcfT/RP
	JkNVY53mWlRS1267DJd7Ii5wQAe32cwT1PxBairv9PkIl7HulU9j/PPaYBlCl2s8DKcxJntNvps04
	hSZ3sky0F5+s2o1bX+CsF6E8ovGUdjIcnIWhNL4zm7eD+DZFOObgFdPZpq6dj/Kma7QAR4xks9QHc
	cDSvavpg==;
MIME-Version: 1.0
Date: Wed, 23 Sep 2026 09:41:53 -0300
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
In-Reply-To: <20260923011232.GBarMngDiylzal41XI@fat_crate.local>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
 <20260922035815.GFarH819yHRX8WWnG9@fat_crate.local>
 <3ed7ea3908233ef72660ddfa1f92e914@igalia.com>
 <20260923011232.GBarMngDiylzal41XI@fat_crate.local>
Message-ID: <4d7b03a55ea3d8633828229d3c3c988e@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1790167344-1E07B757-858DF159/0/0
X-purgate-type: clean
X-purgate-size: 1322

On 2026-09-22 22:12, Borislav Petkov wrote:
> On Tue, Sep 22, 2026 at 07:13:35PM -0300, Mauricio Faria de Oliveira wrote:
>> I think that is fine, yes. Even though it's a boot failure, actually
>> hitting it depends on all of: CONFIG_KASAN, CONFIG_PVH, booting from the
>> PVH entry point, _plus_ a compiler version that triggers it.
>> 
>> Nonetheless, this may be picked up for stable due to the Fixes: tags,
>> but I can provide backports as needed.
> 
> Right, just consider all the bandwidth of the folks involved downstream:
> stable team and all distros backporting stuff every day. This sounds like an
> exotic thing so let's be conservative here pls.

Absolutely. I worked for a long time with distro kernels and
backporting. I just mentioned that it is possible for this to be picked
up, and that if it is, then I can help with it if needed; not pushing.
:)

>> BTW, I just realized that the title of patch 4/4 is missing memset().
>> Would you mind adding it, please? Or I can send v11.
>> -x86/cpuid: fix unbootable VMs by really inlining memcmp() in
>> cpuid_base_hypervisor() and xen_prepare_pvh()
>> +x86/cpuid: fix unbootable VMs by really inlining memcmp() and memset()
>> in cpuid_base_hypervisor() and xen_prepare_pvh()
> 
> Sure, np.

Thanks!

> 
> Thx.

-- 
Mauricio

