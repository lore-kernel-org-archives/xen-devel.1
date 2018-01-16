From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/2] x86: Meltdown band-aid against
 malicious 64-bit PV guests
Date: Tue, 16 Jan 2018 18:13:02 +0000
Message-ID: <733792b3-c881-0fdb-5014-419edab9918b@citrix.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5E2574020000780019F27A@prv-mh.provo.novell.com>
 <5A5E26A0020000780019F28C@prv-mh.provo.novell.com>
 <20180116172840.GF29360@bitfolk.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3dza=el=citrix.com=prvs=547832a6c=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ebW6X-0000VB-G7
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 18:37:01 +0000
In-Reply-To: <20180116172840.GF29360@bitfolk.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andy Smith <andy@strugglers.net>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMTggMTc6MjgsIEFuZHkgU21pdGggd3JvdGU6Cj4gSGkgSmFuLAo+Cj4gT24gVHVl
LCBKYW4gMTYsIDIwMTggYXQgMDg6MjE6NTJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
IFRoaXMgaXMgYSB2ZXJ5IHNpbXBsaXN0aWMgY2hhbmdlIGxpbWl0aW5nIHRoZSBhbW91bnQgb2Yg
bWVtb3J5IGEgcnVubmluZwo+PiA2NC1iaXQgUFYgZ3Vlc3QgaGFzIG1hcHBlZCAoYW5kIGhlbmNl
IGF2YWlsYWJsZSBmb3IgYXR0YWNraW5nKTogT25seSB0aGUKPj4gbWFwcGluZ3Mgb2Ygc3RhY2ss
IElEVCwgYW5kIFRTUyBhcmUgYmVpbmcgY2xvbmVkIGZyb20gdGhlIGRpcmVjdCBtYXAKPj4gaW50
byBwZXItQ1BVIHBhZ2UgdGFibGVzLgo+IENhbiB0aGlzIGJlIHVzZWQgd2l0aCBDb21ldC9WaXhl
biB0byBmdXJ0aGVyIHByb3RlY3QgUFYgZ3Vlc3RzPyBpLmUuCj4gaWYgdGhlIHNoaW0gaHlwZXJ2
aXNvciBoYXMgdGhlc2UgY2hhbmdlcyB0aGVuIHdpbGwgaXQgYWxzbyBsaW1pdAo+IHdoYXQgYSBw
cm9jZXNzIGluIHRoZSBQViBndWVzdCBjYW4gc2VlIGluIHRoYXQgc2hpbSBoeXBlcnZpc29yLAo+
IHdoaWNoIHRoZXJlZm9yZSBwcm90ZWN0cyBpdHMgb3duIGd1ZXN0IGtlcm5lbCBhIGJpdCB0b28/
CgpZZXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
