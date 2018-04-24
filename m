From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 02/10] passthrough: split out x86 PCI
 code to x86/pci.c
Date: Tue, 24 Apr 2018 10:08:23 +0100
Message-ID: <9ad79f38-691c-d84a-a7aa-317fd69cad96@arm.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-3-wei.liu2@citrix.com>
 <5ADDFCF502000078001BDA1D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+mld=hn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fAtw4-0003Iy-IF
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 09:08:28 +0000
In-Reply-To: <5ADDFCF502000078001BDA1D@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNC8yMy8yMDE4IDA0OjM0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAy
MS4wMi4xOCBhdCAyMjo0NiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+PiBNb3ZlIHRo
ZSBmdW5jdGlvbnMgdGhhdCByZWZlcmVuY2UgeDg2IGh2bSBkYXRhIHN0cnVjdHVyZXMgdG8gaXRz
IG93bgo+PiBmaWxlLiAgUmVuYW1lIHBjaV9jbGVhbl9kcGNpX2lycXMgdG8gYXJjaF9wY2lfY2xl
YW5faXJxcy4KPj4KPj4gVGhlcmUgaXMgc3RpbGwgb25lIGxvY2F0aW9uIGluIHRoYXQgZmlsZSB3
aGljaCByZWZlcmVuY2VzCj4+IGFyY2guaHZtX2RvbWFpbiwgYnV0IGl0IGlzIGZpbmUgYmVjYXVz
ZSBBUk0gZ3Vlc3QgaXMgSFZNLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgo+PiAtLS0KPj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxp
bmlAa2VybmVsLm9yZz4KPj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IENjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pgo+PiBBUk0gZG9lc24ndCBzZWxlY3Qg
SEFTX1BDSSwgdGhhdCdzIHdoeSBBUk0gYnVpbGQgaXMgbm90IGJyb2tlbiBieQo+PiB0aGlzLiBB
SVVJIEFSTSB3aWxsIHNlbGVjdCBIQVNfUENJIGF0IHNvbWUgcG9pbnQsIGhlbmNlIEkgb25seSBt
b3ZlCj4+IHRoZSB4ODYgYml0cy4KPiAKPiBUaGUgZmFjdCB0aGF0IHRoaXMgY2hhbmdlIGRvZXNu
J3QgYWN0dWFsbHkgYWZmZWN0IEFSTSBpcyBhZ2FpbiBhbgo+IGluZGljYXRpb24gdGhhdCB0aGUg
ZGVjaXNpb24gd2hldGhlciB0aGUgY29kZSB5b3UgbW92ZSBoZXJlIGlzCj4geDg2LXNwZWNpZmlj
IGRlcGVuZHMgb24gd2hhdCBwYXJ0cyBvZiBQQ0kgcGFzcy10aHJvdWdoIEFSTSBpcwo+IGFjdHVh
bGx5IGdvaW5nIHRvIHdhbnQgdG8gKHJlLSl1c2UuIEknZCBhZ2FpbiBwcmVmZXIgdG8gdGFrZSB0
aGF0Cj4gZGVjaXNpb24gZWl0aGVyIHdoZW4gQVJNIGFjdHVhbGx5IGltcGxlbWVudHMgdGhhdCwg
b3IgYmFzZWQgb24KPiB0aGUgQVJNIGZvbGtzIGNsZWFybHkgZm9yZXNlZWluZyB0aGF0IHRoaXMg
Y29kZSBpcyBub3QgY29taW5nCj4gY2xvc2UgdG8gYW55dGhpbmcgdGhleSBtYXkgd2FudCB1c2Uu
CgpJIGNhbid0IHNlZSBhbnkgdXNlIG9mIHRoYXQgY29kZSBvbiBBcm0uIFRoZXJlIGFyZSBwb3Rl
bnRpYWwgdG8gbW92ZSAKeDg2LWlzbSBvdXRzaWRlLCBidXQgdGhpcyBwYXRjaCBpcyBhbHJlYWR5
IGEgZ29vZCBzdGFydC4KCkkgYWxyZWFkeSBnYXZlIG15IGFja2VkLWJ5IG9uIGEgc2VwYXJhdGUg
ZS1tYWlsLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
