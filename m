Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A01AC88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 23:56:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422151.1647685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6d0O-0003F4-PZ; Tue, 15 Sep 2026 23:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422151.1647685; Tue, 15 Sep 2026 23:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6d0O-0003Ex-Ml; Tue, 15 Sep 2026 23:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1422151;
 Tue, 15 Sep 2026 23:56:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x6d0O-0003Er-7R
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 23:56:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6d0L-00Dcwv-GU
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 01:56:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa9dac9-e002-0a2a0a5209dd-0a2a4507de56-24
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 01:56:00 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa9db0f-b4ea-0a2a45070019-d561b338b142-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 01:56:00 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x6d02-002gs2-4j; Wed, 16 Sep 2026 01:55:41 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x6d01-0085PP-5B; Wed, 16 Sep 2026 01:55:41 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x6d01-000000029jK-0qGh;
 Wed, 16 Sep 2026 01:55:40 +0200
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
	bh=KcruWwdX0V35F0OFmxXzRLw0Nkd32o9ayTCXiOg/3lc=; b=FYTeW+Jse40BtVnGitDFqVV/fa
	oZNgbPIaWm2VLM7aof8GkquqiOdh+416aGGYzTWdgN7qlYyPdsGzR2/YZOVHZI4ICCGuDixvaU4Nm
	RnbXya4BrDsCDFRnChHv8nWFooZe8qxElaYBYLr9hK1eHu43YfCMV0hQZhO3tDaZuYd99/W3j0XRE
	jkWFBVq8G3gqKDXw4ScVxAhHKQVPRA4nl/Q8+LEz7B0CeujEWyVR9wRPMc1+UCm4G0tJNXbElw02z
	hjgOkRqBE063kOy7EejC80UWwyKCKI47LMCzuYnQjTu3D17U1FcvlbLwhntLa0tmZKOvx59zLl/Qe
	iUFxAqLg==;
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 20:55:40 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 5/5] x86/pvh: fix unbootable VMs by really inlining
 memset() in xen_prepare_pvh()
In-Reply-To: <20260915052646.GIaqjXFkXBkWfvt3tP@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-5-e70ef3b75b6a@igalia.com>
 <20260911043947.GIaqOGE9DFCHWwc6Ys@fat_crate.local>
 <bdd7ad774e121d5621ad64f9c7147e45@igalia.com>
 <20260915052646.GIaqjXFkXBkWfvt3tP@fat_crate.local>
Message-ID: <78399f2346182d7de96343c9ede3da6c@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1789516560-3C610AE4-7CC15D7C/0/0
X-purgate-type: clean
X-purgate-size: 960

On 2026-09-15 02:26, Borislav Petkov wrote:
> On Mon, Sep 14, 2026 at 08:40:38AM -0300, Mauricio Faria de Oliveira wrote:
>> Due to scope and review purposes (4/5 is more generic, 5/5 is specific
>> to PVH). If there's a strong preference to combine these, please just
>> let me know.
> 
> But they sound like they're fixing the same thing:
> 
> "vmlinux no longer boots with CONFIG_PVH if CONFIG_KASAN_GENERIC is set."
> 
> and this one's commit message:
> 
> "This particular one (still) generated the inline implementation as expected
> (at least in these compiler versions)"
> 
> sounds like it is referring to the previous patch. Or I don't know what you
> mean with "these compiler versions"?
> 
> Bottom line: if someone needs to apply both to fix unbootable PVH VMs due to
> mis-inlining of the compiler, then someone can simply apply one and be done
> with it.
> 
> Thx.

Sure, I'll combine these.

Thanks,

-- 
Mauricio

