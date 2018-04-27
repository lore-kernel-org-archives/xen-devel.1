From: Lars Kurth <lars.kurth@citrix.com>
Subject: [PATCH for-4.11 v2 1/2] Add Brian Woods as Designated
 reviewer to AMD IOMMU and AMD SVM
Date: Fri, 27 Apr 2018 19:01:02 +0100
Message-ID: <5f97efd6b0a3eaae10e4052c8ee20aea79689dd2.1524851673.git.lars.kurth@citrix.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ezub=hq=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fC7gl-0004PZ-Al
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 18:01:43 +0000
In-Reply-To: <cover.1524851673.git.lars.kurth@citrix.com>
In-Reply-To: <cover.1524851673.git.lars.kurth@citrix.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3YXMgZGlzY3Vzc2VkIGluIGFuIElSQyBkaXNjdXNzaW9uIHBvc3QgdGhlIEFwcmlsIHg4
NiBtZWV0aW5nLgpPbiAyNy80LzE4IEp1ZXJnZW4gZ2F2ZSBhIFJBQiB2aWEgSVJDCgpDYzogTGFy
cyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUu
Y2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpD
YzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KQ2M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgpDYzogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJz
Lmt1cnRoQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4K
QWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogTUFJTlRBSU5FUlMg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBiYmRhNGI5ZjQzLi5lNTM5ZmFjNzFmIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTQyLDEyICsxNDIsMTQg
QEAgRjoJdG9vbHMvbGliYWNwaS8KIAogQU1EIElPTU1VCiBNOglTdXJhdmVlIFN1dGhpa3VscGFu
aXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgorUjoJQnJpYW4gV29vZHMgPGJyaWFu
Lndvb2RzQGFtZC5jb20+CiBTOglNYWludGFpbmVkCiBGOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvCiAKIEFNRCBTVk0KIE06CUJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CiBNOglTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5p
dEBhbWQuY29tPgorUjoJQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+CiBTOglTdXBw
b3J0ZWQKIEY6CXhlbi9hcmNoL3g4Ni9odm0vc3ZtLwogRjoJeGVuL2FyY2gveDg2L2NwdS92cG11
X2FtZC5jCi0tIAoyLjEzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
