Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2881BC4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 15:59:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367955.1617613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCs5-0006tQ-K8; Tue, 21 Jul 2026 15:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367955.1617613; Tue, 21 Jul 2026 15:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmCs5-0006tJ-Gv; Tue, 21 Jul 2026 15:59:05 +0000
Received: by outflank-mailman (input) for mailman id 1367955;
 Tue, 21 Jul 2026 15:59:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wmCs3-0006sY-Rf
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:59:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmCs3-00FUzT-7r
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 17:59:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f9716-5cb7-0a2a0a5109dd-0a2a4509d204-40
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:59:03 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a5f9746-be1a-0a2a45090019-d561b3388444-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 17:59:03 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wmCrn-001fvR-Is; Tue, 21 Jul 2026 17:58:47 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wmCrl-00G837-8e; Tue, 21 Jul 2026 17:58:47 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wmCrl-00000002Lef-0CG5;
 Tue, 21 Jul 2026 17:58:45 +0200
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
	bh=45Y0uuOLwXEQQWIgRHeQpvMWLQJKf0POYE3HeWycPKo=; b=j84dzjs+5ek335EePArwbOlKsq
	8A/vY2/5wLzzrIylsp9UXvipe+VSinhKyDbjMJldoYKAr3WdaEAcnxBUGQIvfuRzS1UBUXQ8eczG1
	09hJl/gvbxH7rHaFFJtkcb+1kWLtEPbclEwJ2GoX0CWznHCuQYSnCeQoDPnMWWuz2LtQyZ5K/sGPH
	LT4w7m2RCXZpUbFWGkQii1zjnXEyGxSeA9Vgr2xtkIOmUL8wBUDnTEYFp1jI/FfU9OzcgIDOkZGMi
	aIvYYuQPyyinTxW802So7tCUZl3fqasn6IMMQWxDbMHKtGLJ9CYfqs3B4Q2EKmcksutGZqkCzz68Y
	eoCAYWLA==;
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 12:58:45 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260718150230.GAaluVhlozNI__9IsA@fat_crate.local>
References: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
 <20260718150230.GAaluVhlozNI__9IsA@fat_crate.local>
Message-ID: <83f4af183354a1cfa67a5ebad092275c@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1784649543-BD4C3034-05A370B8/0/0
X-purgate-type: clean
X-purgate-size: 560

On 2026-07-18 12:02, Borislav Petkov wrote:
> On Wed, Jul 01, 2026 at 08:13:49PM -0300, Mauricio Faria de Oliveira wrote:
>> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> They look like preexisting issues but we probably should take care of them
> before we go forward:
> 
> https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com
> 
> Thx.

Thanks for mentioning. Please see v7:

https://lore.kernel.org/all/20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com/

-- 
Mauricio

