From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] VMX: don't ignore P2M setup error
Date: Wed, 06 Feb 2019 03:24:26 -0700
Message-ID: <5C5AB5DA020000780021436D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grKNb-00016f-2B
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 10:24:31 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

c2V0X21taW9fcDJtX2VudHJ5KCkgbWF5IGZhaWwsIGluIHBhcnRpY3VsYXIgd2l0aCAtRU5PTUVN
LiBEb24ndCBpZ25vcmUKc3VjaCBhbiBlcnJvciwgYnV0IGluc3RlYWQgY2F1c2UgZG9tYWluIGNy
ZWF0aW9uIHRvIGZhaWwgaW4gc3VjaCBhIGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQo0LjEyOiBBbm90aGVyIGNhbmRpZGF0ZSwgYnV0IGFn
YWluIG9wZW4gZm9yIGRpc2N1c3Npb24uCgotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
YworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtMjk5OSwxMCArMjk5OSwxMCBA
QCBzdGF0aWMgaW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1CiAgICAgY2xlYXJfZG9t
YWluX3BhZ2UobWZuKTsKICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHBnLCBkLCBTSEFS
RV9ydyk7CiAgICAgZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNzX21mbiA9IG1mbl94KG1mbik7
Ci0gICAgc2V0X21taW9fcDJtX2VudHJ5KGQsIHBhZGRyX3RvX3BmbihBUElDX0RFRkFVTFRfUEhZ
U19CQVNFKSwgbWZuLAotICAgICAgICAgICAgICAgICAgICAgICBQQUdFX09SREVSXzRLLCBwMm1f
Z2V0X2hvc3RwMm0oZCktPmRlZmF1bHRfYWNjZXNzKTsKIAotICAgIHJldHVybiAwOworICAgIHJl
dHVybiBzZXRfbW1pb19wMm1fZW50cnkoZCwgcGFkZHJfdG9fcGZuKEFQSUNfREVGQVVMVF9QSFlT
X0JBU0UpLCBtZm4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX09SREVSXzRL
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX2dldF9ob3N0cDJtKGQpLT5kZWZh
dWx0X2FjY2Vzcyk7CiB9CiAKIHN0YXRpYyB2b2lkIHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKHN0
cnVjdCBkb21haW4gKmQpCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
