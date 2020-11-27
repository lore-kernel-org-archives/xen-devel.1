Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14304C2D0E4
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 13:31:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6B72087C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 13:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6B72087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39332.72192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidqX-0000f2-F7; Fri, 27 Nov 2020 13:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39332.72192; Fri, 27 Nov 2020 13:31:33 +0000
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
	id 1kidqX-0000ev-Bm; Fri, 27 Nov 2020 13:31:33 +0000
Received: by outflank-mailman (input) for mailman id 39332;
 Fri, 27 Nov 2020 13:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kidqW-0000eq-9i
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:31:32 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2e41ab0-119d-43d7-8b7c-8d4a451e69a8;
 Fri, 27 Nov 2020 13:31:31 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ARDVQp6000255
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 14:31:27 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 3B00C2E9CAC; Fri, 27 Nov 2020 14:31:21 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kidqW-0000eq-9i
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:31:32 +0000
X-Inumbo-ID: b2e41ab0-119d-43d7-8b7c-8d4a451e69a8
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b2e41ab0-119d-43d7-8b7c-8d4a451e69a8;
	Fri, 27 Nov 2020 13:31:31 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ARDVQp6000255
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2020 14:31:27 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 3B00C2E9CAC; Fri, 27 Nov 2020 14:31:21 +0100 (MET)
Date: Fri, 27 Nov 2020 14:31:21 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127133121.GN1717@antioche.eu.org>
References: <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
 <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 27 Nov 2020 14:31:27 +0100 (MET)

On Fri, Nov 27, 2020 at 02:18:54PM +0100, Jan Beulich wrote:
> On 27.11.2020 14:13, Manuel Bouyer wrote:
> > On Fri, Nov 27, 2020 at 12:29:35PM +0100, Jan Beulich wrote:
> >> On 27.11.2020 11:59, Roger Pau Monné wrote:
> >>> --- a/xen/arch/x86/hvm/irq.c
> >>> +++ b/xen/arch/x86/hvm/irq.c
> >>> @@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> >>>       * to know if the GSI is pending or not.
> >>>       */
> >>>      spin_lock(&d->arch.hvm.irq_lock);
> >>> +    if ( gsi == TRACK_IRQ )
> >>> +        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
> >>> +                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);
> >>
> >> This produces
> >>
> >> 81961 hvm_gsi_assert irq 34 trig 1 assert count 1
> >>
> >> Since the logging occurs ahead of the call to assert_gsi(), it
> >> means we don't signal anything to Dom0, because according to our
> >> records there's still an IRQ in flight. Unfortunately we only
> >> see the tail of the trace, so it's not possible to tell how / when
> >> we got into this state.
> >>
> >> Manuel - is this the only patch you have in place? Or did you keep
> >> any prior ones? Iirc there once was one where Roger also suppressed
> >> some de-assert call.
> > 
> > Yes, I have some of the previous patches (otherwise Xen panics).
> > Attached is the diffs I currently have 
> 
> I think you want to delete the hunk dropping the call to
> hvm_gsi_deassert() from pt_irq_time_out(). Iirc it was that
> addition which changed the behavior to just a single IRQ ever
> making it into Dom0. And it ought to be only the change to
> msix_write() which is needed to avoid the panic.

yes, I did keep the hvm_gsi_deassert() patch because I expected it
to make things easier, as it allows to interract with Xen without changing
interrupt states.
I removed it, here's a new trace

http://www-soc.lip6.fr/~bouyer/xen-log12.txt

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

