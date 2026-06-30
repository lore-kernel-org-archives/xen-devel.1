Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388C7C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 15:45:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349150.1607028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaeO-0003fE-AP; Tue, 30 Jun 2026 15:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349150.1607028; Tue, 30 Jun 2026 15:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weaeO-0003ep-7U; Tue, 30 Jun 2026 15:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1349150;
 Tue, 30 Jun 2026 15:45:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1weaeM-0003cB-PY
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 15:45:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weaeM-00HD94-6V
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 17:45:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a43e487-bab6-0a2a0a5309dd-0a2a450aeb2e-40
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:45:26 +0200
Received: from [46.105.58.60] (helo=3.mo575.mail-out.ovh.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a43e495-e40e-0a2a450a0019-2e693a3ccee9-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 17:45:25 +0200
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.0.145])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4gqSCT2pLNz5xbN
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 15:45:25 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5kzb6 (unknown [10.110.118.7])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 81E56C2A13;
 Tue, 30 Jun 2026 15:45:24 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-7d8d68f679-5kzb6 with ESMTPSA
 id IkJEFpTkQ2or9hgAsVWoiA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 30 Jun 2026 15:45:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-101G004ac15717a-dbdb-4e77-be63-62c3daec98d0,
                    8153FC81E90989DE28CEFA46AD98A6783E51CAAD) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.183.249
Date: Tue, 30 Jun 2026 18:45:20 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 21/22] x86/cpu: report SMX, TXT and SKINIT capabilities
Message-ID: <akPkkO_JloZ5aPS_@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <6fb0f217027fc323d3c23e94bb99bc56e06f9763.1748611041.git.sergii.dmytruk@3mdeb.com>
 <ee91de9d-f62f-49fb-9cb7-8b0689ad11c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee91de9d-f62f-49fb-9cb7-8b0689ad11c3@suse.com>
x-ovh-tracer-id: 16471071215159354844
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEgqZoWqJmOPEfuxhIsb3eiV30xYhdlu+VNXmL5v66P4efXzwRCUIHn5rAQheQqQ9d1EeU5wKllI5RQAFy9JQ+lR379uXK9Hn2dBqR3BytZjm5tvoUjwOvNMrdkRt08oXlnYVVv8Cgocz7qlWJ64DLk57qW7l/iF/sUW/uEJJZptEaYREljiRoyfRuuWTPih7z33HuftZyMGo/qL38Q6AG/2t0uAjNZD5cvp0Ij1lETOKNN2WvofCNqEblPXEb21JW3ObZdC8b6rmAvB9fC6/DyJ5K9qFgw4Em9eJCSF0TB4kzitBWPJC+6dVypARmFZSMZp4qJaUrwMC+tjYuTBiq5X+FswV0+lDPXfVZq84mBG2E0oM4TU9RGHChFwMxcf4NixC/cNUyDDV70qLv/2zx5K68H24QktQB7VbSAl+mHNyq3m2EAokEQs0WKsmREnBC9/ikJ21m2aRVkf6bhVAK8TGEUH+PSVFNuyfrHnktLgQ0zfSlPmFElBXxCHt95GXUzgCDHVVruZmoa9AGTIu7CUFtbdHJHxDrpZEIvxzCNpp+LmsMDUQasuVrxyxlkm5/JlUBCGFBOPH12+sgdHYiSrdjn/WZMM/ZokwLkuO1bxe14omf9gDOPEF8MfRzqxrPQdErH5A8TOgCTBlx7gIRgupBiDfthrjjphD+rZ1jhDg
DKIM-Signature: a=rsa-sha256; bh=mkbY/YHVW/FAFq+/W8c1zaFoCQJqMuoszN7V2mJrFjA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782834325; v=1;
 b=TBbFwbxhv/EErAMYKEyeEx/1WholTdPNV9mXUGDvKhEAdjlIx/DqzpUPdDZDyJfiT6Z9oMag
 VgAd4iNEMOUcyTwXTswd9TGU4fxexpYT84UStpiUx5CC+uEAdmXPyNJp4m5S0IgquNPc378WqxB
 wZcAaRzlulVyUE6/J4S4Jh6cc1BiKLho1re27ZfDB97XcWQUqYxSTMqVtuXEmaTP2mmeVWPrOi0
 /awqbUi9sznRSt1uIXhLBd7mptn7vZFdfMvcTh3xPJC1B6L7N0lTKwovbFp5w7s3EsOVPz8N/VJ
 BMm4geITi9Lw/hnFD6hB5BCEr1lz1IVz09hDGjXpsktmA==
X-purgate-ID: tlsNG-4011c0/1782834326-D472EDDE-7392C2C5/0/0
X-purgate-type: clean
X-purgate-size: 1450

On Thu, Jan 22, 2026 at 04:58:48PM +0100, Jan Beulich wrote:
> On 30.05.2025 15:18, Sergii Dmytruk wrote:
> > --- a/xen/arch/x86/cpu/amd.c
> > +++ b/xen/arch/x86/cpu/amd.c
> > @@ -688,6 +688,21 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
> >  #undef FREQ
> >  }
> >
> > +void amd_log_skinit(const struct cpuinfo_x86 *c)
> > +{
> > +    /*
> > +     * Run only on BSP and not during resume to report the capability only once.
> > +     */
> > +    if ( system_state != SYS_STATE_resume && smp_processor_id() )
> > +        return;
>
> Comment and code look to not fit together. DYM
>
>     if ( system_state == SYS_STATE_resume || smp_processor_id() )
>         return;
>
> ?
>
> [...]
>
> Same here?

Right, thanks for pointing this out, something went wrong when adding
system state check.

> > +    cr4_val = read_cr4();
> > +    if ( !(cr4_val & X86_CR4_SMXE) )
> > +        write_cr4(cr4_val | X86_CR4_SMXE);
> > +
> > +    asm volatile ("getsec\n"
> > +        : "=a" (getsec_caps)
> > +        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
> > +
> > +    if ( getsec_caps & GETSEC_CAP_TXT_CHIPSET )
> > +        printk("Chipset supports TXT\n");
> > +    else
> > +        printk("Chipset does not support TXT\n");
> > +
> > +    if ( !(cr4_val & X86_CR4_SMXE) )
> > +        write_cr4(cr4_val & ~X86_CR4_SMXE);
>
> Move this ahead of the printk()s?
>
> Jan

Makes sense, will do.

Regards

