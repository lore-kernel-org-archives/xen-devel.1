From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Subject: Re: [PATCH] golang/xenlight: Fixing compilation for go
 1.11
Date: Sat, 20 Apr 2019 19:27:55 -0400
Message-ID: <6561d58b-3f57-66cd-362e-42c7131825d0@gmail.com>
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iki/=SW=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1hHzOp-00019R-L8
 for xen-devel@lists.xenproject.org; Sat, 20 Apr 2019 23:27:59 +0000
Received: by mail-qk1-x72e.google.com with SMTP id k189so4691130qkc.0
 for <xen-devel@lists.xenproject.org>; Sat, 20 Apr 2019 16:27:57 -0700 (PDT)
In-Reply-To: <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xOC8xOSA5OjExIEFNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDQvMTgvMTkgMjo1
MiBBTSwgRGFuaWVsIFAuIFNtaXRoIHdyb3RlOgo+PiBUaGlzIGRlYWxzIHdpdGggdHdvIGNhc3Rp
bmcgaXNzdWVzIGZvciBjb21waWxpbmcgdW5kZXIgZ28gMS4xMToKPj4gLSBleHBsaWNpdGx5IGNh
c3QgdG8gKkMueGVudG9vbGxvZ19sb2dnZXIgZm9yIEN0eC5sb2dnZXIgcG9pbnRlcgo+PiAtIGFk
ZCBjYXN0IHRvIHVuc2FmZS5Qb2ludGVyIGZvciB0aGUgQyBzdHJpbmcgY3BhdGgKPj4KPj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Cj4gCj4gQlRXLCBkbyB5b3Uga25vdyBpZiB0aGlzIHdpbGwgY29tcGlsZSBmb3Igb2xkZXIg
dmVyc2lvbnMgb2YgZ28/CgpQZXIgdGhlIHN1Z2dlc3Rpb24gb24gSVJDLCBJIGRpZCBhIHRlc3Qg
Y29tcGlsZSB3aXRoIGdvbGFuZyAxLjEwLjggYXMKdGhlIHZlcnNpb24gYXZhaWxhYmxlIHdpdGgg
VWJ1bnR1IDE4LjA0IHdhcyAxLjEwLjEuIFNpbmNlIHRoaXMgbWF0dGVycywKdGhlIGVudmlyb25t
ZW50IHdhcyBzZXR1cCB3aXRoIFhlbiA0LjEyIHRvb2xzLiBJZiB0aGVyZSBhcmUgYWRkaXRpb25h
bAp2YXJpYXRpb25zIHlvdSB3b3VsZCBsaWtlIHRvIHNlZSwgcGxlYXNlIGxldCBtZSBrbm93IGFz
IEkgYW0gdXNpbmcgYQpkb2NrZXIgY29udGFpbmVyIHNldHVwIGZvciByZXByb2R1Y2libGUgYnVp
bGQgZW52aXJvbm1lbnRzIGFuZCBzaG91bGQgYmUKYWJsZSB0byBzcGluIHVwIGRpZmZlcmVudCB2
YXJpYXRpb25zIGZhaXJseSBlYXNpbHkuCgo+IFRoaXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgZm9y
IGJhY2twb3J0IGFzIHdlbGwgKGNjJ2luZyBKYW4pLgo+IAoKQWNrIGFuZCB0aGFuayB5b3UuCgpW
L3IsCkRhbmllbCBQLiBTbWl0aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
