From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] x86/msr: add Raw and Host domain policies
Date: Fri, 16 Feb 2018 04:06:56 -0700
Message-ID: <5A86C96002000078001A85A4@prv-mh.provo.novell.com>
References: <20180208102321.25193-1-sergey.dyasli@citrix.com>
 <5A859A1E02000078001A8131@prv-mh.provo.novell.com>
 <1518777232.2904.1.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518777232.2904.1.camel@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAyLjE4IGF0IDExOjMzLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiBUaHUsIDIwMTgtMDItMTUgYXQgMDY6MzMgLTA3MDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+PiA+ID4gPiBPbiAwOC4wMi4xOCBhdCAxMToyMywgPHNlcmdleS5keWFzbGlAY2l0cml4LmNv
bT4gd3JvdGU6Cj4+ID4gIAl1aW50NjRfdCB2YWw7Cj4+ID4gKwlpbnQgcmM7Cj4+ID4gIAo+PiA+
IC0JaWYgKHJkbXNyX3NhZmUoTVNSX0lOVEVMX1BMQVRGT1JNX0lORk8sIHZhbCkgfHwKPj4gPiAr
CWlmICgocmMgPSByZG1zcl9zYWZlKE1TUl9JTlRFTF9QTEFURk9STV9JTkZPLCB2YWwpKSA9PSAw
KQo+PiA+ICsJewo+PiA+ICsJCWRwLT5wbGFmb3JtX2luZm8uYXZhaWxhYmxlID0gdHJ1ZTsKPj4g
PiArCQlpZiAodmFsICYgTVNSX1BMQVRGT1JNX0lORk9fQ1BVSURfRkFVTFRJTkcpCj4+ID4gKwkJ
CWRwLT5wbGFmb3JtX2luZm8uY3B1aWRfZmF1bHRpbmcgPSB0cnVlOwo+PiA+ICsJfQo+PiA+ICsK
Pj4gPiArCWlmIChyYyB8fAo+PiA+ICAJICAgICEodmFsICYgTVNSX1BMQVRGT1JNX0lORk9fQ1BV
SURfRkFVTFRJTkcpIHx8Cj4+ID4gIAkgICAgcmRtc3Jfc2FmZShNU1JfSU5URUxfTUlTQ19GRUFU
VVJFU19FTkFCTEVTLAo+PiA+ICAJCSAgICAgICB0aGlzX2NwdShtc3JfbWlzY19mZWF0dXJlcykp
KQo+PiAKPj4gQmVsb3cgaGVyZSB3ZSBoYXZlCj4+IAo+PiAJCXNldHVwX2NsZWFyX2NwdV9jYXAo
WDg2X0ZFQVRVUkVfQ1BVSURfRkFVTFRJTkcpOwo+PiAKPj4gU2hvdWxkbid0IHRoaXMgYmUgcmVm
bGVjdGVkIGluIHRoZSBob3N0IHBvbGljeT8KPiAKPiBJIGd1ZXNzIHRoZSBjb3JyZWN0IHRoaW5n
IHRvIGRvIGZvciBub3cgZm9yIGhvc3RfbXNyX2RvbWFpbl9wb2xpY3kgaXM6Cj4gCj4gICAgIGRw
LT5wbGFmb3JtX2luZm8uY3B1aWRfZmF1bHRpbmcgPSBjcHVfaGFzX2NwdWlkX2ZhdWx0aW5nOwo+
ICAgICAKPiBMb29raW5nIGF0IHRoZSBjb2RlLCBjYWxjdWxhdGVfcHZfbWF4X3BvbGljeSgpIHdp
bGwgYmUgc2ltcGxpZmllZCB3aXRoCj4gdGhlIGFib3ZlIGNoYW5nZTogcHZfbWF4X21zcl9kb21h
aW5fcG9saWN5IHdpbGwgYmVjb21lIGEgY29weSBvZiBob3N0Cj4gcG9saWN5Lgo+IAo+IFRoaXMg
YWN0dWFsbHkgYnJpbmdzIGEgcXVlc3Rpb246IHdoYXQgdG8gZG8gYWJvdXQgcGVyLXBDUFUgTVNS
cyBpbiB0aGUKPiBjb250ZXh0IG9mIE1TUiBwb2xpY3k/CgpIb3cgZG9lcyBwZXItcENQVS1uZXNz
IG9mIGFuIE1TUiBhZmZlY3QgdGhlIHBvbGljeT8gQXJlIHlvdQp0aGlua2luZyBvZiBDUFVzIHdp
dGggZGlmZmVyZW50IGNhcGFiaWxpdGllcz8gV2UgYXNzdW1lIGFsbCBDUFVzCmFyZSBpZGVudGlj
YWwgaW4gbWFueSBvdGhlciBwbGFjZXMuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
