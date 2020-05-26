Return-Path: <SRS0=xV0j=7I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88355C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 10:12:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FDD2073B
	for <xen-devel@archiver.kernel.org>; Tue, 26 May 2020 10:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lucina.net header.i=@lucina.net header.b="es4vTGLQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FDD2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lucina.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdWZ5-0000jQ-Jv; Tue, 26 May 2020 10:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N6lx=7I=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jdWZ3-0000jL-Jd
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 10:12:05 +0000
X-Inumbo-ID: 589ff96c-9f39-11ea-a5fe-12813bfff9fa
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 589ff96c-9f39-11ea-a5fe-12813bfff9fa;
 Tue, 26 May 2020 10:12:04 +0000 (UTC)
Received: from nodbug.lucina.net (78-141-76-187.dynamic.orange.sk
 [78.141.76.187])
 by smtp.lucina.net (Postfix) with ESMTPSA id 6AC7D122804;
 Tue, 26 May 2020 12:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1590487923;
 bh=ktMxHkN8RbubbKp+2Me4K8XKCkvYrm8mNijcddKeBhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=es4vTGLQqFdUhQ+yBIXQPO6grScTZUzrVVbgxaAR0elX/6pAF6McJX4Ko4AF9lYvI
 h2Eb3E9Motw5p4CKmhEGMZ+cq8ejEqdGQxihe0sy9DAgPsRdnGfVFN8+BRK5Ke9h/U
 pEY0ByiS9jDd+KtXGCS/mYD80ATOPXXkaIi2pM2FjMTwqvap/wfogDJmm3TmP4PDru
 OnjDBN8ofpW8zx8NAzev1ePPegKcuOpg4SCgZ+R7c8Wu4OVhKx7nC+v18UrzonAGpH
 37zxy7tk/iRxRZKgx3ws/kQRcBz12i8kE3Eg6OVT/bb4AbaohKqAhJDRUft9Io7Pu6
 cA/YgIOrEOXAA==
Received: by nodbug.lucina.net (Postfix, from userid 1000)
 id 4542B268436E; Tue, 26 May 2020 12:12:03 +0200 (CEST)
Date: Tue, 26 May 2020 12:12:03 +0200
From: Martin Lucina <martin@lucina.net>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: Xen PVH domU start-of-day VCPU state
Message-ID: <20200526101203.GE5942@nodbug.lucina.net>
Mail-Followup-To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 mirageos-devel@lists.xenproject.org, dave@recoil.org,
 xen-devel@lists.xenproject.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
 <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
 <20200526085221.GB5942@nodbug.lucina.net>
 <20200526093421.GA38408@Air-de-Roger>
 <20200526100337.GB38408@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526100337.GB38408@Air-de-Roger>
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, anil@recoil.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, mirageos-devel@lists.xenproject.org,
 dave@recoil.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tuesday, 26.05.2020 at 12:03, Roger Pau Monné wrote:
> On Tue, May 26, 2020 at 11:34:21AM +0200, Roger Pau Monné wrote:
> > On Tue, May 26, 2020 at 10:52:21AM +0200, Martin Lucina wrote:
> > > On Monday, 25.05.2020 at 17:59, Andrew Cooper wrote:
> > > > On 25/05/2020 17:42, Jürgen Groß wrote:
> > > > > You need to setup virtual addressing and enable 64 bit mode before using
> > > > > 64-bit GDT.
> > > > >
> > > > > See Mini-OS source arch/x86/x86_hvm.S
> > > > 
> > > > Or
> > > > https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD
> > > > 
> > > > But yes - Juergen is correct.  Until you have enabled long mode, lgdt
> > > > will only load the bottom 32 bits of GDTR.base.
> > > 
> > > Ah, I missed Jurgen's and your reply here.
> > > 
> > > LGDT loading only the bottom 32 bits of GDTR.base shouldn't matter.
> > > Examining gdt_ptr some more:
> > > 
> > >     (gdb) set architecture i386
> > >     The target architecture is assumed to be i386
> > >     (gdb) x /xh 0x108040
> > >     0x108040:	0x002f
> > >     (gdb) x /xw 0x108042
> > >     0x108042:	0x00108000
> > >     (gdb) x /6xb 0x108040
> > >     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00
> > >     (gdb) x /8xb 0x108040
> > >     0x108040:	0x2f	0x00	0x00	0x80	0x10	0x00	0x00	0x00
> > 
> > Could you also print the GDT entry at 0x10 (ie: 0x108000 + 0x10), just
> > to make sure it contains the right descriptor?
> 
> Forgot to ask, but can you also add the output of readelf -lW
> <kernel>?

    Elf file type is EXEC (Executable file)
    Entry point 0x1001e0
    There are 7 program headers, starting at offset 64

    Program Headers:
      Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
      INTERP         0x001000 0x0000000000100000 0x0000000000100000 0x000018 0x000018 R   0x8
          [Requesting program interpreter: /nonexistent/solo5/]
      LOAD           0x001000 0x0000000000100000 0x0000000000100000 0x00626c 0x00626c R E 0x1000
      LOAD           0x008000 0x0000000000107000 0x0000000000107000 0x007120 0x00ed48 RW  0x1000
      NOTE           0x0080ac 0x00000000001070ac 0x00000000001070ac 0x000018 0x000018 R   0x4
      NOTE           0x00f120 0x00000000001070c4 0x00000000001070c4 0x000014 0x000000 R   0x4
      NOTE           0x008088 0x0000000000107088 0x0000000000107088 0x000024 0x000024 R   0x4
      NOTE           0x008000 0x0000000000107000 0x0000000000107000 0x000088 0x000088 R   0x4

     Section to Segment mapping:
      Segment Sections...
       00     .interp
       01     .interp .text .rodata .eh_frame
       02     .note.solo5.manifest .note.solo5.abi .note.solo5.not-openbsd .data .bss
       03     .note.solo5.not-openbsd
       04     .note.solo5.xen
       05     .note.solo5.abi
       06     .note.solo5.manifest

The PT_INTERP and multiple PT_NOTE headers are that way due to specifics of
how Solo5 ABIs work, but I've verified that the domain builder is
interpreting XEN_ELFNOTE_PHYS32_ENTRY correctly.

-mato

