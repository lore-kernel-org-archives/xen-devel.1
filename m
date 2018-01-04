From: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [RFC XEN PATCH v4 02/41] x86_64/mm: avoid cleaning
 the unmapped frame table
Date: Thu, 04 Jan 2018 14:20:26 +0800
Message-ID: <1515046826.3139.5.camel@linux.intel.com>
References: <20171207101030.22364-1-haozhong.zhang@intel.com>
 <20171207101030.22364-3-haozhong.zhang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20171207101030.22364-3-haozhong.zhang@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haozhong Zhang <haozhong.zhang@intel.com>, xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Dan Williams <dan.j.williams@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE3LTEyLTA3IGF0IDE4OjA5ICswODAwLCBIYW96aG9uZyBaaGFuZyB3cm90ZToK
PiBjbGVhbnVwX2ZyYW1lX3RhYmxlKCkgaW5pdGlhbGl6ZXMgdGhlIGVudGlyZSBuZXdseSBhZGRl
ZCBmcmFtZSB0YWJsZQo+IHRvIGFsbCAtMSdzLiBJZiBpdCdzIGNhbGxlZCBhZnRlciBleHRlbmRf
ZnJhbWVfdGFibGUoKSBmYWlsZWQgdG8gbWFwCj4gdGhlIGVudGlyZSBmcmFtZSB0YWJsZSwgdGhl
IGluaXRpYWxpemF0aW9uIHdpbGwgaGl0IGEgcGFnZSBmYXVsdC4KPiAKPiBNb3ZlIHRoZSBjbGVh
bnVwIG9mIHBhcnRpYWxseSBtYXBwZWQgZnJhbWV0YWJsZSB0bwo+IGV4dGVuZF9mcmFtZV90YWJs
ZSgpLAo+IHdoaWNoIGhhcyBlbm91Z2gga25vd2xlZGdlIG9mIHRoZSBtYXBwaW5nIHN0YXR1cy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW96aG9uZyBaaGFuZyA8aGFvemhvbmcuemhhbmdAaW50ZWwu
Y29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gQENoYW86IEkgZG9u
J3QgbW9kaWZ5IHRoaXMgcGF0Y2ggcGVyIHlvdXIgY29tbWVudCwgYmVjYXVzZSBJIGZlZWwgaXQn
cwo+IGJldHRlciB0byBoYW5kbGUgdGhlIGVycm9ycyBsb2NhbGx5IGluIGVhY2ggZnVuY3Rpb24g
KHJhdGhlciB0aGFuCj4gaGFuZGxlCj4gYWxsIG9mIHRoZW0gaW4gdGhlIHRvcC1sZXZlbCksIHdo
aWNoIHdpbGwgbWFrZSBlYWNoIGZ1bmN0aW9uIGVhc2llciB0bwo+IHVzZS4KCkkgZG9uJ3QgaW5z
aXN0IG9uIHRoaXMsIHRvIG1lIHRoaXMgaXMga2luZCBvZiBmbGF2b3IgY2hvaWNlLgoKQ2hhbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
