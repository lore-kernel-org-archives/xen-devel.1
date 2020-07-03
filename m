Return-Path: <SRS0=DZRD=AO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFA4C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2020 15:03:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197FD2088E
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2020 15:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="fU+77xgn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197FD2088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrNDI-0002bV-PD; Fri, 03 Jul 2020 15:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x5eZ=AO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jrNDH-0002bQ-LL
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 15:02:51 +0000
X-Inumbo-ID: 42d8e88c-bd3e-11ea-b7bb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42d8e88c-bd3e-11ea-b7bb-bc764e2007e4;
 Fri, 03 Jul 2020 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1593788570;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fDuNXfjpdF6Jk5EWJfB857d+zYqdvN5+NOL4vz2VmOo=;
 b=fU+77xgni0sMfyPL9GIenNu8In5M+h2tBHu0j1P6VeIQiXvrE/ZoZFJQ
 KkmepWMN9JaEg8rAdjHoZeO3DQuCAy9NdtJX2XJd6Izgw8a9VQbGc8TYG
 E/mR2aR3Y+EDHFMmvzkwV7xYVhLqilbmAgfTkCT3/Zsj+pG1mCehw9985 U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vG574Rd6OoB1Efr/Jdl5cuCLYxoJKIA8GGEAAq3HtmQOdGKHvYVZf6SFQp1xxaNGXuWsI6Xa8v
 U8AUk/4KIbgsuKNLCkngh46JVx5/vPBZe50coLMX46gugaemkIOpLvxutnE40Sty1t3zHZSIcB
 TelkoHqTnySRT3lJdSENuvNMPKdzxIVXmdVaMRtfdrwEVWl8NqcbcjJ1wVQqoFApEp5kx8MkLX
 E6nt9BQFKrPBy+VoU7WFP0UZZMP1yV8pdPvO7i0HhUxEVXgw2a6pgG1h7ocVXXkLIBdayxXcqM
 /uU=
X-SBRS: 2.7
X-MesageID: 22387314
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,308,1589256000"; d="scan'208";a="22387314"
Subject: Re: vPT rework (and timer mode)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200701090210.GN735@Air-de-Roger>
 <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
Date: Fri, 3 Jul 2020 16:02:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/07/2020 15:50, Jan Beulich wrote:
> On 01.07.2020 11:02, Roger Pau Monné wrote:
>> It's my understanding that the purpose of pt_update_irq and
>> pt_intr_post is to attempt to implement the "delay for missed ticks"
>> mode, where Xen will accumulate timer interrupts if they cannot be
>> injected. As shown by the patch above, this is all broken when the
>> timer is added to a vCPU (pt->vcpu) different than the actual target
>> vCPU where the interrupt gets delivered (note this can also be a list
>> of vCPUs if routed from the IO-APIC using Fixed mode).
>>
>> I'm at lost at how to fix this so that virtual timers work properly
>> and we also keep the "delay for missed ticks" mode without doing a
>> massive rework and somehow keeping track of where injected interrupts
>> originated, which seems an overly complicated solution.
>>
>> My proposal hence would be to completely remove the timer_mode, and
>> just treat virtual timer interrupts as other interrupts, ie: they will
>> be injected from the callback (pt_timer_fn) and the vCPU(s) would be
>> kicked. Whether interrupts would get lost (ie: injected when a
>> previous one is still pending) depends on the contention on the
>> system. I'm not aware of any current OS that uses timer interrupts as
>> a way to track time. I think current OSes know the differences between
>> a timer counter and an event timer, and will use them appropriately.
> Fundamentally - why not, the more that this promises to be a
> simplification. The question we need to answer up front is whether
> we're happy to possibly break old OSes (presumably ones no-one
> ought to be using anymore these days, due to their support life
> cycles long having ended).

The various timer modes were all compatibility, and IIRC, mostly for
Windows XP and older which told time by counting the number of timer
interrupts.

Paul - you might remember better than me?

Its possibly worth noting that issues in this are cause triple faults in
OVMF (it seems to enable interrupts in its timer handler), and breaks
in-guest kexec (because our timer-targetting logic doesn't work in a way
remotely close to real hardware when the kexec kernel is booting on a
non-zero vCPU).

~Andrew

