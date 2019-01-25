From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/5] power: ssh: Reduce timeout for
 script fragment
Date: Fri, 25 Jan 2019 14:50:44 +0000
Message-ID: <20190125145046.27138-4-ian.jackson@eu.citrix.com>
References: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1alE=QB=citrix.com=prvs=9210a8ee7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gn2ov-000835-7X
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 14:51:01 +0000
In-Reply-To: <20190125145046.27138-1-ian.jackson@eu.citrix.com>
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

VGhpcyBpcyByZWFsbHkgbm90IGdvaW5nIHRvIHRha2UgYSBtaW51dGUuICBQcm9iYWJseSwgbXVj
aCBsZXNzLgpXYWl0aW5nIGxlc3MgbG9uZyB3aWxsIHNhdmUgdGltZSB3aGVuIHdlIGZhbGwgYmFj
ay4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIE9zc3Rlc3QvUERVL3NzaC5wbSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvUERVL3NzaC5wbSBi
L09zc3Rlc3QvUERVL3NzaC5wbQppbmRleCBjZmNmOGY4NS4uMTY0MTA5MzcgMTAwNjQ0Ci0tLSBh
L09zc3Rlc3QvUERVL3NzaC5wbQorKysgYi9Pc3N0ZXN0L1BEVS9zc2gucG0KQEAgLTQ3LDcgKzQ3
LDcgQEAgc3ViIHBkdV9wb3dlcl9zdGF0ZSB7CiAKICAgICBteSAkZGVsYXkgPSA1OwogCi0gICAg
dGFyZ2V0X2NtZF9yb290KCRtby0+e0hvc3R9LCA8PEVORCwgNjApOworICAgIHRhcmdldF9jbWRf
cm9vdCgkbW8tPntIb3N0fSwgPDxFTkQsIDMwKTsKICBzZXQgLWUKICB0eXBlIHJlYm9vdAogIGV4
ZWMgPj4vdmFyL2xvZy9vc3N0ZXN0LXJlYm9vdC5sb2cKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
