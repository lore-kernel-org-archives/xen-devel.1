Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5B3C5DF94
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 15:36:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397606.1634636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxRI0-0007O1-6R; Fri, 21 Aug 2026 15:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397606.1634636; Fri, 21 Aug 2026 15:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxRI0-0007Nu-3e; Fri, 21 Aug 2026 15:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1397606;
 Fri, 21 Aug 2026 15:36:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wxRHz-0007No-6G
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 15:36:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wxRHz-00FgDQ-0E
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 15:36:14 +0000
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wxRHy-00EKSW-2Q
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 15:36:14 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5b45f1cd80eso1113714e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 08:36:14 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=corrnl7HApta/FO6dLF3SnGijbG7Uv8u4S7s9KnN4Ak=; b=ZBv+hlrvWz+6SCsHuOUTf4IOEH
	AgnHqW+2UgB6175+58itShf4cQgTlljlLoYNdUD2YEDDp7EztsAnpIb2pTA/LKhVRXJGVyU0ztV1U
	kdDLbd1ApwxSXEjLFZlCiEc4yD2xD6mzC8T+v3EzZhfhyBBTnktRJdgF6e/jhNjO6tVU=;
X-Forwarded-Encrypted: i=1; AHgh+Rp925OCODeIbRXbk/mP0imHu/NOBPKK14iRwBwUhI7uS+aExyq8MRHTtexbO1qnQ8gTIG18au195nE=@lists.xenproject.org
X-Gm-Message-State: AFuF++lc+ghklyB4jk0Xzv91DTUjYx0sd7IMowkuOWooecJIpINNKbMN
	EB7eYfgZQfjJHY1kIEZHS2/RRgxBpVmmKIZGHYOoa4Zya6iBiEt/rPIx4ztMh0zTnRlV7cIYidZ
	ewmIFdAEkVOszq5x+JsYqZpRWpNCVRx0=
X-Received: by 2002:a05:6512:1519:10b0:5b2:b808:6913 with SMTP id
 2adb3069b0e04-5b48422b619mr1734292e87.11.1787326573653; Fri, 21 Aug 2026
 08:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <ec040560-4377-474d-a929-3080b74bb0af@suse.com> <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
In-Reply-To: <CAFLBxZbQD7HgdYK3-yzaMOt4P2geO2PSOSDi4-c3KHZ96DDifg@mail.gmail.com>
From: George Dunlap <gwd@xenproject.org>
Date: Fri, 21 Aug 2026 16:36:00 +0100
X-Gmail-Original-Message-ID: <CAFLBxZYZLMzMwt8uOgVGgjYvZDGgX4sH5ukqf0Vuo6Rxao2JPg@mail.gmail.com>
X-Gm-Features: AcwNN1X8bJAu6NAmy1LkhtXLfWlwzVjQrLKO699ydTTBWJtyKYcOHfh8mPtlEfQ
Message-ID: <CAFLBxZYZLMzMwt8uOgVGgjYvZDGgX4sH5ukqf0Vuo6Rxao2JPg@mail.gmail.com>
Subject: Re: [PATCH 0/7] x86: Address Space Isolation, part 1: per-domain area
 mapping rework
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 4:17=E2=80=AFPM George Dunlap <gwd@xenproject.org> =
wrote:

> Ultimately, I think there's a lot of wisdom in the saying, "Premature
> optimization is the root of all evil."  As I said, it's certainly
> right to be on our guard against adding things to xenheap, and look at
> alternatives; but we're nowhere near the point where we need to say,
> "Absolutely nothing added, regardless of the cost."  The design here
> is not locking us into the pages long-term; alternate designs have a
> significant cost in terms of authoring, reviewing, code complexity and
> maintenance, and code performance.

To get a sense of how much this approach simplifies things, look at
how patch 1 of this series simplified create_perdomain_mapping; and
look at how much simpler patch 2 is compared to Roger's implementation
[1].  The xenheap option is way easier to review and maintain.

 -George

[1] https://marc.info/?l=3Dxen-devel&m=3D173634640624259

