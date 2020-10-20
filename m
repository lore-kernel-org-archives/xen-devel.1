Return-Path: <SRS0=M+rI=D3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17065C4363A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 15:48:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF6122244
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2020 15:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="sCda7TrB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF6122244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.9716.25582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtsC-0003FC-GW; Tue, 20 Oct 2020 15:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9716.25582; Tue, 20 Oct 2020 15:48:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUtsC-0003F5-Cr; Tue, 20 Oct 2020 15:48:28 +0000
Received: by outflank-mailman (input) for mailman id 9716;
 Tue, 20 Oct 2020 15:48:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUtsB-0003F0-3j
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:48:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 509d2e9e-df56-4c6a-a4f0-2650e554fdd4;
 Tue, 20 Oct 2020 15:48:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93A2FAF6D;
 Tue, 20 Oct 2020 15:48:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUtsB-0003F0-3j
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:48:27 +0000
X-Inumbo-ID: 509d2e9e-df56-4c6a-a4f0-2650e554fdd4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 509d2e9e-df56-4c6a-a4f0-2650e554fdd4;
	Tue, 20 Oct 2020 15:48:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603208900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4oaI/JO+vm57/aBMG5Zgn752QfMBhOA6ONSbRKRRf4g=;
	b=sCda7TrB3v8Iva7BeCaDPhvaqqCR52KJDNV4IGjQHNnx21EEhFLjbQRaHH9GGIuYZMqQHO
	DPM4rTv4PCBUKxPp+DBjJbHBFjdIOsDvktV5vK1zvBQsK6wsrdFPBkx8mgJWVGAObyu4Ym
	mJst7mhfJYM6fuuUNd2gG1jHDTnQ0oM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93A2FAF6D;
	Tue, 20 Oct 2020 15:48:20 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201020152405.26892-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a50a19ce-321a-ceef-55e4-95ffbebff59d@suse.com>
Date: Tue, 20 Oct 2020 17:48:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201020152405.26892-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 17:24, Andrew Cooper wrote:
> With MMU_UPDATE, a PV guest can make changes to higher level pagetables.  This
> is from Xen's point of view (as the update only affects guest mappings), and
> the guest is required to flush suitably after making updates.
> 
> However, Xen's use of linear pagetables (UPDATE_VA_MAPPING, GNTTABOP_map,
> writeable pagetables, etc.) is an implementation detail outside of the
> API/ABI.
> 
> Changes in the paging structure require invalidations in the linear pagetable
> range for subsequent accesses into the linear pagetables to access non-stale
> mappings.  Xen must provide suitable flushing to prevent intermixed guest
> actions from accidentally accessing/modifying the wrong pagetable.
> 
> For all L2 and higher modifications, flush the full TLB.  (This could in
> principle be an order 39 flush starting at LINEAR_PT_VIRT_START, but no such
> mechanism exists in practice.)
> 
> As this combines with sync_guest for XPTI L4 "shadowing", replace the
> sync_guest boolean with flush_flags and accumulate flags.  The sync_guest case
> now always needs to flush, there is no point trying to exclude the current CPU
> from the flush mask.  Use pt_owner->dirty_cpumask directly.

Why is there no point? There's no need for the FLUSH_ROOT_PGTBL
part of the flushing on the local CPU. The draft you had sent
earlier looked better in this regard.

Jan

