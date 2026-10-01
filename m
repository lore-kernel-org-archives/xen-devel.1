Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CDCCA5FCB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 14:06:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438388.1657241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCHQ0-0000ld-0l; Thu, 01 Oct 2026 14:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438388.1657241; Thu, 01 Oct 2026 14:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCHPz-0000lW-U5; Thu, 01 Oct 2026 14:05:51 +0000
Received: by outflank-mailman (input) for mailman id 1438388;
 Thu, 01 Oct 2026 14:05:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xCHPy-0000lQ-LU
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 14:05:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCHPt-009SA7-1P;
 Thu, 01 Oct 2026 14:05:45 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xCHPt-003ih4-18;
 Thu, 01 Oct 2026 14:05:45 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=4wW+sqw3Z6RB+R5HcbIudEgrjB3VkTT7fJMK6tIEZtk=; b=hkaQSbQ/kJNQ/QJPBdGhbV4iFR
	hfSgLZXbKIE5MudWQw5lwC6iO3PeoYmRtJmu2Xgj4RnwYX1V3BJJqSDTNJeAk9PBaT90G4MMPnUhZ
	kRBq3B22qq1hELZJqQ424+F0056/vlS1wR7ZnR6S0sw5HFmpg6rimUkZFVN+tAJIqek0=;
Date: Thu, 1 Oct 2026 16:05:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
Message-ID: <ar5osbu6CVr66m8O@Mac.lan>
References: <20261001091921.94138-1-roger@xenproject.org>
 <5ff32e79-76c4-4f05-8290-14c248a79afb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ff32e79-76c4-4f05-8290-14c248a79afb@suse.com>

On Thu, Oct 01, 2026 at 01:05:39PM +0200, Jan Beulich wrote:
> On 01.10.2026 11:19, Roger Pau Monne wrote:
> > XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
> > its setting in XENVER_get_features to the is_pv_domain() guarded section,
> > with the rest of the PV specific features.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> > ---
> > Changes since v1:
> >  - Just move the conditional but don't merge it.
> 
> And still no CONFIG_PV32 dependency?

Andrew specifically asked for this form, or at least that was my
understanding.

Regards, Roger.

