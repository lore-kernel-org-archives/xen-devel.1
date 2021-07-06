Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9DDC07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 12:43:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1554861C7A
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 12:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1554861C7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151249.279540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kPc-0007OL-Tv; Tue, 06 Jul 2021 12:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151249.279540; Tue, 06 Jul 2021 12:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0kPc-0007OE-Qt; Tue, 06 Jul 2021 12:42:52 +0000
Received: by outflank-mailman (input) for mailman id 151249;
 Tue, 06 Jul 2021 12:42:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6NH=L6=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1m0kPb-0007O8-RG
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:42:51 +0000
Received: from MTA-12-4.privateemail.com (unknown [198.54.127.107])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id accdedd8-de57-11eb-8494-12813bfff9fa;
 Tue, 06 Jul 2021 12:42:51 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 7C714800BA
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:42:50 -0400 (EDT)
Received: from mail-wm1-f54.google.com (unknown [10.20.151.205])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 4FFA3800BB
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jul 2021 08:42:50 -0400 (EDT)
Received: by mail-wm1-f54.google.com with SMTP id o22so13502781wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jul 2021 05:42:50 -0700 (PDT)
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
X-Inumbo-ID: accdedd8-de57-11eb-8494-12813bfff9fa
X-Gm-Message-State: AOAM532UAwiKqOKVE8Bz4G5KmZuAEkhSbnQTRWKOTU/6QHVkQNao7r78
	SxUdagB0liwcMuv+pp4fS4DU9Y25jBuJrt/kDsE=
X-Google-Smtp-Source: ABdhPJwcd+nVyH3zWSNqJguKyrcdz4AB2gFoE0OfCFA9arXSEVhpzAI/ElwWTO81RAHewx/mCAPwr2itPZuCO3TV6bA=
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr20649649wmk.51.1625575368972;
 Tue, 06 Jul 2021 05:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com> <ec21ca25-73bc-ddb7-8674-b7a59adb441c@suse.com>
In-Reply-To: <ec21ca25-73bc-ddb7-8674-b7a59adb441c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 6 Jul 2021 08:42:13 -0400
X-Gmail-Original-Message-ID: <CABfawhmOBk3MmU-B6wV_jXbcFMOaPZEZ4zqcWqJYt3Ot37=mMg@mail.gmail.com>
Message-ID: <CABfawhmOBk3MmU-B6wV_jXbcFMOaPZEZ4zqcWqJYt3Ot37=mMg@mail.gmail.com>
Subject: Re: [PATCH 13/16] shr_pages field is MEM_SHARING-only
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jul 5, 2021 at 12:13 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> Conditionalize it and its uses accordingly. The main goal though is to
> demonstrate that x86's p2m_teardown() is now empty when !HVM, which in
> particular means the last remaining use of p2m_lock() in this cases goes
> away.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Tamas K Lengyel <tamas@tklengyel.com>

