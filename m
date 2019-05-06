Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971CBC04A6B
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 13:52:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA022054F
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 13:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA022054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNe2W-0006Ct-F4; Mon, 06 May 2019 13:52:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Gz0=TG=citrix.com=prvs=022e014eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNe2U-0006Ck-NW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 13:52:18 +0000
X-Inumbo-ID: 2576b782-7006-11e9-98b8-e30ced58c69a
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2576b782-7006-11e9-98b8-e30ced58c69a;
 Mon, 06 May 2019 13:52:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,438,1549929600"; d="scan'208";a="89670954"
Date: Mon, 6 May 2019 15:52:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190506135203.by4dre24krtuy3up@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 8/9] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506135203.MnDS8re6yqR15L2cyelwrWlz_S1d2RhkiXg-QJG5IeE@z>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjY6NDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2luY2UgdGhlICJDYW5ub3Qgc2V0IGFmZmluaXR5IC4uLiIgd2FybmluZyBpcyBhIG9u
ZSB0aW1lIG9uZSwgYXZvaWQKPiB0cmlnZ2VyaW5nIGl0IGFscmVhZHkgYXQgYm9vdCB0aW1lIHdo
ZW4gcGFya2luZyBzZWNvbmRhcnkgdGhyZWFkcyBhbmQKPiB0aGUgc2VyaWFsIGNvbnNvbGUgdXNl
cyBhIChzdGlsbCB1bmNvbm5lY3RlZCBhdCB0aGF0IHRpbWUpIFBDSSBJUlEuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0yNDEyLDggKzI0
MTIsMjAgQEAgdm9pZCBmaXh1cF9pcnFzKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgYgo+ICAgICAg
ICAgIHZlY3RvciA9IGlycV90b192ZWN0b3IoaXJxKTsKPiAgICAgICAgICBpZiAoIHZlY3RvciA+
PSBGSVJTVF9ISVBSSU9SSVRZX1ZFQ1RPUiAmJgo+ICAgICAgICAgICAgICAgdmVjdG9yIDw9IExB
U1RfSElQUklPUklUWV9WRUNUT1IgKQo+ICsgICAgICAgIHsKPiAgICAgICAgICAgICAgY3B1bWFz
a19hbmQoZGVzYy0+YXJjaC5jcHVfbWFzaywgZGVzYy0+YXJjaC5jcHVfbWFzaywgbWFzayk7Cj4g
IAo+ICsgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgKiBUaGlzIGNhbiBpbiBwYXJ0aWN1
bGFyIGhhcHBlbiB3aGVuIHBhcmtpbmcgc2Vjb25kYXJ5IHRocmVhZHMKPiArICAgICAgICAgICAg
ICogZHVyaW5nIGJvb3QgYW5kIHdoZW4gdGhlIHNlcmlhbCBjb25zb2xlIHdhbnRzIHRvIHVzZSBh
IFBDSSBJUlEuCj4gKyAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICBpZiAoIGRlc2MtPmhh
bmRsZXIgPT0gJm5vX2lycV90eXBlICkKCkkgZm91bmQgaXQgd2VpcmQgdGhhdCBhIGlycSBoYXMg
YSB2ZWN0b3IgYXNzaWduZWQgKGluIHRoaXMgY2FzZSBhCmhpZ2gtcHJpb3JpdHkgdmVjdG9yKSBi
dXQgbm8gaXJxIHR5cGUgc2V0LgoKU2hvdWxkbid0IHRoZSB2ZWN0b3IgYmUgYXNzaWduZWQgd2hl
biB0aGUgdHlwZSBpcyBzZXQ/Cgo+ICsgICAgICAgICAgICB7Cj4gKyAgICAgICAgICAgICAgICBz
cGluX3VubG9jaygmZGVzYy0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAr
ICAgICAgICAgICAgfQo+ICsgICAgICAgIH0KPiArCj4gICAgICAgICAgaWYgKCBkZXNjLT5hcmNo
Lm1vdmVfY2xlYW51cF9jb3VudCApCj4gICAgICAgICAgewo+ICAgICAgICAgICAgICAvKiBUaGUg
Y2xlYW51cCBJUEkgbWF5IGhhdmUgZ290IHNlbnQgd2hpbGUgd2Ugd2VyZSBzdGlsbCBvbmxpbmUu
ICovCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
