From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] README: add a paragraph for specifying python
 interpreter
Date: Thu, 11 Apr 2019 11:42:14 +0100
Message-ID: <20190411104214.18828-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pqov=SN=citrix.com=prvs=997e04109=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEXAt-000597-MI
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:43:19 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgcmVwb3J0ZWQgaW4gTGludXggRnJvbSBTY3JhdGNoIHRoZXJlIGlzbid0IG5lY2Vzc2Fy
aWx5IGEKYHB5dGhvbmAuICBBZGQgYSBwYXJhZ3JhcGggdG8gdGVsbCB1c2VycyBob3cgdG8gc3Bl
Y2lmeSBhIHBhdGggdG8gYQpweXRob24gaW50ZXJwcmV0ZXIuCgpSZXBvcnRlZC1ieTogS2V2aW4g
QnVja2xleSA8a2V2aW4uYnVja2xleS5lY3MudnV3LmFjLm56QGdtYWlsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNDOiBLZXZpbiBCdWNrbGV5
IDxrZXZpbi5idWNrbGV5LmVjcy52dXcuYWMubnpAZ21haWwuY29tPgotLS0KIFJFQURNRSB8IDYg
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvUkVB
RE1FIGIvUkVBRE1FCmluZGV4IDIzZTRmN2MzZGMuLjQ3NDcxOTJhNjEgMTAwNjQ0Ci0tLSBhL1JF
QURNRQorKysgYi9SRUFETUUKQEAgLTE4MSw2ICsxODEsMTIgQEAgVmFyaW91cyB0b29scywgc3Vj
aCBhcyBweWdydWIsIGhhdmUgdGhlIGZvbGxvd2luZyBydW50aW1lIGRlcGVuZGVuY2llczoKICAg
ICAgICAgICBVUkw6ICAgIGh0dHA6Ly93d3cucHl0aG9uLm9yZy8KICAgICAgICAgICBEZWJpYW46
IHB5dGhvbgogCitOb3RlIHRoYXQgdGhlIGJ1aWxkIHN5c3RlbSBleHBlY3RzIGBweXRob25gIHRv
IGJlIGF2YWlsYWJsZS4gSWYgeW91ciBzeXN0ZW0KK29ubHkgaGFzIGBweXRob24yYCBvciBgcHl0
aG9uM2AgYnV0IG5vdCBgcHl0aG9uYCAoYXMgaW4gTGludXggRnJvbSBTY3JhdGNoKSwKK3lvdSB3
aWxsIG5lZWQgdG8gc3BlY2lmeSBhIHBhdGggdG8gYSBweXRob24gaW50ZXJwcmV0ZXIgd2hlbiBy
dW5uaW5nIGNvbmZpZ3VyZToKKworICAgIFBZVEhPTj0vcGF0aC90by9weXRob24vaW50ZXJwcmV0
ZXIgLi9jb25maWd1cmUKKwogSW50ZWwoUikgVHJ1c3RlZCBFeGVjdXRpb24gVGVjaG5vbG9neSBT
dXBwb3J0CiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
