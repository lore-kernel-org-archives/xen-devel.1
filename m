From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH v2] x86/vmx: correctly gather gs_shadow value
 for current vCPU
Date: Wed,  1 May 2019 17:52:03 -0600
Message-ID: <20190501235203.1179-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9NrI=TB=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hLz1K-00022A-Le
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 23:52:14 +0000
Received: by mail-io1-f65.google.com with SMTP id v9so465132iol.10
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 16:52:12 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IHRoZSBnc19zaGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hlbiB0aGUgdkNQ
VSBpcyBiZWluZyBzY2hlZHVsZWQKb3V0IGJ5IFhlbi4gUmVwb3J0aW5nIHRoaXMgKHVzdWFsbHkp
IHN0YWxlIHZhbHVlIHRocm91Z2ggdm1fZXZlbnQgaXMgaW5jb3JyZWN0LApzaW5jZSBpdCBkb2Vz
bid0IHJlcHJlc2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRo
ZSBldmVudAp3YXMgcmVjb3JkZWQuIFRoaXMgcHJldmVudHMgdm1fZXZlbnQgc3Vic2NyaWJlcnMg
ZnJvbSBjb3JyZWN0bHkgZmluZGluZyBrZXJuZWwKc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hl
biBpdCBpcyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgoKUmVmcmVzaCBzaGFkb3dfZ3MgdmFsdWUg
d2hlbiB0aGUgY29udGV4dCBiZWluZyBzYXZlZCBpcyBmb3IgdGhlIGN1cnJlbnQgdkNQVS4KClNp
Z25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KQ2M6IFJh
enZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KQ2M6IEp1biBOYWthamlt
YSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0K
djI6IG1vdmUgZml4IHRvIGh2bSBzbyB2bV9ldmVudCBkb2Vzbid0IGhhdmUgdG8ga25vdyBzcGVj
aWZpY3MKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCmluZGV4IDI4M2ViN2IzNGQuLjUx
NTRlY2MyYTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCkBAIC03NzksMTIgKzc3OSwxNyBAQCBzdGF0aWMgdm9p
ZCB2bXhfbG9hZF9jcHVfc3RhdGUoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpk
YXRhKQogCiBzdGF0aWMgdm9pZCB2bXhfc2F2ZV92bWNzX2N0eHQoc3RydWN0IHZjcHUgKnYsIHN0
cnVjdCBodm1faHdfY3B1ICpjdHh0KQogeworICAgIGlmICggdiA9PSBjdXJyZW50ICkKKyAgICAg
ICAgdm14X3NhdmVfZ3Vlc3RfbXNycyh2KTsKKwogICAgIHZteF9zYXZlX2NwdV9zdGF0ZSh2LCBj
dHh0KTsKICAgICB2bXhfdm1jc19zYXZlKHYsIGN0eHQpOwogfQogCiBzdGF0aWMgaW50IHZteF9s
b2FkX3ZtY3NfY3R4dChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmN0eHQpCiB7
CisgICAgQVNTRVJUKHYgIT0gY3VycmVudCk7CisKICAgICB2bXhfbG9hZF9jcHVfc3RhdGUodiwg
Y3R4dCk7CiAKICAgICBpZiAoIHZteF92bWNzX3Jlc3RvcmUodiwgY3R4dCkgKQotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
