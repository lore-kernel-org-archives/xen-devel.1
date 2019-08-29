Return-Path: <SRS0=9cJ5=WZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F7BC3A59F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 09:27:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7226E208C2
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 09:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7226E208C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3GiG-0007A1-RF; Thu, 29 Aug 2019 09:27:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3GiF-00079w-AF
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:27:27 +0000
X-Inumbo-ID: 36a1a466-ca3f-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36a1a466-ca3f-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 09:27:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91060B116;
 Thu, 29 Aug 2019 09:27:25 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f42b05e7-22de-64b0-0486-c087bde57747@suse.com>
Date: Thu, 29 Aug 2019 11:27:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: properly gate clearing of PKU feature
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c2V0dXBfY2xlYXJfY3B1X2NhcCgpIGlzIF9faW5pdCBhbmQgaGVuY2UgbWF5IG5vdCBiZSBjYWxs
ZWQgcG9zdC1ib290LgpOb3RlIHRoYXQgb3B0X3BrdSBuZXZlcnRoZWxlc3MgaXMgbm90IGdldHRp
bmcgX19pbml0ZGF0YSBhZGRlZCAtIHNlZQplLmcuIGNvbW1pdCA0M2ZhOTVhZTZhICgibW06IG1h
a2Ugb3B0X2Jvb3RzY3J1YiBub24taW5pdCIpLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYworKysg
Yi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBAIC00NjYsNyArNDY2LDcgQEAgdm9pZCBpZGVu
dGlmeV9jcHUoc3RydWN0IGNwdWluZm9feDg2ICpjKQogCQl0aGlzX2NwdS0+Y19pbml0KGMpOwog
CiAKLSAgIAlpZiAoICFvcHRfcGt1ICkKKyAgIAlpZiAoYyA9PSAmYm9vdF9jcHVfZGF0YSAmJiAh
b3B0X3BrdSkKIAkJc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVBVFVSRV9QS1UpOwogCiAJLyoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
