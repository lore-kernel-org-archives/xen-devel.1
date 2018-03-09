From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 1/3] SUPPORT.md: Clarify that the PV keyboard
	protocol includes mouse support
Date: Fri, 9 Mar 2018 18:03:54 +0000
Message-ID: <20180309180356.8067-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zp9h=f7=citrix.com=prvs=599713481=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1euMND-0003JF-Oy
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 18:04:07 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

cy9mby9mbzsgd2hpbGUgd2UncmUgaGVyZS4KClNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAg
PGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tClRoaXMgaXMgYSBjYW5kaWRhdGUgZm9yIGJh
Y2twb3J0IHRvIDQuMTAuCgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+
CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogS29ucmFkIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogQW50aG9u
eSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNDOiBQYXVsIER1cnJhbnQgPHBh
dWwuZHVycmFudEBjaXRyaXguY29tPgpDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXgu
Y29tPgotLS0KIFNVUFBPUlQubWQgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9S
VC5tZAppbmRleCBhMTgxMGI4MDQ2Li44N2QwNzEyOWI0IDEwMDY0NAotLS0gYS9TVVBQT1JULm1k
CisrKyBiL1NVUFBPUlQubWQKQEAgLTM4MCw3ICszODAsOCBAQCBHdWVzdC1zaWRlIGRyaXZlciBj
YXBhYmxlIG9mIHNwZWFraW5nIHRoZSBYZW4gUFYgY29uc29sZSBwcm90b2NvbAogCiAgICAgU3Rh
dHVzLCBMaW51eCAoeGVuLWtiZGZyb250KTogU3VwcG9ydGVkCiAKLUd1ZXN0LXNpZGUgZHJpdmVy
IGNhcGFibGUgb2Ygc3BlYWtpbmcgdGhlIFhlbiBQViBrZXlib2FyZCBwcm90b2NvbAorR3Vlc3Qt
c2lkZSBkcml2ZXIgY2FwYWJsZSBvZiBzcGVha2luZyB0aGUgWGVuIFBWIGtleWJvYXJkIHByb3Rv
Y29sLgorTm90ZSB0aGF0IHRoZSAia2V5Ym9hcmQgcHJvdG9jb2wiIGluY2x1ZGVzIG1vdXNlIC8g
cG9pbnRlciBzdXBwb3J0IGFzIHdlbGwuCiAKICMjIyBQViBVU0IgKGZyb250ZW5kKQogCkBAIC00
NTEsNyArNDUyLDggQEAgSG9zdC1zaWRlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBYZW4gUFYgY29u
c29sZSBwcm90b2NvbAogCiAgICAgU3RhdHVzLCBRRU1VOiBTdXBwb3J0ZWQKIAotSG9zdC1zaWRl
IGltcGxlbWVudGF0aW9uIGZvIHRoZSBYZW4gUFYga2V5Ym9hcmQgcHJvdG9jb2wKK0hvc3Qtc2lk
ZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgWGVuIFBWIGtleWJvYXJkIHByb3RvY29sLgorTm90ZSB0
aGF0IHRoZSAia2V5Ym9hcmQgcHJvdG9jb2wiIGluY2x1ZGVzIG1vdXNlIC8gcG9pbnRlciBzdXBw
b3J0IGFzIHdlbGwuCiAKICMjIyBQViBVU0IgKGJhY2tlbmQpCiAKLS0gCjIuMTYuMgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
