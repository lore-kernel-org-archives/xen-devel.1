From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 2/5] drivers/video: drop unused limits
Date: Mon,  6 May 2019 16:50:18 +0200
Message-ID: <dc79bf966c2079b42d62483b5a5e985ef5a36e50.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9U-0004LI-Cm
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:36 +0000
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

TUFYX0JQUCwgTUFYX0ZPTlRfVywgTUFYX0ZPTlRfSCBhcmUgbm90IHVzZWQgaW4gdGhlIGNvZGUg
YXQgYWxsLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIHhlbi9kcml2ZXJzL3ZpZGVvL2xmYi5j
IHwgMyAtLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3ZpZGVvL2xmYi5jIGIveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMKaW5kZXggZDBj
OGM0OS4uMDQ3NWE2OCAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMKKysrIGIv
eGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMKQEAgLTEyLDkgKzEyLDYgQEAKIAogI2RlZmluZSBNQVhf
WFJFUyAxOTAwCiAjZGVmaW5lIE1BWF9ZUkVTIDEyMDAKLSNkZWZpbmUgTUFYX0JQUCA0Ci0jZGVm
aW5lIE1BWF9GT05UX1cgOAotI2RlZmluZSBNQVhfRk9OVF9IIDE2CiAKIHN0cnVjdCBsZmJfc3Rh
dHVzIHsKICAgICBzdHJ1Y3QgbGZiX3Byb3AgbGZicDsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
