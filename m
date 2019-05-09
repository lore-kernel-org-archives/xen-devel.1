From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 2/5] drivers/video: drop unused limits
Date: Thu,  9 May 2019 21:48:53 +0200
Message-ID: <16cf5823fc9fa65e9161dd1c7a25455cdb60f139.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2R-00066U-Ua
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:07 +0000
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
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
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgpTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgfCAzIC0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8v
bGZiLmMgYi94ZW4vZHJpdmVycy92aWRlby9sZmIuYwppbmRleCBkMGM4YzQ5Li4wNDc1YTY4IDEw
MDY0NAotLS0gYS94ZW4vZHJpdmVycy92aWRlby9sZmIuYworKysgYi94ZW4vZHJpdmVycy92aWRl
by9sZmIuYwpAQCAtMTIsOSArMTIsNiBAQAogCiAjZGVmaW5lIE1BWF9YUkVTIDE5MDAKICNkZWZp
bmUgTUFYX1lSRVMgMTIwMAotI2RlZmluZSBNQVhfQlBQIDQKLSNkZWZpbmUgTUFYX0ZPTlRfVyA4
Ci0jZGVmaW5lIE1BWF9GT05UX0ggMTYKIAogc3RydWN0IGxmYl9zdGF0dXMgewogICAgIHN0cnVj
dCBsZmJfcHJvcCBsZmJwOwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
