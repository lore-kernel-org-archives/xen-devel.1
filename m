From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/17] ts-xen-install: Honour
 DebianExtraPackages_<suite>
Date: Wed, 13 Jun 2018 14:03:56 +0100
Message-ID: <1528895042-14113-12-git-send-email-ian.jackson@eu.citrix.com>
References: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9ytt=i7=citrix.com=prvs=695a74e14=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fT5Rk-0005Oq-TE
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 13:04:20 +0000
In-Reply-To: <1528895042-14113-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbGxvd3MgdXMgdG8gc3BlY2lmeSBzb21lIHBhY2thZ2VzIHRvIGluc3RhbGwgcmVnYXJk
bGVzcyBvZgpmaXJtd2FyZSBhbmQgYXJjaGl0ZWN0dXJlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogUkVBRE1FICAgICAgICAgfCAx
ICsKIHRzLXhlbi1pbnN0YWxsIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvUkVBRE1FIGIvUkVBRE1FCmluZGV4IDJkZmQ0ZGUuLmU5MzhmNjQg
MTAwNjQ0Ci0tLSBhL1JFQURNRQorKysgYi9SRUFETUUKQEAgLTUzNyw2ICs1MzcsNyBAQCBEZWJp
YW5Ob25mcmVlRmlybXdhcmUKICAgZ3JlcC1kY3RybCAoZm9yIGV4YW1wbGUgYmVjYXVzZSBpdCdz
IG5vdCBEZWJpYW4pIHRoZW4geW91IG11c3Qgc2V0CiAgIHRoaXMgdG8gdGhlIGVtcHR5IHN0cmlu
ZywgYnkgd3JpdGluZyAgRGViaWFuTm9uZnJlZUZpcm13YXJlPScnCiAKK0RlYmlhbkV4dHJhUGFj
a2FnZXNfPHN1aXRlPiBbPGl0ZW0+Li4uIF0KIERlYmlhbkV4dHJhUGFja2FnZXNfPGZpcm13YXJl
Pl88YXJjaD5fPHN1aXRlPiBbPGl0ZW0+Li4uIF0KICAgRXh0cmEgcGFja2FnZXMsIG9yIGRpcmVj
dG9yaWVzIG9mIHRoZW0sIHRvIGluc3RhbGwgb24gZXZlcnkgRGViaWFuCiAgIGhvc3QgKGRvbTAp
LiAgRWFjaCB2YXJpYWJsZSBpcyBhIHNwYWNlLXNlcGFyYXRlZCBsaXN0IG9mIGl0ZW1zLgpkaWZm
IC0tZ2l0IGEvdHMteGVuLWluc3RhbGwgYi90cy14ZW4taW5zdGFsbAppbmRleCAxZWMyMzZmLi4z
NDYzZTE3IDEwMDc1NQotLS0gYS90cy14ZW4taW5zdGFsbAorKysgYi90cy14ZW4taW5zdGFsbApA
QCAtMTA2LDYgKzEwNiw5IEBAIHN1YiBzb21lX2V4dHJhZGVicyAoJCkgewogc3ViIGV4dHJhZGVi
cyAoKSB7CiAgICAgbXkgJHN1aXRlID0gJGhvLT57U3VpdGV9OwogCisgICAgIyAkY3sgRGViaWFu
RXh0cmFQYWNrYWdlc188c3VpdGU+IH0KKyAgICBzb21lX2V4dHJhZGVicyhbICdEZWJpYW5FeHRy
YVBhY2thZ2VzJywgJHN1aXRlIF0pOworCiAgICAgIyAkY3sgRGViaWFuRXh0cmFQYWNrYWdlc188
ZmlybXdhcmU+XzxhcmNoPl88c3VpdGU+IH0KICAgICBteSAkZmlybXdhcmUgPSBnZXRfaG9zdF9w
cm9wZXJ0eSgkaG8sICJmaXJtd2FyZSIsICJiaW9zIik7CiAgICAgc29tZV9leHRyYWRlYnMoWyAn
RGViaWFuRXh0cmFQYWNrYWdlcycsICRmaXJtd2FyZSwgJHJ7YXJjaH0sICRzdWl0ZSBdKTsKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
