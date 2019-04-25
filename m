From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
Date: Thu, 25 Apr 2019 07:21:47 -0600
Message-ID: <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeK4-0006O6-93
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:21:56 +0000
In-Reply-To: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, FionaLi-oc <fionali-oc@zhaoxin.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA0LjE5IGF0IDEwOjUwLCA8ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4gd3JvdGU6
Cj4gV2hlbiBleGVjdXRpbmcgU1lTRVhJVCBvciBTWVNFTlRSWSBpbiBaaGFveGluIENQVSwgQ1BV
IG5lZWRzIHRvCgpTWVNFTlRFUgoKPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMK
PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiBAQCAtMzM0LDcgKzMzNCw4IEBA
IHZvaWQgc3ViYXJjaF9wZXJjcHVfdHJhcHNfaW5pdCh2b2lkKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWxzdGFyX2VudGVyKTsKPiAgICAgIHN0
dWJfdmEgKz0gb2Zmc2V0Owo+ICAKPiAtICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICYgKFg4Nl9WRU5ET1JfSU5URUwgfCBYODZfVkVORE9SX0NFTlRBVVIpICkKPiArICAgIGlmICgg
Ym9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYKPiArICAgICAgICAoWDg2X1ZFTkRPUl9JTlRFTCB8
IFg4Nl9WRU5ET1JfQ0VOVEFVUiB8IFg4Nl9WRU5ET1JfU0hBTkdIQUkpICkKPiAgICAgIHsKPiAg
ICAgICAgICAvKiBTWVNFTlRFUiBlbnRyeS4gKi8KPiAgICAgICAgICB3cm1zcmwoTVNSX0lBMzJf
U1lTRU5URVJfRVNQLCBzdGFja19ib3R0b20pOwoKSG93IGlzIHRoaXMgaHVuayByZWxhdGVkIHRv
IHRoZSB0aXRsZSBvZiB0aGUgY2hhbmdlPyBJIHRoaW5rIHRoZQp0aXRsZSB3YW50cyB0byBiZSBh
ZGp1c3RlZC4KCkZ1cnRoZXJtb3JlIGZvciBhbGwgb2YgdGhlIGNoYW5nZXMgZG9uZSwgd291bGRu
J3Qgd2UgYmV0dGVyCnN3aXRjaCB0byB1c2UgY3B1X2hhc19zZXA/IGluaXRfYW1kKCkgYXMgd2Vs
bCBhcyBkZWZhdWx0X2luaXQoKQphbHJlYWR5IGNsZWFyIHRoaXMgZmxhZy4gQW5kcmV3LCB0aG91
Z2h0cz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
