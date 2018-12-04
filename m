From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/2] xen/arm32: Remove __init prefixes from
 funcs that are used within CPU up flow
Date: Tue, 4 Dec 2018 17:14:29 +0000
Message-ID: <7b09f542-52b2-ab56-5f55-d20c475653f8@arm.com>
References: <1543923745-29877-1-git-send-email-olekstysh@gmail.com>
 <1543923745-29877-3-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aD1Q=ON=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUEHJ-0001Oe-Ux
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 17:14:33 +0000
In-Reply-To: <1543923745-29877-3-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org, mirela.simonovic@aggios.com
List-Id: xen-devel@lists.xenproject.org

SGkgT2xla3NhbmRyLAoKT24gMTIvNC8xOCAxMTo0MiBBTSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IFRoaXMgaXMgYSBmb2xsb3ctdXAgcGF0Y2ggdG8KPiBjb21taXQgMDFh
N2U4Y2NlZjZlN2Q1NzE4YTI1MWFkNTg3NTY3YWZiZTcyMzMzMAo+IHhlbi9hcm06IFJlbW92ZSBf
X2luaXRkYXRhIGFuZCBfX2luaXQgdG8gZW5hYmxlIENQVSBob3RwbHVnCj4gCj4gU2lnbmVkLW9m
Zi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMs
Cgo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2FybTMyL3NtcGJvb3QuYyB8IDIgKy0KPiAgIHhlbi9h
cmNoL2FybS9wbGF0Zm9ybS5jICAgICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTMyL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9hcm0zMi9zbXBib290LmMKPiBpbmRleCAy
YTc3ZjI5Li5lNzM2ODY2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9zbXBib290
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvc21wYm9vdC5jCj4gQEAgLTE2LDcgKzE2LDcg
QEAgaW50IF9faW5pdCBhcmNoX2NwdV9pbml0KGludCBjcHUsIHN0cnVjdCBkdF9kZXZpY2Vfbm9k
ZSAqZG4pCj4gICAgICAgcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiAtaW50IF9faW5pdCBhcmNoX2Nw
dV91cChpbnQgY3B1KQo+ICtpbnQgYXJjaF9jcHVfdXAoaW50IGNwdSkKPiAgIHsKPiAgICAgICBy
ZXR1cm4gcGxhdGZvcm1fY3B1X3VwKGNwdSk7Cj4gICB9Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9wbGF0Zm9ybS5jIGIveGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMKPiBpbmRleCA2OTg5ZTU4
Li4wYmEyMDAxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybS5jCj4gKysrIGIv
eGVuL2FyY2gvYXJtL3BsYXRmb3JtLmMKPiBAQCAtOTUsNyArOTUsNyBAQCBpbnQgX19pbml0IHBs
YXRmb3JtX3NwZWNpZmljX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCkKPiAgIH0KPiAgIAo+ICAg
I2lmZGVmIENPTkZJR19BUk1fMzIKPiAtaW50IF9faW5pdCBwbGF0Zm9ybV9jcHVfdXAoaW50IGNw
dSkKPiAraW50IHBsYXRmb3JtX2NwdV91cChpbnQgY3B1KQo+ICAgewo+ICAgICAgIGlmICggcHNj
aV92ZXIgKQo+ICAgICAgICAgICByZXR1cm4gY2FsbF9wc2NpX2NwdV9vbihjcHUpOwo+IAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
