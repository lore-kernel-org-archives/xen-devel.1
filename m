Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648BEC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:34:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3136D20830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3136D20830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEAYN-0001Wt-HN; Wed, 10 Apr 2019 10:34:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/zj=SM=citrix.com=prvs=9969b238a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEAYM-0001Wf-BM
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:34:02 +0000
X-Inumbo-ID: 272f69c7-5b7c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 272f69c7-5b7c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 10:34:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83203703"
Date: Wed, 10 Apr 2019 11:32:52 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190410103252.GV30543@zion.uk.xensource.com>
References: <20190410102634.1426-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410102634.1426-1-olaf@aepfle.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v1] libxl: update prototype of
 libxl__device_vkb_dm_needed
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410103252.aWPhiBO-2pzv7AK48M2XIpmJoAkn2jy60VjKvKLHv2Y@z>

T24gV2VkLCBBcHIgMTAsIDIwMTkgYXQgMTI6MjY6MzRQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQWxpZ24gY29kZSB0byBtYXRjaCBvdGhlciB1c2FnZSBvZiBkZXZpY2VfZG1fbmVlZGVk
X2ZuX3Q6Cj4gcmVjaWV2ZSBhIHZvaWQgcG9pbnRlciwgYXNzaWduIHRvIGV4cGVjdGVkIHR5cGUg
YW5kIHVzZSBpdCBhY2NvcmRpbmdseS4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBleHBlY3Rl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+CgpBY2tl
ZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
