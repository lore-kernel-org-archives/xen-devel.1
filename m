From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 8/8] ci: add new bits to MAINTAINERS combine
	with Travis
Date: Thu, 15 Mar 2018 13:18:01 -0500
Message-ID: <345fb92a8d21e84195ef0ff11e33a8cdc3049c29.1521137713.git-series.cardoe@cardoe.com>
References: <cover.1034c76ceaf3556173e38c58eff71153493039ce.1521137713.git-series.cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cover.1034c76ceaf3556173e38c58eff71153493039ce.1521137713.git-series.cardoe@cardoe.com>
In-Reply-To: <cover.1034c76ceaf3556173e38c58eff71153493039ce.1521137713.git-series.cardoe@cardoe.com>
References: <cover.1034c76ceaf3556173e38c58eff71153493039ce.1521137713.git-series.cardoe@cardoe.com>
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
LS0tCiBNQUlOVEFJTkVSUyB8IDE2ICsrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKaW5kZXggYTViM2U5NS4uODFlYzMxMiAxMDA2NDQKLS0tIGEvTUFJTlRB
SU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE4MSw2ICsxODEsMTYgQEAgQkxLVEFQMgogUzoJ
T3JwaGFuZWQKIEY6CXRvb2xzL2Jsa3RhcDIvCiAKK0NJCitNOglEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+CitXOglodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QveGVuCitX
OglodHRwczovL3RyYXZpcy1jaS5vcmcveGVuLXByb2plY3QveGVuCitTOglTdXBwb3J0ZWQKK0Y6
CS5naXRsYWItY2kueW1sCitGOgkudHJhdmlzLnltbAorRjoJYXV0b21hdGlvbi8KK0Y6CXNjcmlw
dHMvdHJhdmlzLWJ1aWxkCisKIENQVSBQT09MUwogTToJSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgogTToJRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KQEAgLTM4NCwx
MiArMzk0LDYgQEAgRjoJeGVuL2NvbW1vbi90bWVtKgogRjoJeGVuL2luY2x1ZGUveGVuL3RtZW0q
CiBGOglkb2NzL21pc2MvdG1lbSoKIAotVFJBVklTIENJCi1NOglEb3VnIEdvbGRzdGVpbiA8Y2Fy
ZG9lQGNhcmRvZS5jb20+Ci1XOglodHRwczovL3RyYXZpcy1jaS5vcmcveGVuLXByb2plY3QveGVu
Ci1TOglTdXBwb3J0ZWQKLUY6CS50cmF2aXMueW1sCi0KIFVOTU9ESUZJRUQgTElOVVggUFYgRFJJ
VkVSUwogTToJSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgogUzoJT2Jzb2xldGUKLS0g
CmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
