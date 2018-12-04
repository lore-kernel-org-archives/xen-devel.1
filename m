From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 03/17] xen/arm: p2m: Clean-up
 headers included and order them alphabetically
Date: Tue, 4 Dec 2018 15:47:59 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812041547430.527@sstabellini-ThinkPad-X260>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gUKQ8-0000Uz-Rz
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 23:48:04 +0000
In-Reply-To: <20181204202651.8836-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA0IERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQSBsb3Qgb2YgdGhlIGhl
YWRlcnMgYXJlIG5vdCBuZWNlc3NhcnksIHNvIHJlbW92ZSB0aGVtLiBBdCB0aGUgc2FtZQo+IHRp
bWUsIHJlLW9yZGVyIHRoZW0gYWxwaGFiZXRpY2FsbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0v
cDJtLmMgfCAxOCArKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9w
Mm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+IGluZGV4IDZjNzYyOThlYmMuLjgxZjMxMDdkZDIg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3Ay
bS5jCj4gQEAgLTEsMTkgKzEsMTEgQEAKPiAtI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgo+IC0jaW5j
bHVkZSA8eGVuL2xpYi5oPgo+IC0jaW5jbHVkZSA8eGVuL2Vycm5vLmg+Cj4gKyNpbmNsdWRlIDx4
ZW4vY3B1Lmg+Cj4gICNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4KPiAtI2luY2x1ZGUgPHhl
bi9iaXRvcHMuaD4KPiAtI2luY2x1ZGUgPHhlbi92bV9ldmVudC5oPgo+IC0jaW5jbHVkZSA8eGVu
L21vbml0b3IuaD4KPiAgI2luY2x1ZGUgPHhlbi9pb2NhcC5oPgo+IC0jaW5jbHVkZSA8eGVuL21l
bV9hY2Nlc3MuaD4KPiAtI2luY2x1ZGUgPHhlbi94bWFsbG9jLmg+Cj4gLSNpbmNsdWRlIDx4ZW4v
Y3B1Lmg+Cj4gLSNpbmNsdWRlIDx4ZW4vbm90aWZpZXIuaD4KPiAtI2luY2x1ZGUgPHB1YmxpYy92
bV9ldmVudC5oPgo+IC0jaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+Cj4gKyNpbmNsdWRlIDx4ZW4v
bGliLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiArCj4gICNpbmNsdWRlIDxhc20vZXZl
bnQuaD4KPiAtI2luY2x1ZGUgPGFzbS9oYXJkaXJxLmg+Cj4gKyNpbmNsdWRlIDxhc20vZmx1c2h0
bGIuaD4KPiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gIAo+ICAjZGVmaW5lIE1BWF9WTUlEXzhf
QklUICAoMVVMIDw8IDgpCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
