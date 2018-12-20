From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: Xen 4.11.1 panic
Date: Thu, 20 Dec 2018 08:45:16 +0100
Message-ID: <20181220074516.GB200@antioche.eu.org>
References: <20181218221904.GA1461@antioche.eu.org>
 <5C1A26150200007800207693@prv1-mh.provo.novell.com>
 <20181219115516.GA19518@mail.soc.lip6.fr>
 <5C1A3F92020000780020778D@prv1-mh.provo.novell.com>
 <5C1B46830200007800207DFC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ccbn=O5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1gZt1U-00058E-B5
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 07:45:36 +0000
Content-Disposition: inline
In-Reply-To: <5C1B46830200007800207DFC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMTI6MzY6MzVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEyLjE4IGF0IDEzOjU0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+ID4+Pj4gT24gMTkuMTIuMTggYXQgMTI6NTUsIDxib3V5ZXJAYW50aW9jaGUuZXUub3JnPiB3
cm90ZToKPiA+PiBPbiBXZWQsIERlYyAxOSwgMjAxOCBhdCAwNDowNTo1N0FNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+Pj4gSW4gYW55IGV2ZW50LCBib3RoIEFuZHJldyBhbmQgSSBtdXN0
IGhhdmUgb3Zlcmxvb2tlZCB0aGUgb25lCj4gPj4+IGNydWNpYWwgcGxhY2UgZHVlIHRvIHdoaWNo
IHRoZSBhc3NlcnRpb24gaXMgaW5kZWVkIHdyb25nIGZyb20KPiA+Pj4gcHV0X3BhZ2VfZnJvbV9s
MmUoKToKPiA+Pj4gCj4gPj4+ICAgICAgICAgaW50IHJjID0gX3B1dF9wYWdlX3R5cGUocGcsIGZh
bHNlLCBtZm5fdG9fcGFnZShfbWZuKHBmbikpKTsKPiA+Pj4gCj4gPj4+IE5vdCBhbGxvd2luZyBm
b3IgcHJlZW1wdGlvbiB0aGVyZSBpcyBmaW5lIGlmIHRoZSBMMkUgaXMgcG9pbnRpbmcgdG8KPiA+
Pj4gYW4gTDEgdGFibGUsIGJ1dCBpcyBub3cgd3JvbmcgaWYgdGhlIEwyRSBwb2ludHMgdG8gYW5v
dGhlciBMMiwKPiA+Pj4gd2hpY2ggc3VyZWx5IGlzIHRoZSBjYXNlIHdoZW4geW91IHNlZSB0aGUg
YXNzZXJ0aW9uIHRyaWdnZXIuCj4gPj4gCj4gPj4gU2hvdWxkIHdlIGp1c3QgY2hhbmdlIGZhbHNl
IHRvIHRydWUgaGVyZSwgb3Igc2hvdWxkIHRoZSBjYXNlcyBhYm92ZSBiZSAKPiA+PiBoYW5kbGVk
IGRpZmZlcmVudGx5ID8KPiA+IAo+ID4gU3dpdGNoaW5nIGZyb20gZmFsc2UgdG8gdHJ1ZSBoZXJl
IGlzIGp1c3QgdGhlIGluaXRpYWwgcGFydCBvZiB0aGUKPiA+IG5lY2Vzc2FyeSBjaGFuZ2UgLSBp
ZiB5b3UgZGlkIGp1c3QgdGhpcywgeW91J2QgZW5kIHVwIGhpdHRpbmcKPiA+IHRoZSBBU1NFUlQo
KSByaWdodCBhZnRlciB0aGUgbGluZSBhYm92ZS4gVGhlcmUncyBxdWl0ZSBhIGJpdAo+ID4gbW9y
ZSB0byBpdCwgYW5kIGl0IG5lZWRzIHRvIGJlIGRvbmUgcHJldHR5IGNhcmVmdWxseS4KPiAKPiBB
Y3R1YWxseSB0aGVyZSB3YXMgbm8gcmVhc29uIHRvIGFsdGVyIHRoZSBmcmVlX2wyX3RhYmxlKCkg
cGF0aHMKPiBpbiB0aGUgWFNBLTI3MyBmaXhlczogQSBzd2l0Y2ggdG8gc2hhZG93IG1vZGUgY2Fu
IG9ubHkgb2NjdXIKPiB3aGVuIHZhbGlkYXRpbmcgcGFnZSB0YWJsZXMuIFRoZXJlZm9yZSBJIHRo
aW5rIHlvdSBjb3VsZCBzYWZlbHkKPiByZXZlcnQgdGhlIHJlc3BlY3RpdmUgaHVua3MsIHdoaWNo
IGluY2x1ZGVzIGRlbGV0aW5nIHRoZQo+IEFTU0VSVCgpIHlvdSBmb3VuZCB0cmlnZ2VyaW5nLgoK
WW91IG1lYW4sIFhlbiBpcyBub3QgZ29pbmcgdG8gZml4IHRoaXMgPwoKLS0gCk1hbnVlbCBCb3V5
ZXIgPGJvdXllckBhbnRpb2NoZS5ldS5vcmc+CiAgICAgTmV0QlNEOiAyNiBhbnMgZCdleHBlcmll
bmNlIGZlcm9udCB0b3Vqb3VycyBsYSBkaWZmZXJlbmNlCi0tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
