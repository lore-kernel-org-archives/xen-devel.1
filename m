Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D298CC4451C
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 15:03:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365599.1615913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl6ZN-00059x-08; Sat, 18 Jul 2026 15:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365599.1615913; Sat, 18 Jul 2026 15:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wl6ZM-00059p-SL; Sat, 18 Jul 2026 15:03:12 +0000
Received: by outflank-mailman (input) for mailman id 1365599;
 Sat, 18 Jul 2026 15:03:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wl6ZK-00059j-Qy
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 15:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wl6ZJ-00CIpl-Q6
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 17:03:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a5b9575-e002-0a2a0a5209dd-0a2a4504a5d2-44
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 17:03:09 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a5b95ad-b57f-0a2a45040019-416d716ce216-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 17:03:09 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A296640E0031; 
 Sat, 18 Jul 2026 15:03:08 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OqvEu6YOatb8; Sat, 18 Jul 2026 15:02:59 +0000 (UTC)
Received: from stx.tnic (unknown [12.110.208.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7451E40E014C;
 Sat, 18 Jul 2026 15:02:44 +0000 (UTC)
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
	t=1784386977; bh=nrTmjZru6ivCvZPolbK5Vi6eI2c0QzSoBtiB5NIfmjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoveRoPW/vmFtq9F9srxFRyQ+zQGzwMiB5pHwNYwxYlxkRc5Vld7h04YavTReDQzd
	 2XVXOla2bedIAPPRauk9N73eI8FJtGhQOJfEKTJSAlJGujFpWBG/3VhGDQ1Nuv/hji
	 WwKCvPij5/hKiIpCWRkwohgzOKVv2v81xoLukg01y7N7ujU/kDAPKp7i9dVzoCEwCb
	 BCPzhK9/lMrBqeiKSwWHCckXsjZMKz3JW19PldbHxpLAoPqQP11jt5eRCcUPuctawb
	 /ZRuUPEwC1N42RHJ3y/9B5hpe72WV0akaA0YBCPrpCJadpowSDF/n0OOBJOhQ5PVV/
	 8csDHw6/aqsGyj1EUqJMZJXWg0NtNUyLpzXRF52YoEK5B/zknObgdc/cY2WXxn/PCe
	 GHf0vjKryHRZRsPHlaV4qQddbfjPBlNHhWCz3eQyz2OfnulMfSNxx9jI2aE5YcXBOo
	 iRUNfqRpXUZzN7svc8h71g/h5uWKLNqyVh4Q/Jwp4Altho17ie0fIx4lyrwSeCUbTH
	 /8g+ZTZdYgEz9x34ELulTsIh9LbkzgzQnQJRTxaSBC0Lgtvkz4L/sl/7PoyZZLY8QO
	 586V9lB9sxTOchsaSULlk2P795l9ghc2GjLk0QPhN/4mLqJfaiUkOA1mptkx2APqRc
	 0FmkFA0wH4X5xdiCNGqF9ra0=
Date: Sat, 18 Jul 2026 08:02:30 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 0/4] x86/pvh: fix unbootable VMs again (PVH + KASAN)
Message-ID: <20260718150230.GAaluVhlozNI__9IsA@fat_crate.local>
References: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-pvh-kasan-inline-v6-0-ba99045dfa9f@igalia.com>
X-purgate-ID: tlsNG-ebf023/1784386989-52AC8B50-AC280F87/0/0
X-purgate-type: clean
X-purgate-size: 445

On Wed, Jul 01, 2026 at 08:13:49PM -0300, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.

They look like preexisting issues but we probably should take care of them
before we go forward:

https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-ba99045dfa9f%40igalia.com

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

