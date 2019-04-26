From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Fri, 26 Apr 2019 03:24:13 -0600
Message-ID: <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJx5h-00047n-0I
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:24:21 +0000
In-Reply-To: <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA0LjE5IGF0IDAyOjEyLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
SSB3b3VsZCBiZSBPSyB3aXRoIHB1dHRpbmcgdGhlIHdob2xlIHRoaW5nIGJlaGluZAo+IENPTkZJ
R19IQVNfTUVNX1NIQVJJTkcgYW5kIGhhdmluZyB0aGF0IGJlIG9mZiBieSBkZWZhdWx0LiBJcyB0
aGF0IGEKPiBmZWFzaWJsZSByb3V0ZSBmcm9tIHlvdXIgUE9WPwoKU28gaXMgdGhlcmUgYW55dGhp
bmcgd3Jvbmcgd2l0aCBteSBlYXJsaWVyIHN1Z2dlc3Rpb24gb2YKcmUtcHVycG9zaW5nIHRoZSBz
aGFyaW5nIGZpZWxkIHRvIGF0dGFjaCBhIHN0cnVjdHVyZSB0byB0aGUgcGFnZQp3aGljaCBjb250
YWlucyB0aGUgbmVjZXNzYXJ5IGxvY2s/IEkuZS4gaW4gdGhlIHNpbXBsZXN0IGNhc2UgYnkKYWRk
aW5nIHRoZSBsb2NrIHRvIHN0cnVjdCBwYWdlX3NoYXJpbmdfaW5mbyBpdHNlbGY/CgpBcyB0byB5
b3VyIHF1ZXN0aW9uIGFib3ZlIC0gdGhhdCB3b3VsZCBiZSBhbm90aGVyIG9wdGlvbiwgb2YKY291
cnNlIHdpdGggdGhlIGNvbmZpZyBvcHRpb24gZ2V0dGluZyBpdHMgSEFTXyBwYXJ0IGRyb3BwZWQu
ClBvc3NpYmx5IGl0IGNvdWxkIHRoZW4gZXZlbiBkZWZhdWx0IHRvIGVuYWJsZWQgd2hlbiBCSUdN
RU09eS4KQnV0IHlvdSByZWFsaXplIHRoYXQgYnkgZ29pbmcgdGhpcyByb3V0ZSB5b3UgZnVydGhl
ciBpbmNyZWFzZQp0aGUgcmlzayBvZiBjaGFuZ2VzIGVsc2V3aGVyZSBicmVha2luZyBtZW0tc2hh
cmluZyB3aXRob3V0CmFueW9uZSBub3RpY2luZyByaWdodCBhd2F5PwoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
