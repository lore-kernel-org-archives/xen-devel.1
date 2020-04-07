Return-Path: <SRS0=FJpJ=5X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C669C2BA16
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 08:14:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F62206F5
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 08:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F62206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLjNN-0002Fo-Ny; Tue, 07 Apr 2020 08:14:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLjNM-0002Fj-0z
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 08:14:28 +0000
X-Inumbo-ID: cbe0bbf4-78a7-11ea-8080-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbe0bbf4-78a7-11ea-8080-12813bfff9fa;
 Tue, 07 Apr 2020 08:14:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6EDCAC44;
 Tue,  7 Apr 2020 08:14:24 +0000 (UTC)
Subject: Re: [PATCH 6/7] xen/guest_access: Consolidate guest access helpers in
 xen/guest_access.h
To: Julien Grall <julien@xen.org>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-7-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e2588f6e-1f13-b66f-8e3d-b8568f67b62a@suse.com>
Date: Tue, 7 Apr 2020 10:14:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200404131017.27330-7-julien@xen.org>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.04.2020 15:10, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Most of the helpers to access guest memory are implemented the same way
> on Arm and x86. The only differences are:
>     - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
>       and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>       is still fine to use the Arm implementation on x86.
>     - __clear_guest_offset(): Interestingly the prototype does not match
>       between the x86 and Arm. However, the Arm one is bogus. So the x86
>       implementation can be used.
>     - guest_handle{,_subrange}_okay(): They are validly differing
>       because Arm is only supporting auto-translated guest and therefore
>       handles are always valid.

While I'm fine in principle with such consolidation, I'm afraid I
really need to ask for some historical background to be added
here. It may very well be that there's a reason for the separation
(likely to be found in the removed ia64 or ppc ports), which may
then provide a hint at why future ports may want to have these
separated. If such reasons exist, I'd prefer to avoid the back and
forth between headers. What we could do in such a case is borrow
Linux'es asm-generic/ concept, and move the "typical"
implementation there. (And of course if there were no noticable
reasons for the split, the change as it is would be fine in
general; saying so without having looked at the details of it,
yet).

Jan

