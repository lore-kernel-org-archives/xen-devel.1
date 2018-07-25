From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: introduce a script for build
 test
Date: Wed, 25 Jul 2018 11:53:53 +0100
Message-ID: <20180725105353.pgbb36jz6aacufpl@citrix.com>
References: <20180724165651.21743-1-wei.liu2@citrix.com>
 <20180724180152.luftbxunayvi5zgf@doug-macbook.localdomain>
 <20180725104836.GG2296@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=m8ai=kj=citrix.com=prvs=737e41906=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiHQc-0002H4-7r
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 10:53:58 +0000
Content-Disposition: inline
In-Reply-To: <20180725104836.GG2296@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMTE6NDg6MzZBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBKdWwgMjQsIDIwMTggYXQgMDE6MDE6NTJQTSAtMDUwMCwgRG91ZyBH
b2xkc3RlaW4gd3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAyNCwgMjAxOCBhdCAwNTo1Njo1MVBNICsw
MTAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KPiA+ID4gLS0tCj4gPiA+IFRoaXMgaXMgYSBzY3JpcHQgSSB3cm90
ZSBwcmV2aW91c2x5IGZvciBidWlsZCB0ZXN0Lgo+ID4gCj4gPiBHb2FsIGhlcmUgaXMgdG8gYmlz
ZWN0IGEgc2VyaWVzIHRvIGZpbmQgdGhlIGJ1aWxkIGZhaWx1cmU/IFdlIGNvdWxkCj4gPiBhbGxv
dyBnaXQgYmlzZWN0IHRvIGRvIHRoZSB3b3JrIGFuZCBqdXN0IGJ1aWxkIGFuZCByZXR1cm4gc3Vj
Y2VzcyBvcgo+ID4gZmFpbHVyZSBpbnN0ZWFkIG9mIGhhdmluZyB0byB3YWxrIGl0IGJ5IGhhbmQu
IEkgZG9uJ3QgaGF2ZSBvbmUKPiA+IHNwZWNpZmljYWxseSBmb3IgWGVuIGJ1dCBvbiBvdGhlciBw
cm9qZWN0cyBJJ3ZlIGdvdCBzb21ldGhpbmcgbGlrZToKPiA+IAo+IAo+IEFjdHVhbGx5LCBpdCdz
IGEgc2NyaXB0IHRoYXQgdGhvc2UgYSBzaW1pbGFpciBqb2IgdG86Cj4gICAgIGdpdCByZWJhc2Ug
LS1leGVjIC4vc2NyaXB0cy9iYXNpYy1idWlsZC5zaCA8YmFzZT4KClRvIGV4cG91bmQgdGhpcyBh
IGJpdDoKClRoYXQncyB3aGF0IEkgdXNlZCBhbmQgdG9sZCBvdGhlcnMgdG8gdXNlIGJlZm9yZSwg
YnV0IGl0IGlzIGZhciBtb3JlCmRhbmdlcm91cyB0aGFuIHRoaXMgc2NyaXB0IGJlY2F1c2UgZ2l0
LXJlYmFzZSBfcmV3cml0ZXNfIGhpc3RvcnkuCgpBIGZhaWxlZCBjb21tYW5kIGFsc28gZG9lc24n
dCByZXN0b3JlIG9yaWdpbmFsIGhlYWQsIHNvIGl0IGlzIGxlc3MKY29udmVuaWVudCAtLSB5b3Ug
aGF2ZSB0byBjaGVjayB0aGUgc3RhdHVzIG9mIHRoZSB0cmVlIGV2ZXJ5IHRpbWUKc29tZXRoaW5n
IGJyZWFrcy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
