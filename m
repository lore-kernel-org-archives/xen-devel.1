Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4DAC624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 00:39:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406328.1639677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1vUQ-0005E4-3u; Thu, 03 Sep 2026 00:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406328.1639677; Thu, 03 Sep 2026 00:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1vUQ-0005Dx-1H; Thu, 03 Sep 2026 00:39:38 +0000
Received: by outflank-mailman (input) for mailman id 1406328;
 Thu, 03 Sep 2026 00:39:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x1vUO-0005Dr-Fw
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 00:39:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1vUN-00CxA3-Ow
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 02:39:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a98c1c7-8faa-0a2a0a5109dd-0a2a450ac9c8-0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:39:35 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a98c1c7-f2d2-0a2a450a0019-416d716ce296-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:39:35 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B698040E02C2; 
 Thu,  3 Sep 2026 00:39:34 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id udQ5OzAl84YC; Thu,  3 Sep 2026 00:39:25 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0E48440E016C;
 Thu,  3 Sep 2026 00:39:07 +0000 (UTC)
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
	t=1788395964; bh=kdWp3DhJemViBu8ZFWfs12pKAz2JlnXNo53LRyH7ixI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZhqPAQem8gqk0sXhssM2CHkBmYkNbRfO8skWN2H+rthvuEP6NciEwyl9kdedT6ac
	 4VQ7xyjE+FHpW9sSJom3uHv/j0u6LIJsZTsKxibCAljMQmQvYbyw4wcOcLCicgMplw
	 NqfdSt2v/+tL/P+6rDaKJjRjxmR+GCXrnEsSH10zkmjuolrtPYFBl9YJkI0EBc7AFa
	 j5bRPPcArDsDdRL3C3j3/HUcK8JF0SILGIMzGNqydpx0Khuz4IL6O3qkFkKDMqfGuK
	 8mjdzFW9YQ7XAsRrcVPTd3HAyRS/CgxqKGxpdgIt58Ni4CCYVCmrlrNOgPjxX7X62a
	 1mr9PEw1irlaHIXdNx5Y1KSSC2dOp5lfq5qvAeFumZhpytpDyKuQpkulgh6nrOpvzi
	 BS7wQFdJlo8tLuiHDGxEBmbn5MElWBivNonTDmI8pXUkPLyoMHLxNjI7+x8BFRR9pj
	 ffkR7uYezf5lh4/DeHcXH99eggRPRmTaWrZTDoZmIZIkVDG7w6pBn2E4jt0SKj3zvY
	 sg5MiMBW1qAbVWipTDS9gJo5IcbgBdUWPzP6dBUahLx/uGfCnTCKwadDdG6KNsngaR
	 k5oZ+U9+EHcjnelTbKJFgFtDwDgOJXlnM9Bs5DZwYTVkNOvfRHB14Z6CK7Om07DQm+
	 iOIMxNUOGjiys4M1+sddXZJE=
Date: Wed, 2 Sep 2026 17:39:04 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Michael Matz <matz@suse.de>, Richard Biener <rguenther@suse.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260903003904.GIapjBqOSCSrg1e_tY@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
 <05896397667d66a2969259298bcebb7f@igalia.com>
 <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
 <c9dd5e5de8484285b71ae62b98610911@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9dd5e5de8484285b71ae62b98610911@igalia.com>
X-purgate-ID: tlsNG-4011c0/1788395975-4A9D9CFC-10B847B7/0/0
X-purgate-type: clean
X-purgate-size: 336

On Wed, Sep 02, 2026 at 09:07:07PM -0300, Mauricio Faria de Oliveira wrote:
> The rest of this series is OK to you?
> I can wait for further feedback and combine it with this change.

Please wait - I haven't gone through the rest.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

