Return-Path: <SRS0=5MCE=BG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ACCC433E8
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 15:16:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C3420672
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2020 15:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="EyWp971M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47C3420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04ro-0004qU-Fs; Mon, 27 Jul 2020 15:16:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k04rn-0004qP-Kq
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 15:16:39 +0000
X-Inumbo-ID: 2a8747f6-d01c-11ea-8acc-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a8747f6-d01c-11ea-8acc-bc764e2007e4;
 Mon, 27 Jul 2020 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595862998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QxHKKpPVPtY7n6gB7RbvButmrCihfJsVSdeL8qvd5wc=;
 b=EyWp971Mae8GGielSL3I6hDyQvsD4ryN4cIB249T/PTvUJ0+Jutlc4TX
 PfdMYFI6RBdwde/bWQrE/Dmr0NwD7yRbVxyNpCp6bBV1s1cDocloIHiAG
 McT2kvTPcMkmvGoQyD5NooLPErFUkWX0/pBbRbowdhiSiTc6Q1gG+Gfbc E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HTb+sqVtINoCdeeUBznbMtFR82HwkjLAIsfU5vtGkArlRP6rMMhwA1YFoYxW6DUHSioQ5dtwi+
 jJ5LR+9o2HJ9hsxvdIv30l3Tzro+Fr41lmEQLOhG4Llf7VymmvGNm4bnLwPCCAHtvmSfUZgeoQ
 bTZ5Go1fiokDFdf9piqfYxBe7kdX3ta1gSELVbToNe0OAWugQ8ByokLsueKVYCh3irIUUxMpbR
 kmVn8BnC7N03jEfBJ1g/UiGm22wWA6O8jodL4d5vGoS+uc/+CogwWbkUnE+r0PNdy/sAZpiWqy
 5ek=
X-SBRS: 2.7
X-MesageID: 23281947
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23281947"
Date: Mon, 27 Jul 2020 17:16:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 4/4] x86: fold indirect_thunk_asm.h into asm-defns.h
Message-ID: <20200727151630.GU7191@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <af69f44a-5009-40e8-fbbc-6f78b67f7adb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af69f44a-5009-40e8-fbbc-6f78b67f7adb@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:49:40PM +0200, Jan Beulich wrote:
> There's little point in having two separate headers both getting
> included by asm_defns.h. This in particular reduces the number of
> instances of guarding asm(".include ...") suitably in such dual use
> headers.
> 
> No change to generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Some testing with clang might be required, as with the other patch.

Thanks, Roger.

