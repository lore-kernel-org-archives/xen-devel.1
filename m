From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/2] x86/HVM: account for fully eager FPU mode
 in emulation
Date: Fri, 15 Jun 2018 02:58:01 -0600
Message-ID: <5B237F9902000078001CB84B@prv1-mh.provo.novell.com>
References: <5B237D0B02000078001CB837@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9pmr=jb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fTkYX-0008QS-1W
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 08:58:05 +0000
In-Reply-To: <5B237D0B02000078001CB837@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gZnVsbHkgZWFnZXIgbW9kZSB3ZSBtdXN0IG5vdCBjbGVhciBmcHVfZGlydGllZCwgc2V0IENS
MC5UUywgb3IgaW52b2tlCnRoZSBmcHVfbGVhdmUoKSBob29rLiBJbnN0ZWFkIGRvIHdoYXQgdGhl
IG1vZGUncyBuYW1lIHNheXM6IFJlc3RvcmUKc3RhdGUgcmlnaHQgYXdheS4KClNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNoL3g4Ni9o
dm0vZW11bGF0ZS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCkBAIC0yMTM5LDEz
ICsyMTM5LDIwIEBAIHN0YXRpYyB2b2lkIGh2bWVtdWxfcHV0X2ZwdSgKICAgICBpZiAoIGJhY2tv
dXQgPT0gWDg2RU1VTF9GUFVfZnB1ICkKICAgICB7CiAgICAgICAgIC8qCi0gICAgICAgICAqIFRv
IGJhY2sgb3V0IGNoYW5nZXMgdG8gdGhlIHJlZ2lzdGVyIGZpbGUgc2ltcGx5IGFkanVzdCBzdGF0
ZSBzdWNoCi0gICAgICAgICAqIHRoYXQgdXBvbiBuZXh0IEZQVSBpbnNuIHVzZSBieSB0aGUgZ3Vl
c3Qgd2UnbGwgcmVsb2FkIHRoZSBzdGF0ZQotICAgICAgICAgKiBzYXZlZCAob3IgZnJlc2hseSBs
b2FkZWQpIGJ5IGh2bWVtdWxfZ2V0X2ZwdSgpLgorICAgICAgICAgKiBUbyBiYWNrIG91dCBjaGFu
Z2VzIHRvIHRoZSByZWdpc3RlciBmaWxlCisgICAgICAgICAqIC0gaW4gZnVsbHkgZWFnZXIgbW9k
ZSwgcmVzdG9yZSBvcmlnaW5hbCBzdGF0ZSBpbW1lZGlhdGVseSwKKyAgICAgICAgICogLSBpbiBs
YXp5IG1vZGUsIHNpbXBseSBhZGp1c3Qgc3RhdGUgc3VjaCB0aGF0IHVwb24gbmV4dCBGUFUgaW5z
bgorICAgICAgICAgKiAgIHVzZSBieSB0aGUgZ3Vlc3Qgd2UnbGwgcmVsb2FkIHRoZSBzdGF0ZSBz
YXZlZCAob3IgZnJlc2hseSBsb2FkZWQpCisgICAgICAgICAqICAgYnkgaHZtZW11bF9nZXRfZnB1
KCkuCiAgICAgICAgICAqLwotICAgICAgICBjdXJyLT5mcHVfZGlydGllZCA9IGZhbHNlOwotICAg
ICAgICBzdHRzKCk7Ci0gICAgICAgIGh2bV9mdW5jcy5mcHVfbGVhdmUoY3Vycik7CisgICAgICAg
IGlmICggY3Vyci0+YXJjaC5mdWxseV9lYWdlcl9mcHUgKQorICAgICAgICAgICAgdmNwdV9yZXN0
b3JlX2ZwdV9lYWdlcihjdXJyKTsKKyAgICAgICAgZWxzZQorICAgICAgICB7CisgICAgICAgICAg
ICBjdXJyLT5mcHVfZGlydGllZCA9IGZhbHNlOworICAgICAgICAgICAgc3R0cygpOworICAgICAg
ICAgICAgaHZtX2Z1bmNzLmZwdV9sZWF2ZShjdXJyKTsKKyAgICAgICAgfQogICAgIH0KIH0KIAoK
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
