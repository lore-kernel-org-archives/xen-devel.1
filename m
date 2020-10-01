Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B690FC47420
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 09:27:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD2B21481
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 09:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="HfeP5JsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD2B21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1140.3749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNuro-0007xM-TQ; Thu, 01 Oct 2020 09:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140.3749; Thu, 01 Oct 2020 09:27:12 +0000
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
	id 1kNuro-0007xF-QC; Thu, 01 Oct 2020 09:27:12 +0000
Received: by outflank-mailman (input) for mailman id 1140;
 Thu, 01 Oct 2020 09:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNurn-0007xA-AU
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:27:11 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58dceebb-06ad-476e-98f3-24ae2b48aa2b;
 Thu, 01 Oct 2020 09:27:07 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNurn-0007xA-AU
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:27:11 +0000
X-Inumbo-ID: 58dceebb-06ad-476e-98f3-24ae2b48aa2b
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 58dceebb-06ad-476e-98f3-24ae2b48aa2b;
	Thu, 01 Oct 2020 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601544428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hF4JWm2e7NDZ5Xh7ZZWnWl0AevZZigjbED9dD/hQ5oU=;
  b=HfeP5JsT/unY+4e5+iQyB04IyvXALOX1l4v0dJtx7x7R2eFUQ9GvRYAo
   ZvS0zMmEzCRa4e81rleLW6GW4MJBlnZVOSOuQ1chjbKvBSzL9v0UhRlW1
   wgzlNG7GJxhePjUjybYzbR+jvghneVm0mGfHyIe+QH+SCYo/RVufGLV2S
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YLR2UGa1tE/4RMGxGxWxNWWSOwGUipKOqwsyH3eBqcYZjFEq6f63Dql0AuQVpWWc8J5UVkWSdj
 08njLDOgm0tgc62yUVqmg3zOEZ3E2+FUFUyYtucP/bO6tM6nzLIz9YeiZf/V1XOuBt9Mc59Bke
 tPLBAOyw1Fpdi608BbI8st/nsxAPQffcqHvudLfS+PDU4ujYohsT6s9Z/5OeP0S/xhAILZSqT6
 /zdmADLoNm4tgPXNHSRAEKgdUIcaiNBqetH+bvISmUDaf6KZcCbH9KN5vIwD1GiiWrwpIu5PNW
 PWY=
X-SBRS: None
X-MesageID: 28055755
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28055755"
Date: Thu, 1 Oct 2020 11:26:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH 1/8] tools/libxl: Simplify DOMCTL_CDF_ flags handling in
 libxl__domain_make()
Message-ID: <20201001092658.GY19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:41PM +0100, Andrew Cooper wrote:
> The use of the ternary operator serves only to obfuscate the code.  Rewrite it
> in more simple terms, avoiding the need to conditionally OR zero into the
> flags.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Might be worth adding to the log that it's a non-functional change.

Thanks, Roger.

