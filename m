From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v1 5/6] x86/vvmx: correctly report vvmcs size
Date: Fri, 12 Oct 2018 16:27:58 +0100
Message-ID: <20181012152800.7921-6-sergey.dyasli@citrix.com>
References: <20181012152800.7921-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181012152800.7921-1-sergey.dyasli@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHNpemUgb2YgWGVuJ3MgdmlydHVhbCB2bWNzIHJlZ2lvbiBpcyA0MDk2IGJ5dGVzLiBDb3Jy
ZWN0bHkgcmVwb3J0Cml0IHRvIHRoZSBndWVzdCBpbiBjYXNlIHdoZW4gVk1DUyBzaGFkb3dpbmcg
aXMgbm90IGF2YWlsYWJsZSBpbnN0ZWFkIG9mCnByb3ZpZGluZyBIL1cgdmFsdWUgKHdoaWNoIGlz
IHVzdWFsbHkgc21hbGxlcikuCgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXku
ZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgOCAr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwpp
bmRleCA4YjY5MWJmYzA0Li4yYzJiYTM2ZDk0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92dm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCkBAIC0yMDY0LDYg
KzIwNjQsMTQgQEAgaW50IG52bXhfbXNyX3JlYWRfaW50ZXJjZXB0KHVuc2lnbmVkIGludCBtc3Is
IHU2NCAqbXNyX2NvbnRlbnQpCiAgICAgICAgIGRhdGEgPSAoaG9zdF9kYXRhICYgKH4wdWwgPDwg
MzIpKSB8CiAgICAgICAgICAgICAgICAodm1jcy0+dm1jc19yZXZpc2lvbl9pZCAmIDB4N2ZmZmZm
ZmYpOwogICAgICAgICB1bm1hcF9kb21haW5fcGFnZSh2bWNzKTsKKworICAgICAgICBpZiAoICFj
cHVfaGFzX3ZteF92bWNzX3NoYWRvd2luZyApCisgICAgICAgIHsKKyAgICAgICAgICAgIC8qIFJl
cG9ydCB2bWNzX3JlZ2lvbl9zaXplIGFzIDQwOTYgKi8KKyAgICAgICAgICAgIGRhdGEgJj0gflZN
WF9CQVNJQ19WTUNTX1NJWkVfTUFTSzsKKyAgICAgICAgICAgIGRhdGEgfD0gMVVMTCA8PCA0NDsK
KyAgICAgICAgfQorCiAgICAgICAgIGJyZWFrOwogICAgIH0KICAgICBjYXNlIE1TUl9JQTMyX1ZN
WF9QSU5CQVNFRF9DVExTOgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
