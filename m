Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B20C07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 12:45:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6130561949
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 12:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6130561949
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151255.279551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kS5-00080l-B9; Tue, 06 Jul 2021 12:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151255.279551; Tue, 06 Jul 2021 12:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kS5-00080e-7t; Tue, 06 Jul 2021 12:45:25 +0000
Received: by outflank-mailman (input) for mailman id 151255;
 Tue, 06 Jul 2021 12:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6NH=L6=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1m0kS3-00080Y-NJ
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:45:23 +0000
Received: from MTA-08-3.privateemail.com (unknown [198.54.127.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae004168-461a-40ca-8f4b-ed26ef72dcac;
 Tue, 06 Jul 2021 12:45:22 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id D1428600F6
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:45:21 -0400 (EDT)
Received: from mail-wr1-f48.google.com (unknown [10.20.151.242])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 90CF2600D1
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:45:21 -0400 (EDT)
Received: by mail-wr1-f48.google.com with SMTP id i8so13042324wrp.12
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 05:45:21 -0700 (PDT)
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
X-Inumbo-ID: ae004168-461a-40ca-8f4b-ed26ef72dcac
X-Gm-Message-State: AOAM530+UYD9IN+Mwi5MGa1wLgleIC5m8JKSuv7f9IcwU8p4AV/f1s+f
	5VR+K00mlayFkdT0mXwafwSH59Tyfl2Lia2gi0I=
X-Google-Smtp-Source: ABdhPJyOKXXt3p/yRK5yLnFk92vwnWUj31Fxs44Ob/TQj2lyD8DjzfcRxp33uBU9SU6wBPLg7s4tK0tpSq5z1oao24s=
X-Received: by 2002:a5d:524e:: with SMTP id k14mr21874411wrc.390.1625575516335;
 Tue, 06 Jul 2021 05:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com> <ab136038-0242-086c-9e67-02c47e1db3e0@suse.com>
In-Reply-To: <ab136038-0242-086c-9e67-02c47e1db3e0@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 6 Jul 2021 08:44:40 -0400
X-Gmail-Original-Message-ID: <CABfawh=uSLV_ccGBY1Qf7otvRs2jEp8yGfZE6QzAuNmQrJHFyg@mail.gmail.com>
Message-ID: <CABfawh=uSLV_ccGBY1Qf7otvRs2jEp8yGfZE6QzAuNmQrJHFyg@mail.gmail.com>
Subject: Re: [PATCH 14/16] paged_pages field is MEM_PAGING-only
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jul 5, 2021 at 12:14 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> Conditionalize it and its uses accordingly.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the mem_sharing bits:
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

The rest also look fine to me as you can consider having an R-b as
well for those bits.

