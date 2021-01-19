Return-Path: <SRS0=/2oJ=GW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3C6C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 07:26:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 414BD2070B
	for <xen-devel@archiver.kernel.org>; Tue, 19 Jan 2021 07:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 414BD2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.70162.125868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1lOZ-0005TU-PD; Tue, 19 Jan 2021 07:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70162.125868; Tue, 19 Jan 2021 07:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1lOZ-0005TN-Lg; Tue, 19 Jan 2021 07:25:43 +0000
Received: by outflank-mailman (input) for mailman id 70162;
 Tue, 19 Jan 2021 07:25:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oKp0=GW=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l1lOY-0005TI-Do
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 07:25:42 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4657a5e0-0931-4517-87ea-23ff799706c0;
 Tue, 19 Jan 2021 07:25:41 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10J7PIE6067423
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 19 Jan 2021 02:25:24 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10J7PHw6067422;
 Mon, 18 Jan 2021 23:25:17 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 4657a5e0-0931-4517-87ea-23ff799706c0
Date: Mon, 18 Jan 2021 23:25:17 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
        bertrand.marquis@arm.com, andre.przywara@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Re: [PATCH] xen: acpi: Hide UART address only if SPCR exists
Message-ID: <YAaJXRTbMyDW4zP+@mattapan.m5p.com>
References: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <160129689861.4486.15700361505030965554.stgit@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160129689861.4486.15700361505030965554.stgit@localhost>

On Mon, Sep 28, 2020 at 09:41:39PM +0900, Masami Hiramatsu wrote:
> With Julien's ACPI fix, I found my DeveloperBox (
> https://www.96boards.org/product/developerbox/ ) still failed
> to boot bcause of SPCR issue. According to the UEFI EDK2
> implementation, the SCPR table will not be made if user
> chooses graphical console instead of serial.
> In such case, we should ignore the SPCR missing error.

You weren't the only person running into this.  Since you didn't get
back sooner I ended up submitting a pretty similar patch (I kept the
printk() due to informational value).

861f0c110976fa8879b7bf63d9478b6be83d4ab6 on master (switching to "main"
in the future?)

> Compared with Linux kernel implementation, this doesn't check
> the STAO (status override) table, becaue it seems STAO (or XENV)
> will be provided by Xen itself.
> Or, should we check STAO too?

Until we start seeing super-duper-visors Xen won't need to look for STAO.
Linux needs to look for STAO since it expects to potentially run under a
hypervisor, whereas Xen this isn't expected.

Graphics are a problem due to limits of ACPI table support.  Due to
graphics being a high priority for me, I'm temporarily using
device-trees.  :-(


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



