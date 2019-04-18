Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A359C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:46:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050072183E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 11:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050072183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH5Uz-0002Lg-At; Thu, 18 Apr 2019 11:46:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TYG2=SU=citrix.com=prvs=00452dca2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hH5Ux-0002Lb-NM
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 11:46:35 +0000
X-Inumbo-ID: 9b6145ce-61cf-11e9-8228-fb2f26265276
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b6145ce-61cf-11e9-8228-fb2f26265276;
 Thu, 18 Apr 2019 11:46:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,365,1549929600"; d="scan'208";a="83880810"
Date: Thu, 18 Apr 2019 12:46:27 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190418114627.GC30543@zion.uk.xensource.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-9-julien.grall@arm.com>
 <5C891FA4020000780021E3A0@prv1-mh.provo.novell.com>
 <5b02c8e1-5ff6-a1a1-e1dd-650123d66006@arm.com>
 <5C8A0903020000780021E662@prv1-mh.provo.novell.com>
 <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fefbf936-c28d-8ae9-0560-8c0b0d6bc75a@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH for-next 8/9] xen: Introduce HAS_M2P config
 and use to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418114627.azqx6nEs_dm-KO7DXEyIN04cPXqBcgnpIahK6AtLY68@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMDY6NDI6NDdQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IEBXZWksIEBJYW46IERvIHlvdSBoYXZlIGFueSBpbnB1dD8KClNvcnJ5
IEkgaGF2ZW4ndCBiZWVuIGZvbGxvd2luZyB0aGlzIGNsb3NlbHksIGJ1dCBzaG91bGRuJ3Qgd2Ug
Zml4IHRoZQppbnRlcmZhY2UgdG8gcmV0dXJuIGdmbiBpbnN0ZWFkPyBBbmQgdGhlbiB0aGUgbWFw
cGluZyBvZiBpdCBzaG91bGQKaW50ZXJwcmV0IHRoZSB2YWx1ZSBwcm9wZXJseSBwZXIgZ3Vlc3Qg
dHlwZS4KCkkgZG9uJ3Qgc2VlIGltbWVkaWF0ZWx5IGhvdyB1c2VyIHNwYWNlIHByb2dyYW0gd2ls
bCBuZWVkIHRvIGFjY2VzcyB0aGlzCnBhZ2UgZm9yIGF1dG90cmFuc2xhdGVkIGd1ZXN0cyB0aG91
Z2guCgpXZWkuCgo+IAo+IE9uIDE0LzAzLzIwMTkgMDc6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPiA+ID4gT24gMTMuMDMuMTkgYXQgMTg6MzAsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3Jv
dGU6Cj4gPiA+IE9uIDEzLzAzLzIwMTkgMTU6MjAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+
ID4gPiA+IE9uIDE4LjAyLjE5IGF0IDEyOjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3Rl
Ogo+ID4gPiA+ID4gLS0tIGEveGVuL2NvbW1vbi9kb21jdGwuYwo+ID4gPiA+ID4gKysrIGIveGVu
L2NvbW1vbi9kb21jdGwuYwo+ID4gPiA+ID4gQEAgLTIwNSw3ICsyMDUsNyBAQCB2b2lkIGdldGRv
bWFpbmluZm8oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0Cj4gPiA+IHhlbl9kb21jdGxfZ2V0ZG9t
YWluaW5mbyAqaW5mbykKPiA+ID4gPiA+ICAgICAgICBpbmZvLT5vdXRzdGFuZGluZ19wYWdlcyA9
IGQtPm91dHN0YW5kaW5nX3BhZ2VzOwo+ID4gPiA+ID4gICAgICAgIGluZm8tPnNocl9wYWdlcyAg
ICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnNocl9wYWdlcyk7Cj4gPiA+ID4gPiAgICAgICAgaW5m
by0+cGFnZWRfcGFnZXMgICAgICAgPSBhdG9taWNfcmVhZCgmZC0+cGFnZWRfcGFnZXMpOwo+ID4g
PiA+ID4gLSAgICBpbmZvLT5zaGFyZWRfaW5mb19mcmFtZSA9IG1mbl90b19nbWZuKGQsIHZpcnRf
dG9fbWZuKGQtPnNoYXJlZF9pbmZvKSk7Cj4gPiA+ID4gPiArICAgIGluZm8tPnNoYXJlZF9pbmZv
X2ZyYW1lID0gZ2ZuX3goZG9tYWluX3NoYXJlZF9pbmZvX2dmbihkKSk7Cj4gPiA+ID4gCj4gPiA+
ID4gSSB0aGluayB0aGlzIGNoYW5nZSB3YW50cyB0byBiZSBhY2NvbXBhbmllZCBieSBhIHdhcm5p
bmcgYXR0YWNoZWQKPiA+ID4gPiB0byB0aGUgZmllbGQgZGVjbGFyYXRpb24gaW4gdGhlIHB1Ymxp
YyBoZWFkZXIuCj4gPiA+IAo+ID4gPiBNYWtlIHNlbnNlLgo+ID4gPiAKPiA+ID4gPiAKPiA+ID4g
PiBCdXQgSSdkIGFsc28gbGlrZSB0byBoYXZlIHRoZSB0b29sIHN0YWNrIG1haW50YWluZXJzJyB2
aWV3IG9uIG1ha2luZwo+ID4gPiA+IHRoaXMgZmllbGQgZWZmZWN0aXZlbHkgdW51c2FibGUgZm9y
IEFybS4KPiA+ID4gCj4gPiA+IFRoZSB2YWx1ZSBpbiBzaGFyZWRfaW5mb19mcmFtZSB3YXMgcGxh
aW4gd3Jvbmcgc2luY2UgdGhlIGNyZWF0aW9uIG9mIFhlbiBBcm0uIFNvCj4gPiA+IHRoaXMgaXMg
anVzdCBtYWtpbmcgdGhlIGVycm9yIG1vcmUgb2J2aW91cy4gSSBkb24ndCBleHBlY3QgYW55IHVz
ZXIgb2YgaXQgb24gQXJtLgo+ID4gCj4gPiBXZWxsLCBteSByZXF1ZXN0IGZvciB0b29sIHN0YWNr
IG1haW50YWluZXIgaW5wdXQgd2Fzbid0IHRvIHB1dCB1bmRlcgo+ID4gcXVlc3Rpb24gdGhhdCB0
aGUgZmllbGQgY2FuJ3QgY3VycmVudGx5IGJlIHVzZWQgc2Vuc2libHkgb24gQXJtLgo+ID4gSW5z
dGVhZCBJJ20gbWVhbmluZyB0byBrbm93IHdoZXRoZXIgaXQgY2FuIGJlIHNlbnNpYmx5IGV4cGVj
dGVkCj4gPiBmb3IgdGhlIHRvb2wgc3RhY2sgdG8gd2FudCB0byB1c2UgdGhlIGZpZWxkIHVuaWZv
cm1seSwgaW4gd2hpY2ggY2FzZQo+ID4gcmF0aGVyIHRoYW4gbWFraW5nIGl0IG1vcmUgb2J2aW91
c2x5IG5vdCB3b3JrIGl0IHNob3VsZCBiZSBmaXhlZAo+ID4gaW5zdGVhZC4KPiA+IAo+ID4gSmFu
Cj4gPiAKPiA+IAo+IAo+IC0tIAo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
