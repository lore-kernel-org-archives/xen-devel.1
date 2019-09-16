Return-Path: <SRS0=eqFR=XL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931A7C49ED7
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 07:14:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B94B2067D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 07:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B94B2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9lD2-0006aL-KZ; Mon, 16 Sep 2019 07:14:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jHNx=XL=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1i9lD1-0006aG-J3
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 07:14:03 +0000
X-Inumbo-ID: 8f1f4290-d851-11e9-978d-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f1f4290-d851-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 07:14:02 +0000 (UTC)
Received: from localhost (unknown [85.119.46.8])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4EC7F151725B6;
 Mon, 16 Sep 2019 00:14:00 -0700 (PDT)
Date: Mon, 16 Sep 2019 09:13:58 +0200 (CEST)
Message-Id: <20190916.091358.2211845153199495099.davem@davemloft.net>
To: paul.durrant@citrix.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190913124727.3277-1-paul.durrant@citrix.com>
References: <20190913124727.3277-1-paul.durrant@citrix.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 16 Sep 2019 00:14:01 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH net-next] MAINTAINERS: xen-netback: update
 my email address
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: netdev@vger.kernel.org, wei.liu@kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KRGF0ZTogRnJpLCAx
MyBTZXAgMjAxOSAxMzo0NzoyNyArMDEwMAoKPiBNeSBDaXRyaXggZW1haWwgYWRkcmVzcyB3aWxs
IGV4cGlyZSBzaG9ydGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+CgpBcHBsaWVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
