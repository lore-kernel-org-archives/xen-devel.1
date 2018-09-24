From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 6/6] RFC: tools/dm_restrict: Enable QEMU
 sandboxing
Date: Mon, 24 Sep 2018 12:16:34 +0100
Message-ID: <e8886878-a7d8-3cc5-3396-69215716fe78@citrix.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-6-george.dunlap@citrix.com>
 <23464.49451.531992.450514@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0lp=mg=citrix.com=prvs=798996f71=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g4Or0-0006ly-GP
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 11:16:38 +0000
In-Reply-To: <23464.49451.531992.450514@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMjQvMjAxOCAxMTo0OSBBTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJbUEFUQ0ggdjIgNi82XSBSRkM6IHRvb2xzL2RtX3Jlc3RyaWN0OiBFbmFibGUg
UUVNVSBzYW5kYm94aW5nIik6Cj4+IFFFTVUgaGFzIGEgYHNhbmRib3hgIGZlYXR1cmUsIHdoZXJl
aW4gaXQgd2lsbCB1c2Ugc2VjY29tcDIgdG8gcmVzdHJpY3QKPj4gd2hhdCBzeXN0ZW0gY2FsbHMg
aXQgaXMgYWJsZSB0byBtYWtlLgo+IC4uLgo+PiArICAgICAgICBmbGV4YXJyYXlfYXBwZW5kKGRt
X2FyZ3MsICJvbixvYnNvbGV0ZT1kZW55LGVsZXZhdGVwcml2aWxlZ2VzPWFsbG93LHNwYXduPWRl
bnkscmVzb3VyY2Vjb250cm9sPWRlbnkiKTsKPiAKPiBXaHkgYGVsZXZhdGVwcml2aWxlZ2VzPWFs
bG93JyA/CgpGcm9tIHFlbXUtZGVwcml2Lm1kOgoKYGVsZXZhdGVwcml2aWxlZ2VzYCBpcyBjdXJy
ZW50bHkgcmVxdWlyZWQgdG8gYWxsb3cgYC1ydW5hc2AgdG8gd29yay4KUmVtb3ZpbmcgdGhpcyBy
ZXF1aXJlbWVudCB3b3VsZCBtZWFuIG1ha2luZyBzdXJlIHRoYXQgdGhlIHVpZCBjaGFuZ2UKaGFw
cGVuZWQgYmVmb3JlIHRoZSBzZWNjb21wMiBjYWxsLCBwZXJoYXBzIGJ5IGNoYW5naW5nIHRoZSB1
aWQgYmVmb3JlCmV4ZWN1dGluZyBRRU1VLiAgKEJ1dCB0aGlzIHdvdWxkIHRoZW4gcmVxdWlyZSBv
dGhlciBjaGFuZ2VzIHRvIGNyZWF0ZQp0aGUgUU1QIHNvY2tldCwgVk5DIHNvY2tldCwgYW5kIHNv
IG9uKS4KClNob3VsZCBJIEMmUCB0aGlzIGludG8gYSBjb21tZW50IGhlcmU/Cgo+IEluIHRoaXMg
c3ludGF4LCB3aGF0IGhhcHBlbnMgd2l0aCB1bm1lbnRpb25lZCBhYmlsaXRpZXMgPwoKR29vZCBx
dWVzdGlvbiAtLSB0aGUgLWhlbHAgZG9lc24ndCBzZWVtIHRvIHNheS4gIExvb2tpbmcgYXQgdGhl
IGNvZGUKKHFlbXUtc2VjY29tcC5jOnBhcnNlX3NhbmRib3goKSkgZm9yIHRob3NlIHdobyB3YW50
IHRvIGZvbGxvdyBhbG9uZyBhdApob21lKSwgaXQgc2VlbXMgZGlmZmVyZW50IG9wdGlvbnMgaGF2
ZSBkaWZmZXJlbnQgZGVmYXVsdCB2YWx1ZXMgKHdoaWNoCmFyZSBub3QgbWVudGlvbmVkKSAtLSBv
YnNvbGV0ZSBpcyBkZWZhdWx0IGRlbnksIGJ1dCBzcGF3biwKZWxldmF0ZXByaXZpbGVnZXMsIGFu
ZCByZXNvdXJjc2Vjb250cm9sIGFyZSBkZWZhdWx0IGFsbG93LgoKIC1HZW9yZ2UKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
