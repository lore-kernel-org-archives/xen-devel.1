From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 26/26] DO NOT APPLY power:
 ts-freebsd-host-install: Use power_reboot_attempts
Date: Thu, 24 Jan 2019 18:46:13 +0000
Message-ID: <20190124184613.2720-27-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1F-0003i5-3c
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:29 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UkZDLiAgTmVlZHMgaW5wdXQgb24gaG93IHRvCiB8IGNoZWNrIHRoYXQgdGhpcyBpcyB0aGUgaW5z
dGFsbGVyIGVudmlyb25tZW50CmFzIHJlcXVlc3RlZCBieSB0aGUgY29tbWVudAogfCBpbiBwYXJ0
aWN1bGFyICRhd2FpdCBtdXN0IG9ubHkgc3VjY2VlZCBpZiB0aGUgaG9zdCByZWFsbHkgZGlkCiB8
IHJlYm9vdCBpbnRvIHRoZSBib290IGVudmlyb25tZW50IHRoYXQgJGF3YWl0IGV4cGVjdHMuCm5l
YXIgdGhlIHRvcCBvZiBwb3dlcl9yZWJvb3RfYXR0ZW1wdHMKCkNDOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdHMtZnJlZWJzZC1ob3N0LWluc3RhbGwgfCAxNiAr
KysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3RzLWZyZWVic2QtaG9zdC1pbnN0YWxsIGIvdHMtZnJlZWJz
ZC1ob3N0LWluc3RhbGwKaW5kZXggNTNkYWVlZmMuLjIxZjNiNWEyIDEwMDc1NQotLS0gYS90cy1m
cmVlYnNkLWhvc3QtaW5zdGFsbAorKysgYi90cy1mcmVlYnNkLWhvc3QtaW5zdGFsbApAQCAtMjU5
LDE0ICsyNTksMTQgQEAgRU5ECiB9CiAKICMgU3dpdGNoIG9mZiwgc2V0dXAgUFhFIGFuZCBzd2l0
Y2ggb24gdG8gdGhlIGluc3RhbGxlcgotcG93ZXJfc3RhdGUoJGhvLCAwKTsKLXNldHVwX25ldGJv
b3RfaW5zdGFsbGVyKCk7Ci1wb3dlcl9jeWNsZV9zbGVlcCgkaG8pOwotcG93ZXJfc3RhdGUoJGhv
LCAxKTsKLQotIyBXYWl0IGZvciB0aGUgaG9zdCB0byBmaW5pc2ggYm9vdGluZwotbG9nbSgiV2Fp
dGluZyBmb3IgdGhlIGluc3RhbGxlciB0byBib290Iik7Ci1hd2FpdF90Y3AoZ2V0X3RpbWVvdXQo
JGhvLCdyZWJvb3QnLCR0aW1lb3V0KSwgNSwgJGhvKTsKK3Bvd2VyX3JlYm9vdF9hdHRlbXB0cygk
aG8sIHN1YiB7CisgICAgc2V0dXBfbmV0Ym9vdF9pbnN0YWxsZXIoKTsKK30sIHN1YiB7CisgICAg
IyBXYWl0IGZvciB0aGUgaG9zdCB0byBmaW5pc2ggYm9vdGluZworICAgIGxvZ20oIldhaXRpbmcg
Zm9yIHRoZSBpbnN0YWxsZXIgdG8gYm9vdCIpOworICAgIGF3YWl0X3RjcChnZXRfdGltZW91dCgk
aG8sJ3JlYm9vdCcsJHRpbWVvdXQpLCA1LCAkaG8pOworICAgIHh4eCBjaGVjayB0aGF0IHRoaXMg
aXMgdGhlIGluc3RhbGxlciBlbnZpcm9ubWVudAorfSwgdW5kZWYsICdpbnN0YWxsJyk7CiAKIGlm
ICgkYm9vdG9ubHkpIHsKICAgICBob3N0cHJvcF9wdXRhdGl2ZV9yZWNvcmQoJGhvLCAiTWVtZGlz
a0FwcGVuZCIsICRtZW1kaXNrX2FwcGVuZCkKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
