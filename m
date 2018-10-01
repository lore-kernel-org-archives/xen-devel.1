From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] ns16550/PCI: fix skipping of devices
Date: Mon, 01 Oct 2018 09:57:56 -0600
Message-ID: <5BB2440402000078001ED654@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ngkg=mn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g70aA-0002My-S1
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 15:58:02 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

U2VsZWN0aW5nIGJldHdlZW4gc2luZ2xlL211bHRpcGxlIEJBUiBtb2RlIHNob3VsZCBoYXBwZW4g
YWZ0ZXIgY2hlY2tpbmcKd2hldGhlciB0byBza2lwIHRoZSBwcmVzZW50IGRldmljZSwgb3IgZWxz
ZSBtdWx0aS1CQVIgZGV2aWNlcyB3b24ndCBiZQpza2lwcGVkIGNvcnJlY3RseSwgZHVlIHRvIHBv
cnRfaWR4IGdldHRpbmcgc2V0IHRvIHplcm8gaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9u
czE2NTUwLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKQEAgLTEwMzcsMTggKzEw
MzcsMTggQEAgcGNpX3VhcnRfY29uZmlnKHN0cnVjdCBuczE2NTUwICp1YXJ0LCBibwogICAgICAg
ICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAgfQogCi0gICAgICAgICAgICAgICAgaWYg
KCAhcGFyYW0tPmJhcjAgKQotICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAg
YmFyX2lkeCA9IGlkeDsKLSAgICAgICAgICAgICAgICAgICAgcG9ydF9pZHggPSAwOwotICAgICAg
ICAgICAgICAgIH0KLQogICAgICAgICAgICAgICAgIGlmICggcG9ydF9pZHggPj0gcGFyYW0tPm1h
eF9wb3J0cyApCiAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICBpZHggLT0g
cGFyYW0tPm1heF9wb3J0czsKICAgICAgICAgICAgICAgICAgICAgY29udGludWU7CiAgICAgICAg
ICAgICAgICAgfQogCisgICAgICAgICAgICAgICAgaWYgKCAhcGFyYW0tPmJhcjAgKQorICAgICAg
ICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgYmFyX2lkeCA9IGlkeDsKKyAgICAgICAg
ICAgICAgICAgICAgcG9ydF9pZHggPSAwOworICAgICAgICAgICAgICAgIH0KKwogICAgICAgICAg
ICAgICAgIHVhcnQtPmlvX2Jhc2UgPSAwOwogICAgICAgICAgICAgICAgIGJhciA9IHBjaV9jb25m
X3JlYWQzMigwLCBiLCBkLCBmLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQ0lfQkFTRV9BRERSRVNTXzAgKyBiYXJfaWR4KjQpOwoKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
