From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Thu, 6 Dec 2018 12:31:15 +0100
Message-ID: <d0f3f0b2-d48b-4cd1-cf6e-e7a8176dd0da__30330.1671323881$1544095800$gmane$org@suse.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
 <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
 <20181129132657.nlzxzqfdvngjsfvk@black.fi.intel.com>
 <bc770271-65a8-8bf4-10f9-6ce169e94130@suse.com>
 <20181206111352.GQ19891@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nlhd=op=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gUrsE-0008OT-OW
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 11:31:18 +0000
In-Reply-To: <20181206111352.GQ19891@kroah.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <greg@kroah.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAxMjoxMywgR3JlZyBLSCB3cm90ZToKPiBPbiBUaHUsIE5vdiAyOSwgMjAx
OCBhdCAwMjozNToxN1BNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyOS8xMS8y
MDE4IDE0OjI2LCBLaXJpbGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4+PiBPbiBUaHUsIE5vdiAyOSwg
MjAxOCBhdCAwOTo0MToyNUFNICswMDAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IE9uIDI5
LzExLzIwMTggMDI6MjIsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+
Pgo+Pj4+PiBBcyBhbHNvIHNlZW4gYXQ6Cj4+Pj4+IGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2Nn
aS1iaW4vYnVncmVwb3J0LmNnaT9idWc9OTE0OTUxCj4+Pj4+Cj4+Pj4+IEF0dGFjaGVkIHRoZXJl
IGFyZSB0d28gc2VyaWFsIGNvbnNvbGUgb3V0cHV0IGxvZ3MuIE9uZSBpcyBzdGFydGluZyB3aXRo
Cj4+Pj4+IFhlbiA0LjExIChmcm9tIGRlYmlhbiB1bnN0YWJsZSkgYXMgZG9tMCwgYW5kIHRoZSBv
dGhlciBvbmUgd2l0aG91dCBYZW4uCj4+Pj4+Cj4+Pj4+IFsgICAgMi4wODU1NDNdIEJVRzogdW5h
YmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQKPj4+Pj4gZmZmZjg4OGQ5ZmZm
YzAwMAo+Pj4+PiBbICAgIDIuMDg1NjEwXSBQR0QgMjAwYzA2NyBQNEQgMjAwYzA2NyBQVUQgMAo+
Pj4+PiBbICAgIDIuMDg1Njc0XSBPb3BzOiAwMDAwIFsjMV0gU01QIE5PUFRJCj4+Pj4+IFsgICAg
Mi4wODU3MzZdIENQVTogMSBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkCj4+Pj4+
IDQuMTkuMC10cnVuay1hbWQ2NCAjMSBEZWJpYW4gNC4xOS41LTF+ZXhwMStwdmgxCj4+Pj4+IFsg
ICAgMi4wODU4MjNdIEhhcmR3YXJlIG5hbWU6IEhQIFByb0xpYW50IERMMzYwIEc3LCBCSU9TIFA2
OCAwNS8yMS8yMDE4Cj4+Pj4+IFsgICAgMi4wODU4OTVdIFJJUDogZTAzMDpwdGR1bXBfd2Fsa19w
Z2RfbGV2ZWxfY29yZSsweDFmZC8weDQ5MAo+Pj4+PiBbLi4uXQo+Pj4+Cj4+Pj4gVGhlIG9mZmVu
ZGluZyBzdGFibGUgY29tbWl0IGlzIDQwNzRjYTdkOGExODMyOTIxYzg2NWQyNTBiYmQwOGYzNDQx
YjM2NTcKPj4+PiAoIng4Ni9tbTogTW92ZSBMRFQgcmVtYXAgb3V0IG9mIEtBU0xSIHJlZ2lvbiBv
biA1LWxldmVsIHBhZ2luZyIpLCB0aGlzCj4+Pj4gaXMgY29tbWl0IGQ1Mjg4OGFhMjc1M2UzMDYz
YTlkM2EwYzlmNzJmOTRhYTk4MDljMTUgdXBzdHJlYW0uCj4+Pj4KPj4+PiBDdXJyZW50IHVwc3Ry
ZWFtIGtlcm5lbCBpcyBib290aW5nIGZpbmUgdW5kZXIgWGVuLCBzbyBpbiBnZW5lcmFsIHRoZQo+
Pj4+IHBhdGNoIHNob3VsZCBiZSBmaW5lLiBVc2luZyBhbiB1cHN0cmVhbSBrZXJuZWwgYnVpbHQg
ZnJvbSBhYm92ZSBjb21taXQKPj4+PiAod2l0aCB0aGUgdGhlbiBuZWVkZWQgWGVuIGZpeHVwIHBh
dGNoIDE0NTdkOGNmNzY2NGYzNGM0YmE1MzQpIGlzIGZpbmUsCj4+Pj4gdG9vLgo+Pj4+Cj4+Pj4g
S2lyaWxsLCBhcmUgeW91IGF3YXJlIG9mIGFueSBwcmVyZXF1aXNpdGUgcGF0Y2ggZnJvbSA0LjIw
IHdoaWNoIGNvdWxkIGJlCj4+Pj4gbWlzc2luZyBpbiA0LjE5LjU/Cj4+Pgo+Pj4gSSdtIG5vdC4K
Pj4+Cj4+PiBMZXQgbWUgbG9vayBpbnRvIHRoaXMuCj4+Pgo+Pgo+PiBXaGF0IGlzIG1ha2luZyBt
ZSBzdXNwaWNpb3VzIGlzIHRoZSBmYWlsdXJlIGhhcHBlbmluZyBqdXN0IGFmdGVyCj4+IHJlbGVh
c2luZyB0aGUgaW5pdCBtZW1vcnkuIE1heWJlIHRoZXJlIGlzIGFuIGFjY2VzcyB0byAuaW5pdC5k
YXRhCj4+IHNlZ21lbnQgb3Igc2ltaWxhcj8gVGhlIG5hdGl2ZSBrZXJuZWwgYm9vdGluZyBjb3Vs
ZCBiZSByZWxhdGVkIHRvIHRoZQo+PiB1c2FnZSBvZiAyTSBtYXBwaW5ncyBub3QgYmVpbmcgYXZh
aWxhYmxlIGluIGEgUFYtZG9tYWluLgo+IAo+IERpZCB0aGlzIGV2ZXIgZ2V0IGZpeGVkIGFueXdo
ZXJlIHRoYXQgSSBjYW4gcHJvcGVybHkgYmFja3BvcnQgaXQgdG8gdGhlCj4gNC4xOS55IHRyZWU/
CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgxMTMwMjAyMzI4LjY1MzU5LTIta2ly
aWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbS8KClN0aWxsIHBlbmRpbmcgdXBzdHJlYW0uIEp1
c3QgcGluZ2VkIHRnbHguCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
