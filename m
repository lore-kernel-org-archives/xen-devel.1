From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 12/74] xen/acpi: mark the PM timer FADT
	field as optional
Date: Thu, 4 Jan 2018 13:05:23 +0000
Message-ID: <20180104130625.28605-13-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5a1-0004qP-Dl
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:29:09 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFjY29yZGluZyB0
byB0aGUgQUNQSSA2LjEgc3BlY2lmaWNhdGlvbiB0aGlzIGZpZWxkIGlzIG9wdGlvbmFsLCBzbwpt
YXJrIGl0IGFzIHN1Y2guCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vZHJpdmVycy9hY3BpL3RhYmxlcy90YmZhZHQuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL2FjcGkvdGFibGVzL3RiZmFkdC5jIGIveGVuL2RyaXZlcnMvYWNw
aS90YWJsZXMvdGJmYWR0LmMKaW5kZXggZDYyZDhkNWNiOS4uZTg0YTcyNmRmZSAxMDA2NDQKLS0t
IGEveGVuL2RyaXZlcnMvYWNwaS90YWJsZXMvdGJmYWR0LmMKKysrIGIveGVuL2RyaXZlcnMvYWNw
aS90YWJsZXMvdGJmYWR0LmMKQEAgLTk1LDcgKzk1LDcgQEAgc3RhdGljIHN0cnVjdCBhY3BpX2Zh
ZHRfaW5mbyBfX2luaXRkYXRhIGZhZHRfaW5mb190YWJsZVtdID0gewogCiAJeyJQbVRpbWVyQmxv
Y2siLCBBQ1BJX0ZBRFRfT0ZGU0VUKHhwbV90aW1lcl9ibG9jayksCiAJIEFDUElfRkFEVF9PRkZT
RVQocG1fdGltZXJfYmxvY2spLAotCSBBQ1BJX0ZBRFRfT0ZGU0VUKHBtX3RpbWVyX2xlbmd0aCks
IEFDUElfRkFEVF9SRVFVSVJFRH0sCisJIEFDUElfRkFEVF9PRkZTRVQocG1fdGltZXJfbGVuZ3Ro
KSwgQUNQSV9GQURUX09QVElPTkFMfSwKIAogCXsiR3BlMEJsb2NrIiwgQUNQSV9GQURUX09GRlNF
VCh4Z3BlMF9ibG9jayksCiAJIEFDUElfRkFEVF9PRkZTRVQoZ3BlMF9ibG9jayksCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
