From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/hvm: remove default ioreq server
Date: Tue, 7 Aug 2018 11:07:52 +0100
Message-ID: <c7c07bb0-b05c-61de-06a6-b8946bd48f95@citrix.com>
References: <20180807100312.1918-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dbyb=kw=citrix.com=prvs=7504029a4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fmyuC-0005Uz-Lr
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:07:56 +0000
In-Reply-To: <20180807100312.1918-1-paul.durrant@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDgvMTggMTE6MDMsIFBhdWwgRHVycmFudCB3cm90ZToKPiBNeSByZWNlbnQgcGF0Y2gg
WzFdIHRvIHFlbXUteGVuLXRyYWRpdGlvbmFsIHJlbW92ZXMgdGhlIGxhc3QgdXNlIG9mIHRoZQo+
ICdkZWZhdWx0JyBpb3JlcSBzZXJ2ZXIgaW4gWGVuLiAoVGhpcyBpcyBhIGNhdGNoLWFsbCBpb3Jl
cSBzZXJ2ZXIgdGhhdCBpcwo+IHVzZWQgaWYgbm8gZXhwbGljaXRseSByZWdpc3RlcmVkIEkvTyBy
YW5nZSBpcyB0YXJnZXR0ZWQpLgo+Cj4gVGhpcyBwYXRjaCBjYW4gYmUgYXBwbGllZCBvbmNlIHRo
YXQgcGF0Y2ggaXMgY29tbWl0dGVkLCB0byByZW1vdmUgdGhlCj4gKD4xMDAgbGluZXMgb2YpIHJl
ZHVuZGFudCBjb2RlIGluIFhlbi4KPgo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDgvbXNnMDAyNzAuaHRtbAo+Cj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKPiAtLS0KPiBDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL2RtLmMgICAg
ICAgICAgICB8ICAgMiArLQo+ICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICB8ICAy
NyAtLS0tLS0tLS0KPiAgeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jICAgICAgICAgfCAxMjMgKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL2RvbWFpbi5oIHwgICAxIC0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaW9yZXEu
aCAgfCAgIDQgKy0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMzggZGVs
ZXRpb25zKC0pCgpXb3cgLSB3aGF0IGEgZGlmZnN0YXQhCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
