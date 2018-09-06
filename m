From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 02/16] x86: introduce and use a set of
 internal emulation flags
Date: Thu, 6 Sep 2018 14:47:21 +0100
Message-ID: <20180906134721.ek3dtfb6nmamtvmi@zion.uk.xensource.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-3-wei.liu2@citrix.com>
 <5B912B5302000078001E5F6C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xusr=lu=citrix.com=prvs=7806f00aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fxudF-0001qM-IB
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 13:47:37 +0000
Content-Disposition: inline
In-Reply-To: <5B912B5302000078001E5F6C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMDYsIDIwMTggYXQgMDc6Mjc6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjA5LjE4IGF0IDE4OjE1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBVc2UgdGhlc2UgZmxhZ3MgaW4gaGFzXyogdGVzdHMgYW5kIGVtdWxhdGlvbl9mbGFn
c19vay4KPiA+IAo+ID4gTm90IHVzaW5nIHJhdyBmbGFncyBkaXJlY3RseSBlbmFibGluZyBEQ0Ug
dG8ga2ljayBpbiBmb3IgaGFzXyogdGVzdHMKPiA+IHdoaWxlIGF0IHRoZSBzYW1lIHRpbWUgbWFr
aW5nIHN1cmUgZW11bGF0aW9uX2ZsYWdzX29rIHdvbid0IGdvIG91dCBvZgo+ID4gc3luYy4KPiAK
PiBUaGlzIGlzIHJhdGhlciBoYXJkIHRvIHJlYWQgKGZvciBtZSBhdCBsZWFzdCkuIFBlcmhhcHMg
cy9lbmFibGluZy9lbmFibGVzLwo+IGFuZCBzcGxpdCBzZW50ZW5jZXMgYWZ0ZXIgdGhlIGZpcnN0
IGxpbmUsIG9yIGF0IGxlYXN0IHB1dCBhIGNvbW1hCj4gc29tZXdoZXJlPwoKVGhlcmUgd2VyZSBz
b21lIGdyYW1tYXIgZXJyb3JzLiBUaGUgY29tbWl0IG1lc3NhZ2UgaGFzIGJlZW4gdXBkYXRlZCB0
bzoKCiBOb3QgdXNpbmcgcmF3IGZsYWdzIGRpcmVjdGx5IGVuYWJsZXMgRENFIHRvIGtpY2sgaW4g
Zm9yIGhhc18qIHRlc3RzLAogd2hpbGUgYXQgdGhlIHNhbWUgdGltZSBtYWtlcyBzdXJlIGVtdWxh
dGlvbl9mbGFnc19vayB3b24ndCBnbyBvdXQgb2YKIHN5bmMuCgo+IAo+ID4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmtzLgoKV2VpLgoKPiAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
