Return-Path: <SRS0=m9qM=OZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517B2C433EF
	for <xen-devel@archiver.kernel.org>; Tue,  5 Oct 2021 23:19:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CFE16120F
	for <xen-devel@archiver.kernel.org>; Tue,  5 Oct 2021 23:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CFE16120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.202562.357532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXtie-0004Gh-Sm; Tue, 05 Oct 2021 23:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202562.357532; Tue, 05 Oct 2021 23:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXtie-0004Ga-PE; Tue, 05 Oct 2021 23:19:32 +0000
Received: by outflank-mailman (input) for mailman id 202562;
 Tue, 05 Oct 2021 23:19:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0nn=OZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mXtid-0004GU-1p
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 23:19:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b060f27f-2632-11ec-bf1e-12813bfff9fa;
 Tue, 05 Oct 2021 23:19:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5CA061215;
 Tue,  5 Oct 2021 23:19:28 +0000 (UTC)
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
X-Inumbo-ID: b060f27f-2632-11ec-bf1e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633475969;
	bh=Klam4P8ugIvmCfh98ErxgMh8Qx5cFg4VPlqGCnewslw=;
	h=Date:From:To:cc:Subject:From;
	b=M9nIQmbFbiPgReKYam2l2koeEH24Y5py/G9qG3DgGKraXPAL0PIE6Kl/BqMSqq+nd
	 QKxpCRGNiPKhAfBYqumfMJ09kJ2iHKT7H2qrSQCZikn4TsRxRvb3+eJ+1kUWYOYiBY
	 /2ZJcXAn+HrcBCMbSAuGmrPzRLFCJCj4zAhZYdY1flsPAqwu7GHlK2VcrOay3lgaBQ
	 BvVdHFfUROBqv2/SySeJF4MOBpz7w6wm3AMGrPXZVUVa4+I6g9BgiVbOjxd4lm/BvG
	 obvBQoy2CkVDp6F2ESjqjo1nHjcyOGUf045RgjUNM4R8NnwDH3eQmRA2QWwuv8dq/J
	 tF7CgAPCxDwNQ==
Date: Tue, 5 Oct 2021 16:19:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: fam@euphon.net
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, wl@xen.org, 
    anthony.perard@citrix.com, cardoe@cardoe.com, 
    xen-devel@lists.xenproject.org
Subject: Patchew not working for xen-devel
Message-ID: <alpine.DEB.2.21.2110051610480.3209@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Fam,

Patchew is not applying patches any longer from xen-devel. Would you be
able to look into the issue? We are only 2 weeks away from the Xen 4.16
code freeze; it would be great to have Patchew working (the underlying
gitlab-ci tests are known to work.) If you can't look into it at the
moment, could you give us a couple of pointers so that we can try to see
what's wrong by ourselves?

In the long term maybe you could give the Xen community a quick "tour"
of Patchew so that if something like this happens, somebody else might
know where to look and may be able to help as well.

Thanks in advance for any help you can provide! Even just a couple of
links would be appreciated.

Cheers,

Stefano

