Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1316C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:27:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87EBE2084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87EBE2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpqo-0000la-0Z; Tue, 09 Apr 2019 12:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpqm-0000lV-Ie
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:27:40 +0000
X-Inumbo-ID: dbc58224-5ac2-11e9-b39f-0f0cfd30c1cc
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbc58224-5ac2-11e9-b39f-0f0cfd30c1cc;
 Tue, 09 Apr 2019 12:27:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100679"
Date: Tue, 9 Apr 2019 13:27:18 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190409122718.GD30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-14-wei.liu2@citrix.com>
 <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CAB6F0302000078002257C1@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 13/55] x86/mm: rewrite virt_to_xen_l3e
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
Message-ID: <20190409122718.FVTHzrPlgtk8ndfbgBYJ8im2QoCX5QnwydDZzFUfbJo@z>

T24gTW9uLCBBcHIgMDgsIDIwMTkgYXQgMDk6NTU6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtNDc2OSw0NSArNDc2OSw3MCBAQCB2b2lkIGZyZWVfeGVuX3BhZ2V0YWJsZV9u
ZXcobWZuX3QgbWZuKQo+ID4gIAo+ID4gIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0sobWFwX3BnZGly
X2xvY2spOwo+ID4gIAo+ID4gKy8qCj4gPiArICogR2l2ZW4gYSB2aXJ0dWFsIGFkZHJlc3MsIHJl
dHVybiBhIHBvaW50ZXIgdG8geGVuJ3MgTDMgZW50cnkuIENhbGxlcgo+ID4gKyAqIG5lZWRzIHRv
IHVubWFwIHRoZSBwb2ludGVyLgo+ID4gKyAqLwo+ID4gIHN0YXRpYyBsM19wZ2VudHJ5X3QgKnZp
cnRfdG9feGVuX2wzZSh1bnNpZ25lZCBsb25nIHYpCj4gPiAgewo+ID4gICAgICBsNF9wZ2VudHJ5
X3QgKnBsNGU7Cj4gPiArICAgIGwzX3BnZW50cnlfdCAqcGwzZSA9IE5VTEw7Cj4gPiAgCj4gPiAg
ICAgIHBsNGUgPSAmaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQodildOwo+ID4gICAgICBp
ZiAoICEobDRlX2dldF9mbGFncygqcGw0ZSkgJiBfUEFHRV9QUkVTRU5UKSApCj4gPiAgICAgIHsK
PiA+ICAgICAgICAgIGJvb2wgbG9ja2luZyA9IHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9ib290
Owo+ID4gLSAgICAgICAgbDNfcGdlbnRyeV90ICpsM3QgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7
Cj4gPiArICAgICAgICBsM19wZ2VudHJ5X3QgKmwzdDsKPiA+ICsgICAgICAgIG1mbl90IG1mbjsK
PiA+ICsKPiA+ICsgICAgICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7Cj4gPiAr
ICAgICAgICBpZiAoIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSApCj4gPiArICAgICAgICAgICAg
Z290byBvdXQ7Cj4gCj4gQW55IHJlYXNvbiBub3QgdG8gdXNlICJyZXR1cm4gTlVMTCIgaGVyZSwg
YXZvaWRpbmcgdGhlIGdvdG8KPiBhbmQgbGFiZWwgYWx0b2dldGhlciBpbiB0aXMgZnVuY3Rpb24/
CgpUaGlzIGNhbiBiZSBkb25lLCBidXQgSSB3YW50ZWQgdG8gaGF2ZSBhbGwgdmlydF90b194ZW5f
bFhlIGhhdmUgdGhlIHNhbWUKc3RydWN0dXJlLgoKPiAKPiA+ICBzdGF0aWMgbDJfcGdlbnRyeV90
ICp2aXJ0X3RvX3hlbl9sMmUodW5zaWduZWQgbG9uZyB2KQo+ID4gIHsKPiA+ICAgICAgbDNfcGdl
bnRyeV90ICpwbDNlOwo+ID4gKyAgICBsMl9wZ2VudHJ5X3QgKnBsMmUgPSBOVUxMOwo+ID4gIAo+
ID4gICAgICBwbDNlID0gdmlydF90b194ZW5fbDNlKHYpOwo+ID4gICAgICBpZiAoICFwbDNlICkK
PiA+IC0gICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4gCj4gV2h5
IG5vdCBrZWVwIHRoaXMgb25lIHRoZSB3YXkgaXQgaXM/CgpCZWNhdXNlIHRoZXJlIHdpbGwgYmUg
YW4gb3V0IGxhYmVsIGFueXdheSwgd2h5IG5vdCB1c2UgaXQgdG8gaGF2ZSBhCnNpbmdsZSBleGl0
IHBhdGg/CgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
