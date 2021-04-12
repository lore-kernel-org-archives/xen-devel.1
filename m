Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D1DC433B4
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 14:03:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE7B61220
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 14:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDE7B61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.109159.208320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVx9s-0004I3-RP; Mon, 12 Apr 2021 14:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109159.208320; Mon, 12 Apr 2021 14:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVx9s-0004Hv-Nz; Mon, 12 Apr 2021 14:03:20 +0000
Received: by outflank-mailman (input) for mailman id 109159;
 Mon, 12 Apr 2021 14:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVx9r-0004Ho-QA
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:03:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85bd67ce-3b16-466b-9eb9-3fd6868f97e4;
 Mon, 12 Apr 2021 14:03:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C967AF95;
 Mon, 12 Apr 2021 14:03:18 +0000 (UTC)
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
X-Inumbo-ID: 85bd67ce-3b16-466b-9eb9-3fd6868f97e4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v6EqbMCQW6SqgAsAlTr0O+JrHO7RPM5H9busLoF28rs=;
	b=Amq5hkVx3qTy5gHxdUJVo+2TZI0TxRF1KRM7zewUicTPygIbQUmBEUBC2VEN5xV1Po6OJv
	ft2WBIFEEPM0SfN0K3LYmlKFzH7b6ftOEGFBpHergLg9IBoCIeqErlXtpJn5+XDgWGG2Sc
	dYQNOALKGjBUarkZ9LIXwqS8uUlGBD0=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 00/12] x86/p2m: restrict more code to build just for HVM
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Date: Mon, 12 Apr 2021 16:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Since it was brought up in the discussion of v1: I think the end
goal is to be for mm/p2m.c to become a HVM-only file. Any "wrappers"
also trying to take care of !paging_mode_translate() guests ought to
be moved elsewhere. To see what actually still needs taking care of,
incrementally extending the #ifdef CONFIG_HVM regions there is the
way to go imo.

Compared to v1 there are many new patches here plus build fixes to
two of the three remaining ones from v1.

01: p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
02: p2m: {,un}map_mmio_regions() are HVM-only
03: mm: the gva_to_gfn() hook is HVM-only
04: AMD/IOMMU: guest IOMMU support is for HVM only
05: p2m: change_entry_type_* hooks are HVM-only
06: p2m: hardware-log-dirty related hooks are HVM-only
07: p2m: the recalc hook is HVM-only
08: mem-access is HVM-only
09: make mem-paging configuarable and default it to off for being unsupported
10: p2m: {get,set}_entry hooks and p2m-pt.c are HVM-only
11: p2m: write_p2m_entry_{pre,post} hooks are HVM-only
12: p2m: re-arrange struct p2m_domain

Jan

