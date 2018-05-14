From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH for-4.12 0/4] tools: Internal fd access, etc.
Date: Mon, 14 May 2018 18:08:55 +0100
Message-ID: <1526317739-17572-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bdup=ib=citrix.com=prvs=665fc3fee=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fIGy9-0002j6-ND
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 17:09:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSBhbSB3b3JraW5nIG9uIGF1ZGl0aW5nIHdoZXRoZXIgZGVwcnZpbGVnaW5nIHFlbXUgaGFzIGFj
dHVhbGx5CndvcmtlZC4gIFRoZSBhcHByb2FjaCBJIGhhdmUgY2hvc2VuIGlzIHRvIGZpc2ggdGhl
IGRlc2NyaXB0b3JzIG91dCBvZgpxZW11IChieSB1c2luZyBkZWJ1Z2dpbmcgZmFjaWxpdGllcyks
IGFuZCB0cnkgdG8gbWFrZSBoeXBlcmNhbGxzCmV0Yy4gdXNpbmcgdGhlbS4KClRvIHRha2UgbWFr
aW5nIGEgaHlwZXJjYWxsIGFzIGFuIGV4YW1wbGU6IHRoaXMgaXMgbm90IGVhc2lseSBkb25lCndp
dGhvdXQgbGlieGMuICBTbyBJIG5lZWQgdG8gbWFrZSBsaWJ4YyBtYWtlIGEgaHlwZXJjYWxsIHdp
dGggYQpkaWZmZXJlbnQgZmQgLSBhY3R1YWxseSwgYSBkaWZmZXJlbnQgb3Blbi1maWxlLiAgSSBk
byB0aGlzIGJ5IHVzaW5nCmR1cDIgdG8gb3ZlcndyaXRlIGxpYnhjJ3MgZmQgd2l0aCB0aGUgb25l
IHN0b2xlbiBmcm9tIHFlbXUuICBUaGF0Cm1lYW5zIEkgbmVlZCB0byBrbm93IGxpYnhjJ3MgZmQg
bnVtYmVyLiAgSGVuY2UgdGhlIG1pZGRsZSB0d28gcGF0Y2hlcwppbiB0aGlzIHNlcmllcy4KCkFs
c28sIEkgZHJvcCBzb21lIG9ic29sZXRlIGRlY2xhcmF0aW9ucyBhbmQgaW1wcm92ZSBhbiBlcnJv
ciBtZXNzYWdlLgoKSSBkb3VidCB0aGlzIGlzIDQuMTEgbWF0ZXJpYWwuICBxZW11IGRlcHJpdiBp
cyBub3QgY292ZXJlZCBieSBzdXBwb3J0CmluIDQuMTEgYW55d2F5LiAgSW4gNC4xMiBJIHdhbnQg
aXQgdG8gYmUgc3VwcG9ydGVkLCBhbmQsIHRoZXJlZm9yZSwKdGVzdGVkIGFuZCBhdWRpdGVkLiAg
SWYgaXQgYmVjb21lcyBmdWxseSBzdXBwb3J0ZWQgdGhlcmUsIGl0IG1pZ2h0IGJlCndvcnRoIGJh
Y2twb3J0aW5nIHNvbWUgb2YgdGhlc2UgcGF0Y2hlcy4KClRoYW5rcywKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
