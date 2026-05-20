Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120DDCD4F54
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2026 21:23:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1314434.1584395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoNw-0008CB-P0; Wed, 20 May 2026 21:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314434.1584395; Wed, 20 May 2026 21:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPoNw-0008C4-MM; Wed, 20 May 2026 21:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1314434;
 Wed, 20 May 2026 21:23:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wPoNv-0008Bt-Dd
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 21:23:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPoNu-000fJQ-Pt
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 23:23:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a0e25ea-2eae-0a2a0a5409dd-0a2a4502c594-42
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:23:22 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 6a0e2469-af86-0a2a45020019-d561b338b5f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 23:15:22 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPoFv-0041Ys-8c; Wed, 20 May 2026 23:15:07 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wPoFt-008Pcq-07; Wed, 20 May 2026 23:15:07 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wPoFs-00000002qJh-1HpH;
 Wed, 20 May 2026 23:15:04 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QrmoDDcRFc85TJxSTIraknowNTSHHOttVC2hQ/n8Nw8=; b=h5Cwm4IXpqydrJFUwR+NYd9lEz
	MgWdiaLQRW3jNu68Dv9kDXmNtxbACTne+/I1pY8Uyc0KYJx7e5TDIDoxEge2SGzZOpP1SaqH5G8p2
	nX9ChKIUHZtmsjAVXEVgIa2RLd0CxVPfTAU9Yn3ra0srJqgb05V9NUm6tjrzWBERCA9jqBOGm6RBs
	c4l4RXPIkl3P50RE1VOC9221An5SaDxMz2Zk0qYN5SJ6upzgjjlaYm+Xj7j+/235+RRat0vdW20tT
	+bowa6B5uk88ORN7ZtYOBC6XDJDnknjIU8MmW0Bi37N7kalpP/v02ZYMARqD48QhCxa0s5Xp1Xgsn
	kgvLaNfw==;
MIME-Version: 1.0
Date: Wed, 20 May 2026 18:15:04 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/3] x86/pvh: fix unbootable VMs again (PVH + KASAN)
In-Reply-To: <20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com>
References: <20260427-pvh-kasan-inline-v2-0-2c57b8dcff6a@igalia.com>
Message-ID: <b84eb4bb9f056285832e68d510d9a27a@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1779311722-A917D161-25AE0A03/13/0
X-purgate-type: clean
X-purgate-size: 403

On 2026-04-27 13:10, Mauricio Faria de Oliveira wrote:
> The issue of unbootable VMs with CONFIG_PVH due to CONFIG_KASAN is back.
> 
> Booting directly from vmlinux (instead of bzImage) now fails with gcc-14/15
> (but works with gcc-12/13) if CONFIG_KASAN_GENERIC is set, on Ubuntu 25.10.

v3:
https://lore.kernel.org/all/20260520-pvh-kasan-inline-v3-0-bede769c6ec7@igalia.com/

-- 
Mauricio

