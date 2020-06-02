Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E746C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 13:50:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673632074B
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 13:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673632074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg7J8-0000e5-NN; Tue, 02 Jun 2020 13:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTPG=7P=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jg7J7-0000du-TF
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:50:21 +0000
X-Inumbo-ID: ffd2557e-a4d7-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffd2557e-a4d7-11ea-9947-bc764e2007e4;
 Tue, 02 Jun 2020 13:50:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: E7Rn2YMmA958G1Z6kBO/USICXAcuI7mINNu7W7fIaBoWckAbew7dnM0Y1+xVB8aqy+cq6YWfOB
 iQKNG88JWG7uraQFJI0aAZp652XMm1oybedDGy/RuCpHTSMxzqObV9OXNgXqMTh/DNqKNn/ubg
 /bNX5jnwLrjxgKlWpVtOGfMd41z8sAzk1JlkoHf801okrFvVHDXCxdyLx7Q4mir5mS4oiwPGRM
 gMhmxtqyMPhXT8UGGzRZ6KGhcyOytch/KthGTUW4pI5FCu+qteJvgJJuEhS45j08pUKLLc9j9g
 GVk=
X-SBRS: 2.7
X-MesageID: 19313578
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,464,1583211600"; d="scan'208";a="19313578"
Date: Tue, 2 Jun 2020 14:50:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
Message-ID: <20200602135010.GO2105@perard.uk.xensource.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
 <f6ec0a0e-c7d0-22b5-b633-458a7fe2375f@citrix.com>
 <b3f62c64-9845-22b9-6855-91a3ecde421c@suse.com>
 <20200602122614.GN2105@perard.uk.xensource.com>
 <3328fabd-c133-00a9-2ec0-addcf15dbff5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3328fabd-c133-00a9-2ec0-addcf15dbff5@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 02:41:30PM +0200, Jan Beulich wrote:
> On 02.06.2020 14:26, Anthony PERARD wrote:
> > On Tue, Jun 02, 2020 at 02:06:11PM +0200, Jan Beulich wrote:
> >> I don't recall; perhaps I was in another parallel session? If it's
> >> the one with notes at
> >> https://lists.xenproject.org/archives/html/xen-devel/2019-07/msg00786.html
> >> then a remark close to the top suggests I was there, but there's no
> >> sign of this aspect having got discussed. There is, among the issues
> >> listed, "Xen build re-evaluates compiler support for every translation
> >> unit", but that's only remotely related.
> > 
> > What is a "translation unit"? What would that have to do with Kconfig?
> 
> A translation unit is the collective input from all source and
> header files seen by the compiler during the processing of one
> top level input file's worth of compilation.

Thanks. Now it feels like the issue listed in the design session note
isn't exactly correct, compiler didn't used to be evaluated once per CU,
but only once per Makefile loaded/executed.

> The connection to
> Kconfig here is that by switching to it, the compiler flags
> don't get re-constructed once per CU. Of course doing it via
> Kconfig is not the only possible solution to the problem (as
> can be seen from the patch that I had intermediately submitted
> to get at least the HAVE_AS_* out of that set), but for us the
> change in behavior is one intended (side-)effect of the switch
> to newer Kconfig.

Well, with a recent patch of mine, tool chain support should already be
only evaluated only once in the root Makefile. So I do also think that
we don't need to move all of them to Kconfig.

So advantage of evaluating some compiler flags in Kconfig is that we
can have other CONFIG_* depends on those flags; the inconvenient is to
figure out when do we need to re-evaluate the .config.

-- 
Anthony PERARD

