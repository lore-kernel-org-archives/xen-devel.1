Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34143C61DC4
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399706.1635692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz94s-000555-3J; Wed, 26 Aug 2026 08:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399706.1635692; Wed, 26 Aug 2026 08:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz94s-00054x-06; Wed, 26 Aug 2026 08:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1399706;
 Wed, 26 Aug 2026 08:33:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wz94r-00054r-31
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 08:33:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wz94r-006ZIo-0A
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 08:33:44 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wz94q-002NKK-2N
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 08:33:44 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5b013084dc2so561459e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 01:33:44 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=alVlmarvLODuZpIteA7bAr3edUlSESmByVLnlwcbe7o=; b=zMrjUN93zjb+noBiw2NZxObHqI
	FptXC6SX0ZE/olrrE6T+2/fcP8gtva2rL/+LUxBPxGD0nKMLXGUojYQOCN+illq9LxihERlIdVOug
	uvr3DgwdqDA7CR2ysEW8dHUprTd10Mw+HLAAx8ge3AZaN2TGc5GcUbw5sNHLyHZ0FzHw=;
X-Forwarded-Encrypted: i=1; AHgh+Rq3AaUDnytzPCgKeaNGPWSqDSXw5YaeK9+SlTUyM1cNzpDflMm8ln0QbYzI4VD2Ix22t6fYJwvXEMo=@lists.xenproject.org
X-Gm-Message-State: AFuF++kEtKEz0pvJabkDak+btfoXYLfi7jR+6JfJH+yJE5/Gnn0YBOfR
	TkurJfjwHbY0zFWVPsg8TjXz2X9y3Hbm42IxH7yNwCdsanUaVqWqER/jgEhRxZfQo3n4AnSEvnY
	n5A+jrFIOmM0ACcnKFpPISo+cTLPF/tA=
X-Received: by 2002:a05:6512:23a5:b0:5ae:bfd6:1bc1 with SMTP id
 2adb3069b0e04-5b4a9061a82mr1313370e87.14.1787733223550; Wed, 26 Aug 2026
 01:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260420093820.825969-1-julian.vetter@vates.tech>
 <20260420093820.825969-2-julian.vetter@vates.tech> <35a08d22-1e95-4e02-a7e9-7f392ef11722@suse.com>
 <1787667597.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@vates.tech>
In-Reply-To: <1787667597.8631fc262581453bbf619ec5b2062170.1a0394ac7f2000c4f3@vates.tech>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 26 Aug 2026 09:33:31 +0100
X-Gmail-Original-Message-ID: <CAFLBxZY0_3pF5bgt4uT1e+TChVioTqbb_z5T31rFaK_zB+S10Q@mail.gmail.com>
X-Gm-Features: AcwNN1X-dyat42p5dH2nqpm0Q1NjHhbWoBpEC4D-Df-aV4nk2y7-Pwv7G6iCgws
Message-ID: <CAFLBxZY0_3pF5bgt4uT1e+TChVioTqbb_z5T31rFaK_zB+S10Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] ioreq: switch ioreq page allocation to vmap
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 3:20=E2=80=AFPM Julian Vetter <julian.vetter@vates.=
tech> wrote:
> Thank you again for your feedback! I will wait then for Anthony's
> decision regarding whether the multi-page ioreq support and the ioreq_t
> growth should be combined into a single effort, before I proceed further
> with a v7.

BTW, if we're considering modifying the ioreq server protocol, I have
a few requests to consider from an ASI perspective.

Basically, at the moment, ioreq vcpu rings are grouped by backend; so
each vcpu shares a ring with all other vcpus; meaning that, in theory,
one vcpu could read the payload of another vcpu's IO operations.  This
isn't critical, but the more isolation the better.

What would be more convenient from an ASI perspective would be to have
per-vcpu data shared on separate pages.  One design would be to have a
single ioreq page per vcpu, with all ioreq server rings on the single
page.  What would perhaps be nicer long-term is to figure out a way
for all per-vcpu shared structures to share a single page (or set of
pages).

Not sure how this fits with the ioreq_t growth or multi-page ioreq
support, but thought it would be worthwhile to toss out there for
consideration:  At least to make ioreq page isolation less difficult,
and perhaps to make it easier.

 -George

