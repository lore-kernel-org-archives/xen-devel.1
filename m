From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 1/7] xen/arm: Only set necessary
 flags when initializing HCR_EL2
Date: Mon, 28 Jan 2019 11:50:20 +0000
Message-ID: <20190128115026.3336-2-julien.grall@arm.com>
References: <20190128115026.3336-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CKwR=QE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1go5Qw-00034O-GN
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 11:50:34 +0000
In-Reply-To: <20190128115026.3336-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

T25seSB7QSxGLEl9TU8gYXJlIG5lY2Vzc2FyeSB0byByZWNlaXZlIGludGVycnVwdHMgdW50aWwg
YSBndWVzdCB2Q1BVIGlzCmxvYWRlZC4KClRoZSByZXN0IGhhdmUgbm8gZWZmZWN0IG9uIFhlbiBh
bmQgaXQgaXMgYmV0dGVyIHRvIGF2b2lkIHNldHRpbmcgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+ClJldmlld2VkLWJ5OiBBbmRyaWkgQW5p
c292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAg
ICAgIC0gRml4IHR5cG8KICAgICAgICAtIEFkZCBBbmRyaWkncyBhbmQgU3RlZmFubydzIHJldmll
d2VkLWJ5Ci0tLQogeGVuL2FyY2gvYXJtL3RyYXBzLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKaW5kZXggMjIxYzc2MmFkYS4u
NjRhNzhkODNhNSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKKysrIGIveGVuL2Fy
Y2gvYXJtL3RyYXBzLmMKQEAgLTE1Nyw4ICsxNTcsMTIgQEAgdm9pZCBpbml0X3RyYXBzKHZvaWQp
CiAgICAgV1JJVEVfU1lTUkVHKChIQ1BUUl9DUF9NQVNLICYgfihIQ1BUUl9DUCgxMCkgfCBIQ1BU
Ul9DUCgxMSkpKSB8IEhDUFRSX1RUQSwKICAgICAgICAgICAgICAgICAgQ1BUUl9FTDIpOwogCi0g
ICAgLyogU2V0dXAgaHlwZXJ2aXNvciB0cmFwcyAqLwotICAgIFdSSVRFX1NZU1JFRyhnZXRfZGVm
YXVsdF9oY3JfZmxhZ3MoKSwgSENSX0VMMik7CisgICAgLyoKKyAgICAgKiBDb25maWd1cmUgSENS
X0VMMiB3aXRoIHRoZSBiYXJlIG1pbmltdW0gdG8gcnVuIFhlbiB1bnRpbCBhIGd1ZXN0CisgICAg
ICogaXMgc2NoZWR1bGVkLiB7QSxJLEZ9TU8gYml0cyBhcmUgc2V0IHRvIGFsbG93IEVMMiByZWNl
aXZpbmcKKyAgICAgKiBpbnRlcnJ1cHRzLgorICAgICAqLworICAgIFdSSVRFX1NZU1JFRyhIQ1Jf
QU1PIHwgSENSX0ZNTyB8IEhDUl9JTU8sIEhDUl9FTDIpOwogICAgIGlzYigpOwogfQogCi0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
