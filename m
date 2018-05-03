From: Alexey G <x1917x@gmail.com>
Subject: Re: [PATCH for-4.11] x86/dom0: add extra RAM regions as
 RESERVED for PVH memory map
Date: Thu, 3 May 2018 22:02:47 +1000
Message-ID: <20180503220247.00001e80@gmail.com>
References: <20180503095640.58090-1-roger.pau@citrix.com>
 <20180503205514.00002a56@gmail.com>
 <20180503111518.ac2z7fo6f2lei7vx@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=srxd=hw=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1fECwu-0007yv-B3
 for xen-devel@lists.xenproject.org; Thu, 03 May 2018 12:03:00 +0000
Received: by mail-lf0-x22d.google.com with SMTP id j16-v6so25571128lfb.7
 for <xen-devel@lists.xenproject.org>; Thu, 03 May 2018 05:02:59 -0700 (PDT)
In-Reply-To: <20180503111518.ac2z7fo6f2lei7vx@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?UTF-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAzIE1heSAyMDE4IDEyOjE1OjE4ICswMTAwClJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToKCj5PbiBUaHUsIE1heSAwMywgMjAxOCBhdCAwODo1NTox
NFBNICsxMDAwLCBBbGV4ZXkgRyB3cm90ZToKPj4gT24gVGh1LCAzIE1heSAyMDE4IDEwOjU2OjQw
ICswMTAwCj4+IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
PiAgIAo+PiA+V2hlbiBydW5uaW5nIGFzIFBWSCBEb20wIHRoZSBuYXRpdmUgbWVtb3J5IG1hcCBp
cyB1c2VkIGluIG9yZGVyIHRvCj4+ID5jcmFmdCBhIHRhaWxvcmVkIG1lbW9yeSBtYXAgZm9yIERv
bTAgdGFraW5nIGludG8gYWNjb3VudCBpdCdzIG1lbW9yeQo+PiA+bGltaXQuCj4+ID4KPj4gPkRv
bTAgbWVtb3J5IGlzIGFsd2F5cyBnb2luZyB0byBiZSBzbWFsbGVyIHRoYW4gdGhlIHRvdGFsIGFt
b3VudAo+PiA+b2YgbWVtb3J5IHByZXNlbnQgb24gdGhlIGhvc3QsIHNvIGluIG9yZGVyIHRvIHBy
ZXZlbnQgRG9tMCBmcm9tCj4+ID5yZWxvY2F0aW5nIFBDSSBCQVJzIG92ZXIgUkFNIHJlZ2lvbnMg
bWFyayBhbGwgdGhlIFJBTSByZWdpb25zIG5vdAo+PiA+YXZhaWxhYmxlIHRvIERvbTAgYXMgUkVT
RVJWRUQgaW4gdGhlIG1lbW9yeSBtYXAuCj4+ID4tLS0KPj4gPk5COiBJIGhhdmVuJ3Qgc2VlbiBh
bnkgc3lzdGVtIHdoZXJlIERvbTAgd291bGQgcmVsb2NhdGUgdGhlIEJBUnMKPj4gPm92ZXIgUkFN
IHJlZ2lvbnMsIGJ1dCBBRkFJQ1QgZ2l2ZW4gdGhlIGN1cnJlbnQgbWVtb3J5IG1hcCBwcm92aWRl
ZAo+PiA+dG8gRG9tMCB0aGlzIGlzIGEgcG9zc2liaWxpdHkgdGhhdCBzaG91bGQgYmUgYXZvaWRl
ZC4gIAo+PiAKPj4gR3Vlc3QgT1NlcyB0eXBpY2FsbHkgdXNlIGluZm9ybWF0aW9uIGZyb20gQUNQ
SSB0byBsZWFybiB3aGVyZSBQQ0kKPj4gQkFScyBjYW4gKG9yIGNhbm5vdCkgYmUgcmVsb2NhdGVk
LiAgCj4KPkkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gYmUgc2FmZSB0aGFuIHNvcnJ5LCBzbyBJTU8g
dGhlIGhvc3QgUkFNIHJlZ2lvbnMKPnNob3VsZCBiZSBhZGRlZCB0byB0aGUgbWVtb3J5IG1hcCBh
cyBSRVNFUlZFRC4KPgo+Um9nZXIuCgpJIGFzc3VtZSBob3N0J3MgRFNEVCBwYXNzZWQgdGhyb3Vn
aCB0byBQVkggRG9tMCBhcyBpcz8gSW4gdGhpcyBjYXNlCkRvbTAgd2lsbCBzZWUgUENJIGhvbGVz
IG1hdGNoaW5nIHRob3NlIG9mIHRoZSBob3N0IGFuZCBzaG91bGRuJ3QgbWFrZQphbnkgYXR0ZW1w
dHMgdG8gcGxhY2UgQkFScyBvdXRzaWRlIHByb3ZpZGVkIFBDSSBob2xlcyAoZXhjZXB0ICJub2Ny
cyIKZ2l2ZW4pLgoKQXMgbG9uZyBhcyBEb20wIFAyTSBtYXAgcHJldmVudCB1c2luZyB0aGVzZSBo
b3N0IHJhbmdlcyB3ZSBzaG91bGRuJ3QKd29ycnkgaWYgaXQgaXMgbWFya2VkIGFzIHJlc2VydmVk
IGluIGU4MjAgbWFwIEkgdGhpbmsuIEl0J3Mga2luZGEKZXhjZXNzaXZlIGluZm9ybWF0aW9uIGZv
ciBEb20wIC0tIGtub3dpbmcgYWJvdXQgaG9zdCBSQU0gcmFuZ2VzIHdoaWNoCmhlIGNhbm5vdCB0
b3VjaCBhbnl3YXkgZHVlIHRvIGxhY2sgb2YgY29ycmVzcG9uZGluZyBwMm0gbWFwcGluZ3MuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
