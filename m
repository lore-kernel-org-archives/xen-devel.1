Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6402CD6E50
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 14:57:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322414.1588672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyeS-0001DR-7C; Fri, 29 May 2026 14:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322414.1588672; Fri, 29 May 2026 14:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyeS-0001DK-4R; Fri, 29 May 2026 14:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1322414;
 Fri, 29 May 2026 14:57:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e743d7740000d780@swg.vates.tech>)
 id 1wSyeP-0001DC-3I
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:57:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyeO-00FxFt-Cj
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:57:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e743d7740000d780@swg.vates.tech>)
 id 6a19a94d-e002-0a2a0a5209dd-0a2a4509b086-12
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:57:28 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e743d7740000d780@swg.vates.tech>)
 id 6a19a957-2497-0a2a45090019-b9ff1c229069-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:57:27 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e743d7740000d780.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 May 2026 14:57:25 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 12C5186C10;
 Fri, 29 May 2026 16:57:25 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/bm/nifj0oOlN12HMaNetrF3sTQ1SUNAb3WqvE+SDGI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Q5DUcjVTIPSParndFI2/cSoI1SypV3aFewKfNLAIZOLRP4pteVr4Wp2fD3aNAhtiNex0SYndD
 JT72fDoMx+xbxLj37JZwkzYvMtSjsrUPcVNdtCHF6LI9VWeItER8RiWT2k11S+apKKVMWhRHBng
 358OIOaSaFPmY9/doLstEXwpRNgWNVFr9g8NMTHZ52WsKQCePIfo8Xnn+qPVpGdIZFzw43Vvdw8
 mGrY1LLLBdK+eaKJPm8MoOVpMQp1hzngdXMHcYUR83Aw9/e+7QGHG7ek7gEggRsxjmE89BkoFie
 jAjeBQB9NwdP2tvDq0mZXWdaGi8puyckE2AF0bh8e0kQ==
X-Zone-Loop: 15a4ef35a6927c39a9b04bbbf06621daf9fd5cfe2fb5
x-campaign-type: default
x-transaction-id: 7916c5b9-28ac-474b-a96d-c118acc06221
x-swg-uid: 01-c4b277ca-ce4a-4670-b112-6a4f57d10b24
X-Mailer: Sweego
Message-ID:
 <1780066645.8631fc262581453bbf619ec5b2062170.19e743d7740000d780@vates.tech>
x-swg-bid: 1780066645.8631fc262581453bbf619ec5b2062170.19e743d7740000d780
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 29 May 2026 16:57:24 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Cody Zuschlag <cody.zuschlag@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
	roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v3] docs/process: document AI-assisted patch tags
References: <20260527174528.27903-1-cody.zuschlag@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527174528.27903-1-cody.zuschlag@gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.17c0.4f7d27eb6f454136.19e743d74f9.2a7d77ea9eefc69a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780066645242
X-purgate-ID: tlsNG-bad1c0/1780066647-89174A53-67DC28CD/0/0
X-purgate-type: clean
X-purgate-size: 761

---=Part.17c0.4f7d27eb6f454136.19e743d74f9.2a7d77ea9eefc69a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 07:45:28PM +0200, Cody Zuschlag wrote:
> Add documentation for the Assisted-by tag to clarify how
> AI-assisted tooling may be disclosed in Xen patches=2E
>=20
> The guidance follows the Linux kernel documentation=2E
>=20
> Assisted-by: ChatGPT:gpt-5=2E5
> Signed-off-by: Cody Zuschlag <cody=2Ezuschlag@gmail=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.17c0.4f7d27eb6f454136.19e743d74f9.2a7d77ea9eefc69a=---

