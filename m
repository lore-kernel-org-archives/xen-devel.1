Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B29C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 21:07:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412412.1642888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x431t-0004qK-0s; Tue, 08 Sep 2026 21:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412412.1642888; Tue, 08 Sep 2026 21:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x431s-0004qD-UK; Tue, 08 Sep 2026 21:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1412412;
 Tue, 08 Sep 2026 21:06:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1x431o-0004q7-KR
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 21:06:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x431m-00CvCh-Sn
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 23:06:50 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa078d6-8faa-0a2a0a5109dd-0a2a4501d660-14
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:06:50 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6aa078e9-5984-0a2a45010019-d561b33896f6-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 23:06:50 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1x431K-00GhLn-AS; Tue, 08 Sep 2026 23:06:22 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1x431J-006po3-Hm; Tue, 08 Sep 2026 23:06:22 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1x431J-00000007CH8-21e5;
 Tue, 08 Sep 2026 23:06:21 +0200
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
	bh=W0woORh2sNhrNSjAwp60+N8VcUpv9x0tKH5X9eMmLCg=; b=V5NqWq41aeMDKSrS6F5dVbnjgf
	wmRNBzjY7koiaSRlpGgHcaEW+WiAjGfhY/AEBITXtuN8+Kj0qi1WkK9OzF0EWMNO42/ZOFej31+MA
	NGAaehYeDoel9AG2AePrXiLwxJHohpFSAXawU2in6A+w+AuGEpKLe1yII5ZaFS1qqYALtstTNnmOC
	2s+3GD2s/LB1h6jOgF5kc/LMFN1w/Teo51XlhZuHYFSRRd073dS50NCZfUOZq2f2x7ICyy/IWFAam
	P7XJzaL2aI1lgZg3A/is2Ir0mMDVhCGr/verxPv1N4zGbjDZ9Epx56fgVqg0lWScqdp3txuKyvqNJ
	MSbbubvg==;
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 18:06:21 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
Message-ID: <c955deded411defba0de3a1f6daa78b0@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788901610-1D67C757-E66A97A8/0/0
X-purgate-type: clean
X-purgate-size: 580

On 2026-09-08 16:32, Borislav Petkov wrote:
> On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:
>> Boris, perhaps the approach here could be changed to add an actual
>> memcmp()-like inline implementation (e.g., as provided in a previous
>> revision, without return value differences), or continue with the
>> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?
> 
> Nah, new functionality is not needed. We can add it later when it is really needed.

Ack, and to confirm: not rename the existing one, either?

-- 
Mauricio

