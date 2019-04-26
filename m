From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 12/15] cross builds: mfi-common: Break
 out set_build_hostflags
Date: Fri, 26 Apr 2019 17:39:59 +0100
Message-ID: <20190426164002.22381-13-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3us-0008G7-9V
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:38 +0000
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
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

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUt
ZHVtcC1mbGlnaHQtcnVudmFycy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1maS1jb21tb24gfCA3ICsrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZmkt
Y29tbW9uIGIvbWZpLWNvbW1vbgppbmRleCBmOTExNTZmZS4uZGFkMDNlMzkgMTAwNjQ0Ci0tLSBh
L21maS1jb21tb24KKysrIGIvbWZpLWNvbW1vbgpAQCAtMjE2LDYgKzIxNiwxMSBAQCBjcmVhdGVf
eGVuX2J1aWxkX2pvYiAoKSB7CiAgICAgJGV4dHJhX3J1bnZhcnMKIH0KIAorc2V0X2J1aWxkX2hv
c3RmbGFncyAoKSB7CisgICMgc2V0X2J1aWxkX2hvc3RmbGFncyBIT1NUX0FSQ0gKKyAgYnVpbGRf
aG9zdGZsYWdzPSJzaGFyZS1idWlsZC0kc3VpdGUtJDEsYXJjaC0kMSxzdWl0ZS0kc3VpdGUscHVy
cG9zZS1idWlsZCIKK30KKwogY3JlYXRlX2J1aWxkX2pvYnMgKCkgewogCiAgIGxvY2FsIGFyY2gK
QEAgLTM0Miw3ICszNDcsNyBAQCBjcmVhdGVfYnVpbGRfam9icyAoKSB7CiAgICAgICAgIGFyY2hf
cnVudmFycz1cIlwkQVJDSF9SVU5WQVJTXyRhcmNoXCIKICAgICAiCiAKLSAgICBidWlsZF9ob3N0
ZmxhZ3M9c2hhcmUtYnVpbGQtJHN1aXRlLSRhcmNoLGFyY2gtJGFyY2gsc3VpdGUtJHN1aXRlLHB1
cnBvc2UtYnVpbGQKKyAgICBzZXRfYnVpbGRfaG9zdGZsYWdzICRhcmNoCiAKICAgICBmb3IgZW5h
YmxlX3hzbSBpbiAkKHhzbV92YXJpYW50cyAkYXJjaCkgOyBkbwogICAgICAgaWYgWyB4JGVuYWJs
ZV94c20gPSB4dHJ1ZSBdIDsgdGhlbgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
