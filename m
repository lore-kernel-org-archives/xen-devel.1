From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] tools/helpers: make
 gen_stub_json_config accept an UUID argument
Date: Thu, 15 Nov 2018 14:42:16 +0000
Message-ID: <ac1c5cb8-00c9-32b5-9027-8ebc863568ad@citrix.com>
References: <20181114181732.19013-1-wei.liu2@citrix.com>
 <20181114181732.19013-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=verr=n2=citrix.com=prvs=850f8f69e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gNIrV-0003IL-Pu
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 14:43:17 +0000
In-Reply-To: <20181114181732.19013-3-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, edvin.torok@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMTEvMjAxOCAxODoxNywgV2VpIExpdSB3cm90ZToKPiBJZiB0aGF0J3Mgc2V0LCB0aGUg
c3R1YiBpcyBnb2luZyB0byBjb250YWluIHRoYXQgVVVJRC4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLgo+Cj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAt
LS0KPiAgdG9vbHMvaGVscGVycy9pbml0LWRvbS1qc29uLmMgICAgICAgIHwgNSArKysrLQo+ICB0
b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24uaCAgICAgICAgfCAzICsrLQo+ICB0b29scy9oZWxw
ZXJzL2luaXQteGVuc3RvcmUtZG9tYWluLmMgfCAyICstCj4gIHRvb2xzL2hlbHBlcnMveGVuLWlu
aXQtZG9tMC5jICAgICAgICB8IDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvaGVscGVycy9pbml0LWRv
bS1qc29uLmMgYi90b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24uYwo+IGluZGV4IDcwNGU3Y2I0
ZjAuLjk1MTRiM2NlYjYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvaGVscGVycy9pbml0LWRvbS1qc29u
LmMKPiArKysgYi90b29scy9oZWxwZXJzL2luaXQtZG9tLWpzb24uYwo+IEBAIC03LDcgKzcsNyBA
QAo+ICAjaW5jbHVkZSA8eGVuY3RybC5oPgo+ICAjaW5jbHVkZSA8bGlieGwuaD4KPiAgCj4gLWlu
dCBnZW5fc3R1Yl9qc29uX2NvbmZpZyh1aW50MzJfdCBkb21pZCkKPiAraW50IGdlbl9zdHViX2pz
b25fY29uZmlnKHVpbnQzMl90IGRvbWlkLCBsaWJ4bF91dWlkICp1dWlkKQo+ICB7Cj4gICAgICBp
bnQgcmMgPSAxOwo+ICAgICAgeGVudG9vbGxvZ19sb2dnZXJfc3RkaW9zdHJlYW0gKmxvZ2dlcjsK
PiBAQCAtNDAsNiArNDAsOSBAQCBpbnQgZ2VuX3N0dWJfanNvbl9jb25maWcodWludDMyX3QgZG9t
aWQpCj4gICAgICBsaWJ4bF9kb21haW5fYnVpbGRfaW5mb19pbml0X3R5cGUoJmRvbV9jb25maWcu
Yl9pbmZvLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbV9jb25m
aWcuY19pbmZvLnR5cGUpOwo+ICAKPiArICAgIGlmICh1dWlkICYmICFsaWJ4bF91dWlkX2lzX25p
bCh1dWlkKSkKPiArICAgICAgICBsaWJ4bF91dWlkX2NvcHkoY3R4LCAmZG9tX2NvbmZpZy5jX2lu
Zm8udXVpZCwgdXVpZCk7CgpJcyB0aGUgbmlsIGNoZWNrIG5lY2Vzc2FyeSwgZ2l2ZW4gdGhhdCBu
aWwgaXMgdGhlIGRlZmF1bHQgdmFsdWUgZm9yCmRvbV9jb25maWcuY19pbmZvLnV1aWQgPwoKRWl0
aGVyIHdheSwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
