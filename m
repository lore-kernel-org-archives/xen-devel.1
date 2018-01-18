From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 7/9] libxl: lower shim related message to level
	info
Date: Thu, 18 Jan 2018 18:16:50 +0000
Message-ID: <20180118181652.26397-8-wei.liu2@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecEkE-0004Vf-NE
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 18:16:58 +0000
In-Reply-To: <20180118181652.26397-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9kb20uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kb20uYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2RvbS5jCmluZGV4IGUxYTNlNzQ3ZmMuLmI4ODAzNDFkN2UgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbS5jCkBA
IC0xMDM1LDcgKzEwMzUsNyBAQCBzdGF0aWMgaW50IGxpYnhsX19kb21haW5fZmlybXdhcmUobGli
eGxfX2djICpnYywKIAogICAgICAgICAgICAgLyogV2UndmUgbG9hZGVkIHRoZSBzaGltLCBzbyBs
b2FkIHRoZSBrZXJuZWwgYXMgYSBzZWNvbmRhcnkgbW9kdWxlICovCiAgICAgICAgICAgICBpZiAo
c3RhdGUtPnB2X2tlcm5lbC5tYXBwZWQpIHsKLSAgICAgICAgICAgICAgICBMT0coV0FSTiwgInhj
X2RvbV9tb2R1bGVfbWVtLCBjbWRsaW5lICVzIiwKKyAgICAgICAgICAgICAgICBMT0coSU5GTywg
InhjX2RvbV9tb2R1bGVfbWVtLCBjbWRsaW5lICVzIiwKICAgICAgICAgICAgICAgICAgICAgc3Rh
dGUtPnB2X2NtZGxpbmUpOwogICAgICAgICAgICAgICAgIHJjID0geGNfZG9tX21vZHVsZV9tZW0o
ZG9tLCBzdGF0ZS0+cHZfa2VybmVsLmRhdGEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGF0ZS0+cHZfa2VybmVsLnNpemUsIHN0YXRlLT5wdl9jbWRsaW5lKTsKQEAg
LTEwNDQsNyArMTA0NCw3IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RvbWFpbl9maXJtd2FyZShsaWJ4
bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgICAgICAg
ICB9CiAgICAgICAgICAgICB9IGVsc2UgewotICAgICAgICAgICAgICAgIExPRyhXQVJOLCAieGNf
ZG9tX21vZHVsZV9maWxlLCBwYXRoICVzIGNtZGxpbmUgJXMiLAorICAgICAgICAgICAgICAgIExP
RyhJTkZPLCAieGNfZG9tX21vZHVsZV9maWxlLCBwYXRoICVzIGNtZGxpbmUgJXMiLAogICAgICAg
ICAgICAgICAgICAgICBzdGF0ZS0+cHZfa2VybmVsLnBhdGgsIHN0YXRlLT5wdl9jbWRsaW5lKTsK
ICAgICAgICAgICAgICAgICByYyA9IHhjX2RvbV9tb2R1bGVfZmlsZShkb20sIHN0YXRlLT5wdl9r
ZXJuZWwucGF0aCwgc3RhdGUtPnB2X2NtZGxpbmUpOwogICAgICAgICAgICAgICAgIGlmIChyYykg
ewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
