From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/2] arm: improve platforms kconfig,
 was: add one kconfig option per platform
Date: Mon, 24 Sep 2018 15:54:51 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1809241554040.15006@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvfx=mg=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1g4Zkn-00041j-4E
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 22:54:57 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: julien.grall@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhpcyBwYXRjaCBzZXJpZXMgaW1wcm92ZXMgdGhlIGtjb25maWcgYW5kIE1ha2Vm
aWxlIG9mIHRoZSBwbGF0Zm9ybXMKdW5kZXIgcGxhdGZvcm1zLy4gTW9zdCBwYXRjaGVzIGhhdmUg
YmVlbiByZW1vdmVkIGNvbXBhcmVkIHRvIHByZXZpb3VzCnZlcnNpb25zIG9mIHRoZSBzZXJpZXMu
CgpDaGVlcnMsCgpTdGVmYW5vCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBi
MjhjZDIxYzM2Mjg4YTAxYWU2MWVkNGY1NTc4MDJhYmM4ZWUwM2U0OgoKICB4ODYvYnVpbGQ6IFVz
ZSBuZXcgLm5vcHMgZGlyZWN0aXZlIHdoZW4gYXZhaWxhYmxlICgyMDE4LTA4LTI4IDE5OjAxOjEx
ICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHA6
Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3Blb3BsZS9zc3RhYmVsbGluaS94ZW4t
dW5zdGFibGUuZ2l0IGtjb25maWctcGxhdC0zCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gZTA5ZGYyOWQ4ZThiNTQ4ZTZkYjhjODI1MTMyMmIxNmJhZWQ0YTYyMToKCiAgeGVuL2FybTog
aW50cm9kdWNlIE5PX1BMQVQgKDIwMTgtMDgtMzAgMTE6MDE6MDAgLTA3MDApCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0
ZWZhbm8gU3RhYmVsbGluaSAoMik6CiAgICAgIHhlbi9hcm06IG1ha2UgcGxhdGZvcm0gc3BlY2lm
aWMgY29kZSBkZXBlbmRlbnQgb24gQUxMMzJfUExBVCBvciBBTEw2NF9QTEFUCiAgICAgIHhlbi9h
cm06IGludHJvZHVjZSBOT19QTEFUCgogeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICB8
ICA0ICsrKy0KIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZyAgfCAgNSArKysrKwogeGVu
L2FyY2gvYXJtL3BsYXRmb3Jtcy9NYWtlZmlsZSB8IDIwICsrKysrKysrKystLS0tLS0tLS0tCiAz
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
