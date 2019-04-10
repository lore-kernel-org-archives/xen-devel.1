From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 46/62] Debian: set
 partman-lvm/device_remove_lvm_span
Date: Wed, 10 Apr 2019 15:23:52 +0100
Message-ID: <20190410142408.22848-47-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAc-00078x-Gk
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:46 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2ViIHNlYXJjaGluZ1sxXSBzdWdnZXN0cyB0aGF0IHRoaXMgc3VwcHJlc3NlcyB0aGlzIGVycm9y
OgoKICAhISBFUlJPUjogVW5hYmxlIHRvIGF1dG9tYXRpY2FsbHkgcmVtb3ZlIExWTSBkYXRhCiAg
QmVjYXVzZSB0aGUgdm9sdW1lIGdyb3VwKHMpIG9uIHRoZSBzZWxlY3RlZCBkZXZpY2UgYWxzbyBj
b25zaXN0IG9mCiAgcGh5c2ljYWwgdm9sdW1lcyBvbiBvdGhlciBkZXZpY2VzLCBpdCBpcyBub3Qg
Y29uc2lkZXJlZCBzYWZlIHRvCiAgcmVtb3ZlIGl0cyBMVk0gZGF0YSBhdXRvbWF0aWNhbGx5LiBJ
ZiB5b3Ugd2lzaCB0byB1c2UgdGhpcyBkZXZpY2UKICBmb3IgcGFydGl0aW9uaW5nLCBwbGVhc2Ug
cmVtb3ZlIGl0cyBMVk0gZGF0YSBmaXJzdC4KClsxXSBlZyBodHRwczovL3NlcnZlcmZhdWx0LmNv
bS9xdWVzdGlvbnMvNTcxMzYzL3VuYWJsZS10by1hdXRvbWF0aWNhbGx5LXJlbW92ZS1sdm0tZGF0
YQoKSXQgZG9lc24ndCwgdGhvdWdoLiAgSSBhbSBvbmx5IGV4cGVyaWVuY2luZyBpdCBub3cgYmVj
YXVzZSB0aGUgYWQtaG9jCmRpc2stZXJhc2luZyAoMjVlcmFzZS1vdGhlci1kaXNrcykgaXMgYnJv
a2VuIGZvciBvdGhlciByZWFzb25zLiAgQnV0CmxldCdzIGhhdmUgaXQgYW55d2F5IGFzIGl0IHNv
dW5kcyBsaWtlIGEgdGhpbmcgd2UgbWlnaHQgd2FudC4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0
L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4IDlkZWMzMjFmLi4wNzNiNzc2YyAx
MDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAg
LTkwNyw2ICs5MDcsNyBAQCBkLWkgcGFydG1hbi1wYXJ0aXRpb25pbmcvY29uZmlybV93cml0ZV9u
ZXdfbGFiZWwgYm9vbGVhbiB0cnVlCiBkLWkgcGFydG1hbi9jaG9vc2VfcGFydGl0aW9uIHNlbGVj
dCBmaW5pc2gKIGQtaSBwYXJ0bWFuL2NvbmZpcm0gYm9vbGVhbiB0cnVlCiBkLWkgcGFydG1hbi1s
dm0vY29uZmlybSBib29sZWFuIHRydWUKK2QtaSBwYXJ0bWFuLWx2bS9kZXZpY2VfcmVtb3ZlX2x2
bV9zcGFuIGJvb2xlYW4gdHJ1ZQogCiBkLWkgcGFydG1hbi9jb25maXJtX25vb3ZlcndyaXRlIHRy
dWUKIGQtaSBwYXJ0bWFuLWx2bS9jb25maXJtX25vb3ZlcndyaXRlIHRydWUKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
