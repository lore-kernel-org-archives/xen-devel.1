From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 5/5] RFC: test/depriv: Add a tool to check
 process-level depriv
Date: Fri, 26 Oct 2018 15:24:29 +0100
Message-ID: <80581fc8-b345-38e5-2766-3805bed4825d@citrix.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-5-george.dunlap@citrix.com>
 <23507.8023.199492.789695@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rdbn=ng=citrix.com=prvs=830c459d6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gG32Q-0002EM-Jq
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 14:24:34 +0000
In-Reply-To: <23507.8023.199492.789695@mariner.uk.xensource.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMjYvMjAxOCAwMzowNiBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gR2VvcmdlIER1bmxh
cCB3cml0ZXMgKCJbUEFUQ0ggNS81XSBSRkM6IHRlc3QvZGVwcml2OiBBZGQgYSB0b29sIHRvIGNo
ZWNrIHByb2Nlc3MtbGV2ZWwgZGVwcml2Iik6Cj4+IEFkZCBhIHRvb2wgdG8gY2hlY2sgd2hldGhl
ciB0aGUgdmFyaW91cyBwcm9jZXNzLWxldmVsIGRlcHJpdmlsZWdpbmcKPj4gb3BlcmF0aW9ucyBo
YXZlIGFjdHVhbGx5IHRha2VuIHBsYWNlIG9uIHRoZSBwcm9jZXNzLgo+IC4uLgo+PiBOQiB0aGF0
IGEgbnVtYmVyIG9mIG90aGVyIHJlcXVlc3RlZCBjaGFuZ2VzIChzdWNoIGFzIHVzaW5nIGBzZXQg
LWVgLAo+PiBjaGFuZ2luZyB0aGUgb3V0cHV0LCAmYykgaGF2ZSBub3QgYmVlbiBtYWRlLCB3aGls
ZSBJIGNvbnNpZGVyIHdoZXRoZXIKPj4gdG8gbGVhdmUgdGhpcyBhcyBhIHN0YW5kLWFsb25lIHNj
cmlwdCwgb3Igd2hldGhlciB0byBtZXJnZSBvc3N0ZXN0J3MKPj4gZmQgY2hlY2tlciBmdW5jdGlv
bmFsaXR5IGludG8gaXQgKHBlcmhhcHMgY2hhbmdpbmcgdGhlIGxhbmd1YWdlIHRvIHBlcmwKPj4g
YXQgdGhlIHNhbWUgdGltZSkuCj4gCj4gT0suICBCdXQsIHVuZm9ydHVuYXRlbHksIGl0IGlzIHZl
cnkgaGFyZCB0byByZXZpZXcgYSBzaGVsbCBzY3JpcHQgdGhhdAo+IGlzIHdyaXR0ZW4gd2l0aG91
dCBgc2V0IC1lJy4gIEdlbmVyYWxseSBhIGJpZyBmb2N1cyBvZiBteSB1c3VhbCByZXZpZXcKPiBz
dHlsZSBpcyBlcnJvciBoYW5kbGluZy4KPiAKPiBBbHNvLCBJIHN1Z2dlc3RlZCBzb21lIHJlZmFj
dG9yaW5nLiAgU2VlaW5nIHRoZSBzY3JpcHQgYXMgaXQgaXMgbWFrZXMKPiBpdCBtb3JlIG9idmlv
dXMgdGhhdCBhIHN5c3RlbWF0aWMgYXBwcm9hY2ggdG8gcHJpbnRpbmcgRkFJTEVECj4gZXRjLiB3
b3VsZCBiZSBhIGdvb2QgaWRlYS4KCkZZSSBJIGRvIGFncmVlIHdpdGggYWxsIG9mIHRob3NlIHN1
Z2dlc3Rpb25zIChib3RoIGBzZXQgLWVgIGFuZCBoYXZpbmcKZnVuY3Rpb25zIHRvIGhhbmRsZSBm
YWlsdXJlIGluIGEgY29uc2lzdGVudCB3YXkpOyBidXQgSSBkaWRuJ3Qgd2FudCB0bwpmaXggZXZl
cnl0aGluZyB1cCBpbiBiYXNoIG9ubHkgdG8gaGF2ZSB0byB3cml0ZSBpdCBvdmVyIGFnYWluIGlu
IHBlcmwKKHNob3VsZCBJIGRlY2lkZSB0byBkbyBzbykuICBJIHdhc24ndCBleHBlY3RpbmcgYSBy
ZXZpZXcgZm9yIHRoaXMgcGF0Y2gKeWV0OyBJIG9ubHkgaW5jbHVkZWQgaXQgZm9yIGNvbXBsZXRl
bmVzcy4gIEkgZ3Vlc3MgSSBmaWd1cmVkICJJIGRpZG4ndAptYWtlIGFsbCB0aGUgY2hhbmdlcyB5
b3Ugd2FudGVkIiB3b3VsZCBtYWtlIHRoYXQgb2J2aW91cywgYnV0IG5leHQgdGltZQpJJ2xsIGJl
IG1vcmUgZXhwbGljaXQgd2hlbiBJIGRvbid0IGV4cGVjdCBhIHBhdGNoIHRvIGJlIHJldmlld2Vk
LiA6LSkKClRoYW5rcywKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
