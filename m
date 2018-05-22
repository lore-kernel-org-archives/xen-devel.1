From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH v2 2/2] docs/process/xen-release-management:
 Lesson to learn
Date: Tue, 22 May 2018 17:45:23 +0100
Message-ID: <1527007523-23576-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1527007523-23576-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3e1g=ij=citrix.com=prvs=6736f4111=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLAPu-0005ac-1j
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 16:45:42 +0000
In-Reply-To: <1527007523-23576-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xen.org
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIDQuMTAgcmVsZWFzZSBwcmVwYXJhdGlvbiB3YXMgc2lnbmlmaWNhbnRseSBtb3JlIGhhaXJ5
IHRoYW4gaWRlYWwuCihXZSBzZWVtIHRvIGhhdmUgYSBnb29kIG92ZXJhbGwgb3V0Y29tZSBkZXNw
aXRlLCByYXRoZXIgdGhhbiBiZWNhdXNlCm9mLCBvdXIgYXBwcm9hY2guKQoKVGhpcyBpcyB0aGUg
c2Vjb25kIHRpbWUgKGF0IGxlYXN0KSB0aGF0IHdlIGhhdmUgY29tZSBjbG9zZSB0byBmYWlsdXJl
CmJ5IGNvbW1pdHRpbmcgdG8gYSByZWxlYXNlIGRhdGUgYmVmb3JlIHRoZSBleGFjdCBjb2RlIHRv
IGJlIHJlbGVhc2VkCmlzIGtub3duIGFuZCBoYXMgYmVlbiBtYWRlIGFuZCB0ZXN0ZWQuCgpFdmlk
ZW50bHkgb3VyIGRvY3MgbWFrZXMgaXQgaW5zdWZmaWNpZW50bHkgY2xlYXIgbm90IHRvIGRvIHRo
YXQuCgpDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgpDQzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNp
dHJpeC5jb20+Ci0tLQogZG9jcy9wcm9jZXNzL3hlbi1yZWxlYXNlLW1hbmFnZW1lbnQucGFuZG9j
IHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RvY3MvcHJvY2Vzcy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRvYyBiL2RvY3MvcHJvY2Vz
cy94ZW4tcmVsZWFzZS1tYW5hZ2VtZW50LnBhbmRvYwppbmRleCAyZmYwNjY1Li5lZWU1ZGNmIDEw
MDY0NAotLS0gYS9kb2NzL3Byb2Nlc3MveGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2MKKysr
IGIvZG9jcy9wcm9jZXNzL3hlbi1yZWxlYXNlLW1hbmFnZW1lbnQucGFuZG9jCkBAIC0yMTEsNiAr
MjExLDExIEBAIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0NhdGVnb3J5Olhlbl80
LjkKICAgICBBc2sgdGhlbSB0byBkcnktcnVuIHRoZWlyIGNoZWNrbGlzdCBhbmQgY29uZmlybSBl
dmVyeXRoaW5nIGlzIE9LLiBJZiBub3QsCiAgICAgYXJyYW5nZSBhbm90aGVyIFJDIGFuZCByZXN0
YXJ0IHRoaXMgY2hlY2tsaXN0LgogCis3LiBEbyBub3QgY29tbWl0IHRvIGEgcmVsZWFzZSBkYXRl
IHVudGlsCisKKyAgICAqIFRoZSBleGFjdCB4ZW4uZ2l0IGNvbW1pdCBpZCB0byBiZSByZWxlYXNl
ZCBpcyBrbm93bi4KKyAgICAqIFRoYXQgY29tbWl0IGlkIGhhcyBiZWVuIHNhdGlzZmFjdG9yaWx5
IHRlc3RlZC4KKwogNy4gR2l2ZSBQUiBQZXJzb25uZWwgZmluYWwgZ28tYWhlYWQsIGFuZCBpbnN0
cnVjdCBSZWxlYXNlIFRlY2huaWNpYW4gdG8gbWFrZQogcmVsZWFzZSBkZWxpdmVyYWJsZXMgKHRh
Z3MgYW5kIHRhcmJhbGxzIC0gd2lsbCB1c3VhbGx5IGJlIGluIHBsYWNlIHRoZSBkYXkKIGJlZm9y
ZSB0aGUgcmVsZWFzZSkuIEF0IHRoaXMgcG9pbnQsIFBSIGNvbGxhdGVyYWwgd2lsbCBiZSBzZW50
IHRvIHJlcG9ydGVycwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
