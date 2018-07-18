From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] VMX: fix vmx_{find,del}_msr() build
Date: Wed, 18 Jul 2018 03:39:20 -0600
Message-ID: <5B4F0AC802000078001D552B@prv1-mh.provo.novell.com>
References: <5B4CCBD302000078001D4907@prv1-mh.provo.novell.com>
 <20180718093635.6xj53gmrpezy5p2t@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rjtn=kc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffivb-00040L-Pf
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:39:23 +0000
In-Reply-To: <20180718093635.6xj53gmrpezy5p2t@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA3LjE4IGF0IDExOjM2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKdWwgMTYsIDIwMTggYXQgMTA6NDY6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IEZvciBhIHJlYXNvbiB0aGF0IEkgY2FuJ3QgZXhwbGFpbiwgaXQgaXMgb25seSB0aGUg
c2hpbSBidWlsZCB0aGF0IGZhaWxzCj4+IGZvciBtZSB3aXRoIGFuIG9sZGVyIGdjYyBkdWUgdG8g
dGhlIGNvbXBpbGVyIG5vdCByZWNvZ25pemluZyB0aGF0Cj4+IGFwcGFyZW50bHkgdW5pbml0aWFs
aXplZCB2YXJpYWJsZXMgYXJlbid0IHJlYWxseSB1bmluaXRpYWxpemVkLiBQdWxsIG91dAo+PiB0
aGUgYXNzaWdubWVudHMgdXNlZCBieSB0d28gb2YgdGhlIHRocmVlIGNhc2UgYmxvY2tzIGFuZCBt
YWtlIHRoZW0KPj4gaW5pdGlhbGl6ZXJzIG9mIHRoZSB2YXJpYWJsZXMsIGFzIEkgdGhpbmsgSSBo
YWQgc3VnZ2VzdGVkIGR1cmluZyByZXZpZXcuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gQ29kZToKPiAKPiBSZXZpZXdlZC1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBCdXQgcGxlYXNlIHVwZGF0ZSB0aGUgY29t
bWl0IG1lc3NhZ2UgdG8gc2F5IGl0IGlzIGNhdXNlZCBieSBjb21waWxlcgo+IG9wdGltaXNhdGlv
biBsZXZlbC4KClN1cmUsIG5vdyB0aGF0IGl0J3MgY2xlYXIgd2hhdCB0aGUgcmVhc29uIGlzLiBJ
dCBub3cgcmVhZHM6CgpPbGRlciBnY2MgYXQgLU8yIChhbmQgcGVyaGFwcyBoaWdoZXIpIGRvZXMg
bm90IHJlY29nbml6ZSB0aGF0IGFwcGFyZW50bHkKdW5pbml0aWFsaXplZCB2YXJpYWJsZXMgYXJl
bid0IHJlYWxseSB1bmluaXRpYWxpemVkLiBQdWxsIG91dCB0aGUKYXNzaWdubWVudHMgdXNlZCBi
eSB0d28gb2YgdGhlIHRocmVlIGNhc2UgYmxvY2tzIGFuZCBtYWtlIHRoZW0KaW5pdGlhbGl6ZXJz
IG9mIHRoZSB2YXJpYWJsZXMsIGFzIEkgdGhpbmsgSSBoYWQgc3VnZ2VzdGVkIGR1cmluZyByZXZp
ZXcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
