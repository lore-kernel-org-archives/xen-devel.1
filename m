From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/pvshim: use 2M alignment
Date: Tue, 19 Mar 2019 07:56:31 -0600
Message-ID: <5C90F50F02000078002204F0@prv1-mh.provo.novell.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-3-wei.liu2@citrix.com>
 <5C90F1E00200007800220499@prv1-mh.provo.novell.com>
 <20190319135007.GH14641@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a8QS=RW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h6FEM-0004S4-Ks
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:56:38 +0000
In-Reply-To: <20190319135007.GH14641@zion.uk.xensource.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAzLjE5IGF0IDE0OjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDc6NDI6NTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxOS4wMy4xOSBhdCAxNDowNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWcKPj4g
PiArKysgYi94ZW4vYXJjaC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnCj4+ID4gQEAgLTUs
NiArNSw3IEBAIENPTkZJR19QVkhfR1VFU1Q9eQo+PiA+ICBDT05GSUdfUFZfU0hJTT15Cj4+ID4g
IENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRT15Cj4+ID4gIENPTkZJR19OUl9DUFVTPTMyCj4+ID4g
K0NPTkZJR19YRU5fQUxJR05fMk09eQo+PiA+ICAjIERpc2FibGUgZmVhdHVyZXMgbm90IHVzZWQg
YnkgdGhlIFBWIHNoaW0KPj4gPiAgIyBDT05GSUdfU0hBRE9XX1BBR0lORyBpcyBub3Qgc2V0Cj4+
ID4gICMgQ09ORklHX0JJR01FTSBpcyBub3Qgc2V0Cj4+IAo+PiBJbnN0ZWFkIG9mIHRoaXMsIHdo
eSBub3QgYWRkCj4+IAo+PiAgICAgZGVmYXVsdCBYRU5fQUxJR05fMk0gaWYgUFZfU0hJTV9FWENM
VVNJVkUKPj4gCj4+IHRvIHRoZSBjb25maWcgb3B0aW9uIGl0c2VsZiwgYWhlYWQgb2YgdGhlIGRl
ZmF1bHQgcGF0Y2ggMSBlc3RhYmxpc2hlcz8KPiAKPiBUaGlzIHNlZW1zIHRvIHdvcmsgLS0gSSBk
aWRuJ3Qga25vdyB5b3UgY2FuIGhhdmUgdHdvIGRlZmF1bHQncyBmb3IgdGhlCj4gc2FtZSBvcHRp
b24uCgpUaGUgb3JkZXIgaXMgaW1wb3J0YW50LCBidXQgYmV5b25kIHRoYXQgeW91IGNhbiBoYXZl
IGFueSBudW1iZXIKb2YgdGhlbS4gVGhlIGZpcnN0IG9uZSB0aGUgImlmIiBvZiB3aGljaCBtYXRj
aGVzIGdldHMgdXNlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
