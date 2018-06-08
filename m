From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/2] VT-d: make dom0-strict work with buggy
 firmware
Date: Fri, 8 Jun 2018 16:30:28 +0100
Message-ID: <20180608153030.3227-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wccx=i2=citrix.com=prvs=690595dd8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fRJLX-0003tW-9Q
 for xen-devel@lists.xenproject.org; Fri, 08 Jun 2018 15:30:35 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBkb20wLXN0cmljdCBtb2RlIGlzIGVuYWJsZWQgdGhlIGlvbW11X2luY2x1c2l2ZV9tYXBw
aW5nIHdvcmthcm91bmQKZm9yIGZpcm13YXJlIHdpdGggdW5kZWNsYXJlZCBSTVJScyBpcyByZW5k
ZXJlZCB1c2VsZXNzLiBUaGlzIHNlcmllcyBmaXhlcwp0aGUgcHJvYmxlbS4KClBhdWwgRHVycmFu
dCAoMik6CiAgVlQtZDogcmUtcGhyYXNlIGxvZ2ljIGluIHZ0ZF9zZXRfaHdkb21fbWFwcGluZygp
IGZvciBjbGFyaXR5CiAgVlQtZDogcmVjb25jaWxlIGlvbW11X2luY2x1c2l2ZV9tYXBwaW5nIGFu
ZCBpb21tdT1kb20wLXN0cmljdAoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3du
ICAgfCAgNiArKysrLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgICAgICAgfCAg
MiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICB8ICAyICstCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L3Z0ZC5jIHwgMzQgKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAgICB8
ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
