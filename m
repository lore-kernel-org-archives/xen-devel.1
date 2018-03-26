From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 7/7] xen/x86: use PCID feature
Date: Mon, 26 Mar 2018 06:19:12 -0600
Message-ID: <5AB9016002000078001B611E@prv1-mh.provo.novell.com>
References: <20180321125129.28539-1-jgross@suse.com>
 <20180321125129.28539-8-jgross@suse.com>
 <5AB4EA4902000078001B577B@suse.com>
 <c07a3b60-7bcb-c9dc-e63e-2ae41157d3ea@suse.com>
 <5AB5136302000078001B58D9@suse.com>
 <67a5bfca-7cce-4f10-1e24-30888d3d8ccb@suse.com>
 <5AB5324C02000078001B59E7@suse.com>
 <473492c7-1e5b-a3ad-1496-f5b29ca4fc44@suse.com>
 <5AB8CB3902000078001B5F3A@suse.com>
 <a0e2efe6-c456-2cbb-d42f-03dd8a721482@suse.com>
 <5AB8E3DC02000078001B5FEB@suse.com>
 <053a7a73-5470-89b7-872e-92d7527e41f7@suse.com>
 <5AB8EAE902000078001B6034@suse.com>
 <7db012cc-f340-9299-20b8-ac17ee81d8f5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zopv=gq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f0R5p-0002gi-7A
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 12:19:17 +0000
In-Reply-To: <7db012cc-f340-9299-20b8-ac17ee81d8f5@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Kevin Tian <kevin.tian@intel.com>, Dario Faggioli <dfaggioli@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE4IGF0IDE0OjA0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ni8wMy8xOCAxMjo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI2LjAzLjE4IGF0IDEy
OjI5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDI2LzAzLzE4IDEyOjEzLCBKYW4g
QmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyNi4wMy4xOCBhdCAxMDo1NSwgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+Pj4+IEkgY2FuIGNoYW5nZSB0aGUgc2NoZW1lIHRvIHVzZSBkaWZmZXJl
bnQgdmFsdWVzIGZvciBndWVzdCBQQ0lEcwo+Pj4+PiB3aXRoIFhQVEkgb24sIG9mIGNvdXJzZS4g
QXJlIHlvdSBmaW5lIHdpdGg6Cj4+Pj4+Cj4+Pj4+IC0gWFBUSSBvZmY6IFBDSUQgMCA9IGtlcm5l
bCwgUENJRCAxID0gdXNlcgo+Pj4+PiAtIFhQVEkgb246ICBQQ0lEIDAgPSBrZXJuZWwvWGVuLCBQ
Q0lEIDEgPSB1c2VyL1hlbiwKPj4+Pj4gICAgICAgICAgICAgUENJRCAyID0ga2VybmVsL2d1ZXN0
LCBQQ0lEIDMgPSB1c2VyL2d1ZXN0Cj4+Pj4KPj4+PiBZZXMsIHRoYXQgd291bGQgZml0IHRoZSBm
aXJzdCB2YXJpYW50IEkndmUgZGVzY3JpYmVkLiBJIHRha2UgaXQgeW91Cj4+Pj4gcHJlZmVyIG5v
dCB0byBhdm9pZCBQQ0lEIDAgYWx0b2dldGhlciB3aGVuIFBDSURzIGFyZSBlbmFibGVkIC0KPj4+
PiBpcyB0aGVyZSBhIHBhcnRpY3VsYXIgcmVhc29uPwo+Pj4KPj4+IFllcy4gQXMgd3JpdHRlbiBp
biB0aGUgY29tbWVudCBpbiBmbHVzaF9hcmVhX2xvY2FsKCkgSSBjYW4ndCBiZSBzdXJlCj4+PiB3
aGV0aGVyIHRoZSBjdXJyZW50IGFkZHJlc3Mgc3BhY2UgaXMgdGhhdCBvZiBhIGRvbWFpbiB3aXRo
IFhQVEkKPj4+IGVuYWJsZWQgKHRoZSBpZGxlIGRvbWFpbiBjb3VsZCBiZSAiY3VycmVudCIpLiBT
byBJIG5lZWQgdG8gYWx3YXlzCj4+PiBmbHVzaCB3aXRoIFBDSUQgMCBhbmQgd2l0aCB0aGUgcG9z
c2libGUgUENJRCB2YWx1ZXMgZm9yIGEgWFBUSSBkb21haW4uCj4+PiBXaGVuIHVzaW5nIFBDSUQg
MCBmb3IgWFBUSSBhcyB3ZWxsIEknbGwgbmVlZCA0IElOVlBDSURzLCB3aGlsZSB3aGVuCj4+PiBh
dm9pZGluZyBpdCBJJ2QgbmVlZCA1IChhdCBsZWFzdCB3aGVuIGN1cnJlbnQgPT0gaWRsZSkuCj4+
IAo+PiBJIHNlZS4gV2hpY2ggbWFrZXMgbWUgd29uZGVyIHdoZXRoZXIgYSBzdWl0YWJsZSBjb21i
aW5hdGlvbgo+PiBvZiBJTlZMUEcgKHRvIGdldCByaWQgb2YgZ2xvYmFsIGVudHJpZXMpIGFuZCBJ
TlZQQ0lEIGNvdWxkbid0IGJlCj4+IHVzZWQgaW5zdGVhZC4gRm9yIGV4YW1wbGUsIHlvdSBtYXkg
YmUgYWJsZSB0byByZXBsYWNlIHRoZQo+PiBJTlZQQ0lEIGZvciB0aGUgYWN0aXZlIFBDSUQgYnkg
SU5WTFBHICh3aXRob3V0IG5lZWRpbmcgdG8KPj4ga25vdyB3aG8gImN1cnJlbnQiIGlzKS4KPiAK
PiBJTlZMUEcgaGFzIHRoZSBkaXNhZHZhbnRhZ2UgdG8gY2xlYXIgYWxsIHBhZ2luZy1zdHJ1Y3R1
cmUgY2FjaGUKPiBlbnRyaWVzIGFzc29jaWF0ZWQgd2l0aCB0aGUgY3VycmVudCBQQ0lELgo+IAo+
IEFuZCBJIHRob3VnaHQgd2Ugd2VyZSBmaW5hbGx5IG9uIHRoZSBzYW1lIHBhZ2Ugbm90IHRvIHVz
ZSBnbG9iYWwKPiBwYWdlcyB3aXRoIFBDSUQgZW5hYmxlZD8KClllcywgd2UgYXJlLiBJZiBubyBn
bG9iYWwgVExCIGVudHJpZXMgY2FuIGV2ZXIgc3Vydml2ZSBhIENSNC5QQ0lERQowIC0+IDEgdHJh
bnNpdGlvbiwgYWxsIHdvdWxkIGJlIGZpbmUgd2l0aG91dCBJTlZMUEcgb2YgY291cnNlLgoKSmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
