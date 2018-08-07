From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v1 4/4] xen/arm: Reuse R-Car Gen2 platform
 code for Stout board
Date: Tue, 7 Aug 2018 16:18:52 +0100
Message-ID: <fd405643-3ae8-de5d-ed4f-7acd6e3b70b3@arm.com>
References: <1533580552-938-1-git-send-email-olekstysh@gmail.com>
 <1533580552-938-5-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=molc=kw=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fn3lA-0003hI-W9
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 15:18:57 +0000
In-Reply-To: <1533580552-938-5-git-send-email-olekstysh@gmail.com>
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
Cc: Artem_Mygaiev@epam.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNi8wOC8xOCAxOTozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+
IAo+IFJlbmVzYXMgIlN0b3V0IiBkZXZlbG9wbWVudCBib2FyZCAod2l0aCBkaWZmZXJlbnQgZXhw
YW5zaW9uIGJvYXJkcykKPiBpcyBhbHNvIGJhc2VkIG9uIFItQ2FyIEdlbjIgU29DLiBTbyBleHRl
bmQgY29tcGF0IGFycmF5IHdpdGgKPiBib2FyZCdzIGNvbXBhdGlibGUgc3RyaW5ncy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29A
ZXBhbS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhl
bi9hcmNoL2FybS9wbGF0Zm9ybXMvcmNhcjIuYyB8IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L3JjYXIyLmMgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3JjYXIyLmMKPiBpbmRleCBkZjBhYzg0
Li5lZTJkZWQwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvcmNhcjIuYwo+
ICsrKyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvcmNhcjIuYwo+IEBAIC00OSw2ICs0OSwxMCBA
QCBzdGF0aWMgaW50IF9faW5pdCByY2FyMl9zbXBfaW5pdCh2b2lkKQo+ICAgc3RhdGljIGNvbnN0
IGNoYXIgKmNvbnN0IHJjYXIyX2R0X2NvbXBhdFtdIF9faW5pdGNvbnN0ID0KPiAgIHsKPiAgICAg
ICAicmVuZXNhcyxsYWdlciIsCj4gKyAgICAicmVuZXNhcyxyOGE3Nzkwc3RvdXQiLAo+ICsgICAg
InJlbmVzYXMscjhhNzc5MHN0b3V0LXZpZXciLAo+ICsgICAgInJlbmVzYXMscjhhNzc5MHN0b3V0
LWhhZCIsCj4gKyAgICAicmVuZXNhcyxyOGE3Nzkwc3RvdXQtZnVsbCIsCgpJIGFtIHF1aXRlIHJl
bHVjdGFudCB0byBhZGQgY29tcGF0aWJsZSB0aGF0IGFyZSBub3QgcHJlc2VudCBpbiB1cHN0cmVh
bSAKTGludXguIExvb2tpbmcgYXQgdGhlIERUIHVwc3RyZWFtZWQgaW4gTGludXgsIHRoZSBjb21w
YXRpYmxlIGZvciByOGE3NzkwIApTb0Mgc2VlbSB0byBiZSAicmVuZXNhcyxyOGE3NzkwIi4gV291
bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBjb3ZlciBhbGwgCnRoZSBib2FyZHM/IEJ1dCAuLi4K
Ci4uLiBkb24ndCB5b3UgaGF2ZSBQU0NJIHN1cHBvcnQgb24gdGhvc2UgcGxhdGZvcm1zPwoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
