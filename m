From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] xen,
 fbfront: mark expected switch fall-through
Date: Thu, 21 Mar 2019 12:03:09 +0100
Message-ID: <ca45f983-9a42-6326-3c9a-5e239ddc4e46__4537.02395768545$1553166259$gmane$org@samsung.com>
References: <20190227205303.GA1231@embeddedor>
 <f8ff03de-9d7c-233a-cd86-37269667db0c@gmail.com>
 <CGME20190320200813epcas3p20887ed1e3e3f1542f67f0b664f777a8c@epcas3p2.samsung.com>
 <6675f2ed-6916-2be5-fb60-39c9436f53f7@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9+NO=RY=samsung.com=b.zolnierkie@srs-us1.protection.inumbo.net>)
 id 1h6vTg-0003Xd-Qo
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2019 11:03:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190321110313euoutp018620b453efc9f98852550d66a8cd8f5f~N9GyaX1Lr0441404414euoutp01d
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2019 11:03:13 +0000 (GMT)
In-Reply-To: <6675f2ed-6916-2be5-fb60-39c9436f53f7@embeddedor.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>, Oleksandr Andrushchenko <andr2000@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

CkhpLAoKT24gMDMvMjAvMjAxOSAwOTowOCBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToK
PiBIaSBhbGwsCj4gCj4gRnJpZW5kbHkgcGluZzoKPiAKPiBXaG8gY2FuIHRha2UgdGhpcz8KCkkn
bGwgdGFrZSB0aGlzIGZvciB2NS4yLgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5p
ZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmlj
cwoKPiBUaGFua3MKPiAtLQo+IEd1c3Rhdm8KPiAKPiBPbiAyLzI4LzE5IDU6NTEgQU0sIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiArWGVuLWRldmVsIGxpc3QKPj4KPj4gT24gMi8y
Ny8xOSAxMDo1MyBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4+IEluIHByZXBhcmF0
aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1hcmsgc3dpdGNoCj4+PiBj
YXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4KPj4+Cj4+PiBUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPj4+Cj4+PiBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L3hlbi1mYmZyb250LmM6IEluIGZ1bmN0aW9uIOKAmHhlbmZiX2JhY2tlbmRfY2hhbmdl
ZOKAmToKPj4+IGRyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYzo2Nzg6Njogd2Fybmlu
ZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aD1dCj4+PiAgICAgaWYgKGRldi0+c3RhdGUgPT0gWGVuYnVzU3RhdGVDbG9zZWQpCj4+PiAgICAg
ICAgXgo+Pj4gZHJpdmVycy92aWRlby9mYmRldi94ZW4tZmJmcm9udC5jOjY4MToyOiBub3RlOiBo
ZXJlCj4+PiAgICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKPj4+ICAgIF5+fn4KPj4+Cj4+PiBX
YXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9Mwo+Pj4KPj4+
IE5vdGljZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGNvZGUgY29tbWVudCBp
cyBtb2RpZmllZAo+Pj4gaW4gYWNjb3JkYW5jZSB3aXRoIHdoYXQgR0NDIGlzIGV4cGVjdGluZyB0
byBmaW5kLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRz
IHRvIGVuYWJsZQo+Pj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+Pj4gLS0t
Cj4+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYyB8IDIgKy0KPj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYveGVuLWZiZnJvbnQuYwo+Pj4gaW5kZXggNmE0YmJjOWUxZmIwLi5hM2Q2YjZkYjIyMWIg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250LmMKPj4+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYwo+Pj4gQEAgLTY3Nyw3ICs2Nzcs
NyBAQCBzdGF0aWMgdm9pZCB4ZW5mYl9iYWNrZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c19kZXZp
Y2UgKmRldiwKPj4+ICAgICAgIGNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6Cj4+PiAgICAgICAgICAg
aWYgKGRldi0+c3RhdGUgPT0gWGVuYnVzU3RhdGVDbG9zZWQpCj4+PiAgICAgICAgICAgICAgIGJy
ZWFrOwo+Pj4gLSAgICAgICAgLyogTWlzc2VkIHRoZSBiYWNrZW5kJ3MgQ0xPU0lORyBzdGF0ZSAt
LSBmYWxsdGhyb3VnaCAqLwo+Pj4gKyAgICAgICAgLyogZmFsbCB0aHJvdWdoIC0gTWlzc2VkIHRo
ZSBiYWNrZW5kJ3MgQ0xPU0lORyBzdGF0ZS4gKi8KPj4+ICAgICAgIGNhc2UgWGVuYnVzU3RhdGVD
bG9zaW5nOgo+Pj4gICAgICAgICAgIHhlbmJ1c19mcm9udGVuZF9jbG9zZWQoZGV2KTsKPj4+ICAg
ICAgICAgICBicmVhazsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
