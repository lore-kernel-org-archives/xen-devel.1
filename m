From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH] x86/vm_event: correctly gather gs_shadow value
Date: Tue, 30 Apr 2019 22:22:49 -0600
Message-ID: <20190501042249.1218-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9NrI=TB=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hLgln-0005WH-33
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 04:22:59 +0000
Received: by mail-io1-f66.google.com with SMTP id v9so14066157iol.10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 21:22:53 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IHRoZSBnc19zaGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hlbiB0aGUgdkNQ
VSBpcyBiZWluZyBzY2hlZHVsZWQKb3V0IGJ5IFhlbi4gUmVwb3J0aW5nIHRoaXMgKHVzdWFsbHkp
IHN0YWxlIHZhbHVlIHRocm91Z2ggdm1fZXZlbnQgaXMgaW5jb3JyZWN0LApzaW5jZSBpdCBkb2Vz
bid0IHJlcHJlc2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRo
ZSBldmVudAp3YXMgcmVjb3JkZWQuIFRoaXMgcHJldmVudHMgdm1fZXZlbnQgc3Vic2NyaWJlcnMg
ZnJvbSBjb3JyZWN0bHkgZmluZGluZyBrZXJuZWwKc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hl
biBpdCBpcyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBM
ZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni92bV9ldmVudC5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwppbmRleCA1MWMzNDkzYjFk
Li40NDY0OTQwZGE3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYworKysgYi94
ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwpAQCAtMjM5LDcgKzIzOSw3IEBAIHZvaWQgdm1fZXZlbnRf
ZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxKQogICAgIHZtX2V2ZW50X3BhY2tfc2Vn
bWVudF9yZWdpc3Rlcih4ODZfc2VnX2RzLCAmcmVxLT5kYXRhLnJlZ3MueDg2KTsKICAgICB2bV9l
dmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIoeDg2X3NlZ19lcywgJnJlcS0+ZGF0YS5yZWdzLng4
Nik7CiAKLSAgICByZXEtPmRhdGEucmVncy54ODYuc2hhZG93X2dzID0gY3R4dC5zaGFkb3dfZ3M7
CisgICAgcmVxLT5kYXRhLnJlZ3MueDg2LnNoYWRvd19ncyA9IHJkZ3NzaGFkb3coKTsKICAgICBy
ZXEtPmRhdGEucmVncy54ODYuZHI2ID0gY3R4dC5kcjY7CiAjZW5kaWYKIH0KLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
