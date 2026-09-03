Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D072C61DD6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 00:02:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406306.1639658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1uu6-000890-7P; Thu, 03 Sep 2026 00:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406306.1639658; Thu, 03 Sep 2026 00:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1uu6-00088t-4C; Thu, 03 Sep 2026 00:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1406306;
 Thu, 03 Sep 2026 00:02:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x1uu3-00088Z-G5
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 00:02:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1uu2-005Vj6-Or
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 02:02:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a98b8ea-8faa-0a2a0a5109dd-0a2a4503b54c-14
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:02:02 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6a98b8fa-fae8-0a2a45030019-416d716c9ed6-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 02:02:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EEE2340E027F; 
 Thu,  3 Sep 2026 00:02:01 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zOm-ALuwUT36; Thu,  3 Sep 2026 00:01:52 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38A5740E016C;
 Thu,  3 Sep 2026 00:01:35 +0000 (UTC)
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
	t=1788393712; bh=4IXlQHsFzyYYmBoAO8JkyrUh/FaLtn8cSNtt98cWPCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4ycekOh9nFddyT3xYovjLl+9n/5GpQAwZAaLHsBu2LdD/ckNO6uvomUTXRhSfDot
	 g50QK8yvxH+hzcEZES9PIf9B/cGuSpXMxmYGK+/fAut2ZMC5il0LuFbE1TvQGTPUUZ
	 a2ZmDg3mZzjAbZX2ygOLxIQG6tLRCTNAO93O3PgFHoeH8gcYnzsvi8l6I/VyblxpTe
	 oMvckUCteRmBNHvCNL3r2x0oAMFrWTHuLctsilE90m2s97cYEInPCIOBwzcznJeQ8K
	 bN+aWumHgEAh0iJZxmEJJQM5I6FXrz+nkk8S8BZqkBq5APu+24YV20LgF7lOp+kkQl
	 HjiiMhfbRBjfCRhbKaoiidwb0lUZAcIGR1NCqbxmQfMYrfw3p/8evU0Qze+OH2eXqC
	 y3tVRX9WREXjYxl4QtLzSiDA/4yO1eVDiB3RwgLqHiKBuVAIwBU2eynDmsiM+YMNBE
	 9wfKiIfScHM+GnDuF4/c/G75DrBHAUAC4R+fD7QLtux7yfL32rtKBqoqYQz3NtiFoe
	 xrTs2HYgALrpp/QISUMuRgHdLsMDkNQ1LcXV/nQvwwEKQHD/K6JSxgwA5sFK1G0F7z
	 yeKWOc2WVRWAPVDTzMKuGfgs+OylP9NdrFXeVNxOHe3aJgn52ySIg6k/aSwOBYyGoW
	 Dfb4ubLZb6GOtdVx+CvgclsA=
Date: Wed, 2 Sep 2026 17:01:32 -0700
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
Message-ID: <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
 <20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
 <57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
 <05896397667d66a2969259298bcebb7f@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05896397667d66a2969259298bcebb7f@igalia.com>
X-purgate-ID: tlsNG-33051d/1788393722-766FB4E9-313FD626/0/0
X-purgate-type: clean
X-purgate-size: 638

On Wed, Sep 02, 2026 at 10:48:14AM -0300, Mauricio Faria de Oliveira wrote:
> Boris, I guess this may be added as clarification in the commit message.
> Would you prefer another version with it?

Yeah, I'd actually prefer it in the code itself so that we can find it easier.
This file is as good as any.

Something like this:

/*
 * Summarized explanation that "cc" clobbers don't have a meaning
 *
 */
 
and leave the "cc" clobber there but commented out:

 /* "cc" ... */

so that we can grep for it easier later.

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

