Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B7EC433ED
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 13:29:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C51961449
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 13:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C51961449
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114504.218227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZCuT-0002YS-9D; Wed, 21 Apr 2021 13:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114504.218227; Wed, 21 Apr 2021 13:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZCuT-0002YL-5N; Wed, 21 Apr 2021 13:28:53 +0000
Received: by outflank-mailman (input) for mailman id 114504;
 Wed, 21 Apr 2021 13:28:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZCuS-0002YG-EM
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 13:28:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b1863d3-763c-4c70-aafc-069fd7bbfa4d;
 Wed, 21 Apr 2021 13:28:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 802B1B1DE;
 Wed, 21 Apr 2021 13:28:50 +0000 (UTC)
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
X-Inumbo-ID: 1b1863d3-763c-4c70-aafc-069fd7bbfa4d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619011730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIR3Qw5pFN4oA2sVs3On7PYoWr3xNTZWZVH65IN3yiI=;
	b=nnjjBBdZTXe6U1o+eOpxrSH4KwAiacWFLM55lThXl+0dwh7l+agKzaS73q2inuayvTZ/ec
	KYS+7ZB/ELiH2d/fDg4CNOXC5bm87mbnqEKxMO0udRb1iMT5w7QaT7eH0eYwnGtmh7AbT6
	WV01QMzYcTgqPl4R6xD4TNAuRM03LQQ=
Subject: Re: [PATCH 2/8] x86/EFI: sections may not live at VA 0 in PE binaries
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <5d7c61b0-8441-dccc-4917-cc8a436fd96f@suse.com>
 <YH/nzmkQMhsJE4mw@Air-de-Roger>
 <deee924d-f124-5563-727a-71ddb39403f3@suse.com>
 <YIAhHTsNlG7lQarM@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c9e3e9d-b47d-93f8-e1cf-22ddb246c0fb@suse.com>
Date: Wed, 21 Apr 2021 15:28:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIAhHTsNlG7lQarM@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 14:57, Roger Pau Monné wrote:
> So from a bit of searching I just did it seems like stab sections
> where used during the 90s with ELF, but that this has long been
> superseded by DWARF 2 becoming the default in the late 90s, hence I
> think it would be fine to just remove those sections even in the ELF
> case?

Well, maybe. Even up-to-date gcc still supports -gstabs. Plus I seem
to have a vague recollection that Andrew objected to their removal
at some (not overly distant) point. I can't find any reference there
though, so Andrew: Do you have any specific thoughts here?

Of course with the stabs sections gone, .comment would remain. I'm
very firm in not wanting to leave any statements there putting
sections at VA zero. Irrespective of .comment (to take this example)
being listed under /DISCARD/ for PE. This would only be acceptable
(to me) if ld would always have at least warned about such sections.

Jan

