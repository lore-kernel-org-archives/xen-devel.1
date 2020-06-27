Return-Path: <SRS0=bI9w=AI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F10C433E0
	for <xen-devel@archiver.kernel.org>; Sat, 27 Jun 2020 11:55:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E005B20720
	for <xen-devel@archiver.kernel.org>; Sat, 27 Jun 2020 11:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E005B20720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jp9Qr-0000AM-QW; Sat, 27 Jun 2020 11:55:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yHEP=AI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jp9Qq-0000AB-DH
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 11:55:40 +0000
X-Inumbo-ID: 12d4fd4a-b86d-11ea-836a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d4fd4a-b86d-11ea-836a-12813bfff9fa;
 Sat, 27 Jun 2020 11:55:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AF2BAF34;
 Sat, 27 Jun 2020 11:55:19 +0000 (UTC)
Subject: Re: [PATCH v4 for-4.14 1/2] pvcalls: Clearly spell out that the
 header is just a reference
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-2-julien@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f2639da1-820b-c64f-cd91-a4fb5296676f@suse.com>
Date: Sat, 27 Jun 2020 13:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200627095533.14145-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Julien Grall <jgrall@amazon.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.06.20 11:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> A recent thread on xen-devel [1] pointed out that the header was
> provided as a reference for the specification.
> 
> Unfortunately, this was never written down in xen.git so for an external
> user (or a reviewer) it is not clear whether the spec or the header
> shoudl be followed when there is a conflict.

should

> 
> To avoid more confusion, a paragraph is added at the top of the header
> to clearly spell out it is only provided for reference.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s/
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

