Return-Path: <SRS0=uD6j=O3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BC7C433F5
	for <xen-devel@archiver.kernel.org>; Thu,  7 Oct 2021 20:42:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 579A96101E
	for <xen-devel@archiver.kernel.org>; Thu,  7 Oct 2021 20:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 579A96101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.204007.359199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaDd-0003Np-Bn; Thu, 07 Oct 2021 20:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204007.359199; Thu, 07 Oct 2021 20:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYaDd-0003Ni-8z; Thu, 07 Oct 2021 20:42:21 +0000
Received: by outflank-mailman (input) for mailman id 204007;
 Thu, 07 Oct 2021 20:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYaDb-0003Nb-UA
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:42:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10254746-27af-11ec-8000-12813bfff9fa;
 Thu, 07 Oct 2021 20:42:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 072D76101E;
 Thu,  7 Oct 2021 20:42:17 +0000 (UTC)
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
X-Inumbo-ID: 10254746-27af-11ec-8000-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633639338;
	bh=Aoksu8Zz7vmyFYlMhas1DZZ+gfNcIDpqgf688zBV9D8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FJvggSgKn90XoZcVrExOh38ztE6IDydDopvfHtHM7I3n364rIjKS/0/8859McIgLB
	 +nNg4D/IWcL8ni5i4QqcIM3NpAlU2gEph8fFCqzk575CbIy3d8halCk9hQGGl3uxZw
	 buYOvUSaEUsolRLPs+EK5+T6Omr5TZx+HY4dn8fbucthZkBk7kuyBNCLuLIBG1wU56
	 KA4pmjk94r7BT0aP0M0dGdeexsKe+TNVjL233+/LfnObp/YzHM2m2B6zv5uBHVhbsw
	 5ble2whfVtEYcbM1J2JAlo5FoK3j72Cx3BXYnH1hza5fSNh758qKcc3uDk9cPBaHN7
	 oxqu7QFP+U31Q==
Date: Thu, 7 Oct 2021 13:42:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 3/3] xen/arm: Updates for extended regions support
In-Reply-To: <ff6800b3-74f0-3203-6465-1547644924e2@gmail.com>
Message-ID: <alpine.DEB.2.21.2110071337550.414@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-4-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2110061843360.3209@sstabellini-ThinkPad-T480s> <a5a81348-4b18-6be6-ba85-4c31172459dc@gmail.com>
 <alpine.DEB.2.21.2110071300380.414@sstabellini-ThinkPad-T480s> <ff6800b3-74f0-3203-6465-1547644924e2@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Oct 2021, Oleksandr wrote:
> On 07.10.21 23:06, Stefano Stabellini wrote:
> > On Thu, 7 Oct 2021, Oleksandr wrote:
> > > On 07.10.21 04:50, Stefano Stabellini wrote:
> > > 
> > > Hi Stefano
> > > 
> > > > On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
> > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > > 
> > > > > This is a follow-up of
> > > > > "b6fe410 xen/arm: Add handling of extended regions for Dom0"
> > > > > 
> > > > > Add various in-code comments, update Xen hypervisor device tree
> > > > > bindings text, change the log level for some prints and clarify
> > > > > format specifier, reuse dt_for_each_range() to avoid open-coding
> > > > > in find_memory_holes().
> > > > > 
> > > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > Thanks for the patch, it looks like you addressed all Julien's comments
> > > > well.
> > > I believe so)
> > 
> > [...]
> > 
> > > > > @@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct
> > > > > domain
> > > > > *d,
> > > > >            u64 start = ext_regions->bank[i].start;
> > > > >            u64 size = ext_regions->bank[i].size;
> > > > >    -        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> > > > > -                   i, start, start + size);
> > > > > +        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> > > > > +               i, start, start + size);
> > > > Also should be PRIpaddr
> > > I thought I needed to change specifier only for variables of type
> > > "paddr_t",
> > > but here "u64".
> > Sorry, you are right.
> > 
> > I added my reviewed-by and made the small typo changes on commit.
> 
> Thanks! In case if you haven't committed the patch yet, let's please wait for
> Julien (who asked for this follow-up) to review it.
> 
> In any case, I will be able to do another follow-up if needed.
 
I committed it as I would like to squeeze as many runs out of OSSTest
and Gitlab-CI as possible as we are getting closer and closer to the
release. I am trying to avoid the last minute rush to commit 150 patches
one day before code freeze :-)

The more intermediate runs we get, the easier is to pinpoint (and fix)
regressions.

But also, this patch doesn't affect external interfances, it is just
internal and mostly comments, so it is super-easy to do follow-ups.

