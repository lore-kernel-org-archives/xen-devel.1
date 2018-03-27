From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 28/39] ARM: new VGIC: Add event channel
 IRQ handling
Date: Tue, 27 Mar 2018 15:33:37 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803271533310.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-29-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u3an=gr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0x9w-0006ir-7m
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 22:33:40 +0000
In-Reply-To: <20180321163235.12529-29-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMSBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhlIFhlbiBjb3Jl
L2FyY2ggY29kZSByZWxpZXMgb24gdHdvIGFic3RyYWN0ZWQgZnVuY3Rpb25zIHRvIGluamVjdCBh
bgo+IGV2ZW50IGNoYW5uZWwgSVJRIGFuZCB0byBxdWVyeSBpdHMgcGVuZGluZyBzdGF0ZS4KPiBJ
bXBsZW1lbnQgdGhvc2UgdG8gcXVlcnkgdGhlIHN0YXRlIG9mIHRoZSBuZXcgVkdJQyBpbXBsZW1l
bnRhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdh
cmFAbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CgoKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIHwgMjMgKysrKysrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jIGIveGVuL2FyY2gvYXJtL3ZnaWMvdmdp
Yy5jCj4gaW5kZXggMDc4NjZkNzI0My4uM2Q4MThhOThhZCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC9hcm0vdmdpYy92Z2ljLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMKPiBAQCAt
Njk5LDYgKzY5OSwyOSBAQCB2b2lkIHZnaWNfa2lja192Y3B1cyhzdHJ1Y3QgZG9tYWluICpkKQo+
ICAgICAgfQo+ICB9Cj4gIAo+ICt2b2lkIGFyY2hfZXZ0Y2huX2luamVjdChzdHJ1Y3QgdmNwdSAq
dikKPiArewo+ICsgICAgdmdpY19pbmplY3RfaXJxKHYtPmRvbWFpbiwgdiwgdi0+ZG9tYWluLT5h
cmNoLmV2dGNobl9pcnEsIHRydWUpOwo+ICt9Cj4gKwo+ICtib29sIHZnaWNfZXZ0Y2huX2lycV9w
ZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgdmdpY19pcnEgKmlycTsK
PiArICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKyAgICBib29sIHBlbmRpbmc7Cj4gKwo+ICsg
ICAgLyogRG9lcyBub3Qgd29yayBmb3IgTFBJcy4gKi8KPiArICAgIEFTU0VSVCghaXNfbHBpKHYt
PmRvbWFpbi0+YXJjaC5ldnRjaG5faXJxKSk7Cj4gKwo+ICsgICAgaXJxID0gdmdpY19nZXRfaXJx
KHYtPmRvbWFpbiwgdiwgdi0+ZG9tYWluLT5hcmNoLmV2dGNobl9pcnEpOwo+ICsgICAgc3Bpbl9s
b2NrX2lycXNhdmUoJmlycS0+aXJxX2xvY2ssIGZsYWdzKTsKPiArICAgIHBlbmRpbmcgPSBpcnFf
aXNfcGVuZGluZyhpcnEpOwo+ICsgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaXJxLT5pcnFf
bG9jaywgZmxhZ3MpOwo+ICsgICAgdmdpY19wdXRfaXJxKHYtPmRvbWFpbiwgaXJxKTsKPiArCj4g
KyAgICByZXR1cm4gcGVuZGluZzsKPiArfQo+ICsKPiAgc3RydWN0IGlycV9kZXNjICp2Z2ljX2dl
dF9od19pcnFfZGVzYyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdmlycSkKPiAgewo+
IC0tIAo+IDIuMTQuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
