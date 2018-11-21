From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] x86: reduce code duplication in
 guest_remove_page()
Date: Wed, 21 Nov 2018 02:28:49 -0700
Message-ID: <5BF5255102000078001FE547@prv1-mh.provo.novell.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5BF4340B02000078001FE273@prv1-mh.provo.novell.com>
 <8054a1ab-8065-4502-16c3-6d05bbf48d88@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfYJ=OA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPOoZ-00052r-PF
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 09:28:55 +0000
In-Reply-To: <8054a1ab-8065-4502-16c3-6d05bbf48d88@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE4OjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMTEvMjAxOCAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFF1aXRlIGEg
Yml0IG9mIGR1cGxpY2F0ZSBjb2RlIGhhcyBhY2N1bXVsYXRlZCBvbiB0aGUgInBhZ2luZyIgdHlw
ZXMKPj4gc3BlY2lhbCBjYXNlIHBhdGguIFJlLXVzZSB3aGF0IGNhbiBiZSByZS11c2VkIGZyb20g
dGhlIGNvbW1vbiBwYXRoLgo+Pgo+PiBTaW5jZSBpdCBuZWVkcyB0b3VjaGluZyBhbnl3YXksIHNs
aWdodGx5IHJlLWZvcm1hdCBhbmQgZXh0ZW5kIHRoZQo+PiBnZHByaW50aygpIG9uIHRoZSBjb21t
b24gcGF0aCBhcyB3ZWxsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4gRG9lc24ndCB0aGlzIG5lZ2F0ZSB0aGUgcHJldmlvdXMgcGF0Y2g/
ICBJJ20gYWZyYWlkIHRoYXQgSSdtIHJhdGhlcgo+IGNvbmZ1c2VkLgoKTm8gLSBwbGVhc2Ugbm90
ZSB0aGUgbmV3ICJvYnRhaW5fcGFnZSIgbGFiZWwgdGhhdCB0aGUgY29kZSBicmFuY2hlcwp0bywg
d2hpY2ggcmVwbGFjZXMgd2hhdCB0aGUgZWFybGllciBwYXRjaCBoYXMgaW50cm9kdWNlZC4gQmV5
b25kIHRoaXMKY29kZSByZXBsYWNlbWVudCB0aGUgcGF0Y2ggaGVyZSBzaW1wbHkgbGV2ZXJhZ2Vz
IHRoYXQgInBhZ2UiIHdvdWxkCnRoZW4gYmUgTlVMTCB0aHJvdWdob3V0IHRoZSByZW1haW5pbmcg
cGFydCBvZiB0aGlzIHNwZWNpYWwgcGF0aCwgYW5kCmhlbmNlIGFsbCByZXNwZWN0aXZlIGNvbmRp
dGlvbmFscyBhbmQgY29kZSBjYW4gZ28gYXdheS4gSXQgbWVyZWx5CnNlZW1lZCB0byBtZSB0aGF0
IGRvaW5nIHRoZSBvdmVyYWxsIHRyYW5zZm9ybWF0aW9uIGluIHR3byBzdGVwcyB3b3VsZApiZSBi
ZXR0ZXI7IGluIHByaW5jaXBsZSB0aGUgY2hhbmdlIGhlcmUgY291bGQgYmUgbWVyZ2VkIGludG8g
dGhlCmVhcmxpZXIgcGF0Y2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
