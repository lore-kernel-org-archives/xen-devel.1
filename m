Return-Path: <SRS0=90EN=D4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E81C388F9
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 11:36:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B5821789
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2020 11:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="ZT8qfXxl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B5821789
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10044.26464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVCPr-0004mr-AR; Wed, 21 Oct 2020 11:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10044.26464; Wed, 21 Oct 2020 11:36:27 +0000
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
	id 1kVCPr-0004mk-6X; Wed, 21 Oct 2020 11:36:27 +0000
Received: by outflank-mailman (input) for mailman id 10044;
 Wed, 21 Oct 2020 11:36:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kVCPq-0004mf-7Y
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:36:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba2f1a79-833f-405b-8a89-7e6e213c2992;
 Wed, 21 Oct 2020 11:36:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hwko=D4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kVCPq-0004mf-7Y
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 11:36:26 +0000
X-Inumbo-ID: ba2f1a79-833f-405b-8a89-7e6e213c2992
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ba2f1a79-833f-405b-8a89-7e6e213c2992;
	Wed, 21 Oct 2020 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603280186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Dt3zzdvMM4atAHxHc6GXfY9Zx2wAPx/MIkQZnoK/N9c=;
  b=ZT8qfXxl02EaAMSn9D6buao/fyRQYQnIrl3JLaJpYvNeICiJvJGPiyCL
   J1+2C/Ik9GDyAkfrMekwCkJu35HxJEzuERQtaitg8X4ZDUx288oh03OCJ
   BHUNu6k0diZV7+h2brvZ5DmS1/QMmrMFPWhZTE1wg4H/hFgcEiqcwNNbh
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jpVzgbIu5+VWEExXVG+ZsonI+bVKecWKfNBb+XnyceYvkvaGcBdbvYNUa26+fyvDCAm9MowHWi
 Zq/I7ZEWgmHChxUf/KneinoEKdffRIjM+7K9hLG1QyIQ7un0cdIF9/oaui+hmtWXSDF5PVuSkr
 wDhPaBJWK9VWv/9gCAUn65WsJCQ5GrFNjWPQTOA3s1qU4o/JB0bK6aXepLtB9Rc7xpR/1Pl8ZQ
 eX71ofuJ7s8WI2YfYRBHGpG6qUbJGOUhP+L+rEzJjCK+Iahbcg+jL1aD8RT21uUYFn8sXNJSyp
 dZ0=
X-SBRS: 2.5
X-MesageID: 29802679
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,401,1596513600"; 
   d="scan'208";a="29802679"
Date: Wed, 21 Oct 2020 13:36:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH] x86: XENMAPSPACE_gmfn{,_batch,_range} want to special
 case idx == gpfn
Message-ID: <20201021113610.6foqzvhdcpwkzoxg@Air-de-Roger>
References: <920fa307-190e-dc11-f338-5b44a2126050@suse.com>
 <20201021093958.e4kopykalddam7pk@Air-de-Roger>
 <a979d21d-efed-9493-efd1-2643bddbbdd9@suse.com>
 <20201021105841.dqx3tnw3pkys5mun@Air-de-Roger>
 <4de4c497-496b-d55f-0d4d-aa61246daca6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4de4c497-496b-d55f-0d4d-aa61246daca6@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 21, 2020 at 01:10:20PM +0200, Jan Beulich wrote:
> On 21.10.2020 12:58, Roger Pau Monné wrote:
> > On Wed, Oct 21, 2020 at 12:38:48PM +0200, Jan Beulich wrote:
> >> On 21.10.2020 11:39, Roger Pau Monné wrote:
> >>> On Fri, Oct 16, 2020 at 08:44:10AM +0200, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/mm.c
> >>>> +++ b/xen/arch/x86/mm.c
> >>>> @@ -4555,7 +4555,7 @@ int xenmem_add_to_physmap_one(
> >>>>          if ( is_special_page(mfn_to_page(prev_mfn)) )
> >>>>              /* Special pages are simply unhooked from this phys slot. */
> >>>>              rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
> >>>> -        else
> >>>> +        else if ( !mfn_eq(mfn, prev_mfn) )
> >>>>              /* Normal domain memory is freed, to avoid leaking memory. */
> >>>>              rc = guest_remove_page(d, gfn_x(gpfn));
> >>>
> >>> What about the access differing between the old and the new entries,
> >>> while pointing to the same mfn, would Xen install the new entry
> >>> successfully?
> >>
> >> Yes - guest_physmap_add_page() doesn't get bypassed.
> > 
> > But will it succeed if the default access is different from the one
> > the installed entry currently has? Will it update the access bits
> > to match the new ones?
> 
> It will construct and put in place a completely new entry. Old
> values are of concern only for keeping statistics right, and
> of course for refusing certain changes.
> 
> >>> Seems easier to me to use guest_physmap_remove_page in that case to
> >>> remove the entry from the p2m without freeing the page.
> >>
> >> Why do any removal when none is really needed? I also don't see
> >> this fit the "special pages" clause and comment very well. I'd
> >> question the other way around whether guest_physmap_remove_page()
> >> needs calling at all (the instance above; the other one of course
> >> is needed).
> > 
> > Right, replying to my question above: it will succeed, since
> > guest_physmap_add_entry will overwrite the previous entry.
> > 
> > I agree, it looks like the guest_physmap_remove_page call done for
> > special pages is not really needed, as guest_physmap_add_entry would
> > already overwrite such entries and not free the associated mfn?
> 
> That's my understanding, yes.

Then:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I would also like to see the call to guest_physmap_remove_page
for special pages removed for consistency.

Thanks, Roger.

