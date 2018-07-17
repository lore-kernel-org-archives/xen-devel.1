From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 2/9] dummy flight generation: cs-hosts-list
 should not print { }
Date: Tue, 17 Jul 2018 18:03:40 +0200
Message-ID: <20180717160347.60140-3-roger.pau@citrix.com>
References: <20180717160347.60140-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnja=kb=citrix.com=prvs=72919e7bd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffSSo-0001m8-Ce
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 16:04:34 +0000
In-Reply-To: <20180717160347.60140-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpXaXRoIG5ld2Vy
IGJhc2gsIHRoaXMgY2F1c2VzCiAgICAgIGxvY2FsIGVudnZhcj0iRlJFRUJTRF8ke2FyY2heXn1f
QlVJTERKT0IiCiAgICAgIGlmIFsgLW4gIiR7IWVudnZhcn0iIF07IHRoZW4KdG8gKHByb3Blcmx5
KSByZXBvcnQgYSBzeW50YXggZXJyb3IuCgpBcyBSb2dlciBzYXlzLCBpdCBpcyBiZXR0ZXIgdG8g
cHJpbnQgYSBkdW1teSBob3N0IGZvciBlYWNoCmFyY2hpdGVjdHVyZSwgc28gZG8gdGhhdC4KClJl
cG9ydGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogY3Mt
aG9zdHMtbGlzdCB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NzLWhvc3RzLWxpc3Qg
Yi9jcy1ob3N0cy1saXN0CmluZGV4IDZiOTEwYWUzLi4zODRlZDQ2MSAxMDA3NTUKLS0tIGEvY3Mt
aG9zdHMtbGlzdAorKysgYi9jcy1ob3N0cy1saXN0CkBAIC05MiwxNSArOTIsMTggQEAgbXkgKCRm
bGFncykgPSBAQVJHVjsKIG15ICRvOwogCiBpZiAoJEVOVnsnT1NTVEVTVF9IT1NUU0xJU1RfRFVN
TVknfSkgewotICAgICRvIC49ICJTT01FSE9TVCI7Ci0gICAgaWYgKEBhcmNoZXMpIHsKLQkkbyAu
PSAiICRrZXJuZWxzWzBdIjsKLQkkbyAuPSAiIHsiLmpvaW4oJywnLEBhcmNoZXMpLiJ9IjsKKyAg
ICBmb3JlYWNoIG15ICRhcmNoIChAYXJjaGVzID8gQGFyY2hlcyA6IHF3KFNPTUVBUkNIKSkgewor
ICAgICAgICAkbyAuPSAiU09NRUhPU1QiOworICAgICAgICAkbyAuPSAiLVxVJGFyY2giIGlmIEBh
cmNoZXM7CisgICAgICAgIGlmIChAYXJjaGVzKSB7CisgICAgICAgICAgICAkbyAuPSAiICRrZXJu
ZWxzWzBdIjsKKyAgICAgICAgICAgICRvIC49ICIgJGFyY2giOworICAgICAgICB9CisgICAgICAg
IGlmIChAc3VpdGVzKSB7CisgICAgICAgICAgICAkbyAuPSAiICRzdWl0ZXNbMF0iOworICAgICAg
ICB9CisgICAgICAgICRvIC49ICJcbiI7CiAgICAgfQotICAgIGlmIChAc3VpdGVzKSB7Ci0JJG8g
Lj0gIiAkc3VpdGVzWzBdIjsKLSAgICB9Ci0gICAgJG8gLj0gIlxuIjsKICAgICBwcmludCAkbyBv
ciBkaWUgJCE7CiAgICAgZXhpdCAwOwogfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
