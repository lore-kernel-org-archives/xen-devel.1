From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 05/20] arm/boot: Mark construct_dom0() as
	__init
Date: Tue, 20 Mar 2018 03:40:03 +0000
Message-ID: <a4ba8c4c-7b22-154e-57c7-0a24fbf3a47c@arm.com>
References: <1521486839-25617-1-git-send-email-andrew.cooper3@citrix.com>
 <1521486839-25617-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521486839-25617-6-git-send-email-andrew.cooper3@citrix.com>
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

SGkgQW5kcmV3LAoKT24gMDMvMTkvMjAxOCAwNzoxMyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiBJdHMgc29sZSBjYWxsZXIsIHN0YXJ0X3hlbigpLCBpcyBfX2luaXQuCgpBY3R1YWxseSwgbW9z
dCBvZiB0aGF0IGZpbGVzIGNvdWxkIGJlbmVmaXRzIG9mIF9faW5pdCBhcyB0aGlzIGlzIGRvbWFp
biAKb25seSBidWlsZC4KCkluIGFueSBjYXNlLCB0aGlzIHBhdGNoIGlzIGFscmVhZHkgYSBnb29k
IHN0YXJ0LiBTbzoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKQ2hlZXJzLAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyICstCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4gaW5kZXggMjhlZTg3Ni4uOWVmOTAzMCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMjA5
NCw3ICsyMDk0LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGZpbmRfZ250dGFiX3JlZ2lvbihzdHJ1
Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICBraW5mby0+Z250dGFiX3N0YXJ0LCBraW5mby0+
Z250dGFiX3N0YXJ0ICsga2luZm8tPmdudHRhYl9zaXplKTsKPiAgIH0KPiAgIAo+IC1pbnQgY29u
c3RydWN0X2RvbTAoc3RydWN0IGRvbWFpbiAqZCkKPiAraW50IF9faW5pdCBjb25zdHJ1Y3RfZG9t
MChzdHJ1Y3QgZG9tYWluICpkKQo+ICAgewo+ICAgICAgIHN0cnVjdCBrZXJuZWxfaW5mbyBraW5m
byA9IHt9Owo+ICAgICAgIHN0cnVjdCB2Y3B1ICpzYXZlZF9jdXJyZW50Owo+IAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
