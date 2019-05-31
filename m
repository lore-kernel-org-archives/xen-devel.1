From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
Date: Fri, 31 May 2019 18:28:44 +0100
Message-ID: <20190531182844.0cd43909@donnerap.cambridge.arm.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <ab8ec9ce-c602-fe5d-b76b-3ee096a8bf9f@gmail.com>
 <959c8e20-705e-b654-d87c-916c2bdf29f4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IB02=T7=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hWlKk-0005sN-Em
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:28:50 +0000
In-Reply-To: <959c8e20-705e-b654-d87c-916c2bdf29f4@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAzMSBNYXkgMjAxOSAxODoxNjo1MiArMDEwMApKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPiB3cm90ZToKCj4gSGksCj4gCj4gT24gMzAvMDUvMjAxOSAxNzoxNCwgQW5k
cmlpIEFuaXNvdiB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAyOS4wNS4xOSAxODozMiwgSnVsaWVu
IEdyYWxsIHdyb3RlOiAgCj4gPj4+IEJUVywgZG8geW91IGhlYXIgYWJvdXQgcGxhbnMgZm9yIHRo
ZSBuZXcgdmdpYz8gU29tZSB0aW1lIGFnbyBpdCB3YXMgc2FpZCB0aGF0IAo+ID4+PiBuZXcgdmdp
YyBpbXBsZW1lbnRhdGlvbiBnb2luZyB0byByZXBsYWNlIHRoZSBvbGQgb25lLCBhbmQgb3B0aW1p
emluZyB0aGUgb2xkIAo+ID4+PiBpcyB3b3J0aGxlc3MuIEJ1dCBhcyBJIHNlZSwgdGhlcmUgYXJl
IG5vIHVwZGF0ZXMgaW50byB0aGF0IGFyZWEgeWV0LiAgCj4gPj4KPiA+PiBXZSBuZWVkIGhlbHAg
dG8gbWFrZSBpdCBoYXBwZW4uICAKPiA+IEknbSBub3Qgc3VyZSBJJ2xsIGhhdmUgc3BhcmUgdGlt
ZSBzb29uLCBidXQgd2hhdCBraW5kIG9mIGhlbHAgeW91IG5lZWQ/IERvIHlvdSAKPiA+IGhhdmUg
YSBUT0RPIGxpc3Q/ICAKPiAKPiAgRnJvbSB0aGUgdG9wIG9mIG15IGhlYWQgdGhlIG1ham9yIGJs
b2NrZXIgaXMgR0lDdjMgKCsgSVRTKSBzdXBwb3J0LiBJdCBtb3N0bHkgCj4gbmVlZCB0byBiZSBw
b3J0ZWQgZnJvbSBMaW51eC4KPiAKPiBUaGVyZSB3ZXJlIGFsc28gYSBjb3VwbGUgb2YgY29uY2Vy
biByZWdhcmRpbmcgdXNpbmcgb3JkZXJpbmcgdGhlIGxpc3Qgd2hpbGUgCj4gZm9sZGluZyAoY2Fu
J3QgcmVtZW1iZXIgaWYgdGhpcyB3YXMgYWRkcmVzc2VkIGluIExpbnV4KS4KPiAKPiBAQW5kcmUs
IEkgdGhvdWdodCB3ZSBjYXB0dXJlIHRoYXQgaW4gWGVuIFByb2plY3QgamlyYSBidXQgSSBjYW4n
dCBmaW5kIGl0LiBEaWQgCj4geW91IGtlZXAgYSBsaXN0PwoKSSB0aG91Z2h0IEppcmEgYXMgd2Vs
bCwgYnV0IGFwcGFyZW50bHkgd2UgbmV2ZXIgYWN0dWFsbHkgZGlkIHRoaXMgOi0oCgpTbyB5ZXMs
IEdJQ3YzIHN1cHBvcnQgaXMgdGhlIHNob3dzdG9wcGVyIGhlcmUsIHRoaXMgd291bGQgYWxsb3cg
dXMgdG8gbWFrZSB0aGUgbmV3IFZHSUMgdGhlIGRlZmF1bHQsIHNpbmNlIHdlIHdvdWxkIGhhdmUg
ZmVhdHVyZSBwYXJpdHkuCgpBbHNvIHdlIHdvdWxkIG5lZWQgdG8gY2hlY2sgdGhlIGdpdCBsb2cg
aW4gTGludXggZm9yIHRoZSBpbmRpdmlkdWFsIFZHSUMgZmlsZXMgdG8gcG9ydCBvdmVyIGZpeGVz
LCBpZiBhcHBsaWNhYmxlLiBEdWUgdG8gdGhlIGRpZmZlcmVudCBjb2Rpbmcgc3R5bGUgYW5kIHJl
bmFtZWQgaWRlbnRpZmllcnMsIGNvbXBhcmluZyB0aGUgZmlsZXMgZG9lcyBub3QgcmVhbGx5IGhl
bHAuCgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
