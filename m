From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pv: Fix construction of 32bit dom0's
Date: Thu, 14 Feb 2019 01:11:49 -0700
Message-ID: <5C6522C5020000780021690C@prv1-mh.provo.novell.com>
References: <1549485670-9273-1-git-send-email-andrew.cooper3@citrix.com>
 <5C5C2B900200007800214A08@prv1-mh.provo.novell.com>
 <20190213180758.hwh76y5iq6xsm2dd@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190213180758.hwh76y5iq6xsm2dd@zion.uk.xensource.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE5IGF0IDE5OjA3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDU6NTg6NTZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNi4wMi4xOSBhdCAyMTo0MSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IFNsaWdodGx5IFJGQzoKPj4gPiAKPj4gPiAxKSBJJ3ZlIG5vdCB3b3Jr
ZWQgb3V0IGV4YWN0bHkgd2hhdCB0aGUKPj4gPiAKPj4gPiAgICAgIHYtPnZjcHVfaW5mbyA9ICh2
b2lkICopJmQtPnNoYXJlZF9pbmZvLT5jb21wYXQudmNwdV9pbmZvWzBdOwo+PiA+IAo+PiA+ICAg
IGxpbmUgaXMgc3VwcG9zZWQgdG8gYmUgZG9pbmcgYW5kIHdoZXRoZXIgaXQgaXMgbmVlZGVkLCBi
dXQgaXQgZG9lc24ndAo+PiA+ICAgIGFwcGVhciB0byBtYXR0ZXIuICBJdCBpcyBwZXJoYXBzIGFu
b3RoZXIgcmVkdW5kYW50IG9wZW5jb2RpbmcuCj4+IAo+PiBBZmFpY3QgdGhpcyBpcyBqdXN0IHRv
IGJlIGluZGVwZW5kZW50IG9mIHRoZSBmYWN0IHRoYXQgdGhlIHZjcHVfaW5mbwo+PiBhcnJheSBp
cyBmaXJzdCBpbiBzdHJ1Y3Qgc2hhcmVkX2luZm8uIEknZCBiZSBmaW5lIHdpdGggaXQgZ2V0dGlu
ZyByZXBsYWNlZAo+PiBieSBhIHJlc3BlY3RpdmUgQlVJTERfQlVHX09OKCksIGJ1dCBJJ2QgbGlr
ZSB0byBhc2sgdGhhdCBpdCBub3QgYmUKPj4gZHJvcHBlZCB3aXRob3V0IHJlcGxhY2VtZW50Lgo+
IAo+IFdoYXQgZG8geW91IG1lYW4gYnkgImJlIGluZGVwZW5kZW50IG9mIiBoZXJlPyBQZXJoYXBz
IHlvdSBtZWFudCAiYmUgc3VyZQo+IG9mIj8gQnV0IEkgc3RpbGwgZmFpbCB0byB1bmRlcnN0YW5k
IGhvdyB3b3VsZCBhbiBhc3NpZ25tZW50IG1ha2VzIHN1cmUKPiBhIG1lbWJlciBpcyBmaXJzdCBp
biBhIHN0cnVjdC4KCkl0J3MgdGhlIG90aGVyIHdheSBhcm91bmQ6IFdlJ3JlIGZpbmUgd2l0aG91
dCB0aGUgYXNzaWdubWVudCB3aGVuCnRoZSBmaWVsZCBpcyBmaXJzdCBpbiB0aGUgc3RydWN0LiBU
aGUgYXNzaWdubWVudCB3b3VsZCBzdHJpY3RseSBiZSBuZWVkZWQKaWYgaXQgd2Fzbid0LCBiZWNh
dXNlIHRoZW4gd2hhdCdzIGVhcmxpZXIgaW4gdGhlIHN0cnVjdCBjb3VsZCBoYXZlCmRpZmZlcmVu
dCBzaXplcyBiZXR3ZWVuIHRoZSBuYXRpdmUgYW5kIGNvbXBhdCBsYXlvdXRzLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
