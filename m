From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/5] ARM/dom0: Avoid using a variable length
 array in make_memory_node()
Date: Mon, 24 Sep 2018 14:22:27 +0100
Message-ID: <829c857a-2048-d09b-df4a-ff504831fd55@arm.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1537794003-30851-5-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDkvMjQvMjAxOCAwMjowMCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiBUaGUgcmVnW10gYXJyYXkgY2FuIGhhdmUgYSBtYXhpbXVtIHNpemUgb2YgOCBpbiBwcmFjdGlj
ZSwgc28gdXNlIHRoZSB3b3JzdAo+IGNhc2UgY2FsY3VsYXRpb24gcmF0aGVyIHRoYW4gbWFraW5n
IGl0IHZhcmlhYmxlIGxlbmd0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgo+IC0tLQo+IENDOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gCj4gT25seSBjb21waWxlIHRlc3RlZC4KPiAtLS0KPiAgIHhlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyB8IDQgKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCAzOGUwZGUz
Li5hYzhkNDc5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsr
KyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC01MzksOSArNTM5LDExIEBAIHN0
YXRpYyBpbnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwK
PiAgICAgICBpbnQgcmVzLCBpOwo+ICAgICAgIGludCByZWdfc2l6ZSA9IGFkZHJjZWxscyArIHNp
emVjZWxsczsKPiAgICAgICBpbnQgbnJfY2VsbHMgPSByZWdfc2l6ZSpraW5mby0+bWVtLm5yX2Jh
bmtzOwo+IC0gICAgX19iZTMyIHJlZ1tucl9jZWxsc107Cj4gKyAgICBfX2JlMzIgcmVnW05SX01F
TV9CQU5LUyAqIDQgLyogV29yc3QgY2FzZSBhZGRyY2VsbHMgKyBzaXplY2VsbHMgKi9dOwo+ICAg
ICAgIF9fYmUzMiAqY2VsbHM7Cj4gICAKPiArICAgIEJVR19PTihucl9jZWxscyA+PSBBUlJBWV9T
SVpFKHJlZykpOwo+ICsKPiAgICAgICBkdF9kcHJpbnRrKCJDcmVhdGUgbWVtb3J5IG5vZGUgKHJl
ZyBzaXplICVkLCBuciBjZWxscyAlZClcbiIsCj4gICAgICAgICAgICAgICAgICByZWdfc2l6ZSwg
bnJfY2VsbHMpOwo+ICAgCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
