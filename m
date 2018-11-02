From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] x86: use PDEP/PEXT for
 maddr/direct-map-offset conversion when available
Date: Fri, 02 Nov 2018 02:49:16 -0600
Message-ID: <5BDC0F8C02000078001F715E@prv1-mh.provo.novell.com>
References: <5AA7E79302000078001B0FAB@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F73C0@prv1-mh.provo.novell.com>
 <5AA7D98302000078001CDC8C@prv1-mh.provo.novell.com>
 <5AA7D98302000000000F8008@prv1-mh.provo.novell.com>
 <5AA7D98302000078001DD5F0@prv1-mh.provo.novell.com>
 <5BA0F0D802000078001E96D4@prv1-mh.provo.novell.com>
 <5BA0F14502000078001E96E2@prv1-mh.provo.novell.com>
 <20181031170311.rkhagwwcydciwmus@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIV8q-0005SZ-AT
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 08:49:20 +0000
In-Reply-To: <20181031170311.rkhagwwcydciwmus@zion.uk.xensource.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEwLjE4IGF0IDE4OjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDY6MzY6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IFRoaXMgYWxsb3dzIHRvIGZvbGQgNiBpbnN0cnVjdGlvbnMgaW50byBhIHNpbmdsZSBv
bmUsIHJlZHVjaW5nIGNvZGUgc2l6ZQo+PiBxdWl0ZSBhIGJpdCwgZXNwZWNpYWxseSB3aGVuIG5v
dCBjb25zaWRlcmluZyB0aGUgZmFsbGJhY2sgZnVuY3Rpb25zCj4+ICh3aGljaCB3b24ndCBldmVy
IG5lZWQgdG8gYmUgYnJvdWdodCBpbnRvIGlDYWNoZSBvciB0aGVpciBtYXBwaW5ncyBpbnRvCj4+
IGlUTEIgb24gc3lzdGVtcyBzdXBwb3J0aW5nIEJNSTIpLgo+PiAKPj4gTWFrZSB1c2Ugb2YgZ2Nj
J3MgbmV3IFYgb3BlcmFuZCBtb2RpZmllciwgZXZlbiBpZiB0aGF0IHJlc3VsdHMgaW4gYQo+PiBz
bGlnaHRseSBvZGQgZGVwZW5kZW5jeSBpbiB0aGUgc291cmNlcyAoYnV0IEkgYWxzbyBkaWRuJ3Qg
d2FudCB0bwo+PiBpbnRyb2R1Y2UgeWV0IGFub3RoZXIgbWFuaWZlc3QgY29uc3RhbnQpLiBUaGlz
IGFzc3VtZXMgdGhhdCBiYWNrcG9ydHMgb2YKPj4gc3VwcG9ydCBmb3IgdGhpcyByZWxhdGl2ZWx5
IG5ldyBtb2RpZmllciBoYXZlIG9ubHkgYmVlbiBkb25lIHRvIHRvb2wKPj4gY2hhaW5zIHdpdGgg
bm90IHRvbyBvbGQgYSBiaW51dGlscyAoZ2FzKSB2ZXJzaW9uLiBJZiB0aGlzIHR1cm5zIG91dCB0
bwo+PiBiZSBhIGZhbHNlIGFzc3VtcHRpb24sIHdlJ2xsIGhhdmUgdG8gYWRkIEhBVkVfQVNfQk1J
MiBhcyBhIHF1YWxpZmllci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAKPiBJJ20gYWZyYWlkIHRoaXMgcGF0Y2ggc2VyaWVzIHNtZWxscyBs
aWtlICAibWljcm8gb3B0aW1pc2F0aW9uIGdvbmUgdG9vCj4gZmFyIiB0byBtZS4gOi0vCgpXZWxs
LCBhcyBleHBsYWluZWQgaW4gcmVwbGllcyB0byBBbmRyZXcgYXMgd2VsbCwgdGhlIHByaW1hcnkg
bW90aXZhdGlvbgpoZXJlIGlzIHR3by1mb2xkOgoxKSBUaGUgYmluYXJ5IGNvZGUgaW52b2x2ZWQg
aW4gdGhlc2UgdHJhbnNsYXRpb25zIGlzIHJhdGhlciBoYXJkIHRvCmZvbGxvdyBpbiBzb21lIGNh
c2VzLiBBbmFseXNpcyBvZiBjcmFzaGVzIHdvdWxkIGJlIGEgYml0IGVhc2llciB3aXRoCnRoZSBz
aW1wbGVyIHJlc3VsdGluZyBpbnNucy4KMikgVGhlIHVsdGltYXRlIHVzZSBvZiBhIHNpbmdsZSBN
T1YgaXMsIGNvbnNpZGVyaW5nIHRoZSBsYXJnZSBudW1iZXIKb2YgaW5zdGFuY2VzLCBxdWl0ZSBj
ZXJ0YWlubHkgYW4gaW1wcm92ZW1lbnQgb24gdGhlIHZhc3QgbWFqb3JpdHkKb2Ygc3lzdGVtcy4K
ClRoYXQgc2FpZCwgSSB0aGluayBJJ3ZlIGRlY2lkZWQgdG8gbm90IHB1cnN1ZSB0aGlzIHNlcmll
cyBmb2xsb3dpbmcKQW5kcmV3J3MgY29tbWVudHMsIHdoaWNoIGluIHBhcnQgaGF2ZSBtYXRjaGVk
IHlvdXIgcmVtYXJrLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
