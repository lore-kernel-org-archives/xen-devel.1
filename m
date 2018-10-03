From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/pvh: set coherent MTRR state for all
 vCPUs
Date: Wed, 3 Oct 2018 14:38:40 +0100
Message-ID: <20181003133840.kcmy4z4vjddoxrbw@zion.uk.xensource.com>
References: <20181002163614.82859-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nzpo=mp=citrix.com=prvs=80755c3b3=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g7hMZ-0007ss-UV
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 13:38:51 +0000
Content-Disposition: inline
In-Reply-To: <20181002163614.82859-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMDIsIDIwMTggYXQgMDY6MzY6MTRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEluc3RlYWQgb2YganVzdCBkb2luZyBpdCBmb3IgdGhlIEJTUC4gVGhpcyByZXF1
aXJlcyBzdG9yaW5nIHRoZQo+IG1heGltdW0gbnVtYmVyIG9mIHBvc3NpYmxlIHZDUFVzIGluIHhj
X2RvbV9pbWFnZS4KPiAKPiBUaGlzIGhhcyBiZWVuIGEgbGF0ZW50IGJ1ZyBzbyBmYXIgYmVjYXVz
ZSBQVkggZG9lc24ndCB5ZXQgc3VwcG9ydAo+IHBjaS1wYXNzdGhyb3VnaCwgc28gdGhlIGVmZmVj
dGl2ZSBtZW1vcnkgY2FjaGUgYXR0cmlidXRlIGlzIGZvcmNlZCB0bwo+IFdCIGJ5IHRoZSBoeXBl
cnZpc29yLiBOb3RlIGFsc28gdGhhdCBldmVuIHdpdGhvdXQgdGhpcyBpbiBwbGFjZSB2Q1BVIzAK
PiBpcyBwcmVmZXJyZWQgaW4gY2VydGFpbiBzY2VuYXJpb3MgaW4gb3JkZXIgdG8gY2FsY3VsYXRl
IHRoZSBtZW1vcnkKPiBjYWNoZSBhdHRyaWJ1dGVzLgo+IAo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpbLi4uXQo+IC0tLQo+IGRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9kb20uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCj4g
aW5kZXggOGE4YTMyYzY5OS4uNWM4MGFhYjc2NyAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9kb20uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCj4gQEAgLTgwMyw2ICs4
MDMsNyBAQCBpbnQgbGlieGxfX2J1aWxkX3B2KGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlk
LAo+ICAgICAgZG9tLT54ZW5zdG9yZV9ldnRjaG4gPSBzdGF0ZS0+c3RvcmVfcG9ydDsKPiAgICAg
IGRvbS0+eGVuc3RvcmVfZG9taWQgPSBzdGF0ZS0+c3RvcmVfZG9taWQ7Cj4gICAgICBkb20tPmNs
YWltX2VuYWJsZWQgPSBsaWJ4bF9kZWZib29sX3ZhbChpbmZvLT5jbGFpbV9tb2RlKTsKPiArICAg
IGRvbS0+bnJfdmNwdXMgPSBpbmZvLT5tYXhfdmNwdXM7CgpUaGlzIGlzbid0IHN0cmljdGx5IG5l
ZWRlZCwgYnV0IEkgdGhpbmsgc2V0dGluZyBpdCBmb3IgUFYgYXMgd2VsbCBpcwptb3JlIGNvbnNp
c3RlbnQuCgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpBbmRyZXcs
IGNhbiB5b3UgZ2l2ZSB0aGlzIGEgdHJ5PwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
