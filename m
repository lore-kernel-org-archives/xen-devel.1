Return-Path: <SRS0=B7KG=DO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57562C4363D
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 12:06:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD6A7206A1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2020 12:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GPi5Mh18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD6A7206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3483.9956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ8D5-0006Zd-Ga; Wed, 07 Oct 2020 12:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3483.9956; Wed, 07 Oct 2020 12:06:19 +0000
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
	id 1kQ8D5-0006ZW-DV; Wed, 07 Oct 2020 12:06:19 +0000
Received: by outflank-mailman (input) for mailman id 3483;
 Wed, 07 Oct 2020 12:06:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01DM=DO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQ8D4-0006ZR-7H
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:06:18 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95d155b2-9b10-4fd8-9dc7-91acebbd19d0;
 Wed, 07 Oct 2020 12:06:16 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01DM=DO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQ8D4-0006ZR-7H
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 12:06:18 +0000
X-Inumbo-ID: 95d155b2-9b10-4fd8-9dc7-91acebbd19d0
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 95d155b2-9b10-4fd8-9dc7-91acebbd19d0;
	Wed, 07 Oct 2020 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602072376;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=m3SuyyN2yZpMa2yaDM+nPRt2deuYIQhv2ciHoSUXzD0=;
  b=GPi5Mh18lVa+9QDBXyJeWsg2QIfW5fAp6xEzJ3K8X2n13SlUiGFg53Ac
   fHS9UTofN5J9JGBPTv32k54rgdpb8Y6QLrJrPOS69jB95Xeok1ptTxYTy
   NFAO69IJuWqWcF/5uWSRfqTQisq0TuEk4MMHxTrFzAWioP9aizHyy5bq6
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BaIv2Wax62EAN2daRSd2U/HH+6uWX1atyufJSqrxLzJzkA51tbYdEx7J3nLqzXXzKSOWi9bvXT
 h9krM4e5VP/FBUZ2BYWHn1sGZgnF/lqJS8V/6IoKrKZxBV5gm9yMJC+CWvHv92SqIzu5lmLt61
 y29GsrtHOmuSE3ywbChscZLOCyD/dndSFhbfOyResNycJCiv8X30OurD9g1nn4TL6G9gB+l/Fl
 pFHLpd6I2g7zh0nRcZr9E84ofVCXVfXv88WCs0zF7yNE+kMZFrdiHwtx8xdomOaIknYme24xQz
 Lv0=
X-SBRS: None
X-MesageID: 28555886
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,346,1596513600"; 
   d="scan'208";a="28555886"
Subject: Re: [PATCH] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201006162327.93055-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a98d6cb1-0b1d-8fb8-8718-c65e02e448bb@citrix.com>
Date: Wed, 7 Oct 2020 13:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006162327.93055-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 06/10/2020 17:23, Roger Pau Monne wrote:
> Currently a PV hardware domain can also be given control over the CPU
> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.

This might be how the current logic "works", but its straight up broken.

PERF_CTL is thread scope, so unless dom0 is identity pinned and has one
vcpu for every pcpu, it cannot use the interface correctly.

> However since commit 322ec7c89f6 the default behavior has been changed
> to reject accesses to not explicitly handled MSRs, preventing PV
> guests that manage CPU frequency from reading
> MSR_IA32_PERF_{STATUS/CTL}.
>
> Additionally some HVM guests (Windows at least) will attempt to read
> MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
>
> vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
> d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
>
> Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
> handling shared between HVM and PV guests, and add an explicit case
> for reads to MSR_IA32_PERF_{STATUS/CTL}.

OTOH, PERF_CTL does have a seemingly architectural "please disable turbo
for me" bit, which is supposed to be for calibration loops.  I wonder if
anyone uses this, and whether we ought to honour it (probably not).

> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index d8ed83f869..41baa3b7a1 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1069,6 +1069,12 @@ extern enum cpufreq_controller {
>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>  } cpufreq_controller;
>  
> +static inline bool is_cpufreq_controller(const struct domain *d)
> +{
> +    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
> +            is_hardware_domain(d));

This won't compile on !CONFIG_X86, due to CONFIG_HAS_CPUFREQ

Honestly - I don't see any point to this code.  Its opt-in via the
command line only, and doesn't provide adequate checks for enablement. 
(It's not as if we're lacking complexity or moving parts when it comes
to power/frequency management).

~Andrew

> +}
> +
>  int cpupool_move_domain(struct domain *d, struct cpupool *c);
>  int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
>  int cpupool_get_id(const struct domain *d);


