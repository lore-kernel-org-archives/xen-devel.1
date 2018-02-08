From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [RFC 07/11] Add kernel helper functions
Date: Thu, 8 Feb 2018 14:56:30 -0700
Message-ID: <c9b71a79-a68d-cc3b-214e-89969ad701f5@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-8-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9lkd=fc=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1ejuBG-0001cO-NS
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 21:56:34 +0000
Received: by mail-it0-x241.google.com with SMTP id e1so8258672ita.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2018 13:56:33 -0800 (PST)
In-Reply-To: <20180102092809.1841-8-manish.jaggi@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: manish.jaggi@linaro.org, xen-devel@lists.xenproject.org, julien.grall@linaro.org, andre.przywara@linaro.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

Ck9uIDEvMi8yMDE4IDI6MjggQU0sIG1hbmlzaC5qYWdnaUBsaW5hcm8ub3JnIHdyb3RlOgo+IEZy
b206IE1hbmlzaCBKYWdnaSA8bWFuaXNoLmphZ2dpQGxpbmFyby5vcmc+Cj4KPiBBZGQga2FsbG9j
IGtmcmVlIGZ1bmN0aW9ucyBmcm9tIGxpbnV4IGtlcm5lbC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1h
bmlzaCBKYWdnaSA8bWFuaXNoLmphZ2dpQGxpbmFyby5vcmc+Cj4gLS0tCj4gIHhlbi9pbmNsdWRl
L3hlbi9rZXJuZWwuaCB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4va2VybmVsLmggYi94ZW4v
aW5jbHVkZS94ZW4va2VybmVsLmgKPiBpbmRleCA1NDhiNjRkYTlmLi43ODUxN2Y2Y2FhIDEwMDY0
NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9rZXJuZWwuaAo+IEBAIC03LDYgKzcsMTYgQEAKPiAgCj4gICNpbmNsdWRlIDx4ZW4vdHlwZXMu
aD4KPiAgCllvdSBtaWdodCB3YW50IHRvIHN3YXAgMDYgYW5kIDA3LiBPbmNlIHlvdSBkbyB0aGF0
IEkgY2FuIHJlbW92ZSB0aGUgZm9sbG93aW5nIGRlZmluZXMgZnJvbSBrZXJuZWwuaAo+ICsvKiBY
ZW46IERlZmluZSBjb21wYXRpYmlsaXR5IGZ1bmN0aW9ucyAqLwo+ICsjZGVmaW5lIEZXX0JVRyAg
ICAgICAgICJbRmlybXdhcmUgQnVnXTogIgo+ICsjZGVmaW5lIHByX2VycihmbXQsIC4uLikgcHJp
bnRrKFhFTkxPR19FUlIgZm10LCAjIyBfX1ZBX0FSR1NfXykKPiArI2RlZmluZSBwcl93YXJuKGZt
dCwgLi4uKSBwcmludGsoWEVOTE9HX1dBUk5JTkcgZm10LCAjIyBfX1ZBX0FSR1NfXykKPiArCj4g
Ky8qIEFsaWFzIHRvIFhlbiBhbGxvY2F0aW9uIGhlbHBlcnMgKi8KPiArI2RlZmluZSBrZnJlZSB4
ZnJlZQo+ICsjZGVmaW5lIGttYWxsb2Moc2l6ZSwgZmxhZ3MpICAgICAgICAgICAgX3htYWxsb2Mo
c2l6ZSwgc2l6ZW9mKHZvaWQgKikpCj4gKyNkZWZpbmUga3phbGxvYyhzaXplLCBmbGFncykgICAg
ICAgICAgICBfeHphbGxvYyhzaXplLCBzaXplb2Yodm9pZCAqKSkKPiArCj4gIC8qCj4gICAqIG1p
bigpL21heCgpIG1hY3JvcyB0aGF0IGFsc28gZG8KPiAgICogc3RyaWN0IHR5cGUtY2hlY2tpbmcu
LiBTZWUgdGhlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
