Return-Path: <SRS0=OK+i=G7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B42C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 18:26:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55DB164E1D
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jan 2021 18:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55DB164E1D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77404.140179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5C0A-0002G1-Ew; Thu, 28 Jan 2021 18:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77404.140179; Thu, 28 Jan 2021 18:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5C0A-0002Fu-Br; Thu, 28 Jan 2021 18:26:42 +0000
Received: by outflank-mailman (input) for mailman id 77404;
 Thu, 28 Jan 2021 18:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zOoK=G7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l5C09-0002Fl-Gn
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 18:26:41 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23feb9e0-5aca-4058-a2fa-0dd5fac1ac47;
 Thu, 28 Jan 2021 18:26:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10SIQTVO034546
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 28 Jan 2021 13:26:35 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10SIQTNv034545;
 Thu, 28 Jan 2021 10:26:29 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 23feb9e0-5aca-4058-a2fa-0dd5fac1ac47
Date: Thu, 28 Jan 2021 10:26:29 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        Roger Pau Monn?? <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBMB1VUhYd3RUuDO@mattapan.m5p.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
 <YBHo/gscAfcAZqst@mattapan.m5p.com>
 <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44450edc-9a64-8a6e-e8d3-3a3f726a96bc@suse.com>

On Thu, Jan 28, 2021 at 11:19:41AM +0100, Jan Beulich wrote:
> On 27.01.2021 23:28, Elliott Mitchell wrote:
> > On Wed, Jan 27, 2021 at 09:03:32PM +0000, Andrew Cooper wrote:
> >> So.?? What *should* happen is that if QEMU/OVMF dirties more memory than
> >> exists in the PoD cache, the domain gets terminated.
> >>
> >> Irrespective, Xen/dom0 dying isn't an expected consequence of any normal
> >> action like this.
> >>
> >> Do you have a serial log of the crash??? If not, can you set up a crash
> >> kernel environment to capture the logs, or alternatively reproduce the
> >> issue on a different box which does have serial?
> > 
> > No, I don't.  I'm setup to debug ARM failures, not x86 ones.
> 
> Then alternatively can you at least give conditions that need to
> be met to observe the problem, for someone to repro and then
> debug? (The less complex the better, of course.)

Multiple prior messages have included statements of what I believed to be
the minimal case to reproduce.  Presently I believe the minimal
constraints are, maxmem >= host memory, memory < free Xen memory, type
HVM.  A minimal kr45hme.cfg file:

type = "hvm"
memory = 1024
maxmem = 1073741824

I suspect maxmem > free Xen memory may be sufficient.  The instances I
can be certain of have been maxmem = total host memory *7.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



