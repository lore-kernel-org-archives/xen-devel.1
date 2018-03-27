From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 33/39] ARM: new VGIC: Add preliminary
 stub implementation
Date: Tue, 27 Mar 2018 15:48:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803271543430.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-34-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u3an=gr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0xOK-00081O-KF
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 22:48:32 +0000
In-Reply-To: <20180321163235.12529-34-andre.przywara@linaro.org>
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

T24gV2VkLCAyMSBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhlIEFSTSBhcmNo
IGNvZGUgcmVxdWlyZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW11bGF0aW9uIHRvIGltcGxl
bWVudAo+IHZnaWNfY2xlYXJfcGVuZGluZ19pcnFzKCksIGFsdGhvdWdoIGl0IGlzIHN1c3BlY3Rl
ZCB0aGF0IGl0IGlzIGFjdHVhbGx5Cj4gbm90IG5lY2Vzc2FyeS4gR28gd2l0aCBhIHN0dWIgZm9y
IG5vdyB0byBtYWtlIHRoZSBsaW5rZXIgaGFwcHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmUg
UHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS92Z2lj
L3ZnaWMuYyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdmdpYy92Z2ljLmMgYi94ZW4vYXJjaC9hcm0v
dmdpYy92Z2ljLmMKPiBpbmRleCAyM2I4YWJmYzVlLi5iNzBmZGFhZWNiIDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMu
Ywo+IEBAIC03OTEsNiArNzkxLDE0IEBAIHZvaWQgZ2ljX2R1bXBfdmdpY19pbmZvKHN0cnVjdCB2
Y3B1ICp2KQo+ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdi0+YXJjaC52Z2ljLmFwX2xp
c3RfbG9jaywgZmxhZ3MpOwo+ICB9Cj4gIAo+ICt2b2lkIHZnaWNfY2xlYXJfcGVuZGluZ19pcnFz
KHN0cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogVE9ETzogSXQgaXMgdW5j
bGVhciB3aGV0aGVyIHdlIHJlYWxseSBuZWVkIHRoaXMsIHNvIHdlIG1pZ2h0IGluc3RlYWQKPiAr
ICAgICAqIHJlbW92ZSBpdCBvbiB0aGUgY2FsbGVyIHNpdGUuCj4gKyAgICAgKi8KPiArfQoKVGhp
cyBpcyBPSyBmb3Igbm93LgoKSG93ZXZlciwgdGhpbmtpbmcgYWJvdXQgdGhpcyBpc3N1ZSwgaXMg
aXQgcG9zc2libGUgZm9yIGEgdmNwdSB0byBzZW5kIGFuCmludGVycnVwdCB0byBhbiBvZmZsaW5l
IHZjcHUsIG1heWJlIGFuIFNHST8gV2hhdCB3b3VsZCBoYXBwZW4gaW4gdGhhdApjYXNlPyBJdCBs
b29rcyBsaWtlIHRoYXQgdmdpY19tbWlvX3dyaXRlX3NnaXIgd291bGQgYWxsb3cgaXQuIE90aGVy
d2lzZSwKYSB2Y3B1IGNvdWxkIGNhdXNlIHRoZSBnZW5lcmF0aW9uIG9mIGEgcGh5c2ljYWwgaW50
ZXJydXB0LCBhbiBTUEksCnRhcmdldGluZyBhbiBvZmZsaW5lIHZjcHUuCgpNYXliZSB3ZSBzaG91
bGQgV0FSTiBpbiBjYXNlIGFwX2xpc3QgaXMgbm90IGVtcHR5PwoKCj4gIC8qKgo+ICAgKiBhcmNo
X21vdmVfaXJxcygpIC0gbWlncmF0ZSB0aGUgcGh5c2ljYWwgYWZmaW5pdHkgb2YgaGFyZHdhcmUg
bWFwcGVkIHZJUlFzCj4gICAqIEB2OiAgdGhlIHZDUFUsIGFscmVhZHkgYXNzaWduZWQgdG8gdGhl
IG5ldyBwQ1BVCj4gLS0gCj4gMi4xNC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
