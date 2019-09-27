Return-Path: <SRS0=1d2Y=XW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EAAC4360C
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 14:43:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84FE9217D7
	for <xen-devel@archiver.kernel.org>; Fri, 27 Sep 2019 14:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84FE9217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDrT0-0007WO-5J; Fri, 27 Sep 2019 14:43:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDrSy-0007WJ-NP
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:43:28 +0000
X-Inumbo-ID: 2a82615e-e135-11e9-967a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2a82615e-e135-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:43:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FA7DB137;
 Fri, 27 Sep 2019 14:43:27 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06e542f4-1ac5-0a70-eb34-3dcd1b543134@suse.com>
Date: Fri, 27 Sep 2019 16:43:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86: correct bogus error indicator of cpu_add()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDU0Y2UyZGI4YjggKCJ4ODYvbnVtYTogYWRqdXN0IGRhdGF0eXBlcyBmb3Igbm9kZSBh
bmQgcHhtIikKY2hhbmdlZCB0aGlzIGZyb20gdGhlIC0xIChpLmUuIC1FUEVSTSwgd2hpY2ggd2Fz
IGFscmVhZHkgYm9ndXMpIHRoYXQKY29tZXMgYmFjayBmcm9tIHNldHVwX25vZGUoKSB0byBOVU1B
X05PX05PREUgKDB4ZmYpLiBVc2UgYSBwcm9wZXIgZXJyb3IKaW5kaWNhdG9yIGluc3RlYWQuCgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTEyODEs
NyArMTI4MSw3IEBAIGludCBjcHVfYWRkKHVpbnQzMl90IGFwaWNfaWQsIHVpbnQzMl90IGEKICAg
ICAgICAgICAgICAgICAgICAgIlNldHVwIG5vZGUgZmFpbGVkIGZvciBweG0gJXhcbiIsIHB4bSk7
CiAgICAgICAgICAgICB4ODZfYWNwaWlkX3RvX2FwaWNpZFthY3BpX2lkXSA9IEJBRF9BUElDSUQ7
CiAgICAgICAgICAgICBtcF91bnJlZ2lzdGVyX2xhcGljKGFwaWNfaWQsIGNwdSk7Ci0gICAgICAg
ICAgICBjcHUgPSBub2RlOworICAgICAgICAgICAgY3B1ID0gLUVOT1NQQzsKICAgICAgICAgICAg
IGdvdG8gb3V0OwogICAgICAgICB9CiAgICAgICAgIGlmICggYXBpY19pZCA8IE1BWF9MT0NBTF9B
UElDICkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
