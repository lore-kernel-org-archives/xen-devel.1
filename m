From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 27/50] x86emul: support AVX512{F,
 ER} reciprocal insns
Date: Thu, 23 May 2019 17:15:07 +0100
Message-ID: <bf91ae8b-33f8-ee85-ff39-44e8ccc29f60@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84A8020000780021F23F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=52eM=TX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTqN8-00019w-6u
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 16:15:14 +0000
In-Reply-To: <5C8B84A8020000780021F23F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWxzbyBpbmNsdWRlIHRo
ZSBvbmx5IG90aGVyIEFWWDUxMkVSIGluc24gcGFpciwgVkVYUDJQe0QsU30uCj4KPiBOb3RlIHRo
YXQgZGVzcGl0ZSB0aGUgcmVwbGFjZW1lbnQgb2YgdGhlIFNIQSBpbnNucycgdGFibGUgc2xvdHMg
dGhlcmUncwo+IG5vIG5lZWQgdG8gc3BlY2lhbCBjYXNlIHRoZWlyIGRlY29kaW5nOiBUaGVpciBp
bnNuLXNwZWNpZmljIGNvZGUgYWxyZWFkeQo+IHNldHMgb3BfYnl0ZXMgKGFzIHdhcyByZXF1aXJl
ZCBkdWUgdG8gc2ltZF9vdGhlciksIGFuZCBUd29PcCBpcyBvZiBubwo+IHJlbGV2YW5jZSBmb3Ig
bGVnYWN5IGVuY29kZWQgU0lNRCBpbnNucy4KPgo+IFRoZSByYWlzaW5nIG9mICNVRCB3aGVuIEVW
RVguTCdMIGlzIDMgZm9yIEFWWDUxMkVSIHNjYWxhciBpbnNucyBpcyBkb25lCj4gdG8gYmUgb24g
dGhlIHNhZmUgc2lkZS4gVGhlIFNETSBkb2VzIG5vdCBjbGFyaWZ5IGJlaGF2aW9yIHRoZXJlLCBh
bmQKPiBpdCdzIGV2ZW4gbW9yZSBhbWJpZ3VvdXMgaGVyZSAod2l0aG91dCBBVlg1MTJWTCBpbiB0
aGUgcGljdHVyZSkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KClNlZWluZyBhcyBJIGhhdmUgc29tZSBFUiBoYXJkd2FyZSwgaXMgdGhlcmUgYW4gZWFzeSB3
YXkgdG8gZ2V0CkdDQy9iaW51dGlscyB0byBlbWl0IGEgd2VpcmQgTCdMIGZpZWxkLCBvciB3aWxs
IHRoaXMgaW52b2x2ZSBzb21lIG1hbnVhbApvcGNvZGUgZ2VuZXJhdGlvbiB0byB0ZXN0PwoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
