Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB09C43219
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 11:26:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF812084B
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 11:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF812084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4Q3-0008CI-ST; Mon, 29 Apr 2019 11:25:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Q3-0008C9-2d
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:25:59 +0000
X-Inumbo-ID: 8f31a60a-6a71-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f31a60a-6a71-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 11:25:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 05:25:57 -0600
Message-Id: <5CC6DF3D0200007800229EBF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 05:25:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 6/9] x86/IRQ: reduce unused space in struct
 arch_irq_desc
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190429112549.O8F4AX4nM0PvrUcjwNzrkcVzAWSqedac07CL6bMAGvo@z>

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9pcnEuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2lycS5oCkBA
IC0zNSw4ICszNSw4IEBAIHN0cnVjdCBhcmNoX2lycV9kZXNjIHsKICAgICAgICAgY3B1bWFza192
YXJfdCBjcHVfbWFzazsKICAgICAgICAgY3B1bWFza192YXJfdCBvbGRfY3B1X21hc2s7CiAgICAg
ICAgIGNwdW1hc2tfdmFyX3QgcGVuZGluZ19tYXNrOwotICAgICAgICB1bnNpZ25lZCBtb3ZlX2Ns
ZWFudXBfY291bnQ7CiAgICAgICAgIHZtYXNrX3QgKnVzZWRfdmVjdG9yczsKKyAgICAgICAgdW5z
aWduZWQgbW92ZV9jbGVhbnVwX2NvdW50OwogICAgICAgICB1OCBtb3ZlX2luX3Byb2dyZXNzIDog
MTsKICAgICAgICAgczggdXNlZDsKIH07CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
