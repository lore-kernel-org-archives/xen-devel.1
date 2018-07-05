From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6] x86/mm: Suppresses vm_events caused by
 page-walks
Date: Thu, 05 Jul 2018 07:34:13 -0600
Message-ID: <5B3E1E5502000078001D1869@prv1-mh.provo.novell.com>
References: <1525700412-13790-1-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1525700412-13790-1-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, tamas@tklengyel.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA1LjE4IGF0IDE1OjQwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9tb25pdG9yLmgKPiBAQCAtODQsNyArODQsOCBAQCBzdGF0aWMgaW5saW5lIHVp
bnQzMl90IGFyY2hfbW9uaXRvcl9nZXRfY2FwYWJpbGl0aWVzKHN0cnVjdCBkb21haW4gKmQpCj4g
ICAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVOX0RPTUNUTF9NT05JVE9SX0VWRU5UX0RFQlVH
X0VYQ0VQVElPTikgfAo+ICAgICAgICAgICAgICAgICAgICAgKDFVIDw8IFhFTl9ET01DVExfTU9O
SVRPUl9FVkVOVF9DUFVJRCkgfAo+ICAgICAgICAgICAgICAgICAgICAgKDFVIDw8IFhFTl9ET01D
VExfTU9OSVRPUl9FVkVOVF9JTlRFUlJVUFQpIHwKPiAtICAgICAgICAgICAgICAgICAgICgxVSA8
PCBYRU5fRE9NQ1RMX01PTklUT1JfRVZFTlRfRU1VTF9VTklNUExFTUVOVEVEKTsKPiArICAgICAg
ICAgICAgICAgICAgICgxVSA8PCBYRU5fRE9NQ1RMX01PTklUT1JfRVZFTlRfRU1VTF9VTklNUExF
TUVOVEVEKSB8Cj4gKyAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVOX0RPTUNUTF9NT05JVE9S
X0VWRU5UX0lOR1VFU1RfUEFHRUZBVUxUKTsKPiAgCj4gICAgICAvKiBTaW5jZSB3ZSBrbm93IHRo
aXMgaXMgb24gVk1YLCB3ZSBjYW4ganVzdCBjYWxsIHRoZSBodm0gZnVuYyAqLwo+ICAgICAgaWYg
KCBodm1faXNfc2luZ2xlc3RlcF9zdXBwb3J0ZWQoKSApCgpTbyB0aGlzIGNoYW5nZSBsb29rcyB0
byBkZXBlbmQgb24gc29tZSByYW5kb20gdmVyc2lvbiBvZgoiaHZtL3N2bTogRW5hYmxlIEVNVUxf
VU5JTVBMRU1FTlRFRCBldmVudHMgb24gc3ZtIiwgYnV0IHRoaXMKaXNuJ3QgbWVudGlvbmVkIGFu
eXdoZXJlLCBhbmQgaXQncyBhbHNvIG5vdCB0aGUgdmVyc2lvbiB0aGF0IEkndmUKanVzdCBtYW5h
Z2VkIHRvIGFwcGx5LiBQbGVhc2UgY2FuIHlvdSBzcGVsbCBvdXQgc3VjaCBkZXBlbmRlbmNpZXM/
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
