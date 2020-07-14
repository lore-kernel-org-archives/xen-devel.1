Return-Path: <SRS0=aF8x=AZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66956C433EB
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 12:02:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EEFB22224
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 12:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EEFB22224
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvJdr-0007Hz-CO; Tue, 14 Jul 2020 12:02:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvJdp-0007Ht-GJ
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 12:02:33 +0000
X-Inumbo-ID: e5df9ba0-c5c9-11ea-92ff-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5df9ba0-c5c9-11ea-92ff-12813bfff9fa;
 Tue, 14 Jul 2020 12:02:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A0D89B008;
 Tue, 14 Jul 2020 12:02:34 +0000 (UTC)
Subject: Re: [PATCH v7 06/15] x86_64/mm: introduce pl2e in paging_init
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <6e840488d3512bb1b0d5e678391323df5301e1e0.1590750232.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ab9f656a-bad6-c19b-cce4-001aa4236637@suse.com>
Date: Tue, 14 Jul 2020 14:02:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e840488d3512bb1b0d5e678391323df5301e1e0.1590750232.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 13:11, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> We will soon map and unmap pages in paging_init(). Introduce pl2e so
> that we can use l2_ro_mpt to point to the page table itself.
> 
> No functional change.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


