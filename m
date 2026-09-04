Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D14AC624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 08:09:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407952.1640706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Oz8-00076l-Q4; Fri, 04 Sep 2026 08:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407952.1640706; Fri, 04 Sep 2026 08:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Oz8-00076e-M2; Fri, 04 Sep 2026 08:09:18 +0000
Received: by outflank-mailman (input) for mailman id 1407952;
 Fri, 04 Sep 2026 08:09:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3@swg.vates.tech>)
 id 1x2Oz7-00076V-91
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:09:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Oz6-00HSXd-M0
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:09:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3@swg.vates.tech>)
 id 6a9a7c9e-2eae-0a2a0a5409dd-0a2a4503bbc6-38
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:09:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3@swg.vates.tech>)
 id 6a9a7ca9-fae8-0a2a45030019-b9ff1c229b93-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 10:09:14 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06b76f0aa000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 08:09:12 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0DBF483FC0;
 Fri,  4 Sep 2026 10:09:11 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=jKRKce0KmhEE7sBIsGCdl1IED/VNP6GSP40lFG3f/lw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ZicUvekmoiwaVfhXs4yj2clSN5/zlHS4KW8jAsqriKaAro4FcarMd5XJfFj8bNqOxplCbDRAy
 VoKUo5GeNkJI1gLebGv8xK4sohJweHpwgiYXLdvDOKlIceL9D54z5verrdCRAdpABP7dBiQ0gUj
 sjVZwKgKzWr4S0UfNOhQcw5WGsB8r3oPVLDVXRKJjdSdvM46HYrDN+1AFPVhdDJfFbhEonmxTOV
 i/9YDglNjBYbI9X93SrelXrd39eEKmoUy74/mKvDrxY2VgQ4bGm298isRPqHOlZxGWCnk0s4ub4
 wD5JjXGyvaH5x0ZqotX6VWELHtPWP7D8rQBTN0uQn7/Q==
X-Zone-Loop: b4b217ff4d28e4cd900785f4e8b765abc86099ff08e6
x-campaign-type: default
x-transaction-id: e66fff89-107a-4b19-b3a7-9f65906298cb
x-swg-uid: 01-3f1b8d54-ee53-4252-81a4-e9700ea89848
X-Mailer: Sweego
Message-ID:
 <1788509352.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3@vates.tech>
x-swg-bid: 1788509352.8631fc262581453bbf619ec5b2062170.1a06b76f0aa000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 4 Sep 2026 10:09:10 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julian Vetter <julian.vetter@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 0/3] Support multiple ioreq pages
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <23816f6d-57eb-4567-b6da-93269e6a1c23@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23816f6d-57eb-4567-b6da-93269e6a1c23@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3628.50d989936137e3e1.1a06b76ed1b.d0178a230859bc74=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788509351195
X-purgate-ID: tlsNG-33051d/1788509354-774F44E9-72AFE369/0/0
X-purgate-type: clean
X-purgate-size: 2790

---=Part.3628.50d989936137e3e1.1a06b76ed1b.d0178a230859bc74=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 04:08:04PM +0200, Jan Beulich wrote:
> On 20=2E04=2E2026 11:38, Julian Vetter wrote:
> > Julian Vetter (3):
> >   ioreq: switch ioreq page allocation to vmap
> >   ioreq: Indent ioreq_server_alloc_mfn() body one level deeper
> >   x86/ioreq: Extend ioreq server to support multiple ioreq pages
> >=20
> >  xen/arch/x86/hvm/ioreq=2Ec |  63 ++++++++++++++++---
> >  xen/common/ioreq=2Ec       | 127 ++++++++++++++++++++++++++----------=
---
> >  xen/include/xen/ioreq=2Eh  |  13 +++-
> >  3 files changed, 151 insertions(+), 52 deletions(-)
>=20
> For (future) reference, in case it wasn't said earlier:
>=20
> To be able to test this, at least the last patch here will want to wait
> until the apic_id =3D=3D vcpu_id * 2 issue was addressed=2E Andrew said =
he'd pick
> up Alejandro's work there, thus - once finished - permitting up to 255
> vCPU-s (i=2Ee=2E requiring 2 IOREQ pages)=2E
>=20
> Once (really: before) we grow the number of vCPU-s for HVM, we need to
> revisit the amount of VA space set aside for vmap()=2E For many years we=
've
> been adding new uses of vmap() without making sure its reserved range is
> still adequately sized=2E
>=20
> Since multi-page functionality added here will also need qemu changes, a=
nd
> since we did determine (elsewhere) that ioreq_t needs to grow as well, i=
t
> remains to be decided whether the two changes wouldn't better be done
> together, to keep the qemu backwards compatibility logic somewhat limite=
d
> in size / complexity=2E Anthony (in particular) - thoughts?

Put like that, how can I say "no" to merge both changes together :-)

It will certainly be simpler to maintain if having one feature mean also
having the other=2E But it kind of depends on whether both changes are
ready to go in at around the same time=2E I don't really know how the
changes in QEMU will look like, and how QEMU will choose or have a
choice of which feature to use, and it might be one that can be
negotiated as runtime and the other one been a compile time change (as I
think QEMU still depends on unstable ABI)=2E

But it looks like both changes in QEMU are for having more vCPU, so
having both at the same time might be better=2E

So yes, I'm all for less complexity, but I can't ask for this to be a
blocker, especially if the other change might takes years=2E So far, I
don't think I've seen any patches for QEMU=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3628.50d989936137e3e1.1a06b76ed1b.d0178a230859bc74=---

