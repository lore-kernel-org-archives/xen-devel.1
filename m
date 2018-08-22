From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] Revert "production-config: Temporarily
 drop arm64"
Date: Wed, 22 Aug 2018 11:50:03 +0100
Message-ID: <1534935003-28800-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1tiv=lf=citrix.com=prvs=7656d7fe5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fsQid-0001lq-Dd
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 10:50:31 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXZlcnRzIGNvbW1pdCAyZDNmZDgwODdlNzQ2YmM1ZjY0ZDNjZjAxMDE0YWFjMzg4YTFi
YjdlLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHByb2R1Y3Rp
b24tY29uZmlnIHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3Byb2R1Y3Rpb24tY29uZmlnIGIvcHJvZHVjdGlvbi1jb25maWcKaW5kZXggZmFlMzFl
YS4uZGYwMmNkMyAxMDA2NDQKLS0tIGEvcHJvZHVjdGlvbi1jb25maWcKKysrIGIvcHJvZHVjdGlv
bi1jb25maWcKQEAgLTQ1LDkgKzQ1LDYgQEAgTG9nc01pbkV4cGlyZUFnZT0gODY0MDAqNAogTG9n
c1B1Ymxpc2hNaW5TcGFjZU1ieT0gMjAqMWUzCiBMb2dzUHVibGlzaE1pbkV4cGlyZUFnZT0gODY0
MDAqNwogCi1CdWlsZEFyY2hlcyBpMzg2IGFtZDY0IGFybWhmCi1UZXN0QXJjaGVzIGkzODYgYW1k
NjQgYXJtaGYKLQogVGVzdEhvc3RLZXlwYWlyUGF0aCAvaG9tZS9vc3N0ZXN0L2tleXMvaWRfcnNh
X29zc3Rlc3QKIAogR2l0Q2FjaGVQcm94eSBnaXQ6Ly9jYWNoZTo5NDE5LwotLSAKMi4xLjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
