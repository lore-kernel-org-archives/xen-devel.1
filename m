From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/tools: Fix symbols segfaults
Date: Wed, 03 Apr 2019 02:10:50 -0600
Message-ID: <5CA46A8A020000780022423F@prv1-mh.provo.novell.com>
References: <20190403075602.43400-1-wipawel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190403075602.43400-1-wipawel@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: wipawel@amazon.de
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA0LjE5IGF0IDA5OjU2LCA8d2lwYXdlbEBhbWF6b24uZGU+IHdyb3RlOgo+IFRo
ZSBzeW1ib2xzIHRvb2wgaXMgb3V0ZGF0ZWQgYW5kIGhhcyBhIGJ1ZyBpbiBpdCBsZWFkaW5nIHRv
IGNyYXNoZXMuCj4gVGhlIHRvb2wgaXMgZGVyaXZlZCBmcm9tIGxpbnV4IGtlcm5lbCB3aGVyZSB0
aGlzIGJ1ZyBoYXMgYmVlbiBhbHJlYWR5Cj4gZml4ZWQuCgpUaGFua3MgZm9yIG5vdGljaW5nIHRo
aXMgb21pc3Npb24gb2Ygb3Vycy4KCj4gT3JpZ2luYWwgbGludXgga2VybmVsIGNvbW1pdDoKPiBl
MGEwNGIxMWU0MDU5Y2FiMDMzNDY5NjE3IHNjcmlwdHMva2FsbHN5bXMuYzogZml4IHBvdGVudGlh
bCBzZWdmYXVsdAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBh
d2VsQGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpv
bi5kZT4KPiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+
CgpXaGVuIHdlIHB1bGwgaW4gY2hhbmdlcyAoYWxtb3N0KSB2ZXJiYXRpbSBmcm9tIExpbnV4LCB3
ZSB0eXBpY2FsbHkKcmV0YWluIG9yaWdpbmFsIGF1dGhvcnNoaXAgYXMgd2VsbCBhcyB0aGUgKHBv
c3NpYmx5IG1hc3NhZ2VkKQp0aXRsZSBhbmQgZGVzY3JpcHRpb24uIFNlZSB4ZW4vYXJjaC94ODYv
Y3B1L213YWl0LWlkbGUuYydzCmhpc3RvcnkgZm9yIHNvbWUgZXhhbXBsZXMuIEknbGwgZG8gdGhp
cyB0cmFuc2Zvcm1hdGlvbiBiZWZvcmUKY29tbWl0dGluZyB0aGUgY2hhbmdlLCBidXQgaW4gdGhl
IGZ1dHVyZSBJJ2QgYXBwcmVjaWF0ZSBpZiBwb3J0ZWQKcGF0Y2hlcyB3ZXJlIHN1Ym1pdHRlZCB0
aGF0IHdheS4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJJ20g
YnR3IGFsc28gY29uZnVzZWQgYnkgdGhlIENjIGxpc3QgeW91J3ZlIHVzZWQ6IFlvdSBzaG91bGQK
aGF2ZSBDYy1lZCBUSEUgUkVTVCwgbm90IGp1c3QgdGhlIHRvb2wgc3RhY2sgbWFpbnRhaW5lcnMu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
