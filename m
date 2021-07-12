Return-Path: <SRS0=qW8Y=ME=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6F0C07E9C
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 15:22:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEBA661221
	for <xen-devel@archiver.kernel.org>; Mon, 12 Jul 2021 15:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEBA661221
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.154603.285651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2xlC-0005EA-Eq; Mon, 12 Jul 2021 15:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154603.285651; Mon, 12 Jul 2021 15:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2xlC-0005E3-Bk; Mon, 12 Jul 2021 15:22:18 +0000
Received: by outflank-mailman (input) for mailman id 154603;
 Mon, 12 Jul 2021 15:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKSD=ME=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m2xlA-0005Dw-PE
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 15:22:16 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1e120bd-e286-43c5-98c1-4fbf908f60bb;
 Mon, 12 Jul 2021 15:22:15 +0000 (UTC)
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
X-Inumbo-ID: d1e120bd-e286-43c5-98c1-4fbf908f60bb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626103335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OqzM52hAuO0JMLI/f2YPIKbXHI3aQoZ29E+wY6ZE+Zk=;
  b=EQpI/l6RadLXO1crTfraxNUDIduv13qm10EZ5VorDF12GI5zGH72itxJ
   zivXYTjKwIgI9w2lG9uTcBT7i90UWr2593kzwbcfx2Z7NGZnA3PxJ6yzO
   ZjSXg2gsiOLNosMp705ERoFkXtHCaZcxtZ1bj25PAxQ1RenID9JhJtUic
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oLmyHTcK2Tb5AHkx9L2hkNnM8SumIBKOdhJJOWewB3tbjVseW5Gl7FeH8JcXkoNp61PJsFAB++
 dvJEmVNLcrk6Va/3ECS3onqr1QEc7+1EMP5uo5MqZWLrlnBBgykW79Fslweg+76A9V2ciMkpcq
 K7viZPNioyWhKKzvRiHeKun0eTvKEhAP1y/CTZ/rbma8Qd0NinJ00iBZ0BcLOZBqjVih1ntqXB
 SLj2b+5OfZK+zV1j3XUwZ9TmufcZ7aQy6pO6z2aSB9oUGouu1CJqruEF9Yx95lrJxNhZ1eW0cR
 7wM=
X-SBRS: 5.1
X-MesageID: 48137041
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sQIWoaCrozRAy8LlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.84,234,1620705600"; 
   d="scan'208";a="48137041"
Date: Mon, 12 Jul 2021 16:22:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v6 12/31] build: use subdir-y in test/Makefile
Message-ID: <YOxeI1Bn1nxNMjb2@perard>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-13-anthony.perard@citrix.com>
 <b93fcbc5-8b4f-7d17-7d0a-cd2cbf6fd2fe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b93fcbc5-8b4f-7d17-7d0a-cd2cbf6fd2fe@suse.com>

On Wed, Jul 07, 2021 at 05:26:13PM +0200, Jan Beulich wrote:
> On 01.07.2021 16:09, Anthony PERARD wrote:
> > --- a/xen/test/Makefile
> > +++ b/xen/test/Makefile
> > @@ -4,15 +4,10 @@ tests all: build
> >  
> >  ifneq ($(XEN_TARGET_ARCH),x86_32)
> >  # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
> > -SUBDIRS += livepatch
> > +subdir-y += livepatch
> >  endif
> 
> As per xen/Rules.mk having
> 
> subdir-y := $(subdir-y) $(filter %/, $(obj-y))
> obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
> ...
> subdir-obj-y := $(filter %/built_in.o, $(obj-y))
> 
> this will result in building of livepatch/built_in.o afaict. Is
> this an intended but benign side effect?

Actually, nothing in Rules.mk is using $(subdir-y) other than updating
it with possible subdir from $(obj-y).
Recursion into a subdir only happen if it is listed in $(obj-y) and thus
should be part of a built_in.o. Rules.mk doesn't have a mean to recurs
otherwise.

So nothing is actually going to try to build livepatch/build_in.o due to
$(subdir-y).

> >  install build subtree-force-update uninstall: %:
> > -	set -e; for s in $(SUBDIRS); do \
> > +	set -e; for s in $(subdir-y); do \
> >  		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $*; \
> >  	done
> > -
> > -clean::
> > -	set -e; for s in $(SUBDIRS); do \
> > -		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $@; \
> > -	done
> 
> And then why can't the generic recursion rule in xen/Rules.mk
> not also be used for the "build" target? (I guess "install" and
> "uninstall" need to remain separate, and don't think I know what
> "subtree-force-update" is about.)

There's some more changed in a later patch[1] to Rules.mk which would
make it possible to remove the need for a "build" target and I actually
remove the "build" target as well as the "subtree-force-update" target.
Some more changes in tests/livepatch/ are done in patch[2] which
actually allow to remove the "build" target.

    [1] build: build everything from the root dir, use obj=$subdir
    [2] build: rework test/livepatch/Makefile

I think the "subtree-force-update" target as to do with having the same
logic to deal with $(SUBDIRS) as the logic in tools/ and the top
makefile, but might not have been actually hooked up.

Cheers,

-- 
Anthony PERARD

