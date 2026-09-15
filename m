Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5E5C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 05:12:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421446.1647293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6LT1-0007aD-Bs; Tue, 15 Sep 2026 05:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421446.1647293; Tue, 15 Sep 2026 05:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6LT1-0007Zu-6i; Tue, 15 Sep 2026 05:12:27 +0000
Received: by outflank-mailman (input) for mailman id 1421446;
 Tue, 15 Sep 2026 05:12:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x6LSz-0007Zm-FK
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 05:12:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6LSy-00FF8d-7p
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 07:12:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6aa8d396-e002-0a2a0a5209dd-0a2a4506d788-26
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 07:12:24 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6aa8d3b7-195a-0a2a45060019-416d716cecde-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 07:12:24 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 424C640E00B9; 
 Tue, 15 Sep 2026 05:12:23 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id l7mK6AY6STDk; Tue, 15 Sep 2026 05:12:13 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 99D8240E015D;
 Tue, 15 Sep 2026 05:11:58 +0000 (UTC)
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
	t=1789449133; bh=hLEWkb75NILErIyiEvrD6H5Nyelzx0xY/igrkoWaqWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpG6RQygncGPaWQbpmRNxxwJCcqwa5zGFcq7wXesX1MmWu5X84jzrTis3K34DMzwM
	 cUdiscylPSQgVCua0KQJOj/vAYrZhUBXO1iZXS/vNmpja/FvkQXqej1nNd3/rmwLAx
	 hq1FdeUgxjsUXOK6uFSHn43qfp5DYsUGbwIQoAJjd3F77PybjeoCRY6+yZ4/ZAxwy2
	 /KC0Q4B6qk+wlC3WzM6y8a8crPlbeCu/z+qPzVw9uK6gwxGpO4D5bjEZEbKH14QSDB
	 xz4EwFmxy9kx0gwZrZLja4Cakm9KfReIa/oFlVP1ClPsyZTtp1bIVXkoOT/JfsWFFz
	 zHMCrNzhHoB1wwBvgfaSzpsneU3Ud1m/DX5mrku2Ok1CjJtiLJrkqE6Bc39zakdt6y
	 kDAvFl+u8OkXvuiL5uRO0o8a5/Xe+PVRFFGfo/XZM88gjbpy/7xMT9E/mwxc2arID0
	 L32tLGSgjo3OnoVIxuHLuKFFZ3nWwWNTaozksEkiXVHJ+TDpzJpEkMsuLApWCVjToF
	 rU6J7yoBjWlEghXu6itUXnnDInCq1AKVACCZfpMI87AUKa5ojEnkBeb12CYoKW9fQQ
	 wYqWQws2pnIWYZ/Zk41/4YWS4C7cdLM9Lw/SMHY2N6aZfvfu17hm8ycMoTNYVqe9N6
	 GrBoXGvQi6Ai4aCNnH/+FMgs=
Date: Mon, 14 Sep 2026 22:11:55 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
 <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
X-purgate-ID: tlsNG-16d1c6/1789449144-FD80D77B-72D5BFE1/0/0
X-purgate-type: clean
X-purgate-size: 565

On Mon, Sep 14, 2026 at 08:22:08AM -0300, Mauricio Faria de Oliveira wrote:
> In the review of the original patchset (fixed by this series) it is
> mentioned that a compiler might turn it into a memcmp() [1] -- and thus
> revert back to the same issue.
> 
> [1] https://lore.kernel.org/all/877ccz12ab.ffs@tglx/

Hmm, never heard that before but that doesn't mean anything. Probably should
mention it in one of the commit messages so that we know for the future...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

