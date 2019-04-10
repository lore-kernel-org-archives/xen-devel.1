From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 51/62] dm restrict audit: always install
 (some) chiark-scripts
Date: Wed, 10 Apr 2019 15:23:57 +0100
Message-ID: <20190410142408.22848-52-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAc-00078p-EN
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:46 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
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

SW4KICBkbSByZXN0cmljdCBhdWRpdDogaW5zdGFsbCBuZXdlciBjaGlhcmstc2NyaXB0cyBmb3Ig
ZmlzaGRlc2NyaXB0b3IKYXJyYW5nZW1lbnRzIHdlcmUgbWFkZSB0byBpbnN0YWxsIHN1aXRhYmxl
IGNoaWFyay1zY3JpcHRzIGZvcgpmb3IgamVzc2llIGFuZCBzdHJldGNoLgoKRm9yIGJ1c3RlciBh
bmQgbGF0ZXIsIHRoZSBtYWlubGluZSBEZWJpYW4gdmVyc2lvbiBvZiBjaGlhcmstc2NyaXB0cyBp
cwppbmRlZWQgc3VmZmljaWVudCwgYnV0IG5vdGhpbmcgaW5zdGFsbGVkIGl0LiAgRG8gdGhhdC4K
ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgot
LS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0
ZXN0L0RlYmlhbi5wbQppbmRleCA4ZDUzYmJlMS4uOWQ3ZDE1MTggMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvRGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC05OTcsNyArOTk3LDcgQEAg
ZC1pIGFwdC1zZXR1cC9hbm90aGVyIGJvb2xlYW4gZmFsc2UKIGQtaSBhcHQtc2V0dXAvbm9uLWZy
ZWUgYm9vbGVhbiBmYWxzZQogZC1pIGFwdC1zZXR1cC9jb250cmliIGJvb2xlYW4gZmFsc2UKIAot
ZC1pIHBrZ3NlbC9pbmNsdWRlIHN0cmluZyBvcGVuc3NoLXNlcnZlciwgbnRwLCBudHBkYXRlLCBl
dGh0b29sLCBjaGlhcmstdXRpbHMtYmluLCB3Z2V0LCAkZXh0cmFfcGFja2FnZXMKK2QtaSBwa2dz
ZWwvaW5jbHVkZSBzdHJpbmcgb3BlbnNzaC1zZXJ2ZXIsIG50cCwgbnRwZGF0ZSwgZXRodG9vbCwg
Y2hpYXJrLXV0aWxzLWJpbiwgY2hpYXJrLXNjcmlwdHMsIHdnZXQsICRleHRyYV9wYWNrYWdlcwog
CiBkLWkgZ3J1Yi1pbnN0YWxsZXIvZm9yY2UtZWZpLWV4dHJhLXJlbW92YWJsZSBib29sZWFuIHRy
dWUKIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
