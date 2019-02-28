From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.12] x86/altp2m: Fix build with !CONFIG_HVM
Date: Thu, 28 Feb 2019 12:51:12 +0000
Message-ID: <1551358272-666-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Yy9zIDBlYzliNGVmMzE0OCAieDg2L3ZteDogRml4IHNlY3VyaXR5IGlzc3VlIHdoZW4gYSBndWVz
dCBiYWxsb29ucyBvdXQgdGhlCmMvcyBlNzJlY2M3NjE1NDEgIng4Ni9hbHRwMm06IFJld29yayAj
VkUgZW5hYmxlL2Rpc2FibGUgcGF0aHMiIGRpZG4ndCBoYXZlIGEKc3VpdGFibGUgcHJvdG90eXBl
IGluIHRoZSAhQ09ORklHX0hWTSBjYXNlLgoKSW50cm9kdWNlIG9uZSB0byBmaXggdGhlIGJ1aWxk
LgoKU3BvdHRlZCBieSBUcmF2aXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2FsdHAybS5oIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2Fs
dHAybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hbHRwMm0uaAppbmRleCA4MTM5YmY4Li5iMjA2
ZTk1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FsdHAybS5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvYWx0cDJtLmgKQEAgLTUwLDYgKzUwLDcgQEAgc3RhdGljIGlubGluZSBi
b29sIGFsdHAybV9hY3RpdmUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKIAogLyogT25seSBkZWNs
YXJhdGlvbiBpcyBuZWVkZWQuIERDRSB3aWxsIG9wdGltaXNlIGl0IG91dCB3aGVuIGxpbmtpbmcu
ICovCiB1aW50MTZfdCBhbHRwMm1fdmNwdV9pZHgoY29uc3Qgc3RydWN0IHZjcHUgKnYpOwordm9p
ZCBhbHRwMm1fdmNwdV9kaXNhYmxlX3ZlKHN0cnVjdCB2Y3B1ICp2KTsKIAogI2VuZGlmCiAKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
