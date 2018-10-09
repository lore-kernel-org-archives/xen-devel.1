From: Xin Li <talons.lee@gmail.com>
Subject: [PATCH v5 1/3] xen/xsm: remove unnecessary #define
Date: Tue,  9 Oct 2018 17:33:18 +0800
Message-ID: <20181009093320.24003-1-xin.li@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ming Lu <ming.lu@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

dGhpcyAjZGVmaW5lIGlzIHVubmVjZXNzYXJ5IHNpbmNlIFhTTV9JTkxJTkUgaXMgcmVkZWZpbmVk
IGluCnhzbS9kdW1teS5oLCBpdCdzIGEgcmlzayBvZiBidWlsZCBicmVha2FnZSwgc28gcmVtb3Zl
IGl0LgoKU2lnbmVkLW9mZi1ieTogWGluIExpIDx4aW4ubGlAY2l0cml4LmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLQpDQzogRGFuaWVsIERlIEdy
YWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CkNDOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVu
bGFwQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBTZXJnZXkg
RHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CkNDOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogTWluZyBMdSA8bWluZy5sdUBjaXRyaXguY29tPgoK
djU6CjEuIG1vdmUgdGhlIHJlbW92YWwgb2YgI2RlZmluZSB0byB0aGlzIG5ldyBwYXRjaC4KMi4g
Zml4IHdyb25nIGdpdCBhdXRob3IKCi0tLQogeGVuL3hzbS9kdW1teS5jIHwgMSAtCiAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi94c20vZHVtbXkuYyBiL3hl
bi94c20vZHVtbXkuYwppbmRleCAzMjkwZDA0NTI3Li4wNmE2NzRmYWQwIDEwMDY0NAotLS0gYS94
ZW4veHNtL2R1bW15LmMKKysrIGIveGVuL3hzbS9kdW1teS5jCkBAIC0xMSw3ICsxMSw2IEBACiAg
Ki8KIAogI2RlZmluZSBYU01fTk9fV1JBUFBFUlMKLSNkZWZpbmUgWFNNX0lOTElORSAvKiAqLwog
I2luY2x1ZGUgPHhzbS9kdW1teS5oPgogCiBzdHJ1Y3QgeHNtX29wZXJhdGlvbnMgZHVtbXlfeHNt
X29wczsKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
