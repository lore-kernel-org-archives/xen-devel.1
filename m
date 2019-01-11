From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Fri, 11 Jan 2019 08:59:52 +0100
Message-ID: <a27939a1-261b-435f-1a0e-3732bdfe1ff3__35552.2166043103$1547193533$gmane$org@suse.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
 <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
 <20181129132657.nlzxzqfdvngjsfvk@black.fi.intel.com>
 <bc770271-65a8-8bf4-10f9-6ce169e94130@suse.com>
 <20181206111352.GQ19891@kroah.com>
 <d0f3f0b2-d48b-4cd1-cf6e-e7a8176dd0da@suse.com>
 <20181206114609.GA19522@kroah.com>
 <26a64020-3974-ec4d-f64d-65669e87d505@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bKv/=PT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ghrjP-0003R4-UB
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 07:59:55 +0000
In-Reply-To: <26a64020-3974-ec4d-f64d-65669e87d505@suse.com>
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
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTIvMjAxOCAxMjoxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNi8xMi8yMDE4
IDEyOjQ2LCBHcmVnIEtIIHdyb3RlOgo+PiBPbiBUaHUsIERlYyAwNiwgMjAxOCBhdCAxMjozMTox
NVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMDYvMTIvMjAxOCAxMjoxMywg
R3JlZyBLSCB3cm90ZToKPj4+PiBPbiBUaHUsIE5vdiAyOSwgMjAxOCBhdCAwMjozNToxN1BNICsw
MTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBPbiAyOS8xMS8yMDE4IDE0OjI2LCBLaXJp
bGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4+Pj4+PiBPbiBUaHUsIE5vdiAyOSwgMjAxOCBhdCAwOTo0
MToyNUFNICswMDAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4+IE9uIDI5LzExLzIwMTgg
MDI6MjIsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBBcyBhbHNvIHNlZW4gYXQ6Cj4+Pj4+Pj4+IGh0dHBzOi8vYnVncy5kZWJpYW4ub3Jn
L2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9OTE0OTUxCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEF0dGFj
aGVkIHRoZXJlIGFyZSB0d28gc2VyaWFsIGNvbnNvbGUgb3V0cHV0IGxvZ3MuIE9uZSBpcyBzdGFy
dGluZyB3aXRoCj4+Pj4+Pj4+IFhlbiA0LjExIChmcm9tIGRlYmlhbiB1bnN0YWJsZSkgYXMgZG9t
MCwgYW5kIHRoZSBvdGhlciBvbmUgd2l0aG91dCBYZW4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFsgICAg
Mi4wODU1NDNdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQK
Pj4+Pj4+Pj4gZmZmZjg4OGQ5ZmZmYzAwMAo+Pj4+Pj4+PiBbICAgIDIuMDg1NjEwXSBQR0QgMjAw
YzA2NyBQNEQgMjAwYzA2NyBQVUQgMAo+Pj4+Pj4+PiBbICAgIDIuMDg1Njc0XSBPb3BzOiAwMDAw
IFsjMV0gU01QIE5PUFRJCj4+Pj4+Pj4+IFsgICAgMi4wODU3MzZdIENQVTogMSBQSUQ6IDEgQ29t
bTogc3dhcHBlci8wIE5vdCB0YWludGVkCj4+Pj4+Pj4+IDQuMTkuMC10cnVuay1hbWQ2NCAjMSBE
ZWJpYW4gNC4xOS41LTF+ZXhwMStwdmgxCj4+Pj4+Pj4+IFsgICAgMi4wODU4MjNdIEhhcmR3YXJl
IG5hbWU6IEhQIFByb0xpYW50IERMMzYwIEc3LCBCSU9TIFA2OCAwNS8yMS8yMDE4Cj4+Pj4+Pj4+
IFsgICAgMi4wODU4OTVdIFJJUDogZTAzMDpwdGR1bXBfd2Fsa19wZ2RfbGV2ZWxfY29yZSsweDFm
ZC8weDQ5MAo+Pj4+Pj4+PiBbLi4uXQo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIG9mZmVuZGluZyBzdGFi
bGUgY29tbWl0IGlzIDQwNzRjYTdkOGExODMyOTIxYzg2NWQyNTBiYmQwOGYzNDQxYjM2NTcKPj4+
Pj4+PiAoIng4Ni9tbTogTW92ZSBMRFQgcmVtYXAgb3V0IG9mIEtBU0xSIHJlZ2lvbiBvbiA1LWxl
dmVsIHBhZ2luZyIpLCB0aGlzCj4+Pj4+Pj4gaXMgY29tbWl0IGQ1Mjg4OGFhMjc1M2UzMDYzYTlk
M2EwYzlmNzJmOTRhYTk4MDljMTUgdXBzdHJlYW0uCj4+Pj4+Pj4KPj4+Pj4+PiBDdXJyZW50IHVw
c3RyZWFtIGtlcm5lbCBpcyBib290aW5nIGZpbmUgdW5kZXIgWGVuLCBzbyBpbiBnZW5lcmFsIHRo
ZQo+Pj4+Pj4+IHBhdGNoIHNob3VsZCBiZSBmaW5lLiBVc2luZyBhbiB1cHN0cmVhbSBrZXJuZWwg
YnVpbHQgZnJvbSBhYm92ZSBjb21taXQKPj4+Pj4+PiAod2l0aCB0aGUgdGhlbiBuZWVkZWQgWGVu
IGZpeHVwIHBhdGNoIDE0NTdkOGNmNzY2NGYzNGM0YmE1MzQpIGlzIGZpbmUsCj4+Pj4+Pj4gdG9v
Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gS2lyaWxsLCBhcmUgeW91IGF3YXJlIG9mIGFueSBwcmVyZXF1aXNp
dGUgcGF0Y2ggZnJvbSA0LjIwIHdoaWNoIGNvdWxkIGJlCj4+Pj4+Pj4gbWlzc2luZyBpbiA0LjE5
LjU/Cj4+Pj4+Pgo+Pj4+Pj4gSSdtIG5vdC4KPj4+Pj4+Cj4+Pj4+PiBMZXQgbWUgbG9vayBpbnRv
IHRoaXMuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBXaGF0IGlzIG1ha2luZyBtZSBzdXNwaWNpb3VzIGlz
IHRoZSBmYWlsdXJlIGhhcHBlbmluZyBqdXN0IGFmdGVyCj4+Pj4+IHJlbGVhc2luZyB0aGUgaW5p
dCBtZW1vcnkuIE1heWJlIHRoZXJlIGlzIGFuIGFjY2VzcyB0byAuaW5pdC5kYXRhCj4+Pj4+IHNl
Z21lbnQgb3Igc2ltaWxhcj8gVGhlIG5hdGl2ZSBrZXJuZWwgYm9vdGluZyBjb3VsZCBiZSByZWxh
dGVkIHRvIHRoZQo+Pj4+PiB1c2FnZSBvZiAyTSBtYXBwaW5ncyBub3QgYmVpbmcgYXZhaWxhYmxl
IGluIGEgUFYtZG9tYWluLgo+Pj4+Cj4+Pj4gRGlkIHRoaXMgZXZlciBnZXQgZml4ZWQgYW55d2hl
cmUgdGhhdCBJIGNhbiBwcm9wZXJseSBiYWNrcG9ydCBpdCB0byB0aGUKPj4+PiA0LjE5LnkgdHJl
ZT8KPj4+Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgxMTMwMjAyMzI4LjY1
MzU5LTIta2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbS8KPj4+Cj4+PiBTdGlsbCBwZW5k
aW5nIHVwc3RyZWFtLiBKdXN0IHBpbmdlZCB0Z2x4Lgo+Pgo+PiBUaGFua3MsIGl0IHNob3VsZCBo
YXZlIGdvdHRlbiBhIGNjOiBzdGFibGVAIHRhZywgYnV0IEkgY2FuIHdhdGNoIG91dCBmb3IKPj4g
aXQuLi4KPiAKPiBJdCdzIHVwc3RyZWFtIG5vdzogY29tbWl0IDE2ODc3YTU1NzBlMGM1ZjQyNzBk
NWIxN2Y5YmFiNDI3YmNhZTk1MTQKCkFueSByZWFzb24geW91IGRpZG4ndCBpbmNsdWRlIHRoaXMg
cGF0Y2ggaW4gNC4xOS4xND8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
