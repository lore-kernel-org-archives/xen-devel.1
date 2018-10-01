From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 4/4] x86: support "pv-l1tf=default"
Date: Mon, 01 Oct 2018 06:11:00 -0600
Message-ID: <5BB20ED402000078001ED37F@prv1-mh.provo.novell.com>
References: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ngkg=mn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g6x2Z-0005Yf-9y
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 12:11:07 +0000
In-Reply-To: <5BB20CE602000078001ED341@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVzdCBsaWtlIHRoZSBvdGhlcndpc2Ugc2ltaWxhciAieHB0aT0iIGFsbG93cyBmb3IsIHRvIHJl
dmVydCBiYWNrIHRvCmJ1aWx0LWluIGRlZmF1bHRzLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IFNwbGl0IG91dCBpbnRvIHNlcGFyYXRlIHBh
dGNoLgoKLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KKysrIGIvZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24KQEAgLTE2MDQsNyArMTYwNCw3IEBAIGNl
cnRhaW4geW91IGRvbid0IHBsYW4gb24gaGF2aW5nIFBWIGd1ZXMKIHR1cm5pbmcgaXQgb2ZmIGNh
biByZWR1Y2UgdGhlIGF0dGFjayBzdXJmYWNlLgogCiAjIyMgcHYtbDF0ZiAoeDg2KQotPiBgPSBM
aXN0IG9mIFsgPGJvb2w+LCBkb20wPTxib29sPiwgZG9tdT08Ym9vbD4gXWAKKz4gYD0gTGlzdCBv
ZiBbIGRlZmF1bHQsIDxib29sPiwgZG9tMD08Ym9vbD4sIGRvbXU9PGJvb2w+IF1gCiAKID4gRGVm
YXVsdDogYGZhbHNlYCBvbiBiZWxpZXZlZC11bmFmZmVjdGVkIGhhcmR3YXJlLCBvciBpbiBwdi1z
aGltIG1vZGUuCiA+ICAgICAgICAgIGBkb211YCAgb24gYmVsaWV2ZWQtYWZmZWN0ZWQgaGFyZHdh
cmUuCi0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYworKysgYi94ZW4vYXJjaC94ODYvc3Bl
Y19jdHJsLmMKQEAgLTI1Miw3ICsyNTIsOSBAQCBzdGF0aWMgX19pbml0IGludCBwYXJzZV9wdl9s
MXRmKGNvbnN0IGNoCiAgICAgICAgICAgICBicmVhazsKIAogICAgICAgICBkZWZhdWx0OgotICAg
ICAgICAgICAgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigiZG9tMCIsIHMsIHNzKSkgPj0gMCAp
CisgICAgICAgICAgICBpZiAoICFzdHJjbXAocywgImRlZmF1bHQiKSApCisgICAgICAgICAgICAg
ICAgb3B0X3B2X2wxdGZfaHdkb20gPSBvcHRfcHZfbDF0Zl9kb211ID0gLTE7CisgICAgICAgICAg
ICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImRvbTAiLCBzLCBzcykpID49IDAgKQog
ICAgICAgICAgICAgICAgIG9wdF9wdl9sMXRmX2h3ZG9tID0gdmFsOwogICAgICAgICAgICAgZWxz
ZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb211Iiwgcywgc3MpKSA+PSAwICkKICAgICAg
ICAgICAgICAgICBvcHRfcHZfbDF0Zl9kb211ID0gdmFsOwoKCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
