Return-Path: <SRS0=G/Cc=AT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2A8C433E0
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 13:12:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4E220772
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 13:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="f4z+pi1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4E220772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jt9rk-0006W6-Ek; Wed, 08 Jul 2020 13:12:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65hh=AT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jt9rj-0006W1-90
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 13:11:59 +0000
X-Inumbo-ID: 9a0ae830-c11c-11ea-8e36-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a0ae830-c11c-11ea-8e36-12813bfff9fa;
 Wed, 08 Jul 2020 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594213918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hX0TtMCUmf+4bowMcy/kzhrtYTZFcgfPybT5oM0w5oo=;
 b=f4z+pi1Gf1Mv0x9tTkgKaD3hPjXUB72X6WCabkmqpz7RVqZ9HGWJkIhU
 ns8a+jZ1wl8z7zSK/bcpI8/1BSqbuuT4eJa47EJFh2kGdGsQaklCYjN5a
 PvordE5LWSYJS3CwIoG7BTWK0hd8hmAYM9cyAsfXXRovnNbia/mv6dErd A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uJVjlQLQiM6CBRa0xQ0h5vOP8vHiHRY7zdJi/OYa2zYgz1YaJn95QaQXv7yFpPLf1upH9O0NR+
 HG8Nf8ldEVAEVM6DFZIN+xFgv0+LZCqIQnYVzkFcSRRui/JSWXyaaolHczpzbk5+mkQSp3GmnC
 Ymhrt9Z8yosx55URv/e1uWaws5RTTmxBKd5hZCJpnhCHvmNHpl+Zn4j/y1kC7nbL91vM/0bCM6
 1LTv6z7JP8TwVTv2FgMHy0YCJIxc7hrl3iCNjK8BMI+ICPHf8WslW6DoBBho4MN9rGn+kvFRQV
 SYU=
X-SBRS: 2.7
X-MesageID: 22188848
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="22188848"
Date: Wed, 8 Jul 2020 15:11:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alistair Francis <alistair23@gmail.com>, George Dunlap
 <george.dunlap@eu.citrix.com>
Subject: Re: Xen and RISC-V Design Session
Message-ID: <20200708131150.GD7191@Air-de-Roger>
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adding George in case he can help with the session placement.

On Wed, Jul 08, 2020 at 05:55:06AM -0700, Alistair Francis wrote:
> Hey,
> 
> I'm not sure if there is a better way to suggest a design session but
> can we have a Xen on RISC-V discussion tomorrow at the Xen Design
> Summit?

I think that would be interesting!

> Preferably in a later slot as the early slots are very early for me.

You have to register it at: https://design-sessions.xenproject.org/

Roger.

