Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDCDC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:22:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5414F20857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5414F20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDplw-00089I-OY; Tue, 09 Apr 2019 12:22:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDplu-00089C-VA
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:39 +0000
X-Inumbo-ID: 2973c7e2-5ac2-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2973c7e2-5ac2-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:22:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100252"
Date: Tue, 9 Apr 2019 13:21:56 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190409122156.GM1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-2-wei.liu2@citrix.com>
 <5C8BB8EE020000780021F594@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5C8BB8EE020000780021F594@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 01/55] x86/mm: defer clearing page in
 virt_to_xen_lXe
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
Message-ID: <20190409122156.1nYHBa95TALr0_9a7KAD-Jmtz0j6EX3xk0eBKg_HN_4@z>

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDg6Mzg6MzhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPiA+IEBAIC00NzUyLDEzICs0NzUyLDEzIEBAIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZpcnRf
dG9feGVuX2wzZSh1bnNpZ25lZCBsb25nIHYpCj4gPiAgCj4gPiAgICAgICAgICBpZiAoICFwbDNl
ICkKPiA+ICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+IC0gICAgICAgIGNsZWFyX3BhZ2Uo
cGwzZSk7Cj4gPiAgICAgICAgICBpZiAoIGxvY2tpbmcgKQo+ID4gICAgICAgICAgICAgIHNwaW5f
bG9jaygmbWFwX3BnZGlyX2xvY2spOwo+ID4gICAgICAgICAgaWYgKCAhKGw0ZV9nZXRfZmxhZ3Mo
KnBsNGUpICYgX1BBR0VfUFJFU0VOVCkgKQo+ID4gICAgICAgICAgewo+ID4gICAgICAgICAgICAg
IGw0X3BnZW50cnlfdCBsNGUgPSBsNGVfZnJvbV9wYWRkcihfX3BhKHBsM2UpLCBfX1BBR0VfSFlQ
RVJWSVNPUik7Cj4gPiAgCj4gPiArICAgICAgICAgICAgY2xlYXJfcGFnZShwbDNlKTsKPiAKPiBJ
cyB0aGlzIHJlYWxseSBhbiBvcHRpbWl6YXRpb24/IFlvdSB0cmVhdCBhdm9pZGluZyB0byBjbGVh
ciB0aGUgcGFnZQo+IGluIGEgaG9wZWZ1bGx5IGluZnJlcXVlbnQgY2FzZSBvZiBhIHJhY2UgZm9y
IGhvbGRpbmcgdGhlIHNwaW4gbG9jawo+IGZvciBxdWl0ZSBhIGJpdCBsb25nZXIuCgpJIHdhcyBh
Y3R1YWxseSB0d28gbWluZGVkIHdoaWxlIHdyaXRpbmcgdGhpcyBwYXRjaC4gSXQgaXMgZGlmZmlj
dWx0IHRvCnByb3ZlIG9uZSB3YXkgb3IgdGhlIG90aGVyLiBUbyBhdm9pZCBkaXN0cmFjdGluZyBm
cm9tIHRoZSBtYWluIGlzc3VlIGF0CmhhbmQsIGRyb3BwaW5nIHRoaXMgcGF0Y2ggaXMgdGhlIGJl
c3Qgd2F5IGZvcndhcmQuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
