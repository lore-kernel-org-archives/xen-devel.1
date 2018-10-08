From: Xin Li <talons.lee@gmail.com>
Subject: [PATCH 1/3] xen/xsm: remove unnecessary #define
Date: Mon,  8 Oct 2018 18:59:01 +0800
Message-ID: <20181008105903.766-1-xin.li@citrix.com>
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
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, root <root@lcy2-dt16.xenrtcloud>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ming Lu <ming.lu@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogcm9vdCA8cm9vdEBsY3kyLWR0MTYueGVucnRjbG91ZD4KCnRoaXMgI2RlZmluZSBpcyB1
bm5lY2Vzc2FyeSBzaW5jZSBYU01fSU5MSU5FIGlzIHJlZGVmaW5lZCBpbgp4c20vZHVtbXkuaCwg
c28gcmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1ieTogWGluIExpIDx4aW4ubGlAY2l0cml4LmNvbT4K
Ci0tLQpDQzogRGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CkNDOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8
SkJldWxpY2hAc3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+CkNDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CkNDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CkND
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogTWluZyBMdSA8
bWluZy5sdUBjaXRyaXguY29tPgoKdjU6IG1vdmUgdGhlIHJlbW92YWwgb2YgI2RlZmluZSB0byB0
aGlzIG5ldyBwYXRjaC4KCi0tLQogeGVuL3hzbS9kdW1teS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi94c20vZHVtbXkuYyBiL3hlbi94c20v
ZHVtbXkuYwppbmRleCAzMjkwZDA0NTI3Li4wNmE2NzRmYWQwIDEwMDY0NAotLS0gYS94ZW4veHNt
L2R1bW15LmMKKysrIGIveGVuL3hzbS9kdW1teS5jCkBAIC0xMSw3ICsxMSw2IEBACiAgKi8KIAog
I2RlZmluZSBYU01fTk9fV1JBUFBFUlMKLSNkZWZpbmUgWFNNX0lOTElORSAvKiAqLwogI2luY2x1
ZGUgPHhzbS9kdW1teS5oPgogCiBzdHJ1Y3QgeHNtX29wZXJhdGlvbnMgZHVtbXlfeHNtX29wczsK
LS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
