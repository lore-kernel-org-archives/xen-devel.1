Return-Path: <SRS0=FJpJ=5X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CE4C2BA16
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 08:17:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E66C206F5
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 08:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E66C206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjPs-0002Sf-Fa; Tue, 07 Apr 2020 08:17:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLjPr-0002SZ-AV
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:17:03 +0000
X-Inumbo-ID: 286f1f00-78a8-11ea-8083-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 286f1f00-78a8-11ea-8083-12813bfff9fa;
 Tue, 07 Apr 2020 08:17:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 64BF0AC2C;
 Tue,  7 Apr 2020 08:17:00 +0000 (UTC)
Subject: Re: [PATCH 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-8-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7d640aa-51da-830b-51e8-6257868b278e@suse.com>
Date: Tue, 7 Apr 2020 10:17:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404131017.27330-8-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.04.2020 15:10, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
>     * Add space before and after operator
>     * Align \
>     * Format comments

To be honest, despite the reason you give for the split in patch 6,
I'd rather see code movement like this to do formatting adjustments
right away. But if you're convinced the split is better, I'm not
meaning to insist.

Jan

