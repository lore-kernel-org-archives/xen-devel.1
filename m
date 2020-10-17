Return-Path: <SRS0=quZ/=DY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7D9C433DF
	for <xen-devel@archiver.kernel.org>; Sat, 17 Oct 2020 05:13:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEA82074A
	for <xen-devel@archiver.kernel.org>; Sat, 17 Oct 2020 05:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBEA82074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8263.22022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTeWs-0001js-7a; Sat, 17 Oct 2020 05:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8263.22022; Sat, 17 Oct 2020 05:13:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTeWs-0001jl-4a; Sat, 17 Oct 2020 05:13:18 +0000
Received: by outflank-mailman (input) for mailman id 8263;
 Sat, 17 Oct 2020 05:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lxxR=DY=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kTeWq-0001jg-W4
 for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 05:13:17 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4921258-78b9-42e5-8b72-4b1865cd4ef8;
 Sat, 17 Oct 2020 05:13:15 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09H5Coji026800
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 17 Oct 2020 01:12:55 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09H5CnCP026799;
 Fri, 16 Oct 2020 22:12:49 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lxxR=DY=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kTeWq-0001jg-W4
	for xen-devel@lists.xenproject.org; Sat, 17 Oct 2020 05:13:17 +0000
X-Inumbo-ID: d4921258-78b9-42e5-8b72-4b1865cd4ef8
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d4921258-78b9-42e5-8b72-4b1865cd4ef8;
	Sat, 17 Oct 2020 05:13:15 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09H5Coji026800
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 17 Oct 2020 01:12:55 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09H5CnCP026799;
	Fri, 16 Oct 2020 22:12:49 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 16 Oct 2020 22:12:49 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
        Alex Benn??e <alex.bennee@linaro.org>, bertrand.marquis@arm.com,
        andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: Xen-ARM EFI/ACPI problems (was: Re: [PATCH 0/4] xen/arm: Unbreak
 ACPI)
Message-ID: <20201017051249.GA26457@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <CAA93ih2EiyCnuL4sw1OLw+XEWa7sN3zJWvsnxHfx9b9Fq+cOxw@mail.gmail.com>
 <20201016223323.GA23508@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016223323.GA23508@mattapan.m5p.com>

On Fri, Oct 16, 2020 at 03:33:23PM -0700, Elliott Mitchell wrote:
> On the device I'm on (Raspberry PI 4B with Tianocore -> GRUB -> Xen) I
> discovered a SPCR table shows up if I boot with the device the output is
> plugged into is powered down.  I'm guessing this causes Tianocore to
> advise GRUB/Linux/Xen to boot with a serial console (presenting a Serial
> Port Console Redirect table), whereas if the display device is
> functioning the absense of SPCR is supposed to indicate console on
> framebuffer.
> 
> This means the ACPI_FAILURE case in acpi_iomem_deny_access() simply needs
> to be filled in similar to how it likely is on x86.  Allocate a serial
> port for Xen's use as console, present it to domain 0 as hvc0, and hide
> it from domain 0.

Looks like things are worse than I thought.

Upon examining some of my `dmesg` copies it looks like Linux interprets
the ignore_uart field in STAO tables as applying strictly to the UART
referenced in the SPCR table.  As such, when booted with the framebuffer
available, Linux thinks it can freely access the UART found in the
hardware table.  The specification for the STAO table is apparently
garbage since it only allows a hypervisor to tell a VM to ignore a
single UART.  Instead it really needs to be possible to mask arbitrary
devices.  :-(

As such, for ARM devices which can include framebuffers, I'm guessing Xen
will need to either pass a modified table to domain 0, or simulate the
device sufficiently to prevent concurrent access.  This could be as
simple as simulating a MMIO page which discards all writes.





> Next issue for me will be getting the framebuffer operational.
> Apparently the Xen-ARM EFI implementation doesn't provide any EFI
> variables to domain 0?  Jan Beulich, your name was mentioned as person
> likely to have ideas for getting Linux's efifb code operational Xen-ARM.

There may be multiple pieces to this.

For the framebuffer this might be as simple as parsing the BGRT table and
ensuring the addresses are directly mapped to domain 0.  I just noticed
in dmesg, "efi_bgrt: Ignoring BGRT: invalid image address".  I'm guessing
one thing got remapped, but a second didn't.

The other need for EFI variable access is for modifying EFI's boot
process.  While I suspect it may be feasible for most users to reboot to
a kernel directly on hardware to update GRUB/other bootloader, adding an
extra step increases the potential for a failure at the Wrong Time.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



