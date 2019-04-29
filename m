From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for 4.11 2/2] xen: Fix backport of "x86/tsx:
 Implement controls for RTM force-abort mode"
Date: Mon, 29 Apr 2019 17:16:30 +0100
Message-ID: <1556554590-25358-3-git-send-email-andrew.cooper3@citrix.com>
References: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiJS=S7=citrix.com=prvs=0159f91d2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hL8xN-0004Wm-UI
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:16:41 +0000
In-Reply-To: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHBvc3RlZCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBjL3MgM2M1NTUyOTUg
Ing4Ni92cG11OiBJbXByb3ZlCmRvY3VtZW50YXRpb24gYW5kIHBhcnNpbmcgZm9yIHZwbXU9IiAo
WGVuIDQuMTIgYW5kIGxhdGVyKSB0byBwcmV2ZW50CmB2cG11PXJ0bS1hYm9ydGAgaW1wbGl5aW5n
IGB2cG11PTFgLCB3aGljaCBpcyBvdXRzaWRlIG9mIHNlY3VyaXR5IHN1cHBvcnQuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KCiB4ZW4vYXJjaC94ODYvY3B1L3ZwbXUu
YyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKaW5kZXgg
NjM5YWUwYy4uOWE0MmUwOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKKysr
IGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKQEAgLTkxLDYgKzkxLDEwIEBAIHN0YXRpYyBpbnQg
X19pbml0IHBhcnNlX3ZwbXVfcGFyYW1zKGNvbnN0IGNoYXIgKnMpCiAKICAgICAgICAgICAgIHMg
PSBzcyArIDE7CiAgICAgICAgIH0gd2hpbGUgKCAqc3MgKTsKKworICAgICAgICBpZiAoICF2cG11
X2ZlYXR1cmVzICkgLyogcnRtLWFib3J0IGRvZXNuJ3QgaW1wbHkgdnBtdT0xICovCisgICAgICAg
ICAgICBicmVhazsKKwogICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KICAgICBjYXNlIDE6CiAg
ICAgICAgIC8qIERlZmF1bHQgVlBNVSBtb2RlICovCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
