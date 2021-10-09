Return-Path: <SRS0=8Yv+=O5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D05C433F5
	for <xen-devel@archiver.kernel.org>; Sat,  9 Oct 2021 00:03:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F8060FC3
	for <xen-devel@archiver.kernel.org>; Sat,  9 Oct 2021 00:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24F8060FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.204965.360208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYzpZ-000237-Km; Sat, 09 Oct 2021 00:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204965.360208; Sat, 09 Oct 2021 00:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYzpZ-000230-Hj; Sat, 09 Oct 2021 00:03:13 +0000
Received: by outflank-mailman (input) for mailman id 204965;
 Sat, 09 Oct 2021 00:03:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfYO=O5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYzpX-00022u-Pt
 for xen-devel@lists.xenproject.org; Sat, 09 Oct 2021 00:03:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f56bd54-63c0-4b2e-809b-a8705587b6cb;
 Sat, 09 Oct 2021 00:03:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB27E60FC2;
 Sat,  9 Oct 2021 00:03:09 +0000 (UTC)
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
X-Inumbo-ID: 8f56bd54-63c0-4b2e-809b-a8705587b6cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633737790;
	bh=0r7TxkdS9pZnNOTmdNrs3ItUAzcmcS6xCpClx0nYc9E=;
	h=Date:From:To:cc:Subject:From;
	b=uV+FpWwICafnXZ6aa7hUnbfSZGAK0hOGPORkZ72hnjusofAh+pvX5V15cWq4E6jmP
	 nDKd0HDCINDoTJpGHmLJJMkZdfh+jGV95CE9Hdixdh2+vjhMZnTDPfC4RkK0jB6Cg0
	 oxBxdxiyl2a8RxxoydEEjPJRZ46oDCGz5hrVOF/kpR0nP2lU6vhjsJ0PujxFFb3H4w
	 NpaVbGwuzkMbh65aAEUKg6tP3qTCpo1/H8VHtclf9uYZxgj8DqHz09Og0KmDRnVR/o
	 8BfI/VXcMoRkUuP2cA2WN9qFJ7aMWA3Y+/EuDXDpfAaTwUsrO/qtvNsGk7WsbDifP2
	 IM6mirdRUhKcg==
Date: Fri, 8 Oct 2021 17:03:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: wl@xen.org, jgross@suse.com, iwj@xenproject.org, anthony.perard@citrix.com
cc: sstabellini@kernel.org, Rahul.Singh@arm.com, Bertrand.Marquis@arm.com, 
    xen-devel@lists.xenproject.org, michal.orzel@arm.com, 
    Oleksandr Andrushchenko <andr2000@gmail.com>, roger.pau@citrix.com, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: ARM series with tools patches for 4.16
Message-ID: <alpine.DEB.2.21.2110081605340.25528@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi tools and libxl Maintainers,

I am writing this email as a summary of the outstanding ARM series
targeting 4.16 that we are aiming to complete by Oct 15.

There has been a lot of traffic on the mailing list and in a few
occasions there has been 1 or 2 tools patches embedded in larger ARM
series. Easy to miss. For your convenience and help with tracking I
thought it would be useful to list the tools and libxl patches from the
various series that currently need an ack.

Cheers,

Stefano
P.S.
There are more ARM series targeting 4.16 but without tools dependencies
so I didn't list them here (NUMA, Dom0less EFI, PCI Passthrough part 3
which needs vpci reviews.)


- PCI devices passthrough on Arm by Rahul
  https://marc.info/?l=xen-devel&m=163354201102377
  Status:
      - patch #1   missing a tools ack
      - patch #10  missing a libxl ack
      - patch #9   missing a vpci (Roger) ack
      - other patches no action needed from tools (either already
        committed, acked, or almost there)

- PCI devices passthrough on Arm, part 2 by OleksandrA
  https://marc.info/?l=xen-devel&m=163367250003118
  Status:
      - patch #6, #7  missing a libxl ack
      - other patches no action needed from tools (either already
        committed, acked, or almost there)

- Add handling of extended regions (safe ranges) on Arm by OleksandrT
  https://marc.info/?l=xen-devel&m=163351932517019
  Status:
      - patch #1  missing a libxl ack (but also xen side not finished)
      - patch #2  missing a libxl ack (Ian is aware)
      - patch #3  no action needed from tools (committed)

- Expose PMU to the guests by Michal
  https://marc.info/?l=xen-devel&m=163368116008406
  Status:
      - patch #1, #3  missing a tools and libxl ack
      - patch #2      no action needed from tools (acked)

