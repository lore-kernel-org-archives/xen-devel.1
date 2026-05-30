Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7190DCD4F54
	for <xen-devel@archiver.kernel.org>; Sat, 30 May 2026 23:02:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1323206.1589080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTShA-0005NC-VD; Sat, 30 May 2026 23:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323206.1589080; Sat, 30 May 2026 23:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTShA-0005N4-S4; Sat, 30 May 2026 23:02:20 +0000
Received: by outflank-mailman (input) for mailman id 1323206;
 Sat, 30 May 2026 23:02:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wTSh8-0005Mv-DQ
 for xen-devel@lists.xenproject.org; Sat, 30 May 2026 23:02:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTSh7-008Bxe-Qc
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 01:02:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b6c64-bab6-0a2a0a5309dd-0a2a4508a8e4-22
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:02:17 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a1b6c78-63b5-0a2a45080019-d561b338bfe2-3
 for <xen-devel@lists.xenproject.org>; Sun, 31 May 2026 01:02:17 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wTSgc-00AOsE-EC; Sun, 31 May 2026 01:01:46 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wTSga-003sTq-Bu; Sun, 31 May 2026 01:01:46 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wTSgZ-00000005bzp-2pEg;
 Sun, 31 May 2026 01:01:44 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vq4azo/c2He5mOtc4mZYmsILjl/XtYZgVfnCKXgdyY0=; b=LkWZnEv22LlTLcY6fmLKiROp56
	OWvZ1LNFPJZ5PLPaVZr+ELjr+H/RPlglV0ipAwBNPcCX5K374jR3j5WZ8NZw2WcAvfyHHpZ2erGJi
	gaQ87bO7GKqJ8MMQ0jUWvlIu9vfxAs3upgeze4TvcMo8dXI01vzR7/uPZK0ZuQs7L6z5ztDs7SELn
	unogvVuaNurnticDWF2Fugy5lvZFpUaKVRkBYQa991rBD6hkZc8a6E/mWtlA5jTaCGw09k+lDx21/
	EKDQ/eCN/0RvJ+AzjTg2pUshmAH8Ur4Hs2eRPIjUfd0HlJJxoozymXKKB11A6K4Vb4GYivbEhKDll
	Cd05Gn/g==;
MIME-Version: 1.0
Date: Sat, 30 May 2026 20:01:44 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260530220453.GAahtfBVv2hydidbnW@fat_crate.local>
References: <20260526-pvh-kasan-inline-v4-0-a310e6a25ecd@igalia.com>
 <20260527204736.GBahdYaKk6kAkIUYE3@fat_crate.local>
 <274609541a0c7c6b49b386001967dd2b@igalia.com>
 <20260530220453.GAahtfBVv2hydidbnW@fat_crate.local>
Message-ID: <7f1af7169b4f8c90abae28cebd3e377f@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780182137-BEB74DB1-C41E2E8D/0/0
X-purgate-type: clean
X-purgate-size: 1100

On 2026-05-30 19:04, Borislav Petkov wrote:
> On Sat, May 30, 2026 at 03:25:25PM -0300, Mauricio Faria de Oliveira wrote:
>> In this instance, the use case is to speed up the dev-test cycle when
>> debugging on VMs: PVH allows booting directly from vmlinux, avoiding the
>> need to build/compress and decompress bzImage, while KASAN helps detect
>> issues early.
> 
> Makes sense in itself. And you can't do your use case with KVM? It has to be
> Xen?

It uses KVM, actually. 

IIUIC, the PVH entry point was originally developed for Xen, but later
QEMU support was added for KVM as well.
(found this blog post [1] with a nice summary and links about it.)

>> Briefly, this is a side effect of reusing code from 'boot/string.c'
>> through <asm/string.h>, which introduces additional complications;
>> please see patch 1 for details.
>> 
>> These complications could be avoided by not reusing that code and
>> instead adding slightly duplicated code [1] directly to <asm/string.h>,
>> if that is preferred.
> 
> I'll take a look.

Ok, thanks!

> 
> Thx.

-- 
Mauricio

