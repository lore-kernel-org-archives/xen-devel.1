From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm64: livepatch: Fix build after
 03957f58db
Date: Tue, 21 May 2019 08:36:15 -0700 (PDT)
Message-ID: <alpine.DEB.2.21.1905210836050.16404@sstabellini-ThinkPad-T480s>
References: <20190521142913.22394-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jEEf=TV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hT6oL-00068o-Sl
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:36:17 +0000
In-Reply-To: <20190521142913.22394-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMSBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbW1pdCAwMzk1N2Y1
OGRiICJ4ZW4vY29uc3Q6IEV4dGVuZCB0aGUgZXhpc3RpbmcgbWFjcm8gQklUIHRvIHRha2UgYQo+
IHN1ZmZpeCBpbiBwYXJhbWV0ZXIiIGRpZG4ndCBjb252ZXJ0IGFsbCB0aGUgY2FsbGVycyBvZiB0
aGUgbWFjcm8gQklULgo+IAo+IFRoaXMgd2lsbCByZXN1bHQgdG8gYSBidWlsZCBicmVha2FnZSB3
aGVuIGVuYWJsaW5nIExpdmVwYXRjaCBvbiBhcm02NC4KPiAKPiBSZXBvcnRlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJt
NjQvbGl2ZXBhdGNoLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvbGl2ZXBh
dGNoLmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbGl2ZXBhdGNoLmMKPiBpbmRleCAyMjQ3YjkyNWEw
Li41Yzc1Nzc5Mjg0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2gu
Ywo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2guYwo+IEBAIC0yMDgsNyArMjA4
LDcgQEAgc3RhdGljIGludCByZWxvY19pbnNuX2ltbShlbnVtIGFhcmNoNjRfcmVsb2Nfb3Agb3As
IHZvaWQgKmRlc3QsIHU2NCB2YWwsCj4gICAgICBzdmFsID4+PSBsc2I7Cj4gIAo+ICAgICAgLyog
RXh0cmFjdCB0aGUgdmFsdWUgYml0cyBhbmQgc2hpZnQgdGhlbSB0byBiaXQgMC4gKi8KPiAtICAg
IGltbV9tYXNrID0gKEJJVChsc2IgKyBsZW4pIC0gMSkgPj4gbHNiOwo+ICsgICAgaW1tX21hc2sg
PSAoQklUKGxzYiArIGxlbiwgVUwpIC0gMSkgPj4gbHNiOwo+ICAgICAgaW1tID0gc3ZhbCAmIGlt
bV9tYXNrOwo+ICAKPiAgICAgIC8qIFVwZGF0ZSB0aGUgaW5zdHJ1Y3Rpb24ncyBpbW1lZGlhdGUg
ZmllbGQuICovCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
