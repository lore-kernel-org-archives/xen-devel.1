From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: LLVM optimizations and .init variables usage
Date: Wed, 21 Nov 2018 19:13:59 +0100
Message-ID: <20181121181359.gwjozljs35r4omgi@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UXe6=OA=citrix.com=prvs=856d7c560=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gPX2D-0008CS-Q0
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 18:15:33 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpBcyBzb21lIG9mIHlvdSBrbm93IG1pZ2h0IGFscmVhZHkga25vdyBieSBkaXNjdXNz
aW9ucyBvbiBJUkMgbmV3ZXIKdmVyc2lvbnMgb2YgWGVuIGNvbXBpbGVkIHdpdGggTExWTSB3aWxs
IHRyaWdnZXIgYSBwYWdlIGZhdWx0IHNob3J0bHkKYWZ0ZXIgYm9vdC4KClRoaXMgaXMgZHVlIHRv
IHRoZSB1c2FnZSBvZiBvcHRfYm9vdHNjcnViIGluIGluaXRfaGVhcF9wYWdlcy4Kb3B0X2Jvb3Rz
Y3J1YiBpcyBkZWZpbmVkIGluIHRoZSAuaW5pdCBzZWN0aW9uLCB3aGlsZSBpbml0X2hlYXBfcGFn
ZXMKaXMgbm90IGFuIGluaXQgZnVuY3Rpb24gaXQgcmVhZHMgb3B0X2Jvb3RzY3J1YiBkZXBlbmRp
bmcgb24gdGhlCnN5c3RlbV9zdGF0ZS4gTExWTSBnZW5lcmF0ZWQgY29kZSB3aWxsIGF0dGVtcHQg
dG8gbG9hZCBvcHRfYm9vdHNjcnViCnJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlIG9mIHN5c3RlbV9z
dGF0ZSwgdW5kZXIgdGhlIGFzc3VtcHRpb24gdGhhdApsb2FkaW5nIGEgcmVndWxhciBnbG9iYWwg
dmFyaWFibGUgaGF2ZSBubyBzaWRlIGVmZmVjdHMuCgpUaGVyZSBoYXZlIGJlZW4gc2V2ZXJhbCBz
dWdnZXN0aW9ucyBhYm91dCBob3cgdG8gc29sdmUgdGhpczoKCiAtIE1hcmsgdGhlIHZhcmlhYmxl
IGFzIHZvbGF0aWxlLCBvciB1c2Ugc29tZXRoaW5nIGxpa2UgQUNDRVNTX09OQ0UuCiAtIFVzZSB0
aGUgd2VhayBhdHRyaWJ1dGUuCiAtIERvbid0IGRlY2xhcmUgb3B0X2Jvb3RzY3J1YiBhcyBpbml0
LiBUaGlzIGlzIEFGQUlLIHdoYXQgTGludXggd291bGQKICAgZG8sIHNpbmNlIGluaXQgdmFyaWFi
bGVzIGNhbiBvbmx5IGJlIHVzZWQgaW4gaW5pdCBmdW5jdGlvbnMuCgpUaGUgTExWTSBidWcgcmVw
b3J0IGlzIGF0OgoKaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD0zOTcwNwoK
SSB3b25kZXIgd2hldGhlciB3ZSBzaG91bGQgdHJ5IHRvIHBhdGNoIHRoaXMgYnkgZWl0aGVyIHVz
aW5nIHRoZQp2b2xhdGlsZSBvciB0aGUgd2VhayB3b3JrYXJvdW5kLCBidXQgdGhlbiBuZXcgdXNh
Z2VzIHRoYXQgdHJpZ2dlcgpzaW1pbGFyIGJ1Z3MgY291bGQgYmUgaW50cm9kdWNlZCBhZ2Fpbi4g
TWF5YmUgWGVuIHNob3VsZCBmb2xsb3cgc3VpdAp3aXRoIExpbnV4IGFuZCBsaW1pdCB0aGUgdXNh
Z2Ugb2YgaW5pdCB2YXJpYWJsZXMgdG8gaW5pdCBmdW5jdGlvbnMsCnRoaXMgaXMgbGlrZWx5IHRv
IGJlIHNhZmUgKHNpbmNlIGl0J3Mgd2hhdCBMaW51eCBkb2VzKSwgYW5kIHRodXMgd291bGQKcHJl
dmVudCBmdXR1cmUgc2ltaWxhciBpc3N1ZXMuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
