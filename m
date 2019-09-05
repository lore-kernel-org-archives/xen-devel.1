Return-Path: <SRS0=DRPg=XA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775C1C3A5A5
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 12:24:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B512080C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Sep 2019 12:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B512080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qnv-0007ae-7W; Thu, 05 Sep 2019 12:23:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5qnu-0007aW-Fz
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:23:58 +0000
X-Inumbo-ID: 085e6578-cfd8-11e9-abc8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 085e6578-cfd8-11e9-abc8-12813bfff9fa;
 Thu, 05 Sep 2019 12:23:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BE646AD07;
 Thu,  5 Sep 2019 12:23:56 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <9d29cef7-752c-2805-2f83-174e47c27516@suse.com>
 <9459eba3-3da0-3229-94ae-94e2d2f0061e@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <79c18eb9-1c1b-c64f-9343-d59e67d9be9c@suse.com>
Date: Thu, 5 Sep 2019 14:24:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9459eba3-3da0-3229-94ae-94e2d2f0061e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxNDoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS4wOS4xOSAx
NDoxMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA1LjA5LjIwMTkgMTM6MzksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL2RlYnVndHJhY2UuYwo+Pj4gKysrIGIv
eGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKPj4+IEBAIC0xNywzNCArMTcsNDAgQEAKPj4+ICAgI2Rl
ZmluZSBERUJVR19UUkFDRV9FTlRSWV9TSVpFICAgMTAyNAo+Pj4gICAKPj4+ICAgLyogU2VuZCBv
dXRwdXQgZGlyZWN0IHRvIGNvbnNvbGUsIG9yIGJ1ZmZlciBpdD8gKi8KPj4+IC1zdGF0aWMgdm9s
YXRpbGUgaW50IGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOwo+Pj4gK3N0YXRpYyB2b2xhdGls
ZSBib29sIGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOwo+Pj4gICAKPj4+IC1zdGF0aWMgY2hh
ciAgICAgICAgKmRlYnVndHJhY2VfYnVmOyAvKiBEZWJ1Zy10cmFjZSBidWZmZXIgKi8KPj4+IC1z
dGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfcHJkOyAvKiBQcm9kdWNlciBpbmRleCAgICAg
Ki8KPj4+IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2Vfa2lsb2J5dGVzID0gMTI4LCBk
ZWJ1Z3RyYWNlX2J5dGVzOwo+Pj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV91c2Vk
Owo+Pj4gK3N0cnVjdCBkZWJ1Z3RyYWNlX2RhdGEgewo+Pj4gKyAgICB1bnNpZ25lZCBsb25nIGJ5
dGVzOyAvKiBTaXplIG9mIGJ1ZmZlci4gKi8KPj4KPj4gSG1tLCBJJ20gc29ycnkgZm9yIHJlY29n
bml6aW5nIHRoaXMgb25seSBub3csIGJ1dCB3aHkgZG9lcyB0aGlzCj4+IGZpZWxkIG5lZWQgcmVw
bGljYXRpbmc/IEl0J3MgdGhlIHNhbWUgaW4gYWxsIGluc3RhbmNlcyBvZiB0aGUKPj4gc3RydWN0
dXJlIGFmYWljdC4KPiAKPiBPaCwgcmlnaHQuIEluIHRoZSBiZWdpbm5pbmcgSSBoYWQgcGxhbnMg
dG8gc3VwcG9ydCBtb2RpZnlpbmcgdGhlIGJ1ZmZlcgo+IHNpemUgYXQgcnVudGltZS4KPiAKPiBP
a2F5LCBJJ2xsIGNoYW5nZSBpdC4KClRoYW5rcy4gRkFPRCB0aGlzIGlzIG5vdCBnb2luZyB0byBp
bnZhbGlkYXRlIGFueSBvZiBteSBhY2tzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
