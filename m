Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0050F4199E
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 12:22:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282390.1564985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCzGW-0005tz-1I; Wed, 15 Apr 2026 12:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282390.1564985; Wed, 15 Apr 2026 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCzGV-0005ts-Up; Wed, 15 Apr 2026 12:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1282390;
 Wed, 15 Apr 2026 12:22:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCzGV-0005tm-0d
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 12:22:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCzGU-003DMY-06;
 Wed, 15 Apr 2026 12:22:42 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCzGT-0042rr-2b;
 Wed, 15 Apr 2026 12:22:41 +0000
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
	bh=9OxsrBbnph6Lh14GYqegueMdJ+lWozdPjhaBtj9/v4o=; b=3VCHho85Y2SnHT8OuFc2Xm8zE9
	+9vVQkndkQRQOSFJnu/nVe2y5NvQmvJ7gbQfngTmlDmWm0pQDYXKbwPRnnODzu5a25LVM7E1j/rBM
	4Gb9qfF+CKOTje041BSgxj5U+ehoCQqXCICXK//x4BLj7mT5segt0FumlDmYsTdp6a4M=;
Message-ID: <aa00c8d8-f20b-46ab-9a69-039d1016a1b8@xen.org>
Date: Wed, 15 Apr 2026 13:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/dt-overlay: fix double-free of rangesets on
 attach failure
Content-Language: en-GB
To: Gyujeong Jin <wlsrbwjd7232@gmail.com>, Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20260415113700.107915-1-michal.orzel@amd.com>
 <20260415113700.107915-2-michal.orzel@amd.com>
 <CANrF8CEDV5m1Jap0kBoa3sOXD2GV6PAYumfV9rgL2c70nZa=tg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CANrF8CEDV5m1Jap0kBoa3sOXD2GV6PAYumfV9rgL2c70nZa=tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gyujeong,

On 15/04/2026 12:48, Gyujeong Jin wrote:
> Thanks for your efforts.
> 
> I’ve seen some advisories that received cve here.
> https://xenbits.xen.org/xsa/ <https://xenbits.xen.org/xsa/>
> 
> Can I receive a cve for this report?

Thank you for the original report. The security team doesn't issue any 
CVE when there is no associated XSA.

Best regards,

-- 
Julien Grall


