From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 15/62] x86/Kconfig: Options for Xen and PVH
	support
Date: Fri, 12 Jan 2018 11:28:23 +0000
Message-ID: <20180112112910.16762-16-wei.liu2@citrix.com>
References: <20180112112910.16762-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=clhg=eh=citrix.com=prvs=54360ad83=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZy0S-0006oW-2L
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 12:00:20 +0000
In-Reply-To: <20180112112910.16762-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkludHJvZHVj
ZSB0d28gb3B0aW9ucy4gT25lIHRvIGRldGVjdCB3aGV0aGVyIHRoZSBiaW5hcnkgaXMgcnVubmlu
ZyBvbgpYZW4sIHRoZSBvdGhlciBlbmFibGVzIFBWSCBBQkkgc3VwcG9ydC4KClRoZSBmb3JtZXIg
d2lsbCBiZSB1c2VmdWwgdG8gUFYgaW4gSFZNIGFwcHJvYWNoLiBCb3RoIHdpbGwgYmUgdXNlZCBi
eQpQViBpbiBQVkggYXBwcm9hY2guCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgotLS0KdjI6CldyaXRlIGNvbW1pdCBtZXNzYWdlLiBEaWRuJ3QgY2hhbmdlIHRo
ZSBjb25maWcgb3B0aW9uIHZhbHVlIGFzIGl0CnJlcXVpcmVzIGEgbG90IG9mIGNoYW5nZXMgaW4g
bGF0ZXIgcGF0Y2hlcy4KLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyB8IDE3ICsrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2L0tjb25maWcKaW5kZXggN2M0NTgyOTIy
Zi4uYzBiMGJjZGNiMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L0tjb25maWcKKysrIGIveGVu
L2FyY2gveDg2L0tjb25maWcKQEAgLTExNyw2ICsxMTcsMjMgQEAgY29uZmlnIFRCT09UCiAJICBU
ZWNobm9sb2d5IChUWFQpCiAKIAkgIElmIHVuc3VyZSwgc2F5IFkuCisKK2NvbmZpZyBYRU5fR1VF
U1QKKwlkZWZfYm9vbCBuCisJcHJvbXB0ICJYZW4gR3Vlc3QiCisJLS0taGVscC0tLQorCSAgU3Vw
cG9ydCBmb3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5pbmcgdW5kZXIgWGVuLgorCisJ
ICBJZiB1bnN1cmUsIHNheSBOLgorCitjb25maWcgUFZIX0dVRVNUCisJZGVmX2Jvb2wgbgorCXBy
b21wdCAiUFZIIEd1ZXN0IgorCWRlcGVuZHMgb24gWEVOX0dVRVNUCisJLS0taGVscC0tLQorCSAg
U3VwcG9ydCBib290aW5nIHVzaW5nIHRoZSBQVkggQUJJLgorCisJICBJZiB1bnN1cmUsIHNheSBO
LgogZW5kbWVudQogCiBzb3VyY2UgImNvbW1vbi9LY29uZmlnIgotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
