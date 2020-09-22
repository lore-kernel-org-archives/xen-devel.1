Return-Path: <SRS0=tzN1=C7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6455C2D0E2
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 08:44:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17090238A1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2020 08:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XQ51OI9z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17090238A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKdtZ-0007Dq-VY; Tue, 22 Sep 2020 08:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKdtY-0007Dl-Ef
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 08:43:28 +0000
X-Inumbo-ID: 6b73856d-bb26-40a1-96b8-aceb2defc16f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b73856d-bb26-40a1-96b8-aceb2defc16f;
 Tue, 22 Sep 2020 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600764207;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IJKBn+QCCvDBIR9V53YpwjzD0k5fIPqmW6xzAQzTAvM=;
 b=XQ51OI9z6ZpC8mK6ttSIpZUNCuPfDEOST3kgN80aEsoofjH2ewz06LlK
 YvGIbra4i0yf+7s06xpx/BMdysATdNqyEwbB1JGQpJjYJUAjUAIA3ygSQ
 nZgP2LOmP/w3uUF7UqYfQZItkPtuPYyKpAGuqTBoLHSo9/0rdtbdZG6xI 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0MhhcbD63KwiML7VPjN+LEH9FqSMVM9lrH5dpj08dDnHwewOpMwECuflvsswLk1wrtm/JvuCF6
 rNTN9Btejor4VCsazya6DXzlluedEsYDOuVeHdEF7CzLfiUfjsrTdYeZar0SSGDDgZxPuho2D+
 serYavMDRvxbbWG8WGVdXhh9aoJEHQoRUgzO6GMG9B6g9sdCP1fjDvdsqIcG9W/DP3LNwfRDKR
 fu+26CH5boLRfhNoNHiBfk1ZYPvgkrRs2PGjUA1wBAFPEs95TXd5uNo2gyIDUprJpyWYhkZADk
 9As=
X-SBRS: 2.7
X-MesageID: 27568114
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,290,1596513600"; d="scan'208";a="27568114"
Date: Tue, 22 Sep 2020 10:43:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/mm: do not mark IO regions as Xen heap
Message-ID: <20200922084318.GI19254@Air-de-Roger>
References: <20200910133514.82155-1-roger.pau@citrix.com>
 <3b61c04e-b2ef-a9c6-c3c4-e1d8624e7115@suse.com>
 <20200921153545.GG19254@Air-de-Roger>
 <d25d6fe1-da67-2378-3b25-8046a9bd655f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d25d6fe1-da67-2378-3b25-8046a9bd655f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 21, 2020 at 05:49:45PM +0200, Jan Beulich wrote:
> On 21.09.2020 17:35, Roger Pau Monné wrote:
> > On Mon, Sep 21, 2020 at 04:22:26PM +0200, Jan Beulich wrote:
> >> On 10.09.2020 15:35, Roger Pau Monne wrote:
> >>> arch_init_memory will treat all the gaps on the physical memory map
> >>> between RAM regions as MMIO and use share_xen_page_with_guest in order
> >>> to assign them to dom_io. This has the side effect of setting the Xen
> >>> heap flag on such pages, and thus is_special_page would then return
> >>> true which is an issue in epte_get_entry_emt because such pages will
> >>> be forced to use write-back cache attributes.
> >>>
> >>> Fix this by introducing a new helper to assign the MMIO regions to
> >>> dom_io without setting the Xen heap flag on the pages, so that
> >>> is_special_page will return false and the pages won't be forced to use
> >>> write-back cache attributes.
> >>>
> >>> Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
> >>
> >> Is this really the correct commit? I had this queued for backport,
> >> and ended up discarding it from the queue based on this tag, just
> >> to then noticing that I remembered correctly that I did backport
> >> ca24b2ffdbd9 ("x86/hvm: set 'ipat' in EPT for special pages") to
> >> the stable trees already. Isn't it _this_ commit which the change
> >> here fixes?
> > 
> > My bisection pointed to that exact commit as the one that broke my PVH
> > dom0 setup, so yes, I'm quite sure that's the commit at least on the
> > box that I've bisected it.
> > 
> > ca24b2ffdbd9 was still fine because previous to the is_special_page
> > check loop there was still the `if ( direct_mmio ) ...` handling,
> > which made all MMIO regions except for the APIC access page forcefully
> > have it's cache attributes set to UC.
> 
> Ah yes, I see - thanks. Makes me less sure whether the patch
> here really wants backporting.

As long as 81fd0d3ca4b2cd is not backported, then I would argue to not
backport this either. I don't see much benefit in backporting this
alone, and the risk of introducing a non intended functionality change
as a result of not marking MMIO pages as Xen heap is possible.

Thanks, Roger.

