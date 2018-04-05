From: Marcello Seri <marcello.seri@citrix.com>
Subject: [PATCH 0/1] Reduce copies between ocaml Strings and
 Bytes
Date: Thu,  5 Apr 2018 11:40:20 +0100
Message-ID: <20180405104021.10239-1-marcello.seri@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+yui=g2=callisto.uk.xensource.com=mseri@srs-us1.protection.inumbo.net>)
 id 1f42Yh-0004F2-6G
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 10:55:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Marcello Seri <marcello.seri@citrix.com>, christian.lindig@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhlIHBvcnQgb2YgdGhlIG9jYW1sIGxpYnJhcmllcyB0byB0aGUgbmV3IHNhZmUtc3RyaW5nIGlu
dGVyZmFjZQppbnRyb2R1Y2VkIHNvbWUgdW5uZWNlc3NhcnkgY29waWVzIGJldHdlZW4gb2NhbWwg
c3RyaW5ncyBhbmQgYnl0ZXMuIFRoZQpieXRlcyBtb2R1bGUgcHJvdmlkZXMgdW5zYWZlIGNvbnZl
cnNpb24gZnVuY3Rpb25zIHRoYXQgYXZvaWQgdGhlIGNvcGllcwphbmQgYXJlIHNhZmUgdG8gdXNl
IHdoZW4gdGhlIGJ5dGVzIGFyZSB1c2VkIGltbXV0YWJseSAoYXMgaW4gVW5peC53cml0ZQpjYWxs
cykgb3Igd2hlbiB0aGUgb3duZXJzaGlwIG9mIHRoZSBieXRlcyBpcyBjbGVhci4gRm9yIHJlZmVy
ZW5jZSBzZWUKaHR0cHM6Ly9jYW1sLmlucmlhLmZyL3B1Yi9kb2NzL21hbnVhbC1vY2FtbC9saWJy
ZWYvQnl0ZXMuaHRtbCMzX1Vuc2FmZWNvbnZlcnNpb25zZm9yYWR2YW5jZWR1c2VycwoKVGhpcyBw
YXRjaCByZXBsYWNlcyB0aGUgY29udmVyc2lvbiBmdW5jdGlvbnMgd2l0aCB1bnNhZmUgY29udmVy
c2lvbnMKd2hlbiBwb3NzaWJsZS4KCk1hcmNlbGxvIFNlcmkgKDEpOgogIHRvb2xzOiByZWR1Y2Ug
Y29waWVzIGIvdyBvY2FtbCBTdHJpbmdzIGFuZCBCeXRlcwoKIHRvb2xzL29jYW1sL2xpYnMveGIv
eGIubWwgICAgICAgIHwgNCArKystCiB0b29scy9vY2FtbC94ZW5zdG9yZWQvbG9nZ2luZy5tbCB8
IDggKysrKystLS0KIHRvb2xzL29jYW1sL3hlbnN0b3JlZC9zdGRleHQubWwgIHwgMiArLQogdG9v
bHMvb2NhbWwveGVuc3RvcmVkL3V0aWxzLm1sICAgfCA2ICsrKy0tLQogNCBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKLS0gCjIuMTQuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
