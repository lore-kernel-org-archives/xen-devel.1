Return-Path: <SRS0=lvvB=2D=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271C0C2D0CA
	for <xen-devel@archiver.kernel.org>; Fri, 13 Dec 2019 21:00:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6539D24682
	for <xen-devel@archiver.kernel.org>; Fri, 13 Dec 2019 21:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6539D24682
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifit3-0001Qy-Gf; Fri, 13 Dec 2019 11:13:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifit2-0001Qt-Qg
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:13:32 +0000
X-Inumbo-ID: 989c2094-1d99-11ea-8ee0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 989c2094-1d99-11ea-8ee0-12813bfff9fa;
 Fri, 13 Dec 2019 11:13:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 28915AF21;
 Fri, 13 Dec 2019 11:13:31 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-7-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50800e04-ea99-777f-a268-e296ba18dca6@suse.com>
Date: Fri, 13 Dec 2019 12:13:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212182740.2190199-7-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 6/8] xen: Move CONFIG_INDIRECT_THUNK to
 Kconfig
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxOToyNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gLS0tIGEveGVuL2Fy
Y2gveDg2L0tjb25maWcKPiArKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+IEBAIC0zMiw2ICsz
Miw5IEBAIGNvbmZpZyBBUkNIX0RFRkNPTkZJRwo+ICAJc3RyaW5nCj4gIAlkZWZhdWx0ICJhcmNo
L3g4Ni9jb25maWdzL3g4Nl82NF9kZWZjb25maWciCj4gIAo+ICtjb25maWcgSU5ESVJFQ1RfVEhV
TksKPiArCWRlZl9ib29sICQoY2Mtb3B0aW9uLC1taW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVyKQoK
SSdtIG5vdCBoYXBweSB0byBzZWUgY29uc3RydWN0cyBsaWtlIHRoaXMgYXBwZWFyLiBUaGV5IGxl
YXZlIGEKIiMgQ09ORklHXy4uLiBpcyBub3QgZGVmaW5lZCIgaW4gLmNvbmZpZyBmb3Igbm8gcmVh
c29uIHdoZW4KdGhlIGV4cHJlc3Npb24gZXZhbHVhdGVzIHRvIG4uIFRoaXMgbWF5IG5vdCBtYXR0
ZXIgbXVjaCB3aGVuCmNvbnNpZGVyaW5nIGp1c3Qgb25lIHN1Y2ggbGluZSwgYnV0IGl0IHdpbGwg
d2hlbiB3ZSBnYWluCmRvemVucyBvciBodW5kcmVkcy4gRm9yIG9wdGlvbnMgd2l0aG91dCBwcm9t
cHRzIEkgdGhpbmsgdGhlCmRlZmF1bHQgc2hvdWxkIG9ubHkgZXZlciBiZSBzZXQgdG8geSAob3Ig
bSwgd2hpY2ggd2UgZG9uJ3QKdXNlKS4gVGhlIGFib3ZlIHdvdWxkIHRoZW4gYmUgd3JpdHRlbiBh
cwoKY29uZmlnIElORElSRUNUX1RIVU5LCglkZWZfYm9vbCB5IGlmICQoY2Mtb3B0aW9uLC1taW5k
aXJlY3QtYnJhbmNoLXJlZ2lzdGVyKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
