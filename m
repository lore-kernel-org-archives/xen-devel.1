Return-Path: <SRS0=eqFR=XL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D279BC49ED7
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 11:17:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A82572067B
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 11:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A82572067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9p0B-00010T-Az; Mon, 16 Sep 2019 11:17:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9p0A-00010O-6K
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:17:02 +0000
X-Inumbo-ID: 811c0bb6-d873-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 811c0bb6-d873-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 11:17:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 93B87AE2C;
 Mon, 16 Sep 2019 11:17:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-9-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a48bd401-32e1-0b7e-4c0b-3509630652ce@suse.com>
Date: Mon, 16 Sep 2019 13:17:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913192759.10795-9-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 08/10] tools/libxc: Rework
 xc_cpuid_apply_policy() to use {get, set}_cpu_policy()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtc3RhdGljIHZvaWQg
aW50ZWxfeGNfY3B1aWRfcG9saWN5KGNvbnN0IHN0cnVjdCBjcHVpZF9kb21haW5faW5mbyAqaW5m
bywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGlu
dCAqaW5wdXQsIHVuc2lnbmVkIGludCAqcmVncykKPiAtewo+IC0gICAgc3dpdGNoICggaW5wdXRb
MF0gKQo+IC0gICAgewo+IC0gICAgY2FzZSAweDAwMDAwMDA0Ogo+IC0gICAgICAgIC8qCj4gLSAg
ICAgICAgICogRUFYWzMxOjI2XSBpcyBNYXhpbXVtIENvcmVzIFBlciBQYWNrYWdlIChtaW51cyBv
bmUpLgo+IC0gICAgICAgICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQg
KiAyLgo+IC0gICAgICAgICAqLwo+IC0gICAgICAgIHJlZ3NbMF0gPSAoKChyZWdzWzBdICYgMHg3
YzAwMDAwMHUpIDw8IDEpIHwgMHgwNDAwMDAwMHUgfAo+IC0gICAgICAgICAgICAgICAgICAgKHJl
Z3NbMF0gJiAweDNmZnUpKTsKPiAtICAgICAgICByZWdzWzNdICY9IDB4M2ZmdTsKCkkgdGhpbmsg
eW91IHdhbnQgdG8gbWVudGlvbiB0aGF0IHRoZSByZW1vdmFsIG9mIHRoaXMgbWFza2luZyBpcwpp
bnRlbnRpb25hbCwgZm9yIGl0IGxvb2tpbmcgYm9ndXMuIFdpdGggYW4gYXBwcm9wcmlhdGUgYWRk
aXRpb24gdG8KdGhlIGRlc2NyaXB0aW9uClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
