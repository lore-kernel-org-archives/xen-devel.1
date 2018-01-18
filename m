From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 4/9] Remove sched=null from shim cmdline and doc
Date: Thu, 18 Jan 2018 18:16:47 +0000
Message-ID: <20180118181652.26397-5-wei.liu2@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecEo3-0005sY-70
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 18:20:55 +0000
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgdXNlIHRoZSBkZWZhdWx0IHNjaGVkdWxlciAoY3JlZGl0MSBhcyBvZiB3cml0aW5nKS4gVGhl
IE5VTEwKc2NoZWR1bGVyIHN0aWxsIGhhcyBidWdzIHRvIGZpeC4KClNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIGRvY3MvbWFu
L3hsLmNmZy5wb2QuNS5pbiAgICAgfCAyICstCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuY2ZnLnBvZC41LmluIGIvZG9jcy9tYW4veGwuY2Zn
LnBvZC41LmluCmluZGV4IDMwZmU0Yjg1MzEuLmE2OTkzNjc3NzkgMTAwNjQ0Ci0tLSBhL2RvY3Mv
bWFuL3hsLmNmZy5wb2QuNS5pbgorKysgYi9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4KQEAgLTUz
MSw3ICs1MzEsNyBAQCBJZ25vcmVkIGlmIHB2aHNpbSBpcyBmYWxzZS4KID1pdGVtIEI8cHZzaGlt
X2NtZGxpbmU9IlNUUklORyI+CiAKIENvbW1hbmQgbGluZSBmb3IgdGhlIHNoaW0uCi1EZWZhdWx0
IGlzICJwdi1zaGltIGNvbnNvbGU9eGVuLHB2IHNjaGVkPW51bGwiLgorRGVmYXVsdCBpcyAicHYt
c2hpbSBjb25zb2xlPXhlbixwdiIuCiBJZ25vcmVkIGlmIHB2aHNpbSBpcyBmYWxzZS4KIAogPWl0
ZW0gQjxwdnNoaW1fZXh0cmE9IlNUUklORyI+CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAwZjg5MzY0
NDY2Li43ZmY5YTY3ZTUwIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5o
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTExOSw3ICsxMTksNyBAQAog
I2RlZmluZSBET01JRF9YU19QQVRIICJkb21pZCIKICNkZWZpbmUgSU5WQUxJRF9ET01JRCB+MAog
I2RlZmluZSBQVlNISU1fQkFTRU5BTUUgInhlbi1zaGltIgotI2RlZmluZSBQVlNISU1fQ01ETElO
RSAicHYtc2hpbSBjb25zb2xlPXhlbixwdiBzY2hlZD1udWxsIgorI2RlZmluZSBQVlNISU1fQ01E
TElORSAicHYtc2hpbSBjb25zb2xlPXhlbixwdiIKIAogLyogU2l6ZSBtYWNyb3MuICovCiAjZGVm
aW5lIF9fQUMoWCxZKSAgIChYIyNZKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
