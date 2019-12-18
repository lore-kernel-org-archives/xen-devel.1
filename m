Return-Path: <SRS0=H5Oh=2I=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74060C43603
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 07:04:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5245F24672
	for <xen-devel@archiver.kernel.org>; Wed, 18 Dec 2019 07:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5245F24672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihTNL-0000Cz-Fi; Wed, 18 Dec 2019 07:04:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dfmg=2I=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1ihTNK-0000Ci-IV
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 07:04:02 +0000
X-Inumbo-ID: 91fb71b2-2164-11ea-a914-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91fb71b2-2164-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 07:04:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 63A0615039441;
 Tue, 17 Dec 2019 23:04:01 -0800 (PST)
Date: Tue, 17 Dec 2019 23:04:01 -0800 (PST)
Message-Id: <20191217.230401.1145786498004179773.davem@davemloft.net>
To: pdurrant@amazon.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191217133218.27085-4-pdurrant@amazon.com>
References: <20191217133218.27085-1-pdurrant@amazon.com>
 <20191217133218.27085-4-pdurrant@amazon.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 17 Dec 2019 23:04:01 -0800 (PST)
Subject: Re: [Xen-devel] [PATCH net-next 3/3] xen-netback: remove
 'hotplug-status' once it has served its purpose
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
Cc: xen-devel@lists.xenproject.org, wei.liu@kernel.org, paul@xen.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpEYXRlOiBUdWUsIDE3IERl
YyAyMDE5IDEzOjMyOjE4ICswMDAwCgo+IFJlbW92aW5nIHRoZSAnaG90cGx1Zy1zdGF0dXMnIG5v
ZGUgaW4gbmV0YmFja19yZW1vdmUoKSBpcyB3cm9uZzsgdGhlIHNjcmlwdAo+IG1heSBub3QgaGF2
ZSBjb21wbGV0ZWQuIE9ubHkgcmVtb3ZlIHRoZSBub2RlIG9uY2UgdGhlIHdhdGNoIGhhcyBmaXJl
ZCBhbmQKPiBoYXMgYmVlbiB1bnJlZ2lzdGVyZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBE
dXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKQXBwbGllZC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
