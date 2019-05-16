From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 12:50:43 +0100
Message-ID: <20190516115043.GB2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516133857.742e4f13.ohering@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREuN-0004sf-Hq
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:50:47 +0000
Content-Disposition: inline
In-Reply-To: <20190516133857.742e4f13.ohering@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <ohering@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDE6Mzg6NTdQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMjoyNDo1MCArMDEwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBUaGUgcHJvYmxlbSB3aXRoIHRoaXMgYXBw
cm9hY2ggaXMgdGhhdCBpdCBkb2Vzbid0IGhlbHAgZXhpc3RpbmcgbGlieGwKPiA+IHVzZXJzLiBU
aGV5IHdpbGwgbmVlZCB0byBiZSBmaXhlZCBieSBjYWxsaW5nIHRoaXMgbmV3IEFQSS4KPiAKPiBJ
ZiB0aGUgQVBJIG5lZWRzIHRvIGJlIGNoYW5nZWQsIGEgTElCWExfSEFWRV8gY2FtZSB3aXRoIHRo
ZSBjaGFuZ2UuCj4gCj4gSSdtIG5vdCBzdXJlIGhvdyB0byBmaXggdGhpcyB3aXRob3V0IGNoYW5n
aW5nIHNvbWUgQVBJLgo+IGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0IHdvdWxk
IG5lZWQgYSBkX2NvbmZpZyB0byBtYWtlIGEKPiB1c2FibGUgZGVjaXNpb24uIFRoZSBjYWxsZXJz
IGRvIG5vdCBoYXZlIGEgZF9jb25maWcuIEFuZCB3aGF0IHRoZWlyCj4gY2FsbGVzIGhhdmUgaXMg
YW4gaW5jb21wbGV0ZSBkX2NvbmZpZyBiZWNhdXNlIGxpYnhsIGxhY2tzIGEgcHVibGljIEFQSQo+
IHRvIHByb3Blcmx5IHBvcHVsYXRlIG1pc3NpbmcgZGVmYXVsdHMgaW4gZF9jb25maWcuCj4gCj4g
VG8gbWUgaXQgbG9va3MgbGlrZSBzb21ldGhpbmcgbGlrZSBsaWJ4bF9kb21haW5fY29uZmlnX2Zp
bmlzaChsaWJ4bF9kb21haW5fY29uZmlnKikKPiBpcyBtaXNzaW5nIG5vdy4KPiAKPiBNYXliZSBJ
IGFtIGp1c3QgbWlzdW5kZXJzdGFuZGluZyB3aGF0IHlvdSB0cnlpbmcgdG8gc2F5LCBidXQgdG8g
bWUgaXQKPiBsb29rcyBsaWtlIGZyZWVtZW0oKSB3b3VsZCBuZWVkIHRvIGNhbGwgYW4gdXBkYXRl
ZCBsaWJ4bCBwdWJsaWMgQVBJCj4gYW55d2F5LiBTdXJlbHkgbm90IGZyZWVtZW0gaXRzZWxmLCBi
dXQgeGw6Y3JlYXRlX2RvbWFpbiBhcyBhIHdob2xlLgoKWWVzLCB0aGF0J3Mgd2hhdCBJIHdhbnQg
dG8gYXZvaWQgaWYgcG9zc2libGUuIHhsIGlzIGp1c3Qgb25lIG9mIHRoZQp1c2VycyBvZiBsaWJ4
bC4gWW91IHdpbGwgbGlrZWx5IG5lZWQgdG8gY2hhbmdlIGxpYnZpcnQgYXMgd2VsbC4KCkFkZGlu
ZyBuZXcgQVBJcyBhbmQgZGVmaW5pbmcgTElCWExfSEFWRSB3b24ndCBnZXQgeW91IG91dCBvZiB0
aGlzIGhvbGUuClllcyB5b3UgY2FuIGFkZCBuZXcgQVBJcyBhbmQgbmV3IHVzZXJzIGFyZSBmcmVl
IHRvIHVzZSB0aGVtLCBidXQgWW91CnN0aWxsIG5lZWQgdG8gcmV0YWluIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkgc29tZWhvdy4KCldlaS4KCj4gCj4gT2xhZgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
