Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB2EC3E8C5
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 16:21:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9FE21534
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 16:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="uyRnsBBB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9FE21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39633.72582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigV4-0003wv-DL; Fri, 27 Nov 2020 16:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39633.72582; Fri, 27 Nov 2020 16:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigV4-0003wo-AK; Fri, 27 Nov 2020 16:21:34 +0000
Received: by outflank-mailman (input) for mailman id 39633;
 Fri, 27 Nov 2020 16:21:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kigV3-0003wj-8j
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:21:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b8ffb12-8211-4ad1-ae41-8f6f41112705;
 Fri, 27 Nov 2020 16:21:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 999BBAC2D;
 Fri, 27 Nov 2020 16:21:31 +0000 (UTC)
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
X-Inumbo-ID: 5b8ffb12-8211-4ad1-ae41-8f6f41112705
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606494091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vKq1RsWnINe57Es3dEOBPFU5E6xXZbeF2qCahwtMek=;
	b=uyRnsBBBivbcLcWY8/KCfrliSH/Q/ouyMQm89y/C1Mh6dMLxBkqE5up20XZUbbqQpzTy1j
	bJRMQW+OVWIGbVVPFH6Sd1IXgD313IDA8/iLYKITXEJpAjhFJTtBKRhR7s1IuxacQu9pMx
	+VRInl+D+4ize4X7DfP7QFfA6Id2Exw=
Subject: Re: [PATCH v10 0/7] IOMMU cleanup
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201120132440.1141-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2015b3e8-0269-d9ba-c160-eb90b6ca3a99@suse.com>
Date: Fri, 27 Nov 2020 17:21:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120132440.1141-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 14:24, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This is the remainder of the cleanup series deferred until XSA-346 and
> XSA-347 were publicly disclosed.
> 
> Paul Durrant (7):
>   remove remaining uses of iommu_legacy_map/unmap
>   common/grant_table: batch flush I/O TLB
>   iommu: remove the share_p2m operation
>   iommu: stop calling IOMMU page tables 'p2m tables'

Are the latter two patches dependent upon the former two, or could
they go in independently?

Jan

