From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/passthrough: put the x86 folder under
 x86 maintainership
Date: Fri, 4 Jan 2019 11:33:28 +0100
Message-ID: <20190104103329.35741-4-roger.pau@citrix.com>
References: <20190104103329.35741-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CPMs=PM=citrix.com=prvs=9008e7f41=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gfMo1-0007d7-M6
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 10:34:21 +0000
In-Reply-To: <20190104103329.35741-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

cGFzc3Rocm91Z2gveDg2IGlzIHRpZWQgdG8gdGhlIHg4NiBjb2RlLCBhbmQgYXMgc3VjaCBwdXQg
aXQgdW5kZXIgeDg2Cm1haW50YWluZXJzaGlwLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUu
Y2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpD
YzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGU5
OWQzOWViNDcuLmE0MGZhNjFlYjIgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5U
QUlORVJTCkBAIC0yNTcsNiArMjU3LDcgQEAgRjoJeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvCiBY
Ogl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvCiBYOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vCiBYOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvCitYOgl4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC94ODYvCiBYOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5j
CiBGOgl4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAogCkBAIC00NDUsNiArNDQ2LDcgQEAgUjoJUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CiBTOglTdXBwb3J0ZWQKIEw6CXhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwogRjoJeGVuL2FyY2gveDg2LworRjoJeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gveDg2LwogRjoJeGVuL2luY2x1ZGUvYXNtLXg4Ni8KIEY6CXhlbi9p
bmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni8KIEY6CXRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci8KLS0g
CjIuMTcuMiAoQXBwbGUgR2l0LTExMykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
