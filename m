From: Manish Jaggi <manish.jaggi@cavium.com>
Subject: [PATCH v2 17/17] arm64: if trapping a
 read-from-write-only GICv3 access inject undef exception in guest
Date: Tue, 27 Mar 2018 14:37:26 +0530
Message-ID: <7c8060faf7518d1684a4a85e7dd7b29b2d66709a.1522135597.git.manish.jaggi@cavium.com>
References: <cover.1522135597.git.manish.jaggi@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xxgx=gr=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1f0kbh-00071Z-9W
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 09:09:29 +0000
In-Reply-To: <cover.1522135597.git.manish.jaggi@cavium.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, marc.zyngier@arm.com, andre.przywara@arm.com
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpcyBwb3J0ZWQgdG8geGVuIGZyb20gbGludXggY29tbWl0OgplN2YxZDFlZWY0
ODIxNTBhNjRhNmU2YWQ4ZmFmNDBmOGY5N2VlZDY3CktWTTogYXJtNjQ6IExvZyBhbiBlcnJvciBp
ZiB0cmFwcGluZyBhIHJlYWQtZnJvbS13cml0ZS1vbmx5IEdJQ3YzIGFjY2VzcwoKQSByZWFkLWZy
b20td3JpdGUtb25seSBHSUN2MyBhY2Nlc3Mgc2hvdWxkIFVOREVGIGF0IEVMMS4gQnV0IHNpbmNl
CndlJ3JlIGluIGNvbXBsZXRlIHBhcmFub2lhLWxhbmQgd2l0aCBicm9rZW4gQ1BVcywgbGV0J3Mg
YXNzdW1lIHRoZQp3b3JzZSBhbmQgZ3JhY2VmdWxseSBoYW5kbGUgdGhlIGNhc2UuCgpTaWduZWQt
b2ZmLWJ5OiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBjYXZpdW0uY29tPgotLS0KIHhlbi9h
cmNoL2FybS9hcm02NC92Z2ljLXYzLXNyLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9h
cm02NC92Z2ljLXYzLXNyLmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvdmdpYy12My1zci5jCmluZGV4
IDE0Mjc2YTRjOTIuLmQ1ZGM4MTY4YzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC92
Z2ljLXYzLXNyLmMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L3ZnaWMtdjMtc3IuYwpAQCAtNjE0
LDcgKzYxNCwxMSBAQCBzdGF0aWMgdm9pZCB2Z2ljX3YzX3dyaXRlX2VvaXIoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MsCiAKIHN0YXRpYyB2b2lkIHZyZWdfZW11bGF0ZV9lb2koc3RydWN0IGNw
dV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVuaW9uIGhzciBoc3IpCiB7Ci0gICAgdmdpY192M193
cml0ZV9lb2lyKHJlZ3MsIGhzcik7CisKKyAgICBpZiAoIHVubGlrZWx5KGhzci5zeXNyZWcucmVh
ZCkgKQorICAgICAgICBpbmplY3RfdW5kZWZfZXhjZXB0aW9uKHJlZ3MsIGhzcik7CisgICAgZWxz
ZQorICAgICAgICB2Z2ljX3YzX3dyaXRlX2VvaXIocmVncywgaHNyKTsKIH0KIAogc3RhdGljIHZv
aWQgdmdpY192M19yZWFkX2FweHJuKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLAotLSAKMi4x
NC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
