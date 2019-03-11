From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v4 8/8] README: remove requirement on Python 2
Date: Mon, 11 Mar 2019 18:01:37 +0000
Message-ID: <20190311180137.7805-9-wei.liu2@citrix.com>
References: <20190311180137.7805-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZGF3=RO=citrix.com=prvs=966959e1a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h3PFJ-0000aE-Sm
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 18:01:53 +0000
In-Reply-To: <20190311180137.7805-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm93IHRoYXQgYWxsIHB5dGhvbiBzY3JpcHRzIGFyZSBjb21wYXRpYmxlIHdpdGggUHl0aG9uIDIu
NiBhbmQgYWJvdmUsCnJlbW92ZSB0aGUgcmVzdHJpY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIFJFQURNRSB8IDEwICsrLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvUkVBRE1FIGIvUkVBRE1FCmluZGV4IDkyM2M4ZmRkZjkuLjY1MDRhN2YxOWMgMTAwNjQ0Ci0t
LSBhL1JFQURNRQorKysgYi9SRUFETUUKQEAgLTQ2LDcgKzQ2LDcgQEAgcHJvdmlkZWQgYnkgeW91
ciBPUyBkaXN0cmlidXRvcjoKICAgICAgICAgLSBHQ0MgNC44IG9yIGxhdGVyCiAgICAgICAgIC0g
R05VIEJpbnV0aWxzIDIuMjQgb3IgbGF0ZXIKICAgICAqIERldmVsb3BtZW50IGluc3RhbGwgb2Yg
emxpYiAoZS5nLiwgemxpYi1kZXYpCi0gICAgKiBEZXZlbG9wbWVudCBpbnN0YWxsIG9mIFB5dGhv
biAyLCB2Mi42IG9yIGxhdGVyIChlLmcuLCBweXRob24tZGV2KQorICAgICogRGV2ZWxvcG1lbnQg
aW5zdGFsbCBvZiBQeXRob24gMi42IG9yIGxhdGVyIChlLmcuLCBweXRob24tZGV2KQogICAgICog
RGV2ZWxvcG1lbnQgaW5zdGFsbCBvZiBjdXJzZXMgKGUuZy4sIGxpYm5jdXJzZXMtZGV2KQogICAg
ICogRGV2ZWxvcG1lbnQgaW5zdGFsbCBvZiBvcGVuc3NsIChlLmcuLCBvcGVuc3NsLWRldikKICAg
ICAqIERldmVsb3BtZW50IGluc3RhbGwgb2YgeDExIChlLmcuIHhvcmcteDExLWRldikKQEAgLTE3
NywxNiArMTc3LDEwIEBAIFB5dGhvbiBSdW50aW1lIExpYnJhcmllcwogCiBWYXJpb3VzIHRvb2xz
LCBzdWNoIGFzIHB5Z3J1YiwgaGF2ZSB0aGUgZm9sbG93aW5nIHJ1bnRpbWUgZGVwZW5kZW5jaWVz
OgogCi0gICAgKiBQeXRob24gMiwgdjIuNiBvciBsYXRlci4KKyAgICAqIFB5dGhvbiAyLjYgb3Ig
bGF0ZXIuCiAgICAgICAgICAgVVJMOiAgICBodHRwOi8vd3d3LnB5dGhvbi5vcmcvCiAgICAgICAg
ICAgRGViaWFuOiBweXRob24KIAotTm90ZSB0aGF0IHRoZSBidWlsZCBzeXN0ZW0gZXhwZWN0cyBg
cHl0aG9uYCB0byBiZSBweXRob24yLiAgSWYgeW91ciBzeXN0ZW0KLWhhcyBgcHl0aG9uYCBwb2lu
dGluZyB0byBweXRob24zIChhcyBpbiB0aGUgY2FzZSBvZiBBcmNoIExpbnV4IG9yIEFuYWNvbmRh
KSwKLXlvdSdsbCBuZWVkIHRvIHNwZWNpZnkgYSBwYXRoIHRvIGEgcHl0aG9uMiBiaW5hcnkgd2hl
biBydW5uaW5nIGNvbmZpZ3VyZToKLQotICAgIFBZVEhPTj0vdXNyL2Jpbi9weXRob24yIC4vY29u
ZmlndXJlCi0KIEludGVsKFIpIFRydXN0ZWQgRXhlY3V0aW9uIFRlY2hub2xvZ3kgU3VwcG9ydAog
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAKLS0gCjIuMTEu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
