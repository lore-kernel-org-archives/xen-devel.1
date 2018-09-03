From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] hvmloader: fix build with LLVM Linker
Date: Mon, 03 Sep 2018 08:51:03 -0600
Message-ID: <5B8D4A5702000078001E4AE9@prv1-mh.provo.novell.com>
References: <20180824095802.78002-1-roger.pau@citrix.com>
 <5B83C96F02000078001E214F@prv1-mh.provo.novell.com>
 <20180903141937.pxyox3zwz37rpn6l@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ymad=lr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fwqC4-0000Hj-BB
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 14:51:08 +0000
In-Reply-To: <20180903141937.pxyox3zwz37rpn6l@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE2OjE5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXVnIDI3LCAyMDE4IGF0IDAzOjUwOjM5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjQuMDguMTggYXQgMTE6NTgsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIC9kZXYvbnVsbAo+PiA+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxv
YWRlci9odm1sb2FkZXIubGRzCj4+ID4gQEAgLTAsMCArMSwxMyBAQAo+PiA+ICtTRUNUSU9OUwo+
PiA+ICt7Cj4+ID4gKyAgLiA9IDB4MTAwMDAwOwo+PiA+ICsgIC8qCj4+ID4gKyAgICogTkI6IHRo
ZXJlJ3Mgbm8gbmVlZCB0byB1c2UgdGhlIEFUIGtleXdvcmQgaW4gb3JkZXIgdG8gc2V0IHRoZSBM
TUEsIGJ5Cj4+ID4gKyAgICogZGVmYXVsdCB0aGUgbGlua2VyIHdpbGwgdXNlIFZNQSA9IExNQSB1
bmxlc3Mgc3BlY2lmaWVkIG90aGVyd2lzZS4KPj4gPiArICAgKi8KPj4gPiArICAudGV4dCA6IHsg
KigudGV4dCkgfQo+PiA+ICsgIC5yb2RhdGEgOiB7ICooLnJvZGF0YSkgfQo+PiA+ICsgIC5kYXRh
IDogeyAqKC5kYXRhKSB9Cj4+ID4gKyAgLmJzcyA6IHsgKiguYnNzKSB9Cj4+ID4gKyAgX2VuZCA9
IC47Cj4+ID4gK30KPj4gCj4+IElzIHRoaXMgcmVhbGx5IHN1ZmZpY2llbnQ/IElpcmMgdGhlIGNv
bXBpbGVyIGNvdWxkIGNyZWF0ZSBxdWl0ZSBhIGZldwo+PiBtb3JlIHZhcmlhbnRzIG9mIHRoZSBz
ZWN0aW9ucyBuYW1lZCBhYm92ZSwgbGlrZSAucm9kYXRhLnN0ciogb3IKPj4gLnRleHQuY29sZC4g
SGVuY2UgYXQgdGhlIHZlcnkgbGVhc3QgSSdkIGV4cGVjdCAuPHNlY3Rpb24+IG9uIHRoZQo+PiBy
aWdodCBzaWRlcyBhYm92ZSB0byBiZSBhY2NvbXBhbmllZCBieSAuPHNlY3Rpb24+LiogLgo+IAo+
IFJpZ2h0LCBBVE0gdGhlIGNvbXBpbGVyIEknbSB1c2luZyBkb2Vzbid0IGdlbmVyYXRlIGFueSBv
ZiB0aG9zZSwgYnV0Cj4geW91IGFyZSBjb3JyZWN0IHRoYXQgdGhpcyBjb3VsZCBiZSB0aGUgY2Fz
ZS4KPiAKPiBEbyB5b3UgaGF2ZSBhIHByZWZlcmVuY2UgZm9yIGFkZGluZyAuPHNlY3Rpb24+Liog
aW5zdGVhZCBvZiBqdXN0IHVzaW5nCj4gYSBzaW5nbGUgLjxzZWN0aW9uPio/CgpZZXMsIEkgdGhp
bmsgd2Ugc2hvdWxkbid0IG1hdGNoIG1vcmUgYWdncmVzc2l2ZWx5IHRoYW4gd2UgaGF2ZSB0by4K
LnRleHQuKiBldGMgYXJlIHdlbGwga25vd24gZm9ybXMsIGFuZCB3aGlsZSAudGV4dDEgZXRjIG1h
eSBhbHNvIGJlLApJIHdvdWxkbid0IHdhbnQgdG8gbWF0Y2ggbW9yZSBleG90aWMgb25lcyBsaWtl
IC50ZXh0dWFsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
