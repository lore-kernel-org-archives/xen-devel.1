Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8F0C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 09:27:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349655.1607338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werE9-0005IR-FJ; Wed, 01 Jul 2026 09:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349655.1607338; Wed, 01 Jul 2026 09:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werE9-0005IK-CO; Wed, 01 Jul 2026 09:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1349655;
 Wed, 01 Jul 2026 09:27:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@swg.vates.tech>)
 id 1werE7-0005IB-HJ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:27:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1werE6-0029pA-U0
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:27:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@swg.vates.tech>)
 id 6a44dd7e-2eae-0a2a0a5409dd-0a2a4508cdf8-0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:27:26 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@swg.vates.tech>)
 id 6a44dd7e-edec-0a2a45080019-b9ff1c239a1d-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:27:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1d012af000080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 09:27:23 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EFC1E86596;
 Wed,  1 Jul 2026 11:27:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=v0Oq/0medtw3sWIFv4AgOKqcwlN1SFd1sf3+cKdknjY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GjF3DCLlULwNymzJpERSpOOgla89r2GwhwyxthuCdbtU643ZLgESThjgkInB2jKBliR1k1/CU
 1Qsia0oxdx/kBSQof11vZ28FMva/zfCF08mVc7AxSli7jOTrEIE2AnF6+FON3b096PTzX/zpGTI
 Upmu3S05gDV9PaicCEd7hv+tBW+OMm4kxOUZhVrV3Aw85xu8gxYRAr0CKOZmtjIjeqbQMpMnQb7
 B0O2I0o5FB6p+lP9xNpKulLySOBetZRsYmLibLUwnCa9IV0hsFPtX/LMBq0Y3PE4W/QtItJJoCX
 Hs+0ToARv4dGUaKkxvMP0pgyv0Uox1S5zYXvg27dhNqQ==
X-Zone-Loop: 001b24ec1a56cdabcbb35d61b228e048446220dfc4e7
x-campaign-type: default
x-transaction-id: 88ad89b4-7bce-43fb-9c7e-74acc0c48aab
x-swg-uid: 01-a0298d41-4b52-4b98-93a6-fccb53e33bf5
X-Mailer: Sweego
Message-ID:
 <1782898043.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@vates.tech>
x-swg-bid: 1782898043.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 1 Jul 2026 11:27:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
 <33cc1e9d-38c5-44b4-b25b-0f38b625d279@suse.com>
 <2cc83d7a-1e22-4c2f-85ff-7e9daa0876ab@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cc83d7a-1e22-4c2f-85ff-7e9daa0876ab@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9ce.c7b59d80fda33320.19f1d0128c0.cdb4581bb1eb246f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782898043073
X-purgate-ID: tlsNG-c1860d/1782898046-40D2B3FC-9334E5B5/0/0
X-purgate-type: clean
X-purgate-size: 1212

---=Part.9ce.c7b59d80fda33320.19f1d0128c0.cdb4581bb1eb246f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 12:00:29PM +0200, Jan Beulich wrote:
> On 16=2E06=2E2026 11:19, J=C3=BCrgen Gro=C3=9F wrote:
> > On 16=2E06=2E26 11:01, Jan Beulich wrote:
> >> Nul-terminated strings are passed in all cases, so the strlen() can v=
ery
> >> well be invoked by the function itself=2E In preparation for a hyperv=
isor
> >> change also include the nul terminator in the size calculation=2E
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> >> ---
> >> Ideally libxl_flask_context_to_sid() would follow suit, but aiui doin=
g so
> >> would break its (stable) ABI=2E
> >=20
> > You could use LIBXL_API_VERSION in libxl=2Eh to modify the interface f=
or new
> > libxl versions=2E See how it is done e=2Eg=2E for libxl_domain_create_=
restore()=2E
>=20
> Question being - is this worth the effort?

I don't feel like it is=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.9ce.c7b59d80fda33320.19f1d0128c0.cdb4581bb1eb246f=---

