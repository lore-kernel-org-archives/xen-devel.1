Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7950DC04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:35:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E202175B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E202175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5g1-0004oz-Kh; Fri, 10 May 2019 13:35:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5g0-0004oq-Bc
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:35:04 +0000
X-Inumbo-ID: 69b7ae2c-7328-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 69b7ae2c-7328-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:35:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 07:35:01 -0600
Message-Id: <5CD57E04020000780022D8F0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 07:35:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-12-julien.grall@arm.com>
 <5CD571FE020000780022D826@prv1-mh.provo.novell.com>
 <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
In-Reply-To: <22eaed55-f714-0c97-385d-72cf796f5936@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 11/14] xen/x86: mm: Re-implement
 set_gpfn_from_mfn() as a static inline function
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510133500.Aj1C3z2FOClYLE_LbnQzVgGOROupO_-G5RqEmU_oFoI@z>

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjI3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTM6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+ICtzdGF0aWMgaW5s
aW5lIHZvaWQgc2V0X2dwZm5fZnJvbV9tZm4odW5zaWduZWQgbG9uZyBtZm4sIHVuc2lnbmVkIGxv
bmcgcGZuKQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVy
KG1mbl90b19wYWdlKF9tZm4obWZuKSkpOwo+Pj4gKyAgICB1bnNpZ25lZCBsb25nIGVudHJ5ID0g
KGQgJiYgKGQgPT0gZG9tX2NvdykpID8gU0hBUkVEX00yUF9FTlRSWSA6IHBmbjsKPj4gCj4+IFRo
ZSAmJiBoZXJlIGxvb2tzLCBlaG0sIGZ1bm55LCBidXQgSSBndWVzcyBpdCdzIG5lZWRlZCBmb3Ig
ZWFybHkgYm9vdD8KPiAKPiBJIGhhdmUgbm8gaWRlYSwgdGhpcyBpcyB4ODYgbm90IEFybS4uLgo+
IAo+PiBCdXQgdGhhdCdzIHBlcmhhcHMgYSBzZXBhcmF0ZSB0aGluZyB0byBjbGVhbiB1cC4gSG93
ZXZlciwgbG9va2luZyBhdAo+PiB0aGlzIC0gd2h5IGlzIEFybSBzZXR0aW5nIHVwIGRvbV9jb3cg
aW4gdGhlIGZpcnN0IHBsYWNlPwo+IAo+IENvbW1vbiBjb2RlIGlzIHVzaW5nIGRvbV9jb3csIHNv
IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCBpdCB0byBiZSBOVUxMIG9uIEFybSB0byAKPiBhdm9pZCB3
ZWlyZCBpc3N1ZXMuCgpJIGRpZG4ndCBtZWFuIGl0IHRvIHJlbWFpbiBOVUxMLiBDb21tb24gY29k
ZSBkb2Vzbid0IGRlcmVmZXJlbmNlIGl0CihhbmQgaXNuJ3Qgc3VwcG9zZWQgdG8pLCBzbyBJJ2Qg
Y29uc2lkZXIgaW5pdGlhbGl6aW5nIGl0IHRvIHNvbWUga25vd24KZmF1bHRpbmcgbm9uLU5VTEwg
YWRkcmVzcywgaWYgdGhlcmUgaXMgc3VjaCBvbiBBcm0uCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
