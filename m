From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 45/74] x86/guest: use unpopulated
 memory to map the shared_info page
Date: Mon, 08 Jan 2018 04:25:11 -0700
Message-ID: <5A536327020000780019C1AA@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-46-wei.liu2@citrix.com>
 <5A535E26020000780019C126@prv-mh.provo.novell.com>
 <20180108110618.r2smhsjikjqe2lph@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYVYP-00069j-I3
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:25:21 +0000
In-Reply-To: <20180108110618.r2smhsjikjqe2lph@MacBook-Pro-de-Roger.local>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE4IGF0IDEyOjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDA0OjAzOjUwQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTggYXQgMTQ6MDUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4gPiBUaGlzIHByZXZlbnRzIGhhcmRjb2RpbmcgYSBrbm93biB1bnBvcHVsYXRlZCBt
ZW1vcnkgcGFnZSB0byBtYXAKPj4gPiB0aGUgc2hhcmVkIGluZm8gcGFnZS4gVGhpcyBmaXhlcyBh
IFRPRE8gaXRlbSBpbiBhIHByZXZpb3VzIHBhdGNoLgo+PiA+IAo+PiA+IFJlbW92ZSBoeXBlcnZp
c29yX2Vhcmx5X3NldHVwIGFzIG5vdyBpdCBpcyBub3QgcmVxdWlyZWQgYW55bW9yZS4KPj4gPiAK
Pj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+IAo+
PiBMb29rcyBnb29kLCBidXQgb25lIHF1ZXN0aW9uOgo+PiAKPj4gPiBAQCAtMTg3LDE1ICsxODYs
MTIgQEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfbWVtbWFwKHZvaWQpCj4+ID4gICAgICB9Cj4+
ID4gIH0KPj4gPiAgCj4+ID4gLXZvaWQgX19pbml0IGh5cGVydmlzb3JfZWFybHlfc2V0dXAoc3Ry
dWN0IGU4MjBtYXAgKmU4MjApCj4+ID4gLXsKPj4gPiAtICAgIG1hcF9zaGFyZWRfaW5mbyhlODIw
KTsKPj4gPiAtfQo+PiA+IC0KPj4gPiAgdm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lk
KQo+PiA+ICB7Cj4+ID4gICAgICBpbml0X21lbW1hcCgpOwo+PiA+ICAKPj4gPiArICAgIG1hcF9z
aGFyZWRfaW5mbygpOwo+PiA+ICsKPj4gPiAgICAgIGluaXRfZXZ0Y2huKCk7Cj4+ID4gIH0KPj4g
Cj4+IElmIHRoZSBzaGFyZWQgaW5mbyBwYWdlIGlzbid0IG5lZWRlZCBhcyBlYXJseSwgd2h5IHdh
cyBpdCBzZXQgdXAKPj4gdGhhdCBlYXJseSBvcmlnaW5hbGx5Pwo+IAo+IEJlY2F1c2UgZHVyaW5n
IHRoZSBzZXR1cCBvZiB0aGUgc2hhcmVkX2luZm8gdGhlIHVzZWQgbWVtb3J5IGFkZHJlc3MKPiB3
b3VsZCBhbHNvIGJlIGFkZGVkIHRvIHRoZSBlODIwIGluIG9yZGVyIHRvIG1hcmsgaXQgYXMgUkFN
LiBJIGRvbid0Cj4gdGhpbmsgdGhhdCB3YXMgcmVhbGx5IHJlcXVpcmVkLCBzaW5jZSBpdCdzIG5v
dCBuZWVkZWQgdG8gaGF2ZSBhCj4gcGFnZV9pbmZvIGZvciB0aGUgc2hhcmVkX2luZm8gYmVjYXVz
ZSBpdCdzIG5vdCBzaGFyZWQgd2l0aCB0aGUgZ3Vlc3QuCgpBaCwgSSBzZWUuCgpSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
