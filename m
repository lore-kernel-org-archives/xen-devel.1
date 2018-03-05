From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 0/2] Use invpcid
Date: Mon, 5 Mar 2018 09:50:30 +0000
Message-ID: <20180305095032.30062-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yt/y=f3=citrix.com=prvs=595ca3bc4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1esmlR-0006HP-JQ
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 09:50:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSAoMik6CiAgeDg2OiByZXBvcnQgaWYgUENJRCBhbmQgSU5WUENJRCBhcmUgc3VwcG9y
dGVkCiAgeDg2OiB1c2UgaW52cGNpZCB0byBkbyBnbG9iYWwgZmx1c2hpbmcKCiB4ZW4vYXJjaC94
ODYvZmx1c2h0bGIuYyB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KIHhlbi9hcmNoL3g4Ni9z
ZXR1cC5jICAgIHwgIDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
