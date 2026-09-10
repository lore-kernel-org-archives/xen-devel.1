Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD75C79FB7
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 03:39:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413868.1643797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4VcY-0006SG-Jx; Thu, 10 Sep 2026 03:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413868.1643797; Thu, 10 Sep 2026 03:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4VcY-0006S8-Gz; Thu, 10 Sep 2026 03:38:42 +0000
Received: by outflank-mailman (input) for mailman id 1413868;
 Thu, 10 Sep 2026 03:38:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1x4VcW-0006Rl-Ip
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 03:38:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4VcV-00GeXg-DG
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 05:38:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6aa225df-bab6-0a2a0a5309dd-0a2a450784e0-44
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 05:38:39 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <bp@alien8.de>)
 id 6aa2263e-b4ea-0a2a45070019-416d716cc876-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 05:38:39 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4973640E02DA; 
 Thu, 10 Sep 2026 03:38:38 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DgxUcYTwl7IG; Thu, 10 Sep 2026 03:38:28 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B712E40E00B9;
 Thu, 10 Sep 2026 03:38:13 +0000 (UTC)
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
	t=1789011508; bh=56esme3wXZzA28wrdzVrMK053H2QTxOeMLqIu/NG3Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRVn8+E1wzobwfUIvffLigaTfD/SQPfkWwOp01/4UpBFVPp41n6e4eLpNABn+J/Z7
	 YSayQr1sO7A0Vbv1omE5ki9NMfGZ7qyUt7zWVv+lQXRiF+wDrTcmV0GbxRGGbRiG/I
	 MYo4XuPDfuiL9oqA1+TRF3MovHk0ENv6ZGFWbWSpD8Oe7mZ/mxfqTJgqyI8YZ9ZbRk
	 d+jIgHx7SfsXfrJ7wa+Lrw75EAU+7LSp+fCdsLIbmG1gU+8c/0Boh3xjoz/JKwcXqO
	 nHeWvB6SK2u5JiapAUTymNccX9Iu6m8KFpjCdxbdU7QAQZOMrdi4EiG+tPItT11p8h
	 eQ2HfwY29+dzimYjiMfTv85EsrSYwux/Rvf8Ac3R7tk5GOi22DCFnqfsTd+RRRE4d/
	 Tv3NVi1bRA3WO7ZiTZupPOuDmfohylcdWSAfwzt65vGyeP9zRwO9GqQnYGqDTtS1yK
	 E6iOfH564Pf4kZWeE1sozVDbOCNA0TGPx6/7scnQngsTCx/LHNYx2ETPp+F/VsJDpj
	 RXp4/3YBRAFi4AIjhx2zCMV8jSfMAhFY3qM+/XdwQ23u+cPYGbzSMyVwvze8LR0cnM
	 izR0TdiZ18N6qehBtfOc525L8UaYPw31ZEGgUMp/nbChY4enOCxAjfVc9sFRGde8Aw
	 KNbgm0ZepzF5joHLu0mrIF9M=
Date: Wed, 9 Sep 2026 20:38:10 -0700
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
Message-ID: <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
 <c955deded411defba0de3a1f6daa78b0@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c955deded411defba0de3a1f6daa78b0@igalia.com>
X-purgate-ID: tlsNG-ef75cf/1789011519-374D3AE4-AE275F51/0/0
X-purgate-type: clean
X-purgate-size: 350

On Tue, Sep 08, 2026 at 06:06:21PM -0300, Mauricio Faria de Oliveira wrote:
> Ack, and to confirm: not rename the existing one, either?

Nah, concentrate only on what you're trying to achieve.

hpa can send a patch ontop since he cares so much.

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

