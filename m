Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4FEC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 21:15:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350934.1608311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2H4-0006fa-0c; Wed, 01 Jul 2026 21:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350934.1608311; Wed, 01 Jul 2026 21:15:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2H3-0006fT-UC; Wed, 01 Jul 2026 21:15:13 +0000
Received: by outflank-mailman (input) for mailman id 1350934;
 Wed, 01 Jul 2026 21:15:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wf2H2-0006dn-Ay
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:15:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf2H1-00Byh5-K2
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 23:15:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a4582f2-5cb7-0a2a0a5109dd-0a2a45039ff6-44
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:15:11 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a45835f-ec1a-0a2a45030019-416d716caef4-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:15:11 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 70AA240E00C0; 
 Wed,  1 Jul 2026 21:15:10 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fbVmubCe1ObW; Wed,  1 Jul 2026 21:15:00 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C9DD140E0140;
 Wed,  1 Jul 2026 21:14:47 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782940500; bh=AP9t8vC+xALil2fXjdkfM+2rrb7oKrVXHkgSICn34hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrbfaOTBZHoHJ1+2gwxFQDPcXTG3kl01IxHgjkSSEEc/KUYMyUfqOwZImCZZNHdHx
	 zxtZQkFrPz6/wBLeglc8vC4JFYqhK5itMxOR2Hz07svKN5DUDzjpzTq6lSyu7PMpg6
	 J0xHizV2IK6aDQff9T25xdyZbqLrGz97nxH3DoAqYS8cu6KbayS6fd7uX34anV/JH6
	 kStB7xY/XN0omASukknYBmF8GhOt3yAxT9R7wP0khVC8sdJq/WanITt1kqKDNavwoS
	 po7RwS1s1alOm3PkUkd4bsLTwTcjgr+zw7dXNKAlndXa1NQ0ZgtBdT+3eY2pMc3poU
	 gXhF9G9u0Xinm42MK80mx8+uqnB0vOUh5+4Pd2wbCGxIrummuFeSHmoQEpDTKR92ua
	 /QQohisLTCCpL2MOyD8776HknTCWg3jcL916cb13G57enf67OFawWdt09jwZUGz8pF
	 1GMT+iSc7cHt2jl1SCf2jdbAnHZv4zRkKeLrHZgdhgTnThaYnkx1FJjUz/+TthAwNM
	 6Um+6HfAQ8mpeUGokLdYUkE0RjViVmZACbPAqrz868OJ65PMa4hyeZ9eTAbdaBjAta
	 N+zYclQVyoZY8A9d7Q/CALnydIrZsO4oSAOI5dd5eneHWahpPSDYGyEzchcx80Jf0p
	 G5ZX8pFv9FoaWJRurr18e5/o=
Date: Wed, 1 Jul 2026 14:14:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
Message-ID: <20260701211444.GEakWDRI0LY5o5GGM7@fat_crate.local>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
 <20260701184014.GDakVfDhIgaIKurzTb@fat_crate.local>
 <fed9dc5860b96063c06592080f957589@igalia.com>
 <ccdc4d450a8683991f53038cde393597@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ccdc4d450a8683991f53038cde393597@igalia.com>
X-purgate-ID: tlsNG-33051d/1782940511-B692D5D1-3E8840FF/0/0
X-purgate-type: clean
X-purgate-size: 263

On Wed, Jul 01, 2026 at 05:03:04PM -0300, Mauricio Faria de Oliveira wrote:
> That would discard the credit attribution when applied, AFAIK. So,

Read my reply again.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

