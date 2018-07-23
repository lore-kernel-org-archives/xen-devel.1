From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v7 09/12] xen: add per-platform defaults for
 NR_CPUS
Date: Mon, 23 Jul 2018 12:26:23 +0100
Message-ID: <3a6208c4-92e9-29e4-2c1f-74d7cdef535f@arm.com>
References: <alpine.DEB.2.10.1807061537300.13502@sstabellini-ThinkPad-X260>
 <1530918843-14318-9-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530918843-14318-9-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrii_anisov@epam.com, andrew.cooper3@citrix.com, George.Dunlap@citrix.com, dfaggioli@suse.com, JBeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA3LzA3LzE4IDAwOjE0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gQWRkIHNwZWNpZmljIHBlci1wbGF0Zm9ybSBkZWZhdWx0cyBmb3IgTlJfQ1BVUy4gTm90ZSB0
aGF0IHRoZSBvcmRlciBvZgo+IHRoZSBkZWZhdWx0cyBtYXR0ZXI6IHRoZXkgbmVlZCB0byBnbyBm
aXJzdCwgb3RoZXJ3aXNlIHRoZSBnZW5lcmljCj4gZGVmYXVsdHMgd2lsbCBiZSBhcHBsaWVkLgo+
IAo+IFRoaXMgaXMgZG9uZSBzbyB0aGF0IFhlbiBidWlsZHMgY3VzdG9taXplZCBmb3IgYSBzcGVj
aWZpYyBoYXJkd2FyZQo+IHBsYXRmb3JtIGNhbiBoYXZlIHRoZSByaWdodCBOUl9DUFVTIG51bWJl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFj
a2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKPiBD
QzogSkJldWxpY2hAc3VzZS5jb20KPiBDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+IAo+
IC0tLQo+IAo+IENoYW5nZXMgaW4gdjY6Cj4gLSByZW1vdmUgdXNlbGVzcyBhZGRpdGlvbmFsIGRl
ZmF1bHQgZm9yIEFMTAo+IC0tLQo+ICAgeGVuL2FyY2gvS2NvbmZpZyB8IDMgKysrCj4gICAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL0tj
b25maWcgYi94ZW4vYXJjaC9LY29uZmlnCj4gaW5kZXggY2YwYWNiNy4uMTk1NGQxYyAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9LY29uZmlnCj4gKysrIGIveGVuL2FyY2gvS2NvbmZpZwo+IEBAIC0z
LDYgKzMsOSBAQCBjb25maWcgTlJfQ1BVUwo+ICAgCWludCAiTWF4aW11bSBudW1iZXIgb2YgcGh5
c2ljYWwgQ1BVcyIKPiAgIAlyYW5nZSAxIDQwOTUKPiAgIAlkZWZhdWx0ICIyNTYiIGlmIFg4Ngo+
ICsJZGVmYXVsdCAiOCIgaWYgQVJNICYmIFJDQVIzCj4gKwlkZWZhdWx0ICI0IiBpZiBBUk0gJiYg
UUVNVQo+ICsJZGVmYXVsdCAiNCIgaWYgQVJNICYmIE1QU09DCj4gICAJZGVmYXVsdCAiMTI4IiBp
ZiBBUk0KPiAgIAktLS1oZWxwLS0tCj4gICAJICBTcGVjaWZpZXMgdGhlIG1heGltdW0gbnVtYmVy
IG9mIHBoeXNpY2FsIENQVXMgd2hpY2ggWGVuIHdpbGwgc3VwcG9ydC4KPiAKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
