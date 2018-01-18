From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC 11/11] Add to_pci_dev macro
Date: Thu, 18 Jan 2018 19:15:05 +0000
Message-ID: <29aec56f-cadb-d47d-0a40-26e67c5499e9@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-12-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kmc5=en=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ecFeY-0003mw-TN
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 19:15:10 +0000
Received: by mail-wr0-x243.google.com with SMTP id p6so23758400wrd.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2018 11:15:09 -0800 (PST)
In-Reply-To: <20180102092809.1841-12-manish.jaggi@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: manish.jaggi@linaro.org, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, manish.jaggi@cavium.com, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgTWFuaXNoLAoKQWdhaW4gcGxlYXNlIHVzZSBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbC4K
Ck9uIDAyLzAxLzE4IDA5OjI4LCBtYW5pc2guamFnZ2lAbGluYXJvLm9yZyB3cm90ZToKPiBGcm9t
OiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBsaW5hcm8ub3JnPgo+IAo+IFRoaXMgcGF0Y2gg
YWRkcyB0b19wY2lfZGV2IG1hY3JvCgpXaHk/IFdobyBpcyBnb2luZyB0byB1c2UgaXQ/IElmIGl0
IGlzIGEgcGF0Y2ggaW4geW91ciBzZXJpZXMsIHRoZW4gCmxpa2VseSB0aGlzIHBhdGNoIHNob3Vs
ZCBiZSBiZWZvcmUgeW91IHVzZSBpdC4KCkFueSBpbiBjYXNlLCBhIGNvbW1pdCBtZXNzYWdlIGEg
Yml0IG1vcmUgZGV2ZWxvcCB3aWxsIGJlIGhlbHAuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hbmlz
aCBKYWdnaSA8bWFuaXNoLmphZ2dpQGxpbmFyby5vcmc+Cj4gLS0tCj4gICB4ZW4vaW5jbHVkZS94
ZW4vcGNpLmggfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNp
LmgKPiBpbmRleCA0M2YyMTI1MWE1Li40YzdmZjRkZDEwIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+IEBAIC05Miw4ICs5
MiwxMSBAQCBzdHJ1Y3QgcGNpX2RldiB7Cj4gICAjZGVmaW5lIFBUX0ZBVUxUX1RIUkVTSE9MRCAx
MAo+ICAgICAgIH0gZmF1bHQ7Cj4gICAgICAgdTY0IHZmX3JsZW5bNl07Cj4gKyAgICBzdHJ1Y3Qg
ZGV2aWNlIGRldjsKClRoYXQncyBjb21tb24gY29kZS4gUGxlYXNlIGxvb2sgYXQgYWRkaW5nIHRo
aXMgaW4gYXJjaF9wY2lfZGV2LiBCdXQgSSAKd291bGQgbmVlZCBhIGJpdCBtb3JlIGNvbnRleHQg
d2h5IHlvdSBuZWVkIHRoYXQuCgo+ICAgfTsKPiAgIAo+ICsjZGVmaW5lIHRvX3BjaV9kZXYocCkg
Y29udGFpbmVyX29mKHAsIHN0cnVjdCBwY2lfZGV2LCBkZXYpCj4gKyNkZWZpbmUgcGNpX2RvbWFp
bl9ucihkZXYpIGRldi0+c2VnCj4gICAjZGVmaW5lIGZvcl9lYWNoX3BkZXYoZG9tYWluLCBwZGV2
KSBcCj4gICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShwZGV2LCAmKGRvbWFpbi0+YXJjaC5wZGV2
X2xpc3QpLCBkb21haW5fbGlzdCkKPiAgIAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
