Return-Path: <SRS0=xV0j=7I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EB6C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 08:52:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0DB42073B
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 08:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lucina.net header.i=@lucina.net header.b="gcGJMuBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0DB42073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lucina.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdVJx-0000QC-Ls; Tue, 26 May 2020 08:52:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdVJw-0000Q7-W6
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 08:52:25 +0000
X-Inumbo-ID: 3760aee6-9f2e-11ea-9947-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3760aee6-9f2e-11ea-9947-bc764e2007e4;
 Tue, 26 May 2020 08:52:24 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 182F3122804;
 Tue, 26 May 2020 10:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590483142;
 bh=XwDVAhYIHN59igx5z/ZwfLAUYZdwFiO8r9vROke/t0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gcGJMuBsYGMtvtKYzIbnugjaX8mt0TgWIGKfN0MYQYf6YfB0rnbpeBn8oxJ+mVlW1
 BHkwh9+oXWVjWW5caGEBIcWaExTGk9g+xxUR4vQXfl+WmTHmTWRqd7WTv+0Ven7LmH
 yVfVx45jtlVfna12QO7Tb+EfsjbQNGhIGU38rdqz+m2lJ9rzZQUpmiUT1KXH7dc9X6
 jpPccijphOyl/4WDZhD51i/VXvfYzO44H99+UdxZcCdbCbnFBMcYYLlRNxpmOCK//s
 Q4dEdfQEib+QJWvJCkEyH7B8FJAapNh0KCBlVn0ZLvHDnqywCzOeFzDUn7To6Su0zz
 iZajJDdb/9pjg==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id EB3AB268436E; Tue, 26 May 2020 10:52:21 +0200 (CEST)
Date: Tue, 26 May 2020 10:52:21 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526085221.GB5942@nodbug.lucina.net>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 anil@recoil.org, dave@recoil.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, dave@recoil.org,
 mirageos-devel@lists.xenproject.org, anil@recoil.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> On 25/05/2020 17:42, Jürgen Groß wrote:
> > You need to setup virtual addressing and enable 64 bit mode before using
> > 64-bit GDT.
> >
> > See Mini-OS source arch/x86/x86_hvm.S
> 
> Or
> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> 
> But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> will only load the bottom 32 bits of GDTR.base.

Ah, I missed Jurgen's and your reply here.

LGDT loading only the bottom 32 bits of GDTR.base shouldn't matter.
Examining gdt_ptr some more:

    (gdb) set architecture i386
    The target architecture is assumed to be i386
    (gdb) x /xh 0x108040
    0x108040:	0x002f
    (gdb) x /xw 0x108042
    0x108042:	0x00108000
    (gdb) x /6xb 0x108040
    0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00
    (gdb) x /8xb 0x108040
    0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00	0x00	0x00

> Is there a less abridged version to look at?

https://github.com/mato/solo5/blob/xen/bindings/xen/boot.S

As I wrote in another reply, this boot.S is based off the virtio
(multiboot) boot.S, which has worked fine for years and should have the
same environment (32-bit flat protected mode).

-mato

