From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/physdev: Remove redundant assignment in
 allocate_and_map_msi_pirq()
Date: Fri, 20 Jul 2018 12:13:01 +0200
Message-ID: <20180720101301.h66ypbccenhfwwev@mac.bytemobile.com>
References: <6be2c543-bca6-4e52-870a-9ed63fd6c67f@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <6be2c543-bca6-4e52-870a-9ed63fd6c67f@default>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjAsIDIwMTggYXQgMDI6Mjk6MzRBTSAtMDcwMCwgWmhlbnpob25nIER1YW4g
d3JvdGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnpo
b25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4
Ni9pcnEuYyB8ICAgIDIgLS0KPiAgMSBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9h
cmNoL3g4Ni9pcnEuYwo+IGluZGV4IDg3ZWYyZTguLjUyNTNmZDEgMTAwNjQ0Cj4gLS0tIGEveGVu
L2FyY2gveDg2L2lycS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4gQEAgLTI3MDEsOCAr
MjcwMSw2IEBAIGludCBhbGxvY2F0ZV9hbmRfbWFwX21zaV9waXJxKHN0cnVjdCBkb21haW4gKmQs
IGludCBpbmRleCwgaW50ICpwaXJxX3AsCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAg
ICB9Cj4gIAo+IC0gICAgbXNpLT5pcnEgPSBpcnE7CgpJIHdvdWxkIHByZWZlciB0byByZW1vdmUg
dGhlIGFzc2lnbm1lbnQgaW4gdGhlIE1BUF9QSVJRX1RZUEVfTVVMVElfTVNJCmNhc2UgcmF0aGVy
IHRoYW4gaGVyZS4gSU1PIHRoaXMgb25lIG1ha2VzIGl0IGNsZWFyZXIgdGhhdCBtc2ktPmlycSBp
cwphbHdheXMgc2V0LiBJbiBhbnkgY2FzZToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
