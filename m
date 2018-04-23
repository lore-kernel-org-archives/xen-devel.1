From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 for-4.11] libxl: fix memory map reported
 to PVH guests
Date: Mon, 23 Apr 2018 09:34:58 +0100
Message-ID: <20180423083458.twysk5vqqs4kecsa@citrix.com>
References: <20180420145719.5702-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=flmh=hm=citrix.com=prvs=6441587ed=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fAWwB-0002IF-J9
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 08:35:03 +0000
Content-Disposition: inline
In-Reply-To: <20180420145719.5702-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjAsIDIwMTggYXQgMDM6NTc6MTlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFBWSCBndWVzdHMgd2l0aCA0R0Igb2YgUkFNIG9yIG1vcmUgZ2V0IGEgbWVtb3J5
IG1hcCBsaWtlIHRoZQo+IGZvbGxvd2luZzoKPiAKPiAweDAwMDAwMDAwMDAwMDAwIC0gMHgwMDAw
MDBmZWUwMDAwMCBSQU0KPiAweDAwMDAwMGZlZTAwMDAwIC0gMHgwMDAwMDEwMDAwMDAwMCBSRVNF
UlZFRAo+IDB4MDAwMDAwZmMwMDkwMDAgLSAweDAwMDAwMGZjMDA5MDQwIEFDUEkKPiAweDAwMDAw
MGZjMDAwMDAwIC0gMHgwMDAwMDBmYzAwMTAwMCBBQ1BJCj4gMHgwMDAwMDBmYzAwMTAwMCAtIDB4
MDAwMDAwZmMwMDkwMDAgQUNQSQo+IDB4MDAwMDAxMDAwMDAwMDAgLSAweDAwMDAwMWZiMjAwNDAw
IFJBTQo+IAo+IFRoaXMgaXMgd3JvbmcgYmVjYXVzZSBBQ1BJIHJlZ2lvbnMgb3ZlcmxhcCB3aXRo
IFJBTSByZWdpb25zLiBUaGUgY2F1c2UKPiBvZiB0aGlzIGlzc3VlIGlzIG5vdCBzZXR0aW5nIGEg
YmlnIGVub3VnaCBNTUlPIGhvbGUgYW5kIG1hcmtpbmcgdGhlCj4gd2hvbGUgTU1JTyBob2xlIGFz
IHJlc2VydmVkLCB3aGVuIGl0IGFjdHVhbGx5IGNvbnRhaW5zIHNldmVyYWwgcGllY2VzOgo+IAo+
ICAtIGxvY2FsIEFQSUMgcGFnZS4KPiAgLSBBQ1BJIHRhYmxlcy4KPiAgLSBIVk0gc3BlY2lhbCBw
YWdlcy4KPiAKPiBPZiB0aG9zZSBpdGVtcyBvbmx5IEhWTSBzcGVjaWFsIHBhZ2VzIG5lZWQgdG8g
YmUgbWFya2VkIGFzIHJlc2VydmVkIGluCj4gb3JkZXIgdG8gYWR2aXNlIHRoZSBndWVzdCBhZ2Fp
bnN0IHVzaW5nIHRoZW0gZm9yIGV4YW1wbGUgZm9yIG1lbW9yeQo+IGhvdHBsdWcuCj4gCj4gQWZ0
ZXIgdGhlIGZpeCB0aGUgbGF5b3V0IHJlcG9ydGVkIGZvciB0aGUgc2FtZSBndWVzdCBpczoKPiAK
PiAweDAwMDAwMDAwMDAwMDAwIC0gMHgwMDAwMDBmYzAwMDAwMCBSQU0KPiAweDAwMDAwMGZlZmY4
MDAwIC0gMHgwMDAwMDBmZjAwMDAwMCBSRVNFUlZFRAo+IDB4MDAwMDAwZmMwMDkwMDAgLSAweDAw
MDAwMGZjMDA5MDQwIEFDUEkKPiAweDAwMDAwMGZjMDAwMDAwIC0gMHgwMDAwMDBmYzAwMTAwMCBB
Q1BJCj4gMHgwMDAwMDBmYzAwMTAwMCAtIDB4MDAwMDAwZmMwMDkwMDAgQUNQSQo+IDB4MDAwMDAx
MDAwMDAwMDAgLSAweDAwMDAwMWZlMDAwNDAwIFJBTQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKCkFja2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
