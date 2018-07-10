From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 1/2] MAINTAINERS: drop USB PV DRIVERS entry
Date: Tue, 10 Jul 2018 09:15:35 +0100
Message-ID: <20180710081536.25438-2-wei.liu2@citrix.com>
References: <20180710081536.25438-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9fb0=j2=citrix.com=prvs=7221156ca=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fcnoD-0001Tg-6r
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 08:15:41 +0000
In-Reply-To: <20180710081536.25438-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNj
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIE1BSU5UQUlORVJTIHwgNiAtLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNDU4MTQxOTcxMC4uZDUwYmEwYTE3YyAxMDA2NDQKLS0t
IGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTQwNywxMiArNDA3LDYgQEAgUzoJ
T2Jzb2xldGUKIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwogRjoJdW5tb2RpZmll
ZF9kcml2ZXJzL2xpbnV4LTIuNi8KIAotVVNCIFBWIERSSVZFUlMKLU06CU5vYm9ydSBJd2FtYXRz
dSA8bl9pd2FtYXRzdUBqcC5mdWppdHN1LmNvbT4KLVM6CVN1cHBvcnRlZAotVDoJaGcgaHR0cHM6
Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2hnL2xpbnV4LTIuNi4xOC14ZW4uaGcKLUY6CWRyaXZl
cnMveGVuL3VzYiovCi0KIFZNIEVWRU5ULCBNRU0gQUNDRVNTIGFuZCBNT05JVE9SCiBNOglSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CiBNOglUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
