From: Viktor Mitin <viktor.mitin.19@gmail.com>
Subject: libxc: memory leak in handle_hvm_context
Date: Fri, 17 May 2019 14:49:44 +0300
Message-ID: <CAOcoXZYuwoFDKexde=BJgexsv=DN5u_Y8WdLcOgveC+GvEAiuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FnXM=TR=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hRbN6-0003J8-Qf
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 11:49:56 +0000
Received: by mail-it1-x130.google.com with SMTP id q132so11404340itc.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 04:49:55 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Campbell <Ian.Campbell@citrix.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLAoKSXQgc2VlbXMgdGhlcmUgaXMgYSBtZW1vcnkgbGVhayBpbiBsaWJ4YyBmdW5jdGlv
biBoYW5kbGVfaHZtX2NvbnRleHQKKGluIGZpbGUgdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94
ODZfaHZtLmMuKS4gVGhlcmUgaXMgYSBtYWxsb2Mgb2YKdmFyaWFibGUgcCB3aXRob3V0IGZyZWUu
ClBsZWFzZSB0YWtlIGEgbG9vay4KCisvKgorICogUHJvY2VzcyBhbiBIVk1fQ09OVEVYVCByZWNv
cmQgZnJvbSB0aGUgc3RyZWFtLgorICovCitzdGF0aWMgaW50IGhhbmRsZV9odm1fY29udGV4dChz
dHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHhjX3NyX3JlY29yZCAqcmVjKQoreworICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4
LT54Y2g7CisgICAgdm9pZCAqcDsKKworICAgIHAgPSBtYWxsb2MocmVjLT5sZW5ndGgpOworICAg
IGlmICggIXAgKQorICAgIHsKKyAgICAgICAgRVJST1IoIlVuYWJsZSB0byBhbGxvY2F0ZSAldSBi
eXRlcyBmb3IgaHZtIGNvbnRleHQiLCByZWMtPmxlbmd0aCk7CisgICAgICAgIHJldHVybiAtMTsK
KyAgICB9CisKKyAgICBmcmVlKGN0eC0+eDg2X2h2bS5yZXN0b3JlLmNvbnRleHQpOworCisgICAg
Y3R4LT54ODZfaHZtLnJlc3RvcmUuY29udGV4dCA9IG1lbWNweShwLCByZWMtPmRhdGEsIHJlYy0+
bGVuZ3RoKTsKKyAgICBjdHgtPng4Nl9odm0ucmVzdG9yZS5jb250ZXh0c3ogPSByZWMtPmxlbmd0
aDsKKworICAgIHJldHVybiAwOworfQoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
