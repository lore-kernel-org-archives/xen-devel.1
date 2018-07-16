From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 0/2] EFI build improvements
Date: Mon, 16 Jul 2018 16:07:22 +0200
Message-ID: <20180716140724.44509-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ekp1=ka=citrix.com=prvs=7282efde9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ff49y-0002x3-57
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:07:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHBhdGNoZXMgc3RhcnRlZCBhcyBhIHdvcmthcm91bmQgdG8g
YnVpbGQgWGVuIHVzaW5nIGxsZAoodGhlIExMVk0gbGlua2VyKSwgYnV0IG5vdyBwYXRjaCAjMiBp
cyBhbiBpbXByb3ZlbWVudCBvZiB0aGUgYnVpbGQKc3lzdGVtLCB0aHVzIGFsbG93aW5nIHRvIGNy
ZWF0ZSBhIG11bHRpYm9vdDIgY2FwYWJsZSBFTEYgYmluYXJ5CnJlcXVpcmluZyBqdXN0IGEgY29t
cGlsZXIgdGhhdCBzdXBwb3J0cyB0aGUgTVMgQUJJLiBQcmV2aW91c2x5IGluIG9yZGVyCnRvIGJ1
aWxkIGEgbXVsdGlib290MiBjYXBhYmxlIEVMRiBiaW5hcnkgbGlua2VyIFBFIHN1cHBvcnQgd2Fz
IGFsc28KcmVxdWlyZWQuCgpUaGFua3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICgyKToKICB4
ODYvZWZpOiBtb3ZlIHRoZSBsb2dpYyB0byBkZXRlY3QgUEUgYnVpbGQgc3VwcG9ydAogIHg4Ni9l
Zmk6IHNwbGl0IGNvbXBpbGVyIHZzIGxpbmtlciBzdXBwb3J0CgogLmdpdGlnbm9yZSAgICAgICAg
ICAgICAgICB8ICAxIC0KIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgfCAxMiArKysrKysrKysr
LS0KIHhlbi9hcmNoL3g4Ni9lZmkvTWFrZWZpbGUgfCAxMSArKystLS0tLS0tLQogeGVuL2FyY2gv
eDg2L3hlbi5sZHMuUyAgICB8ICA0ICsrKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
