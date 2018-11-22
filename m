From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Thu, 22 Nov 2018 17:07:15 +0000
Message-ID: <20181122170715.GI30658__26228.8297563375$1542906392$gmane$org@n2100.armlinux.org.uk>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz9y=ob=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1gPsS9-0000To-Fh
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 17:07:46 +0000
Content-Disposition: inline
In-Reply-To: <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, joro@8bytes.org, the arch/x86 maintainers <x86@kernel.org>, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDg6NTA6NDdBTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gVGh1LCBOb3YgMjIsIDIwMTggYXQgNjowMyBBTSBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPgo+ID4gVGhlIDAgcmV0dXJuIGRvZXNuJ3Qgd29yayBm
b3IgZGlyZWN0IG1hcHBpbmdzIHRoYXQgaGF2ZSByYW0gYXQgYWRkcmVzcwo+ID4gemVybyBhbmQg
YSBsb3Qgb2YgSU9NTVVzIHRoYXQgc3RhcnQgYWxsb2NhdGluZyBidXMgc3BhY2UgZnJvbSBhZGRy
ZXNzCj4gPiB6ZXJvLCBzbyB3ZSBjYW4ndCBjb25zb2xpZGF0ZSBvbiB0aGF0LCBidXQgSSB0aGlu
ayB3ZSBjYW4gbW92ZSBldmVyeW9uZQo+ID4gdG8gYWxsLUZzLCB3aGljaCB0aGUgcGF0Y2ggaGVy
ZSBkb2VzLgo+IAo+IEhtbS4gTWF5YmUgbm90IGxpbWl0IGl0IHRvIGp1c3QgYWxsIG9uZXMsIGJ1
dCBhY3R1YWxseSB1c2UgdGhlCj4gKHN0YW5kYXJkLCBmb3IgdGhlIGtlcm5lbCkgSVNfRVJSX1ZB
TFVFKCk/Cj4gCj4gVGhhdCBiYXNpY2FsbHkgcmVzZXJ2ZXMgdGhlIGxhc3QgNDA5NSB2YWx1ZXMg
aW4gYW4gdW5zaWduZWQgbG9uZyBmb3IKPiBlcnJvciB2YWx1ZXMuCj4gCj4gVGhlbiB0aG9zZSBm
dW5jdGlvbnMgY291bGQgYWN0dWFsbHkgcmV0dXJuICp3aGF0KiBlcnJvciB0aGV5Cj4gZW5jb3Vu
dGVyZWQsIHVzaW5nIGp1c3QgcGxhaW4KPiAKPiAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+IAo+
IG9yIHdoYXRldmVyPwoKTGludXMsCgpJJ20gYWZyYWlkIHRoYXQgd29uJ3Qgd29yayB2ZXJ5IHdl
bGwgLSAzMiBiaXQgcGxhdGZvcm1zIHdpdGggNjQtYml0CmFkZHJlc3NlcyAoTFBBRSkgd291bGQg
aGF2ZSBkbWFfYWRkcl90IGFzIGEgNjQtYml0IHZhbHVlLCB3aGljaAp3b3VsZG4ndCBmaXQgaW50
byBhbiB1bnNpZ25lZCBsb25nLgoKSVNfRVJSX1ZBTFVFKCkgd291bGQgY2FzdCBhIDY0LWJpdCBE
TUEgYWRkcmVzcyBkb3duIHRvIGEgMzItYml0CnBvaW50ZXIgKGVmZmVjdGl2ZWx5IG1hc2tpbmcg
d2l0aCAweGZmZmZmZmZmKS4gIEl0IHdvdWxkIGhhdmUgdGhlCmVmZmVjdCBvZiBtYWtpbmcgKGVn
KSAweFhYWFhYWFhYX2ZmZmZmVlZWIGFuIGVycm9yLCB3aGVyZSBYWFhYWFhYWAphcmUgYW55IG9m
IHRoZSB0b3AgMzItYml0cyBvZiBhIDY0LWJpdCBidXMgYWRkcmVzcywgYW5kIFZWViBpcyB0aGUK
ZXJyb3IgY29kZSB2YWx1ZS4KClRoYXQgY291bGQgYmUgYSBwcm9ibGVtIGlmIHlvdSBoaXQgaXQg
aW4gc2V2ZXJhbCBwbGFjZXMgdGhyb3VnaG91dAp5b3VyIGF2YWlsYWJsZSBSQU0uLi4gd2UnZCBo
YXZlIHRvIG1hcmsgZXZlcnkgdG9wIHBhZ2Ugb2YgUkFNIGluCmEgbmF0dXJhbGx5IGFsaWduZWQg
NEdCIGFzIHVudXNhYmxlLCBhcyB3ZWxsIGFzIGJsb2NrIHRoZSB0b3AgcGFnZQppbiBuYXR1YWxs
eSBhbGlnbmVkIDRHQiBibG9ja3MgZnJvbSBJT01NVXMuLi4gYW5kIHRoZW4gd2hhdCBhYm91dApi
dXNlcyB0aGF0IGhhdmUgd2VpcmQgb2Zmc2V0cy4uLgoKU28sIEkgZG9uJ3QgdGhpbmsgdGhlIElT
X0VSUl9WQUxVRSgpIHdvdWxkIHdvcmsgdmVyeSB3ZWxsLgoKLS0gClJNSydzIFBhdGNoIHN5c3Rl
bTogaHR0cDovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMgYnJv
YWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMgZG93
biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3duIDUw
MGticHMgdXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
