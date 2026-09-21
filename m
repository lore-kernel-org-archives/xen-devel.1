Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703C2C982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 12:43:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427447.1650145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dMk-0002qn-E1; Mon, 21 Sep 2026 12:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427447.1650145; Mon, 21 Sep 2026 12:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8dMk-0002qg-9y; Mon, 21 Sep 2026 12:43:26 +0000
Received: by outflank-mailman (input) for mailman id 1427447;
 Mon, 21 Sep 2026 12:43:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4@swg.vates.tech>)
 id 1x8dMj-0002qa-0Z
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:43:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8dMi-00DpC6-D4
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 14:43:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4@swg.vates.tech>)
 id 6ab1266a-bab6-0a2a0a5309dd-0a2a4508a650-2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:43:24 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4@swg.vates.tech>)
 id 6ab1266b-f659-0a2a45080019-b9ff1c22ab57-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 14:43:24 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c3fdfa2c00072c4.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 21 Sep 2026 12:43:16 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id E5A4181D1D;
 Mon, 21 Sep 2026 14:43:15 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=trSW28bbnFjhU58RiED3jIaS5MHYmlubY2tsEF4Xi64=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gOiqHwE7/3CAeMqMOGTffPWpOlFhV0n2Fb0vExMe+QwwVjeEWh5Qfgj8NgtEkA++YLqPq/sw4
 baDP7wrL/DQpGhYeEeNMg1cvR0ERA8wdBDUp36Pkt9s1ujVKhGTgkbHn1fH7PaL2ueAAqBqBhzd
 t/CzNf9t3gwQVAzhlSAWFelyATYWxhTLXMyc7sQUAmamLinJ3/D+wILlOz4/XrikB3TtoWbuHhj
 zqaOJH+Ohw8QLkQNIKhY92RTNBztUurYKzRANHQwYAMzsnivExnGP9wzj7Vxp76FEqjAJjJXM4i
 wkGNDT6ApBuhFV8MRI8Mn/wxUndoCm4h8qj+ApSKwZeg==
X-Zone-Loop: 9b8ebdd3842a839d84696709f3db82e18c29933345aa
x-campaign-type: default
x-transaction-id: 28885734-849a-4e36-9f70-4002b699c2f9
x-swg-uid: 01-e2c0d260-a534-4bdb-90a0-c50706a54e63
X-Mailer: Sweego
Message-ID:
 <1789994596.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4@vates.tech>
x-swg-bid: 1789994596.8631fc262581453bbf619ec5b2062170.1a0c3fdfa2c00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 21 Sep 2026 14:43:15 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Julian Vetter <julian.vetter@vates.tech>,
	xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v5 3/6] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130863.8631fc262581453bbf619ec5b2062170.1a090827272000c4f3@vates.tech>
 <3c3c203d-7951-4340-a926-67b92224d531@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c3c203d-7951-4340-a926-67b92224d531@amd.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2a3.ae71483d88675bb7.1a0c3fdf79e.1b971fcd853fd7e=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789994596258
X-purgate-ID: tlsNG-c1860d/1789994604-CF15E87B-9669C04F/0/0
X-purgate-type: clean
X-purgate-size: 4086

---=Part.2a3.ae71483d88675bb7.1a0c3fdf79e.1b971fcd853fd7e=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 03:08:13PM +0200, Orzel, Michal wrote:
>=20
>=20
> On 11-Sep-26 14:47, Julian Vetter wrote:
> > XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
> > resolve the domain's GIC version to whatever the host hardware has=2E =
Xen
> > then writes the resolved value back into the same in/out
> > xen_arch_domainconfig the toolstack used as input, which is the kind o=
f
> > API abuse we're trying to get rid of=2E The struct passed to createdom=
ain
> > should only be an input parameter=2E
> >=20
> > Move the "pick the best available GIC version" decision to the
> > toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
> > already exposed via XEN_SYSCTL_physinfo:
> >=20
> >  * libxl__arch_domain_build_info_setdefault() resolves the GIC version
> >    against those bits before the config is built=2E An unspecified ver=
sion
> >    becomes v3 if available, else v2, else fails=2E An explicitly reque=
sted
> >    v2/v3 is validated against the same bits, so a version the host
> >    cannot provide is directly rejected in the toolstack=2E
> >  * The Python xc=2Edomain_create() binding does the same via a call to
> >    xc_physinfo()=2E
> >  * libxl__arch_domain_prepare_config() therefore only ever sees a
> >    concrete v2/v3 request and just validates it=2E The GIC_NATIVE case=
 is
> >    dropped since setdefault() always resolves it first=2E
> >=20
> > The LIBXL_GIC_VERSION enum value 0 is renamed from DEFAULT to NONE to
> > reflect that it now only means "the user did not pick a version"=2E
> > setdefault() resolves it before anything else can observe it, so there
> > is no longer a "default" left in the config=2E The xl=2Ecfg(5) gic_ver=
sion
> > documentation is updated to match=2E
> >=20
> > This guarantees no toolstack path can still produce
> > XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
> > Xen side and from the ABI entirely=2E
> >=20
> > Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> > ---
> > Changes in v5:
> > - Go back to the initial per-version arch_capabilities_arm_gic_{v2,v3}=
()
> >   helpers instead of a generic arch_capabilities_arm_has(caps, mask)
> > - Validate an explicitly requested GIC version against the host
> >   capabilities, not just resolve an unspecified one
> > - Rename LIBXL_GIC_VERSION_DEFAULT to LIBXL_GIC_VERSION_NONE
> This one is on me=2E I just realized that libxl compares user provided s=
tring with
> the IDL types, so a xl=2Ecfg file specifying "default" would fail now=2E=
 This would
> be wrong given that libxl API is stable=2E Let's keep the DEFAULT as it =
was (for

Yes please :-) "default" is fine=2E That option could even be removed from
the config file, and only allow users to choose between v2 and v3
option, or remove the option from the config file to let the tool stack
decide=2E We could simply document both v2 and v3, and say that if the
config option isn't given, libxl will try v3, then v2=2E (and probably
keep the gic_version=3Ddefault working, so that existing config don't
break as there isn't a need to break them=2E)

"none" is definitely wrong, because it should mean start without any
GIC=2E

I need to review the rest of the change now=2E

> NONE you would also need to change the golang bindings)=2E With that cha=
nged:
> Acked-by: Michal Orzel <michal=2Eorzel@amd=2Ecom>
>=20
> You will still need Rb from Anthony as toolstack maintainer=2E

FYI, it's the other way around, you need at least an Acked-by from a
maintainer, and you should supply a Reviewed-by instead for part of the
code you don't maintained=2E ;-)  That's documented in the MAINTAINERS=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.2a3.ae71483d88675bb7.1a0c3fdf79e.1b971fcd853fd7e=---

