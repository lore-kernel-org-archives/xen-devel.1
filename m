From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] xen: append EXTRA_CFLAGS to CFLAGS for expert
	builds
Date: Thu, 18 Jan 2018 11:04:46 -0600
Message-ID: <20180118170446.435-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zhje=en=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ecDcH-0006g7-LV
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 17:04:41 +0000
Received: by mail-yw0-x241.google.com with SMTP id m19so11768872ywh.12
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2018 09:04:40 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWxsb3cgYSB1c2VyIHRvIHN1cHBseSBleHRyYSBDRkxBR1MgdmlhIHRoZSBFWFRSQV9DRkxBR1Mg
ZW52aXJvbm1lbnQKdmFyaWFibGUuICBUaGlzIGlzIG5vdCBhIGNvbmZpZ3VyYXRpb24gdGhhdCBp
cyBzdXBwb3J0ZWQgYnV0IGlzIG9ubHkKYWltZWQgdG8gaGVscCBzdXBwb3J0IHRlc3RpbmcgYW5k
IHRyb3VibGVzaG9vdGluZyB3aGVuIHlvdSBuZWVkIHRvIG1ha2UKY2hhbmdlcy4KClNpZ25lZC1v
ZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KLS0tCkNDOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogR2VvcmdlIER1bmxhcCA8R2Vv
cmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNDOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVu
Lm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vUnVsZXMubWsgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL1J1bGVzLm1rIGIv
eGVuL1J1bGVzLm1rCmluZGV4IDNjZjQwNzU0YTYuLjYzYjU1OTAzNWYgMTAwNjQ0Ci0tLSBhL3hl
bi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAgLTc1LDYgKzc1LDggQEAgQUxMX09CSlMg
Oj0gJChBTExfT0JKUy15KQogQ0ZMQUdTLXkgKz0gLU1NRCAtTUYgJChARCkvLiQoQEYpLmQKIAog
Q0ZMQUdTICs9ICQoQ0ZMQUdTLXkpCisjIGFsbG93IGV4dHJhIENGTEFHUyBleHRlcm5hbGx5IHZp
YSBFWFRSQV9DRkxBR1MKK0NGTEFHUyArPSAkKEVYVFJBX0NGTEFHUykKIAogIyBNb3N0IENGTEFH
UyBhcmUgc2FmZSBmb3IgYXNzZW1ibHkgZmlsZXM6CiAjICAtc3RkPWdudXs4OSw5OX0gZ2V0cyBj
b25mdXNlZCBieSAjLXByZWZpeGVkIGVuZC1vZi1saW5lIGNvbW1lbnRzCi0tIAoyLjEzLjYKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
