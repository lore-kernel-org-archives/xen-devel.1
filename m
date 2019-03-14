From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] add xl command to get hypervisor .config
Date: Thu, 14 Mar 2019 12:59:35 +0100
Message-ID: <20190314115937.26394-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4P1U-0003Xe-Fc
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 11:59:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

QWRkICJ4bCBnZXQtaHlwZXJ2aXNvci1jb25maWciIHByaW50aW5nIHRoZSAuY29uZmlnIHVzZWQg
dG8gYnVpbGQgdGhlCmN1cnJlbnRseSBydW5uaW5nIGh5cGVydmlzb3IuCgpKdWVyZ2VuIEdyb3Nz
ICgyKToKICB4ZW46IGFkZCBpbnRlcmZhY2UgZm9yIG9idGFpbmluZyAuY29uZmlnIGZyb20gaHlw
ZXJ2aXNvcgogIHRvb2xzOiBhZGQgbmV3IHhsIGNvbW1hbmQgZ2V0LWh5cGVydmlzb3ItY29uZmln
CgogLmdpdGlnbm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogZG9jcy9tYW4v
eGwuMS5wb2QuaW4gICAgICAgICAgICAgICAgfCAgNSArKysrKwogdG9vbHMvZmxhc2svcG9saWN5
L21vZHVsZXMvZG9tMC50ZSAgfCAgMiArLQogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmgg
ICAgICAgfCAgOCArKysrKysrCiB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmd1ZXN0LmggICAgICB8
IDEzICsrKysrKysrKysrKwogdG9vbHMvbGlieGMveGNfbWlzYy5jICAgICAgICAgICAgICAgfCA0
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4Yy94Z19w
cml2YXRlLmggICAgICAgICAgICB8ICA0IC0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsLmMgICAgICAg
ICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4
bC9saWJ4bC5oICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKysKIHRvb2xzL3hsL3hsLmggICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwogdG9vbHMveGwveGxfY21kdGFibGUuYyAgICAgICAg
ICAgICAgfCAgNSArKysrKwogdG9vbHMveGwveGxfbWlzYy5jICAgICAgICAgICAgICAgICAgfCAy
MCArKysrKysrKysrKysrKysrKysKIHhlbi9jb21tb24vTWFrZWZpbGUgICAgICAgICAgICAgICAg
IHwgIDcgKysrKysrKwogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgICAgICAgICAgfCAxNyAr
KysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCAgICAgICAgIHwgMTgg
KysrKysrKysrKysrKysrLQogeGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oICAgICAgICAgICAgfCAg
MyArKysKIHhlbi90b29scy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrLS0K
IHhlbi90b29scy9iaW4yYy5jICAgICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysr
KysrKysrKysrKwogeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgICAgICAgICAgfCAgMyArKysK
IHhlbi94c20vZmxhc2svcG9saWN5L2FjY2Vzc192ZWN0b3JzIHwgIDIgKysKIDIwIGZpbGVzIGNo
YW5nZWQsIDIyMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi90b29scy9iaW4yYy5jCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
