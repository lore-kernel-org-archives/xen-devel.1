From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 16/18] xen: automatically create
 XenBlockDevice-s
Date: Fri, 7 Dec 2018 18:52:02 +0000
Message-ID: <20181207185202.GO18875__3696.40720678053$1544208653$gmane$org@perard.uk.xensource.com>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-17-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRRO=OQ=citrix.com=prvs=87219212e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gVLEO-0004Jg-3m
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 18:52:08 +0000
Content-Disposition: inline
In-Reply-To: <1544108924-10841-17-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDM6MDg6NDJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhIGNyZWF0b3IgZnVuY3Rpb24gZm9yIFhlbkJsb2NrRGV2
aWNlLXMgc28gdGhhdCB0aGV5IGNhbgo+IGJlIGNyZWF0ZWQgYXV0b21hdGljYWxseSB3aGVuIHRo
ZSBYZW4gdG9vbHN0YWNrIGluc3RhbnRpYXRlcyBhIG5ldwo+IFBWIGJhY2tlbmQuIFdoZW4gdGhl
IFhlbkJsb2NrRGV2aWNlIGlzIGNyZWF0ZWQgdGhpcyB3YXkgaXQgaXMgYWxzbwo+IG5lY2Vzc2Fy
eSB0byBjcmVhdGUgYSBkcml2ZSB3aGljaCBtYXRjaGVzIHRoZSBjb25maWd1cmF0aW9uIHRoYXQg
dGhlIFhlbgo+IHRvb2xzdGFjayBoYXMgd3JpdHRlbiBpbnRvIHhlbnN0b3JlLiBUaGlzIGRyaXZl
IGlzIG1hcmtlZCAnYXV0b19kZWwnIHNvCj4gdGhhdCBpdCB3aWxsIGJlIHJlbW92ZWQgd2hlbiB0
aGUgWGVuQmxvY2tEZXZpY2UgaXMgZGVzdHJveWVkLiBBbHNvLCBmb3IKPiBjb21wYXRpYmlsaXR5
IHdpdGggdGhlIGxlZ2FjeSAneGVuX2Rpc2snIGltcGxlbWVudGF0aW9uLCBhbiBpb3RocmVhZAo+
IGlzIGF1dG9tYXRpY2FsbHkgY3JlYXRlZCBmb3IgdGhlIG5ldyBYZW5CbG9ja0RldmljZS4gVGhp
cyB3aWxsIGFsc28gYmUKPiByZW1vdmVkIHdoZW4gdGhlIFhlbkJsb2NrRGV2aWNlIGlzIGRlc3Ry
b3llZC4KPiAKPiBDb3JyZXNwb25kaW5nbHkgdGhlIGxlZ2FjeSBiYWNrZW5kIHNjYW4gZm9yICdx
ZGlzaycgaXMgcmVtb3ZlZC4KPiAKPiBBZnRlciB0aGlzIHBhdGNoIGlzIGFwcGxpZWQgdGhlIGxl
Z2FjeSAneGVuX2Rpc2snIGNvZGUgaXMgcmVkdW5kYW50LiBJdAo+IHdpbGwgYmUgcmVtb3ZlZCBi
eSBhIHN1YnNlcXVlbnQgcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
