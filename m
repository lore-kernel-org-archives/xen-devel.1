From: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] xl: Don't warn on using 'deprecated' mode
	selection
Date: Mon, 8 Jan 2018 15:50:53 +0000
Message-ID: <20180108155053.14214-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gjyc=ed=citrix.com=prvs=5397da941=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eYZha-0006AN-IN
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 15:51:06 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgZ2VuZXJhbGx5IHN1cHBvcnQgb2xkIGNvbmZpZyBmb3JtYXRzIGluZGVmaW5pbnRlbHkgKHNl
ZSB0aGUgZGlzawpmb3JtYXQpIHdpdGhvdXQgZW1pdHRpbmcgd2FybmluZ3MuCgpTaWduZWQtb2Zm
LWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQpUaGlzIGlz
IGEgY2FuZGlkYXRlIHRvIGJhY2twb3J0IHRvIDQuMTAuCgpDQzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzog
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KLS0tCiB0b29scy94bC94bF9wYXJzZS5jIHwgMyAtLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3BhcnNl
LmMgYi90b29scy94bC94bF9wYXJzZS5jCmluZGV4IGQxOWY4NWQzN2MuLjJmMjYzY2E1YmQgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMKKysrIGIvdG9vbHMveGwveGxfcGFyc2UuYwpA
QCAtODY5LDkgKzg2OSw2IEBAIHZvaWQgcGFyc2VfY29uZmlnX2RhdGEoY29uc3QgY2hhciAqY29u
ZmlnX3NvdXJjZSwKICAgICBpZiAoIXhsdV9jZmdfZ2V0X3N0cmluZyhjb25maWcsICJidWlsZGVy
IiwgJmJ1ZiwgMCkpIHsKICAgICAgICAgbGlieGxfZG9tYWluX3R5cGUgYnVpbGRlcl90eXBlOwog
Ci0gICAgICAgIGlmIChjX2luZm8tPnR5cGUgPT0gTElCWExfRE9NQUlOX1RZUEVfSU5WQUxJRCkK
LSAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLAotIlRoZSBcImJ1aWxkZXJcIiBvcHRpb24gaXMg
YmVpbmcgZGVwcmVjYXRlZCwgcGxlYXNlIHVzZSBcInR5cGVcIiBpbnN0ZWFkLlxuIik7CiAgICAg
ICAgIGlmICghc3RybmNtcChidWYsICJodm0iLCBzdHJsZW4oYnVmKSkpCiAgICAgICAgICAgICBi
dWlsZGVyX3R5cGUgPSBMSUJYTF9ET01BSU5fVFlQRV9IVk07CiAgICAgICAgIGVsc2UgaWYgKCFz
dHJuY21wKGJ1ZiwgImdlbmVyaWMiLCBzdHJsZW4oYnVmKSkpCi0tIAoyLjE1LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
