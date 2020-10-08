Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BA5C433DF
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 18:39:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50152221FE
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 18:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50152221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4552.11906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQap9-0003cU-0e; Thu, 08 Oct 2020 18:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4552.11906; Thu, 08 Oct 2020 18:39:30 +0000
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
	id 1kQap8-0003cN-Tx; Thu, 08 Oct 2020 18:39:30 +0000
Received: by outflank-mailman (input) for mailman id 4552;
 Thu, 08 Oct 2020 18:39:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ogxi=DP=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kQap6-0003cI-Un
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:39:28 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b1e3e3-711c-4c1f-ba9e-a206fff3f1b6;
 Thu, 08 Oct 2020 18:39:27 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 098Id4eR056821
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 8 Oct 2020 14:39:10 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 098Id4tw056820;
 Thu, 8 Oct 2020 11:39:04 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ogxi=DP=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kQap6-0003cI-Un
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:39:28 +0000
X-Inumbo-ID: d7b1e3e3-711c-4c1f-ba9e-a206fff3f1b6
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7b1e3e3-711c-4c1f-ba9e-a206fff3f1b6;
	Thu, 08 Oct 2020 18:39:27 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 098Id4eR056821
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 8 Oct 2020 14:39:10 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 098Id4tw056820;
	Thu, 8 Oct 2020 11:39:04 -0700 (PDT)
	(envelope-from ehem)
Date: Thu, 8 Oct 2020 11:39:04 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
        Alex Benn??e <alex.bennee@linaro.org>, bertrand.marquis@arm.com,
        andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
Message-ID: <20201008183904.GA56716@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>

On Mon, Sep 28, 2020 at 03:47:52PM +0900, Masami Hiramatsu wrote:
> This made progress with my Xen boot on DeveloperBox (
> https://www.96boards.org/product/developerbox/ ) with ACPI.

Adding your patch on top of Julien Grall's patch appears to push the Xen
boot of my target device (Raspberry PI 4B with Tianocore) further.  Still
yet to see any output attributable to the Domain 0 kernel though.

(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000032234000
(XEN) Loading ramdisk from boot module @ 0000000031747000
(XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
(XEN) BANK[0] 0x00000020000000-0x00000030000000 (256MB)
(XEN) BANK[1] 0x00000040000000-0x000000b0000000 (1792MB)
(XEN) Grant table range: 0x000000315f3000-0x00000031633000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 0000000032234000 to 0000000020080000-0000000021359200
(XEN) Loading d0 initrd from 0000000031747000 to 0x0000000028200000-0x0000000028cebfe4
(XEN) Loading d0 DTB to 0x0000000028000000-0x0000000028000273
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 396kB init memory.

The line, "Loading d0 DTB to 0x0000000028000000-0x0000000028000273" seems
rather suspicious as I would expect Domain 0 to see ACPI tables, not a
device tree.

Your (Masami Hiramatsu) patch seems plausible, but things haven't
progressed enough for me to endorse it.  Looks like something closer to
the core of ACPI still needs further work, Julien Grall?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



