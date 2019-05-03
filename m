From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
Date: Fri, 3 May 2019 18:59:00 +0300
Message-ID: <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaW-0007qk-7c
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id b12so5654915lji.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:03 -0700 (PDT)
In-Reply-To: <20190422164937.21350-17-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgZnVuY3Rpb24gY3JlYXRlX3hlbl9lbnRyaWVzIG1heSBiZSBjb25jdXJyZW50bHkgY2FsbGVk
LiBTbyB3ZSBuZWVkCj4gdG8gcHJvdGVjdCB3aXRoIGEgc3BpbmxvY2sgdG8gYXZvaWQgY29ycnVw
dGlvbiB0aGUgcGFnZS10YWJsZXMuCgpUaGUgcXVlc3Rpb24gZnJvbSBtZSBpcyB3aHkgZGlkbid0
IHdlIHN0ZXAgaW50byB0aGlzIGlzc3VlIGJlZm9yZT8KCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9t
bS5jIHwgNiArKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4
IGZhMGY0MWJkMDcuLmVjZGU0ZTM0ZGYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMK
PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC05NjksNiArOTY5LDggQEAgZW51bSB4ZW5t
YXBfb3BlcmF0aW9uIHsKPiAgICAgICBSRVNFUlZFCj4gICB9Owo+ICAgCj4gK3N0YXRpYyBERUZJ
TkVfU1BJTkxPQ0soeGVuX3B0X2xvY2spOwo+ICsKPiAgIHN0YXRpYyBpbnQgY3JlYXRlX3hlbl9l
bnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmlydCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG1mbl90IG1mbiwKPiBAQCAtOTgwLDYgKzk4Miw4IEBAIHN0YXRpYyBpbnQgY3JlYXRl
X3hlbl9lbnRyaWVzKGVudW0geGVubWFwX29wZXJhdGlvbiBvcCwKPiAgICAgICBscGFlX3QgcHRl
LCAqZW50cnk7Cj4gICAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7Cj4gICAKPiArICAgIHNwaW5f
bG9jaygmeGVuX3B0X2xvY2spOwo+ICsKPiAgICAgICBmb3IoOyBhZGRyIDwgYWRkcl9lbmQ7IGFk
ZHIgKz0gUEFHRV9TSVpFLCBtZm4gPSBtZm5fYWRkKG1mbiwgMSkpCj4gICAgICAgewo+ICAgICAg
ICAgICBlbnRyeSA9ICZ4ZW5fc2Vjb25kW3NlY29uZF9saW5lYXJfb2Zmc2V0KGFkZHIpXTsKPiBA
QCAtMTA1NCw2ICsxMDU4LDggQEAgb3V0Ogo+ICAgICAgICAqLwo+ICAgICAgIGZsdXNoX3hlbl90
bGJfcmFuZ2VfdmEodmlydCwgUEFHRV9TSVpFICogbnJfbWZucyk7Cj4gICAKPiArICAgIHNwaW5f
dW5sb2NrKCZ4ZW5fcHRfbG9jayk7Cj4gKwo+ICAgICAgIHJldHVybiByYzsKPiAgIH0KPiAgIAo+
IAoKCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
