From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/libxenstat: Fix SONAME following c/s
 57077cc42
Date: Tue, 9 Oct 2018 15:06:32 +0100
Message-ID: <1539093992-11459-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHVuc3RhYmxlIEFCSSB2ZXJzaW9uIGlzIDQuMTIsIG5vdCA0LjExCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IElhbiBK
YWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KLS0tCiB0b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgYi90b29scy94ZW5zdGF0L2xpYnhl
bnN0YXQvTWFrZWZpbGUKaW5kZXggOGM2ZGRmOC4uZWI4ODA4NSAxMDA2NDQKLS0tIGEvdG9vbHMv
eGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlCisrKyBiL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3Rh
dC9NYWtlZmlsZQpAQCAtMTgsNyArMTgsNyBAQCBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1
bGVzLm1rCiBMRENPTkZJRz1sZGNvbmZpZwogTUFLRV9MSU5LPWxuIC1zZgogCi1NQUpPUj00LjEx
CitNQUpPUj00LjEyCiBNSU5PUj0wCiAKIExJQj1zcmMvbGlieGVuc3RhdC5hCi0tIAoyLjEuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
