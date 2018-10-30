From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH RFC] VMX: fix vmx_handle_eoi()
Date: Tue, 30 Oct 2018 06:19:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BE2B9C6@SHSMSX101.ccr.corp.intel.com>
References: <5BC06A4B02000078001F0EE0@prv1-mh.provo.novell.com>
 <20181019143010.GA24016@gao-cwp>
 <5BD190F402000078001F48E2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zlu6=nk=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gHNNT-0007xN-NA
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 06:19:47 +0000
In-Reply-To: <5BD190F402000078001F48E2@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, "Gao, Chao" <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBPY3RvYmVyIDI1LCAyMDE4IDU6NDYgUE0KPiAKPiA+Pj4gT24gMTkuMTAuMTggYXQg
MTY6MzAsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTIsIDIw
MTggYXQgMDM6MzI6NTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj5JbiBjb21taXQg
MzAzMDY2ZmRiMWUgKCJWTVg6IGZpeCBpbnRlcmFjdGlvbiBvZiBBUElDLVYgYW5kIFZpcmlkaWFu
Cj4gPj5lbXVsYXRpb24iKSBJIHNjcmV3ZWQgdXAgcXVpdGUgaGVhdmlseTogSW5zdGVhZCBvZiBj
bGVhcmluZyBTVkksIFJWSSB3YXMKPiA+PmNsZWFyZWQuIEZ1cnRoZXJtb3JlLCB1bmNvbmRpdGlv
bmFsIGNsZWFyaW5nIG9mIFNWSSBpcyB3cm9uZyB0b28gLSBvdGhlcgo+ID4+SVNSIGJpdHMgc2hv
dWxkIGJlIHRha2VuIGludG8gYWNjb3VudC4KPiA+Pgo+ID4+SW50cm9kdWNlIGEgbmV3IGhlbHBl
ciBzZXRfc3ZpKCksIHNwbGl0IG91dCBvZiB2bXhfcHJvY2Vzc19pc3IoKSwgYW5kCj4gPj51c2Ug
aXQgYWxzbyBmcm9tIHZteF9oYW5kbGVfZW9pKCkuCj4gPj4KPiA+PkZvbGxvd2luZyB0aGUgcHJv
YmxlbXMgaW4gdm14X2ludHJfYXNzaXN0KCkgKHNlZSB0aGUgc3RpbGwgcHJlc2VudCBiaWcKPiA+
PmJsb2NrIG9mIGRlYnVnZ2luZyBjb2RlIHRoZXJlKSBhbHNvIHdhcm4gKG9uY2UpIGlmIEVPSSdk
IHZlY3RvciBhbmQKPiA+Pm9yaWdpbmFsIFNWSSBkb24ndCBtYXRjaC4KPiA+Pgo+ID4+U2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4KPiA+IEFmdGVyIGNv
cnJlY3RpbmcgdGhlIGRlc2NyaXB0aW9uIGluIHRoZSBmaXJzdCBwYXJhZ3JhcGgKPiA+Cj4gPiBS
ZXZpZXdlZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiAKPiBXaXRoIHRoaXMg
LSBhbnkgY2hhbmNlIG9mIGdldHRpbmcgdGhlIG5lY2Vzc2FyeSBhY2tzPyBPcgo+IGFtIEkgZXhw
ZWN0ZWQgdG8gcmUtc3VibWl0IHdpdGggdGhlIChhbHJlYWR5KSBhZGp1c3RlZAo+IGRlc2NyaXB0
aW9uPwo+IAoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPi4gUGxl
YXNlIGZpeCB0aGUKZGVzY3JpcHRpb24gd2hlbiBjb21taXR0aW5nLiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
