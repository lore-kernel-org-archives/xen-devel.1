From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xtf: fix cdefs.h conflict with __section
Date: Fri, 23 Feb 2018 15:20:56 +0000
Message-ID: <20180223152056.evjrxiine33vsyef@MacBook-Pro-de-Roger.local>
References: <20180222120348.46267-1-roger.pau@citrix.com>
 <5A8EC48502000078001AA5E0@prv-mh.provo.novell.com>
 <c4fefd72-dc3f-b8fb-9d30-06684aecbaf9@citrix.com>
 <5A8ED41702000078001AA670@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nm5i=fr=citrix.com=prvs=5854f5d22=roger.pau@srs-us1.protection.inumbo.net>)
 id 1epF9r-0002oq-Fa
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:21:11 +0000
Content-Disposition: inline
In-Reply-To: <5A8ED41702000078001AA670@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMjIsIDIwMTggYXQgMDY6MzA6NDdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjAyLjE4IGF0IDEzOjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAyMi8wMi8xOCAxMjoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+
Pj4gT24gMjIuMDIuMTggYXQgMTM6MDMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
Pj4+IE9uIEZyZWVCU0QgdGhlIGJ1aWxkIGZhaWxzIHdpdGg6Cj4gPj4+Cj4gPj4+IC9yb290L3Ny
Yy94dGYvaW5jbHVkZS94dGYvY29tcGlsZXIuaDoxMzo5OiBlcnJvcjogJ19fc2VjdGlvbicgbWFj
cm8gCj4gPj4+IHJlZGVmaW5lZAo+ID4+PiAgICAgICBbLVdlcnJvciwtV21hY3JvLXJlZGVmaW5l
ZF0KPiA+Pj4gI2RlZmluZSBfX3NlY3Rpb24ocykgICAgICAgICAgX19hdHRyaWJ1dGVfXygoX19z
ZWN0aW9uX18ocykpKQo+ID4+PiAgICAgICAgIF4KPiA+Pj4gL3Vzci9pbmNsdWRlL3N5cy9jZGVm
cy5oOjIyOTo5OiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIGlzIGhlcmUKPiA+Pj4gI2RlZmlu
ZSBfX3NlY3Rpb24oeCkgICAgX19hdHRyaWJ1dGVfXygoX19zZWN0aW9uX18oeCkpKQo+ID4+PiAg
ICAgICAgIF4KPiA+Pj4gMSBlcnJvciBnZW5lcmF0ZWQuCj4gPj4+Cj4gPj4+IE9ubHkgZGVmaW5l
IF9fc2VjdGlvbiBpZiBpdCdzIHVuZGVmaW5lZCBpbiBvcmRlciB0byBwcmV2ZW50IGNvbmZsaWN0
cy4KPiA+PiBCdXQgdGhlIGFjdHVhbCBidWcgaXMgdGhhdCAvdXNyL2luY2x1ZGUvc3lzL2NkZWZz
LmggaXMgKG1hZ2ljYWxseT8pCj4gPj4gYmVpbmcgaW5jbHVkZWQuIEp1c3QgbGlrZSB0aGUgaHlw
ZXJ2aXNvciBidWlsZCwgdGhlIHh0ZiBvbmUgc2hvdWxkbid0Cj4gPj4gcHVsbCBpbiBfYW55XyBl
eHRlcm5hbCBoZWFkZXJzLgo+ID4gCj4gPiBYVEYgdXNlcyB0aGUgZm9sbG93aW5nIGZyZWVzdGFu
ZGluZyBoZWFkZXJzIG9ubHkuCj4gPiAKPiA+ICNpbmNsdWRlIDxzdGRpbnQuaD4KPiA+ICNpbmNs
dWRlIDxzdGRib29sLmg+Cj4gPiAjaW5jbHVkZSA8c3RkYXJnLmg+Cj4gPiAjaW5jbHVkZSA8c3Rk
ZGVmLmg+Cj4gPiAjaW5jbHVkZSA8aW50dHlwZXMuaD4KPiA+ICNpbmNsdWRlIDxsaW1pdHMuaD4K
PiAKPiBOb25lIG9mIHdoaWNoIGNhbGwgZm9yIF9fc2VjdGlvbigpIHRvIGJlIGRlZmluZWQuIE90
b2ggX19zZWN0aW9uKCkKPiBpcyBhIHJlc2VydmVkIG5hbWUsIHNvIGl0IGNvdWxkIGJlIHVzZWQg
Zm9yIF9hbnl0aGluZ18uIEkgdGhlcmVmb3JlCj4gdGhpbmsgaXQgc2hvdWxkIGJlICN1bmRlZi1l
ZCwgaW5zdGVhZCBvZiB0aGUgI2RlZmluZSBiZWluZyBtYWRlCj4gY29uZGl0aW9uYWwuIChUaGUg
Y29tbWVudCBSb2dlciBhZGRzIGlzIHByZXR0eSB1c2VsZXNzIGFzIHdlbGwsCj4gY29uc2lkZXJp
bmcgdGhlcmUncyBubyBjZGVmcy5oIGFueXdoZXJlIGluIHRoZSB4dGYgdHJlZS4pCgpIbSwgdGhh
dCdzIGJhc2ljYWxseSBpbi1saW5lIHdpdGggdGhlIG90aGVyIGNvbW1lbnRzIHJlZ2FyZGluZwpf
X25vaW5saW5lIGFuZCBfX2Fsd2F5c19pbmxpbmUgaW4gdGhlIHNhbWUgZmlsZSwgdGhhdCdzIHdo
eSBJIGRpZG4ndApib3RoZXIgbXVjaCBhbmQganVzdCBkaWQgdGhlIHNhbWUgZm9yIF9fc2VjdGlv
bi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
