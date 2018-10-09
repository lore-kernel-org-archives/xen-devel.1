From: Xin Li <talons.lee@gmail.com>
Subject: [PATCH 1/3] xen/xsm: remove unnecessary #define
Date: Tue,  9 Oct 2018 08:28:31 +0800
Message-ID: <20181009002831.22678-1-xin.li@citrix.com>
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
IGl0LgoKU2lnbmVkLW9mZi1ieTogWGluIExpIDx4aW4ubGlAY2l0cml4LmNvbT4KCi0tLQpDQzog
RGFuaWVsIERlIEdyYWFmIDxkZ2RlZ3JhQHR5Y2hvLm5zYS5nb3Y+CkNDOiBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+CkNDOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBU
aW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
CkNDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CkNDOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogTWluZyBMdSA8bWluZy5sdUBj
aXRyaXguY29tPgoKdjU6CjEuIG1vdmUgdGhlIHJlbW92YWwgb2YgI2RlZmluZSB0byB0aGlzIG5l
dyBwYXRjaC4KMi4gZml4IHdyb25nIGdpdCBhdXRob3IKCi0tLQogeGVuL3hzbS9kdW1teS5jIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi94c20v
ZHVtbXkuYyBiL3hlbi94c20vZHVtbXkuYwppbmRleCAzMjkwZDA0NTI3Li4wNmE2NzRmYWQwIDEw
MDY0NAotLS0gYS94ZW4veHNtL2R1bW15LmMKKysrIGIveGVuL3hzbS9kdW1teS5jCkBAIC0xMSw3
ICsxMSw2IEBACiAgKi8KIAogI2RlZmluZSBYU01fTk9fV1JBUFBFUlMKLSNkZWZpbmUgWFNNX0lO
TElORSAvKiAqLwogI2luY2x1ZGUgPHhzbS9kdW1teS5oPgogCiBzdHJ1Y3QgeHNtX29wZXJhdGlv
bnMgZHVtbXlfeHNtX29wczsKLS0gCjIuMTguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
