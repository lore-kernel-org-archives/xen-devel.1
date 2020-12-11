Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239C0C433FE
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 15:50:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F9E23329
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 15:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F9E23329
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50739.89489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knkgC-0000o2-11; Fri, 11 Dec 2020 15:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50739.89489; Fri, 11 Dec 2020 15:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knkgB-0000nv-US; Fri, 11 Dec 2020 15:49:59 +0000
Received: by outflank-mailman (input) for mailman id 50739;
 Fri, 11 Dec 2020 15:49:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkE0=FP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1knkgA-0000nq-Am
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 15:49:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1827a939-1510-4203-9c69-e247b60fa3b5;
 Fri, 11 Dec 2020 15:49:57 +0000 (UTC)
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
X-Inumbo-ID: 1827a939-1510-4203-9c69-e247b60fa3b5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607701797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HXzTfy3peath7yRLaZn9TW89udAT16dHtncFLJ3VpKg=;
  b=bG8B7/upISNdWKom9r8abGzjYriXh4XqUTngJB6BV3llXRJKDzqn4Q9M
   6jJC0Q6INNpDBSm+chbV7/SK6dkOJ42NQ4UQLfb8QHX7uee29MB2PFFuw
   suuvh2giGhW/uwAu7DdgOV49ucSd+5f1OZszb6oU3tDM9kK2nEii7l95y
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: q4fG5HaXf2FgSuNaHkpsHh4khpNkmWCUkJYwlzY9LM+hFG1971iZxTjqCSjNRHZxVSF491GMJq
 8gKghUbMHToYeBj+DLRPbS3bHsIATEx/5gH36HYbhXg+RXXto6mOKsCiAiXEIZUgfAgZp0BG24
 HCSiAz9x4da5Z5t1wDnooyB2lyxGD7ClfL4poULbmfRv6a04WcnsdtxysB2UTvCu2C3rwAvF30
 RgghDWFDrR5tb/OBC3duU2l+MWRNvjH/ZsVYmn4FMvsfcmn2sPvqTySqoo7ChEbxVKHItOleoq
 Qho=
X-SBRS: 5.2
X-MesageID: 33385861
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,411,1599537600"; 
   d="scan'208";a="33385861"
Date: Fri, 11 Dec 2020 15:49:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/8] lib: collect library files in an archive
Message-ID: <X9OVIGVdEteBNRIn@perard.uk.xensource.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
 <X9I1GCAM2nn8W8eN@perard.uk.xensource.com>
 <65b94fd1-c840-cb1b-51f7-c9a5b158cc1e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <65b94fd1-c840-cb1b-51f7-c9a5b158cc1e@suse.com>

On Fri, Dec 11, 2020 at 11:00:19AM +0100, Jan Beulich wrote:
> On 10.12.2020 15:47, Anthony PERARD wrote:
> > On Mon, Nov 23, 2020 at 04:21:19PM +0100, Jan Beulich wrote:
> >> --- a/xen/Rules.mk
> >> +++ b/xen/Rules.mk
> >> @@ -60,7 +64,14 @@ include Makefile
> >>  # ---------------------------------------------------------------------------
> >>  
> >>  quiet_cmd_ld = LD      $@
> >> -cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
> >> +cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
> >> +               --start-group $(filter %.a,$(real-prereqs)) --end-group
> > 
> > It might be a bit weird to modify the generic LD command for the benefit
> > of only prelink.o objects but it's probably fine as long as we only use
> > archives for lib.a. libelf and libfdt will just have --start/end-group
> > added to there ld command line. So I guess the change is fine.
> 
> I'm afraid I don't understand what the concern is. Neither libelf
> nor libfdt use any %.a right now. Or are you referring to them
> merely because it's just them which have got converted to using
> $(call if-changed ...), and your remark would eventually apply to
> e.g. built_in.o as well? And then further is all you're worried
> about the fact that there may be "--start-group  --end-group" on
> the command line, i.e. with nothing inbetween? If so, besides
> possibly looking a little odd if someone inspected the command
> lines closely, what possible issue do you see? (If there is one,
> making the addition of both options conditional upon there being
> any/multiple %.a in the first place wouldn't be a big problem,
> albeit Linux also doesn't care whether ${KBUILD_VMLINUX_LIBS} is
> empty.)

Well, maybe one day we might want to collect objects in build_in.a archives
rather than build_in.o, like Linux does, but Xen is probably too small
for that to have any impact on the time it takes to build. And if that
happen, we will have to change the linker's command anyway to use
--whole-archive. So the change is fine.

As for "--start-group --end-group", yes it would just look odd, but I don't
think there would by any issue with option added to the command line.

> > The rest looks good,
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Thanks, but I'd prefer the above clarified.
> 
> Jan

-- 
Anthony PERARD

