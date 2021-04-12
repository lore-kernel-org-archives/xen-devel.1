Return-Path: <SRS0=44Tx=JJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAA0C43460
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 14:17:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0745E61246
	for <xen-devel@archiver.kernel.org>; Mon, 12 Apr 2021 14:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0745E61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.109225.208479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxNZ-0006m5-Dw; Mon, 12 Apr 2021 14:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109225.208479; Mon, 12 Apr 2021 14:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxNZ-0006ly-9s; Mon, 12 Apr 2021 14:17:29 +0000
Received: by outflank-mailman (input) for mailman id 109225;
 Mon, 12 Apr 2021 14:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpGe=JJ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lVxNY-0006lt-3X
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:17:28 +0000
Received: from MTA-12-4.privateemail.com (unknown [198.54.127.107])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12e6d011-a6ba-4416-9b10-7001dc58fb8d;
 Mon, 12 Apr 2021 14:17:27 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id 90DFD80069
 for <xen-devel@lists.xenproject.org>; Mon, 12 Apr 2021 10:17:26 -0400 (EDT)
Received: from mail-wm1-f49.google.com (unknown [10.20.151.209])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 5B0B280062
 for <xen-devel@lists.xenproject.org>; Mon, 12 Apr 2021 10:17:26 -0400 (EDT)
Received: by mail-wm1-f49.google.com with SMTP id p19so6938012wmq.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Apr 2021 07:17:26 -0700 (PDT)
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
X-Inumbo-ID: 12e6d011-a6ba-4416-9b10-7001dc58fb8d
X-Gm-Message-State: AOAM532HtO+ZBqQxRWuhaqZ4fOcRyXSjb4XlEO/7DVrImKSBaBVVIBmy
	aB2Xd2hzSxXHDgu/Kdkd86LgTnXwF3bXm1LqQh4=
X-Google-Smtp-Source: ABdhPJw2es7oqLdjR2BkWa4H0seDxE0+ebV4ekb52DKXHV5EbwbxKJxug614hFU4IogGBXkUzZ044i/qWtAPtHlsFiw=
X-Received: by 2002:a05:600c:1405:: with SMTP id g5mr6716742wmi.186.1618237045195;
 Mon, 12 Apr 2021 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com> <91921cd4-902e-3341-10b7-718550658c8d@suse.com>
In-Reply-To: <91921cd4-902e-3341-10b7-718550658c8d@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 12 Apr 2021 10:16:49 -0400
X-Gmail-Original-Message-ID: <CABfawhktuRFPuNQqs9fv2OXoYCxrTAaxbiXj-Ru1Li_8dwN4PQ@mail.gmail.com>
Message-ID: <CABfawhktuRFPuNQqs9fv2OXoYCxrTAaxbiXj-Ru1Li_8dwN4PQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] x86: mem-access is HVM-only
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Apr 12, 2021 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> By excluding the file from being built for !HVM, #ifdef-ary can be
> removed from it.
>
> The new HVM dependency on the Kconfig option is benign for Arm.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>

