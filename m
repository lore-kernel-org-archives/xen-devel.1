Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3683C25B78
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2024 11:14:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.735342.1141515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sES76-0005j6-0F; Tue, 04 Jun 2024 11:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735342.1141515; Tue, 04 Jun 2024 11:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sES75-0005iz-TZ; Tue, 04 Jun 2024 11:13:59 +0000
Received: by outflank-mailman (input) for mailman id 735342;
 Tue, 04 Jun 2024 11:13:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sES74-0005iq-4A
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 11:13:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sES72-0000Cp-Ev; Tue, 04 Jun 2024 11:13:56 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sES72-00027S-6y; Tue, 04 Jun 2024 11:13:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=pcYrkOLcEwC1UqIzg9fwWXkbE6I3gycHivNE520qcPM=; b=qAWidke601ieLszqZcuU0HHcqN
	Km2y/70JJ4gi0Fok89QQPfQwBqS2iqj3b71hnXi/Z36QUg58cCB/Cvcy3HH5I2xcdq9g8/5QSK3rh
	W7M+dvw4vbwfZgRJmHcEzlKPgs41UfTbD8P332WA6B2WfsJm7IeitPbn3KY10urGsTds=;
Message-ID: <3e8c5cad-d5b2-48f6-8db4-ea714a1166d7@xen.org>
Date: Tue, 4 Jun 2024 12:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 03/10] xen: Refactor altp2m options into a
 structured format
Content-Language: en-GB
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1717356829.git.w1benny@gmail.com>
 <5dc1d0375206bd982b91f4db4bd237769a889f48.1717356829.git.w1benny@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5dc1d0375206bd982b91f4db4bd237769a889f48.1717356829.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/06/2024 21:04, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Encapsulate the altp2m options within a struct. This change is preparatory
> and sets the groundwork for introducing additional parameter in subsequent
> commit.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> ---
>   tools/libs/light/libxl_create.c     | 6 +++---
>   tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
>   xen/arch/arm/domain.c               | 2 +-

For the small change in Arm:

Acked-by: Julien Grall <jgrall@amazon.com> # arm

>   xen/arch/x86/domain.c               | 4 ++--
>   xen/arch/x86/hvm/hvm.c              | 2 +-
>   xen/include/public/domctl.h         | 4 +++-
>   6 files changed, 13 insertions(+), 9 deletions(-)

Cheers,

-- 
Julien Grall

