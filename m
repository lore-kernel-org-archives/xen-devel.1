Return-Path: <SRS0=TTqk=H7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8CAC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 17:16:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD3A651C8
	for <xen-devel@archiver.kernel.org>; Mon,  1 Mar 2021 17:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DD3A651C8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.91816.173255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGm9u-0007Xg-VJ; Mon, 01 Mar 2021 17:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91816.173255; Mon, 01 Mar 2021 17:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGm9u-0007XZ-SC; Mon, 01 Mar 2021 17:16:38 +0000
Received: by outflank-mailman (input) for mailman id 91816;
 Mon, 01 Mar 2021 17:16:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGm9u-0007XU-78
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:16:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGm9u-0004qy-2u
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:16:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGm9u-0002V6-1x
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:16:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGm9q-0004xS-NV; Mon, 01 Mar 2021 17:16:34 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=13Kj7RzqmVCzVZETaSPuaFP8XdUIobXKzSnObUsCibA=; b=WOiNlCUpOk+TNTyZOfE6ZqhgqL
	v2MHHEml4KYs+nraDZxLmOGRLycDMZ3WgU8g6oJaVm+olcMHpNB+cctSFvzicAn+LhxWsyS69+W/v
	qO/Q6Fqk/Ua4hmfCF9azujPFF6hoqUPZVEkwppEc358rKMPPqcL+wQlKs0OiMOAhZVxc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24637.8562.514355.845883@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:16:34 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR behavior selection
In-Reply-To: <20210301162357.76527-1-roger.pau@citrix.com>
References: <20210301162357.76527-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH RFC for-4.15] x86/msr: introduce an option for legacy MSR behavior selection"):
> Introduce an option to allow selecting the legacy behavior for
> accesses to MSRs not explicitly handled. Since commit
> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> handled by Xen result in the injection of a #GP to the guest. This is
> a behavior change since previously a #GP was only injected if
> accessing the MSR on the real hardware will also trigger a #GP.
> 
> This seems to be problematic for some guests, so introduce an option
> to fallback to this legacy behavior. The main difference between what
> was previously done is that the hardware MSR value is not leaked to
> the guests on reads.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> ---
> Note that this option is not made available to dom0. I'm not sure
> whether it makes sense to do so, since anyone updating Xen to such
> newer version will also likely pair it with a newish kernel that
> doesn't require such workarounds.
> 
> RFC because there's still some debate as to how we should solve the
> MSR issue, this is one possible way, but IMO we need to make a
> decision soon-ish because of the release timeline.
> 
> Boris, could you please test with Solaris to see if this fixes the
> issue?

So AIUI this patch is to make it possible for Xen 4.15 to behave like
Xen 4.14, thus avoiding a regression for these troublesome guests.

Have we diffed the result of this against 4.14 and if not would it be
a sensible thing to do ?

Ian.

