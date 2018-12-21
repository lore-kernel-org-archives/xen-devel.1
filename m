From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/3] xen/pt: fix some pass-thru devices
 don't work across reboot
Date: Fri, 21 Dec 2018 12:32:48 +0100
Message-ID: <20181221113248.5fxpc5ljsnaj4eni@mac.citrite.net>
References: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
 <5C1CBCDE0200007800208727@prv1-mh.provo.novell.com>
 <20181221102622.2csul4nq4bsuf62w@mac.citrite.net>
 <5C1CC14F0200007800208762@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Efb1=O6=citrix.com=prvs=886684236=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gaJ35-0008Sa-4u
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 11:32:59 +0000
Content-Disposition: inline
In-Reply-To: <5C1CC14F0200007800208762@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjEsIDIwMTggYXQgMDM6MzI6NDdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIxLjEyLjE4IGF0IDExOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBEZWMgMjEsIDIwMTggYXQgMDM6MTM6NTBBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gQnV0IHRoZW4gYWdhaW4gSSdtIHN0aWxsIG5vdCBmdWxseSBjb252
aW5jZWQgdGhhdCBhIGh5cGVydmlzb3IKPiA+PiBjaGFuZ2UgaXMgdGhlIHJpZ2h0IGNvdXJzZSBv
ZiBhY3Rpb24gaGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UuIEl0Cj4gPj4gd291bGQgYmUgYmV0dGVy
IGlmIHRoZSBoeXBlcnZpc29yIGhhZCB0byBqdXN0IHZlcmlmeSB0aGF0IGFsbAo+ID4+IElSUSBt
YXBwaW5ncyBhcmUgZ29uZSwgb3IgZWxzZSBmYWlsIHRoZSBkZS1hc3NpZ25tZW50IG9mIHRoZQo+
ID4+IGRldmljZS4KPiA+IAo+ID4gVGhlIG9ubHkgY29tcG9uZW50IChleGNlcHQgdGhlIGh5cGVy
dmlzb3IpIHRoYXQga25vd3MgYWJvdXQgc3VjaAo+ID4gYXNzaWdubWVudHMgaXMgUUVNVSwgYW5k
IGluIHRoZSBjYXNlIG9mIGEgUUVNVSBjcmFzaCB0aGUgaG9zdCB3b3VsZCBiZQo+ID4gbGVmdCB3
aXRoIGEgZGV2aWNlIHRoYXQgY2Fubm90IGJlIGRlLWFzc2lnbmVkLCBiZWNhdXNlIHRoZSBpbmZv
cm1hdGlvbgo+ID4gYWJvdXQgdGhlIFBJUlEgYmluZGluZ3MgaW4gbG9zdCBkdWUgdG8gdGhlIFFF
TVUgY3Jhc2guCj4gPiAKPiA+IElNTyBYZW4gbmVlZHMgdG8gYmUgY2FwYWJsZSBvZiBjbGVhbmlu
ZyBhbnkgYmluZGluZ3MgYW5kIG1hcHBpbmdzIGRvbmUKPiA+IGJ5IHRoZSB0b29sc3RhY2sgb3Ig
dGhlIGRldmljZSBtb2RlbCBpbiBvcmRlciB0byBiZSBhYmxlIHRvIGNvcnJlY3RseQo+ID4gcmVj
b3ZlciBmcm9tIGEgZGV2aWNlIG1vZGVsIG9yIHRvb2xzdGFjayBjcmFzaC4KPiAKPiBCdXQgcG9z
c2libHkgd2l0aCB0b29sIHN0YWNrIGFzc2lzdGFuY2U6IFJhdGhlciB0aGFuIGRvaW5nIGl0IChp
biBhCj4gcG90ZW50aWFsbHkgZnJhZ2lsZSB3YXksIGFzIHBlciBteSBvdGhlciBjb21tZW50cykg
YXMgYW4gaW50ZWdyYWwKPiBwYXJ0IG9mIGRlYXNzaWduLWRldmljZSwgaXQgY291bGQgYmUgYSBz
ZXBhcmF0ZSBkb21jdGwgdG8gYmUKPiBpc3N1ZWQgZmlyc3QuCgpJIGRvbid0IGhhdmUgYSBzdHJv
bmcgb3BpbmlvbiB3aGV0aGVyIGEgbmV3IGh5cGVyY2FsbCB3b3VsZCBiZSBiZXR0ZXIKdGhhbiBq
dXN0IGhvb2tpbmcgdGhpcyBsb2dpYyBpbnRvIHRoZSBjdXJyZW50IGRlYXNzaWduIGh5cGVyY2Fs
bCwgYXMKbG9uZyBhcyBpdCdzIHJvYnVzdC4KCj4gT3Igb3RoZXJ3aXNlIGZhaWx1cmUgaGVyZSBv
dWdodCB0byBsZWFkIHRvIGZhaWx1cmUgb2YKPiBkZWFzc2lnbi1kZXZpY2UsIHJhdGhlciB0aGFu
IChlLmcuKSBhbiBpbmZpbml0ZSBsb29wLgoKWWVzLCBJIGZ1bGx5IGFncmVlIGl0IG5lZWRzIHRv
IGJlIHJvYnVzdCwgaWRlYWxseSB0aGUKdW5iaW5kaW5nL3VubWFwcGluZyBzaG91bGQgYWx3YXlz
IHN1Y2NlZWQsIG9yIGF0IGxlYXN0IGRvbid0IGdldCBzdHVjawppbnRvIGFuIGluZmluaXRlIGxv
b3AuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
