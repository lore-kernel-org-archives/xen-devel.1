From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RESEND v1 6/7] x86: Implement Intel
 Processor Trace MSRs read/write
Date: Thu, 03 May 2018 05:36:40 -0600
Message-ID: <5AEAF44802000078001C06B8@prv1-mh.provo.novell.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <1516039953-2988-7-git-send-email-luwei.kang@intel.com>
 <5AE3170702000078001BF1BE@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E167F6D582@SHSMSX101.ccr.corp.intel.com>
 <5AEABB5802000078001C05AD@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E167F6DB20@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E167F6DB20@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA1LjE4IGF0IDExOjQwLCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
ICAgICAgVGhhbmtzIGZvciB5b3VyIGNsYXJpZmljYXRpb24uIFBsZWFzZSBjb3JyZWN0IG1lIGlm
IEkgaGF2ZSBzb21ldGhpbmcgCj4gd3JvbmcuIEd1ZXN0IG1heSBleGVjdXRlIGFuIGluc3RydWN0
aW9uIGFuZCB0aGlzIGluc3RydWN0aW9uIG1heSBwcm9kdWNlIGFuIAo+IFBUIHBhY2tldCBzYXZl
IGluIFBUIG91dHB1dCBidWZmZXIuIEFuIEVQVCB2aW9sYXRpb24gd2lsbCBiZSBnZW5lcmF0ZWQg
aWYgdGhlIAo+IGFkZHJlc3Mgb2YgdGhpcyBQVCBidWZmZXIgZG9uJ3QgaGF2ZSBFUFQgcGFnZSB0
YWJsZSBtYXBwaW5nLCBidXQgdGhpcyBFUFQgCj4gdmlvbGF0aW9ucyBzaG91bGRuJ3QgYmUgaGFu
ZGxlZCBieSB4ODZfZW11bGF0ZSgpIGJlY2F1c2UgaXQgbm8gcmVsYXRlIHdpdGggCj4gdGhlIGV4
ZWN1dGUgb2YgdGhpcyBpbnN0cnVjdGlvbi4KClBsdXMgLSBhbmQgdGhhdCdzIHZlcnkgaW1wb3J0
YW50IC0gdGhlIEVQVCB2aW9sYXRpb24gbWF5IGJlIHJlcG9ydGVkIG9uIHNvbWUKbGF0ZXIgaW5z
bi4KCj4gICAgICBJbiB0aGF0IGNhc2UsIGNhbiB3ZSBidWlsZCB0aGUgRVBUIG1hcCB3aGVuIHNl
dCB0aGUgb3V0cHV0IGJ1ZmZlciAKPiBhZGRyZXNzIChJQTMyX1JUSVRfT1VUUFVUX0JBU0UpIGFu
ZCBjcmFzaCB0aGUgZ3Vlc3QgaWYgc3RpbGwgaGFwcGVuZWQgRVBUIAo+IHZpb2xhdGlvbiB3aXRo
IEludGVsIFBUIG91dHB1dCBidWZmZXIgcmVhZC93cml0ZSBleGl0IHF1YWxpZmljYXRpb24uIE9y
IGFkZCAKPiBhbiBleGl0IHF1YWxpZmljYXRpb24gY2hlY2sgYmVmb3JlIGluc3RydWN0aW9uIGVt
dWxhdGlvbj8KCkltbyB5b3Ugc2hvdWxkIGFkZCBhbiBleGl0IHF1YWxpZmljYXRpb24gY2hlY2sg
aW4gYW55IGNhc2UuIERlcGVuZGluZwp3aGF0IGVsc2UgeW91IGRvLCBmaW5kaW5nIHRoZSBuZXcg
Yml0IHNldCBtYXkgaW1wbHkgY3Jhc2hpbmcgdGhlIGRvbWFpbgpvciBkb2luZyBzb21ldGhpbmcg
bW9yZSBzb3BoaXN0aWNhdGVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
