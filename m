From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 15/31] libxl_qmp_ev: Implement fd
 callback and read data
Date: Thu, 28 Jun 2018 12:33:14 +0100
Message-ID: <20180628113314.GH2052@perard.uk.xensource.com>
References: <20180601143720.24637-1-anthony.perard@citrix.com>
 <20180601143720.24637-16-anthony.perard@citrix.com>
 <23347.43226.684654.141150@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8t7v=jo=citrix.com=prvs=7105abfae=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fYVAs-0003su-Jt
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 11:33:18 +0000
Content-Disposition: inline
In-Reply-To: <23347.43226.684654.141150@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDQ6MTA6MThQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYzIDE1LzMxXSBsaWJ4bF9xbXBf
ZXY6IEltcGxlbWVudCBmZCBjYWxsYmFjayBhbmQgcmVhZCBkYXRhIik6Cj4gPiBGaXJzdCBzdGVw
IGludG8gdGFraW5nIGNhcmUgb2YgdGhlIGlucHV0IGZyb20gUUVNVSdzIFFNUCBzb2NrZXQuIEZv
cgo+ID4gbm93LCB3ZSByZWFkIGRhdGEgYW5kIHN0b3JlIHRoZW0gaW4gYnVmZmVycy4KPiAKPiBI
b3cgYmlnIGlzIHRoaXMgZGF0YSA/ICBJcyBhbGwgdGhpcyBidXNpbmVzcyB3aXRoIGEgbGlua2Vk
IGxpc3Qgb2YKPiBidWZmZXJzIHJlYWxseSBuZWNlc3NhcnkgPwoKVGhlIGFsdGVybmF0aXZlIGlz
IHJlYWxsb2MuIEkgZG9uJ3Qga25vdyBob3cgYmlnIHRoZSBkYXRhIGlzIGdvaW5nIHRvCmJlLiBJ
IGRvbid0IHdhbnQgdG8gc3BlY3VsYXRlLgoKQnV0IHJpZ2h0IG5vdywgUU1QX1JFQ0VJVkVfQlVG
RkVSX1NJWkUgaXMgc2V0IHRvIDRrLCBJIGRvbid0IHRoaW5rIHdlCndvdWxkIG5lZWQgbW9yZSB0
aGFuIHRoYXQsIGJ1dCBJIHRoaW5rIHRoZSBjb2RlIG5lZWQgdG8gYmUgcHJlcGFyZWQgdG8KcmVj
ZWl2ZSBtb3JlLgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
