Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE3CCC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:52:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448088.1664119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeo0-0008Jt-76; Tue, 13 Oct 2026 15:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448088.1664119; Tue, 13 Oct 2026 15:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeo0-0008Jm-4e; Tue, 13 Oct 2026 15:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1448088;
 Tue, 13 Oct 2026 15:52:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGeny-0008Jg-SS
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:52:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGeny-00000003Rgr-3ZDr;
 Tue, 13 Oct 2026 15:52:42 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGenx-00000003hGn-3PiW;
 Tue, 13 Oct 2026 15:52:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=bbqIHxEuhtBWwZ6mOUDTm5ir4iWLuI8EVwb/Fcu67tU=; b=hv/RmbguXABsqZTtx9S6znnMwG
	fuH2dSOqBTeMOmQjlsO6RyA0ZIpOWrvNqTPm4mTxBFiXc/TE7bxMZ9sCw/vWAuOT4hr3WNvEFqsN0
	YbPtBE17yoS0i1cdEzKXJk6MkQT1YPpxVLtOWxeteJHxVfc7S+92pS2Go40G5WEG+7rE=;
Date: Tue, 13 Oct 2026 17:52:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 08/15] x86/PVH: split pvh_setup_acpi()
Message-ID: <as5TyD0ZX1HnN578@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d0f1a88b-66a0-4bf9-9dd2-ea0cc48bc3ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d0f1a88b-66a0-4bf9-9dd2-ea0cc48bc3ae@suse.com>

On Mon, Oct 12, 2026 at 10:23:16AM +0200, Jan Beulich wrote:
> All E820 manipulations want to happen before the initrd is placed, or else
> pvh_steal_ram() may steal from the tail part of it. As a second step,
> split placing ACPI data from actually populating it.

Would it be less intrusive to duplicate the memory map (like it's done
in a change ahead of this one), and subtract the kernel and initrd
region from that memory map, then use it as the basis for
pvh_steal_ram()?

We could adjust/replace pvh_add_mem_range() so it allows changing
regions from RAM to other types.  That would seem to be less churn
overall.  Maybe you did already consider this and found further
problem with this approach that I'm failing to see?

Thanks, Roger.

