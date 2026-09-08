Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25C9C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 19:33:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412380.1642871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x41Yz-00005S-AO; Tue, 08 Sep 2026 19:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412380.1642871; Tue, 08 Sep 2026 19:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x41Yz-00005L-77; Tue, 08 Sep 2026 19:33:01 +0000
Received: by outflank-mailman (input) for mailman id 1412380;
 Tue, 08 Sep 2026 19:33:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x41Yx-000054-A5
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 19:33:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x41Yw-000VoL-LP
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 21:32:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6aa062bb-e002-0a2a0a5209dd-0a2a4508841a-38
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 21:32:58 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6aa062ea-f659-0a2a45080019-416d716cdb3e-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 21:32:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7ABD340E01F9; 
 Tue,  8 Sep 2026 19:32:57 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EOvuZCCfcmsb; Tue,  8 Sep 2026 19:32:47 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D3FB040E01DD;
 Tue,  8 Sep 2026 19:32:32 +0000 (UTC)
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
	t=1788895967; bh=CSxdJl4VBmqHBG2bWI7rm0ZQwyV1SRPcqmp/fkG/2Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwg+fHP68U1E4MZ59lLpLK/8gQ6qCUXS7fi5N32ugrohWQjHI6hDpvpxTWRIE5Uhn
	 p6GUxO/I9ZXLuYKmVbEuMqDqRrGw5eI4prsmMRnlGxCY4C4+TTQ1Q97gBYJa3GCdmv
	 ASmk0yH1wCK1RvHvz+mp8scgjIluUYfD+ejJtJmyjcJRYecg3WnfY+Hwcq4DB0i0zE
	 L2m+h1SAkafW6bkrpr8pNiBUSa+gdznsgnLq1PMzc/pBupjiqfExCFGUPNvEY8TSrP
	 cL7dfrs1tAC9t9AOfJM8duIPbsCHZZbehvFl0cvQdGC3KSJ4V2P7IKZwmKMGohEph8
	 7KAVVlgS9yOdoDDWPurPqj+d5p6nsY7ROShKx9SQa8LK2DVdR9tOLAc7GC7pWoM++w
	 VJO05TcWaSy6da/m+C2WftviWAvOtriATkGbNX1L3Yhb15QMwYatOukSuqqXDXOMo+
	 5eJxuquCtyeN7sVE3Dxgjvhlb9ZN/EAqkVNrzKWQuogJ86EvXw//L8RmpUpAj0dl3Z
	 /11ogNuRl0PeDHKTpqMJa96NpNeh/dY16TGIXH3JGLbLWrAWpgKYPwK2ZiVP/+KDxM
	 vBGlz8imGLf75+JzTvp248YRm3SiWdd9NdJx4kCbAVkcABxryoqq4N5zIjSrv6tUKn
	 cGqY+ntuQUYJ7gzDyyyd1aa0=
Date: Tue, 8 Sep 2026 12:32:29 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
X-purgate-ID: tlsNG-c1860d/1788895978-CEF5F87B-FBD08618/0/0
X-purgate-type: clean
X-purgate-size: 539

On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:
> Boris, perhaps the approach here could be changed to add an actual
> memcmp()-like inline implementation (e.g., as provided in a previous
> revision, without return value differences), or continue with the
> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?

Nah, new functionality is not needed. We can add it later when it is really needed.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

