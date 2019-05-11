From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 07/12] x86/IRQ: fix locking around vector
 management
Date: Sat, 11 May 2019 00:11:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA2A30C@SHSMSX104.ccr.corp.intel.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D563020000780022CD40@prv1-mh.provo.novell.com>
 <5CD2D6AD020000780022CDAC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3x+=TL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hPFcP-0000oV-Bl
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 00:12:01 +0000
In-Reply-To: <5CD2D6AD020000780022CDAC@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTWF5IDgsIDIwMTkgOToxNiBQTQo+IAo+ID4+PiBPbiAwOC4wNS4xOSBhdCAxNTox
MCwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+IEFsbCBvZiBfX3thc3NpZ24sYmluZCxj
bGVhcn1faXJxX3ZlY3RvcigpIG1hbmlwdWxhdGUgc3RydWN0IGlycV9kZXNjCj4gPiBmaWVsZHMs
IGFuZCBoZW5jZSBvdWdodCB0byBiZSBjYWxsZWQgd2l0aCB0aGUgZGVzY3JpcHRvciBsb2NrIGhl
bGQgaW4KPiA+IGFkZGl0aW9uIHRvIHZlY3Rvcl9sb2NrLiBUaGlzIGlzIGN1cnJlbnRseSB0aGUg
Y2FzZSBmb3Igb25seQo+ID4gc2V0X2Rlc2NfYWZmaW5pdHkoKSAoaW4gdGhlIGNvbW1vbiBjYXNl
KSBhbmQgZGVzdHJveV9pcnEoKSwgd2hpY2ggYWxzbwo+ID4gY2xhcmlmaWVzIHdoYXQgdGhlIG5l
c3RpbmcgYmVoYXZpb3IgYmV0d2VlbiB0aGUgbG9ja3MgaGFzIHRvIGJlLgo+ID4gUmVmbGVjdCB0
aGUgbmV3IGV4cGVjdGF0aW9uIGJ5IGhhdmluZyB0aGVzZSBmdW5jdGlvbnMgYWxsIHRha2UgYQo+
ID4gZGVzY3JpcHRvciBhcyBwYXJhbWV0ZXIgaW5zdGVhZCBvZiBhbiBpbnRlcnJ1cHQgbnVtYmVy
Lgo+ID4KPiA+IEFsc28gdGFrZSBjYXJlIG9mIHRoZSB0d28gc3BlY2lhbCBjYXNlcyBvZiBjYWxs
cyB0byBzZXRfZGVzY19hZmZpbml0eSgpOgo+ID4gc2V0X2lvYXBpY19hZmZpbml0eV9pcnEoKSBh
bmQgVlQtZCdzIGRtYV9tc2lfc2V0X2FmZmluaXR5KCkgZ2V0IGNhbGxlZAo+ID4gZGlyZWN0bHkg
YXMgd2VsbCwgYW5kIGluIHRoZXNlIGNhc2VzIHRoZSBkZXNjcmlwdG9yIGxvY2tzIGhhZG4ndCBn
b3QKPiA+IGFjcXVpcmVkIHRpbGwgbm93LiBGb3Igc2V0X2lvYXBpY19hZmZpbml0eV9pcnEoKSB0
aGlzIG1lYW5zIGFjcXVpcmluZyAvCj4gPiByZWxlYXNpbmcgb2YgdGhlIElPLUFQSUMgbG9jayBj
YW4gYmUgcGxhaW4gc3Bpbl97LHVufWxvY2soKSB0aGVuLgo+ID4KPiA+IERyb3Agb25lIG9mIHRo
ZSB0d28gbGVhZGluZyB1bmRlcnNjb3JlcyBmcm9tIGFsbCB0aHJlZSBmdW5jdGlvbnMgYXQKPiA+
IHRoZSBzYW1lIHRpbWUuCj4gPgo+ID4gVGhlcmUncyBvbmUgY2FzZSBsZWZ0IHdoZXJlIGRlc2Ny
aXB0b3JzIGdldCBtYW5pcHVsYXRlZCB3aXRoIGp1c3QKPiA+IHZlY3Rvcl9sb2NrIGhlbGQ6IHNl
dHVwX3ZlY3Rvcl9pcnEoKSBhc3N1bWVzIGl0cyBjYWxsZXIgdG8gYWNxdWlyZQo+ID4gdmVjdG9y
X2xvY2ssIGFuZCBoZW5jZSBjYW4ndCBpdHNlbGYgYWNxdWlyZSB0aGUgZGVzY3JpcHRvciBsb2Nr
cyAod3JvbmcKPiA+IGxvY2sgb3JkZXIpLiBJIGRvbid0IGN1cnJlbnRseSBzZWUgaG93IHRvIGFk
ZHJlc3MgdGhpcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gPiAtLS0KPiA+IHYyOiBBbHNvIGFkanVzdCBzZXRfaW9hcGljX2FmZmluaXR5
X2lycSgpIGFuZCBWVC1kJ3MKPiA+ICAgICBkbWFfbXNpX3NldF9hZmZpbml0eSgpLgo+IAo+IEkn
bSBzb3JyeSwgS2V2aW4sIEkgc2hvdWxkIGhhdmUgQ2MtZWQgeW91IG9uIHRoaXMgb25lLgoKUmV2
aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPiBmb3IgdnRkIHBhcnQu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
