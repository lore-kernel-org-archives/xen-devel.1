Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F67C2BB85
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 13:11:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DA6214AF
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 13:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DA6214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP4IK-00007p-E3; Thu, 16 Apr 2020 13:11:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3QVr=6A=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jP4II-00007i-Qs
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 13:11:02 +0000
X-Inumbo-ID: b7e65698-7fe3-11ea-8b90-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7e65698-7fe3-11ea-8b90-12813bfff9fa;
 Thu, 16 Apr 2020 13:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7E81CAE65;
 Thu, 16 Apr 2020 15:11:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTR01cjk79An; Thu, 16 Apr 2020 15:10:59 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 5E2BFADE6;
 Thu, 16 Apr 2020 15:10:59 +0200 (CEST)
Received: from samy by function with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jP4ID-004Vno-Tr; Thu, 16 Apr 2020 15:10:57 +0200
Date: Thu, 16 Apr 2020 15:10:57 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH] mini-os: use -m elf_i386 for final linking
Message-ID: <20200416131057.yvrsijib7aqjzc4s@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20200416122731.22713-1-jgross@suse.com>
 <20200416124636.35zgnf5bhq3d3bpw@function>
 <71871753-d4e5-9afc-9637-479f5ecb2776@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71871753-d4e5-9afc-9637-479f5ecb2776@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jürgen Groß, le jeu. 16 avril 2020 14:58:34 +0200, a ecrit:
>  Specifically, 64bit emulation appears to include "align primary
>  sections to 2M so your OS can make better use of superpages even when
>  mmap()ing", with no way I can spot to override this in the linker
>  file."

Ok, I see, I had indeed guessed that the 2M rounding probably had
something to do with 2M pages.

I'm afraid it may bite us back some day, but I'd say it is fine enough
for now to include it, so 

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

with the information quoted above put in the changelog, please :)

Samuel

