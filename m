From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 8/8] ci: add new bits to MAINTAINERS combine
 with Travis
Date: Tue, 20 Mar 2018 22:01:28 -0500
Message-ID: <5b9117e02f93d8ad9994c13f1f4d27bb833fc8e9.1521600968.git-series.cardoe@cardoe.com>
References: <4f0696bcb28a15392dedf2282a99baa99add033a.1521600968.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4f0696bcb28a15392dedf2282a99baa99add033a.1521600968.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.517034f4470b4dbdfdfaaab48d9e3143bbb7aa81.1521600968.git-series.cardoe@cardoe.com>
References: <cover.517034f4470b4dbdfdfaaab48d9e3143bbb7aa81.1521600968.git-series.cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3JlYXRlZCBhIG5ldyBzZWN0aW9uIGp1c3QgY2FsbGVkICdDSScgc2luY2UgdGhpcyBpcyBhZGRp
bmcgR2l0TGFiIENJCmFuZCBzdGlsbCBsZWF2aW5nIHRoZSBvbGQgVHJhdmlzIENJIGZpbGVzIGFy
b3VuZC4gVGhpcyBjb25zb2xpZGF0ZXMgdGhlCnR3byBzZWN0aW9ucyBhbmQgYWRkcyB0aGUgbmV3
IGZpbGVzIGFzIHdlbGwgYXMgYWRkaW5nIGFub3RoZXIgVHJhdmlzCmZpbGUgdGhhdCB3YXMgbWlz
c2luZy4KClNpZ25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4K
UmV2aWV3ZWQtYnk6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4KLS0tCiBNQUlOVEFJTkVSUyB8IDE2ICsrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggYTViM2U5NS4uODFlYzMxMiAxMDA2NDQKLS0tIGEvTUFJ
TlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE4MSw2ICsxODEsMTYgQEAgQkxLVEFQMgog
UzoJT3JwaGFuZWQKIEY6CXRvb2xzL2Jsa3RhcDIvCiAKK0NJCitNOglEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+CitXOglodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVu
CitXOglodHRwczovL3RyYXZpcy1jaS5vcmcveGVuLXByb2plY3QveGVuCitTOglTdXBwb3J0ZWQK
K0Y6CS5naXRsYWItY2kueW1sCitGOgkudHJhdmlzLnltbAorRjoJYXV0b21hdGlvbi8KK0Y6CXNj
cmlwdHMvdHJhdmlzLWJ1aWxkCisKIENQVSBQT09MUwogTToJSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgogTToJRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KQEAgLTM4
NCwxMiArMzk0LDYgQEAgRjoJeGVuL2NvbW1vbi90bWVtKgogRjoJeGVuL2luY2x1ZGUveGVuL3Rt
ZW0qCiBGOglkb2NzL21pc2MvdG1lbSoKIAotVFJBVklTIENJCi1NOglEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+Ci1XOglodHRwczovL3RyYXZpcy1jaS5vcmcveGVuLXByb2plY3Qv
eGVuCi1TOglTdXBwb3J0ZWQKLUY6CS50cmF2aXMueW1sCi0KIFVOTU9ESUZJRUQgTElOVVggUFYg
RFJJVkVSUwogTToJSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogUzoJT2Jzb2xldGUK
LS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
