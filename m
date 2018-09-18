From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 02/34] x86/HVM: grow MMIO cache data size to
 64 bytes
Date: Tue, 18 Sep 2018 05:53:43 -0600
Message-ID: <5BA0E74702000078001E952E@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2EZg-00061T-7p
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:53:48 +0000
In-Reply-To: <5BA0E58F02000078001E94CE@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyBuZWVkZWQgYmVmb3JlIGVuYWJsaW5nIGFueSBBVlg1MTIgaW5zbnMgaW4gdGhlIGVt
dWxhdG9yLiBDaGFuZ2UKdGhlIHdheSBhbGlnbm1lbnQgaXMgZW5mb3JjZWQgYXQgdGhlIHNhbWUg
dGltZS4KCkFkZCBhIGNoZWNrIHRoYXQgdGhlIGJ1ZmZlciB3b24ndCBhY3R1YWxseSBvdmVyZmxv
dywgYW5kIHdoaWxlIGF0IGl0CmFsc28gY29udmVydCB0aGUgY2hlY2sgZm9yIGFjY2Vzc2VzIHRv
IG5vdCBjcm9zcyBwYWdlIGJvdW5kYXJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MzogTmV3LgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9l
bXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKQEAgLTg2Niw3ICs4NjYs
MTggQEAgc3RhdGljIGludCBodm1lbXVsX3BoeXNfbW1pb19hY2Nlc3MoCiAgICAgaW50IHJjID0g
WDg2RU1VTF9PS0FZOwogCiAgICAgLyogQWNjZXNzZXMgbXVzdCBmYWxsIHdpdGhpbiBhIHBhZ2Uu
ICovCi0gICAgQlVHX09OKChncGEgJiB+UEFHRV9NQVNLKSArIHNpemUgPiBQQUdFX1NJWkUpOwor
ICAgIGlmICggKGdwYSAmIH5QQUdFX01BU0spICsgc2l6ZSA+IFBBR0VfU0laRSApCisgICAgewor
ICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5I
QU5ETEVBQkxFOworICAgIH0KKworICAgIC8qIEFjY2Vzc2VzIG11c3Qgbm90IG92ZXJmbG93IHRo
ZSBjYWNoZSdzIGJ1ZmZlci4gKi8KKyAgICBpZiAoIHNpemUgPiBzaXplb2YoY2FjaGUtPmJ1ZmZl
cikgKQorICAgIHsKKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAgICAgIHJldHVy
biBYODZFTVVMX1VOSEFORExFQUJMRTsKKyAgICB9CiAKICAgICAvKgogICAgICAqIGh2bWVtdWxf
ZG9faW8oKSBjYW5ub3QgaGFuZGxlIG5vbi1wb3dlci1vZi0yIGFjY2Vzc2VzIG9yCi0tLSBhL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZjcHUuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2
bS92Y3B1LmgKQEAgLTQyLDE1ICs0MiwxNCBAQCBzdHJ1Y3QgaHZtX3ZjcHVfYXNpZCB7CiB9Owog
CiAvKgotICogV2UgbWF5IHJlYWQgb3Igd3JpdGUgdXAgdG8gbTI1NiBhcyBhIG51bWJlciBvZiBk
ZXZpY2UtbW9kZWwKKyAqIFdlIG1heSByZWFkIG9yIHdyaXRlIHVwIHRvIG01MTIgYXMgYSBudW1i
ZXIgb2YgZGV2aWNlLW1vZGVsCiAgKiB0cmFuc2FjdGlvbnMuCiAgKi8KIHN0cnVjdCBodm1fbW1p
b19jYWNoZSB7CiAgICAgdW5zaWduZWQgbG9uZyBnbGE7CiAgICAgdW5zaWduZWQgaW50IHNpemU7
CiAgICAgdWludDhfdCBkaXI7Ci0gICAgdWludDhfdCBwYWRbM107IC8qIG1ha2UgYnVmZmVyW10g
bG9uZy1hbGlnbmVkICovCi0gICAgdWludDhfdCBidWZmZXJbMzJdOworICAgIHVpbnQ4X3QgYnVm
ZmVyWzY0XSBfX2FsaWduZWQoc2l6ZW9mKGxvbmcpKTsKIH07CiAKIHN0cnVjdCBodm1fdmNwdV9p
byB7CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
