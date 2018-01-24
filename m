From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH 3/7] ARM: GICv3: emit optional DT property
 only when necessary
Date: Wed, 24 Jan 2018 16:32:08 +0000
Message-ID: <0344bf88-9c7a-d7ea-e5d6-49343ea666cd@linaro.org>
References: <20180124143517.18469-1-andre.przywara@linaro.org>
 <20180124143517.18469-4-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=szm7=et=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eeNy9-0004nP-JN
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 16:32:13 +0000
Received: by mail-wm0-x244.google.com with SMTP id v123so9752724wmd.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2018 08:32:11 -0800 (PST)
In-Reply-To: <20180124143517.18469-4-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAyNC8wMS8xOCAxNDozNSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhl
IEFSTSBHSUN2MyBEVCBwcm9wZXJ0eSAiI3JlZGlzdHJpYnV0b3ItcmVnaW9ucyIgaXMgb3B0aW9u
YWwgYW5kIG9ubHkKPiB1c2VmdWwgaWYgaXQgaGFzIGFueSBvdGhlciB2YWx1ZXMgdGhhbiB0aGUg
YXJjaGl0ZWN0ZWQgIjEiLgo+IEtlZXAgb3VyIGdlbmVyYXRlZCBEVCBub2RlIGNsZWFuIGJ5IGVt
aXR0aW5nIHRoaXMgcHJvcGVydHkgb25seSBpZiB3ZQo+IGFjdHVhbGx5IG5lZWQgbW9yZSB0aGFu
IG9uZSByZWdpb24uCgpJIHJlYWxseSBkb24ndCBzZWUgdGhlIGJlbmVmaXRzIG9mIHRoaXMgcGF0
Y2guIEl0IGlzIGZpbmUgdG8gaGF2ZSAKI3JlZGlzdHJpYnV0b3ItcmVnaW9ucyBwcm9wZXJ0eSBp
biB0aGUgRFQuIFlvdSBtaWdodCAiY2xlYW4iIHRoZSBEVCBidXQgCm1ha2UgdGhlIGNvZGUgYSBi
aXQgbW9yZSBjb21wbGV4LgoKQ2hlZXJzLAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5
d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9n
aWMtdjMuYyB8IDExICsrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYz
LmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMKPiBpbmRleCBhMGQyOTBiNTVjLi45YWQwY2QxOWVm
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMtdjMuYwo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9naWMtdjMuYwo+IEBAIC0xMTY4LDEwICsxMTY4LDEzIEBAIHN0YXRpYyBpbnQgZ2ljdjNfbWFr
ZV9od2RvbV9kdF9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAgaWYgKCByZXMg
KQo+ICAgICAgICAgICByZXR1cm4gcmVzOwo+ICAgCj4gLSAgICByZXMgPSBmZHRfcHJvcGVydHlf
Y2VsbChmZHQsICIjcmVkaXN0cmlidXRvci1yZWdpb25zIiwKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGQtPmFyY2gudmdpYy5ucl9yZWdpb25zKTsKPiAtICAgIGlmICggcmVzICkKPiAt
ICAgICAgICByZXR1cm4gcmVzOwo+ICsgICAgaWYgKCBkLT5hcmNoLnZnaWMubnJfcmVnaW9ucyA+
IDEgKQo+ICsgICAgewo+ICsgICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eV9jZWxsKGZkdCwgIiNy
ZWRpc3RyaWJ1dG9yLXJlZ2lvbnMiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGQtPmFyY2gudmdpYy5ucl9yZWdpb25zKTsKPiArICAgICAgICBpZiAoIHJlcyApCj4gKyAgICAg
ICAgICAgIHJldHVybiByZXM7Cj4gKyAgICB9Cj4gICAKPiAgICAgICBsZW4gPSBkdF9jZWxsc190
b19zaXplKGR0X25fYWRkcl9jZWxscyhnaWMpICsgZHRfbl9zaXplX2NlbGxzKGdpYykpOwo+ICAg
ICAgIC8qCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
