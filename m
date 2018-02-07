From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] firmware/shim: better filtering of
 dependency files during Xen tree setup
Date: Wed, 07 Feb 2018 09:27:49 -0700
Message-ID: <5A7B371502000078001A6285@prv-mh.provo.novell.com>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
 <5A7B244C02000078001A6145@prv-mh.provo.novell.com>
 <20180207160518.lhp4xibwcncje2c2@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=rmex=fb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ejSZi-0000MD-OU
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2018 16:27:58 +0000
In-Reply-To: <20180207160518.lhp4xibwcncje2c2@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE4IGF0IDE3OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDA3LCAyMDE4IGF0IDA4OjA3OjQwQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBJIGhhdmUgbm8gaWRlYSB3aGF0ICouZDEgaXMgc3VwcG9zZWQgdG8gcmVmZXIgdG8g
LSB3ZSBvbmx5IGhhdmUgLiouZAo+PiBhbmQgLiouZDIgZmlsZXMgKG5vdGUgYWxzbyB0aGUgbGVh
ZGluZyBkb3QpLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+PiAKPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+PiAr
KysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+IEBAIC0yNiw3ICsyNiw3IEBA
IGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykKPj4gIAkkKGZvcmVhY2gg
ZCwgJChMSU5LX0RJUlMpLCBcCj4+ICAJCShjZCAkKFhFTl9ST09UKTsgXAo+PiAgCQkgZmluZCAk
KGQpICEgLXR5cGUgbCAtdHlwZSBmIFwKPj4gLQkJICQoYWRkcHJlZml4ICEgLXBhdGggLCAnKi5b
b2RhMV0nICcqLmRbMTJdJykpIFwKPj4gKwkJICQoYWRkcHJlZml4ICEgLXBhdGggLCAnKi5bb2Ex
XScgJy4qLmQnICcuKi5kMicpKSBcCj4gCj4gRG9uJ3QgeW91IHdhbnQgLW5hbWUgaGVyZSBpbnN0
ZWFkIG9mIC1wYXRoPwo+IAo+IEFGQUlDVCB1c2luZyAnLiouZCcgaXMgbm90IGdvaW5nIHRvIHdv
cmsgd2l0aCBwYXRoLCBiZWNhdXNlIHRoYXQncyB0aGUKPiBmdWxsIHBhdGgsIG5vdCB0aGUgbmFt
ZSBvZiB0aGUgZmlsZS4gVGhpcyB1c2VkIHRvIHdvcmsgYmVmb3JlIGJlY2F1c2UKPiB0aGUgcGF0
dGVybnMgc3RhcnRlZCB3aXRoICcqJy4KCk9oLCBnb29kIHBvaW50LiBPbmNlIGFnYWluIEkgaGF2
ZSBubyBpZGVhIHdoeSAtcGF0aCB3YXMgdXNlZCBpbgp0aGUgZmlyc3QgcGxhY2UuCgo+IEFsc28g
SSBjYW5ub3QgZmluZCBhbnkgLmEgb3IgLjEgZmlsZXMsIGJ1dCBtYXliZSB0aGF0J3MganVzdCBi
ZWNhdXNlCj4gb2YgbXkgYnVpbGQgc3lzdGVtIChJIGRvbid0IGJ1aWxkIEVGSSkuCgpUaGUgLjEg
cGFydCBnb2VzIGF3YXkgaW4gcGF0Y2ggMy4gSSBzdXBwb3NlIC5hIGlzIGp1c3QgdG8gY292ZXIK
YXJjaGl2ZXMgZXZlbiBpZiB3ZSBkb24ndCB1c2UgYW55IHJpZ2h0IG5vdy4KCkphbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
