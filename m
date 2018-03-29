From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: possible I/O emulation state machine issue
Date: Thu, 29 Mar 2018 00:27:26 -0600
Message-ID: <5ABCA36E02000078001B6FF0@prv1-mh.provo.novell.com>
References: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
 <9038fd3e-6726-0418-8ce6-e023efb9f012@citrix.com>
 <5AB4BB1E02000078001B5633@gwmail.emea.novell.com>
 <cee96de9e1e94475bc55b3add0f14a44@AMSPEX02CL03.citrite.net>
 <5AB4F4A102000078001B5815@gwmail.emea.novell.com>
 <45c762bb12af4d3289060a452a58e8ec@AMSPEX02CL03.citrite.net>
 <5AB8CE9602000078001B5F5F@prv1-mh.provo.novell.com>
 <af3e3bd283ec4ad89fc8bcfc956d3f1d@AMSPEX02CL03.citrite.net>
 <5ABBD7F202000078001B6E27@prv1-mh.provo.novell.com>
 <1c787264bd5f4be397b3a3b27479d0c2@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fhp7=gt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1R23-0002Ri-JD
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 06:27:31 +0000
In-Reply-To: <1c787264bd5f4be397b3a3b27479d0c2@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE4IGF0IDE4OjIyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyOCBNYXJjaCAyMDE4IDE2OjU5Cj4+IAo+PiBTaW1wbHkgdGltaW5nLCBwZXJoYXBzLiBJbiBh
bnkgZXZlbnQsIG5ld2VzdCBsb2dzIHN1Z2dlc3Qgd2UgaGF2ZQo+PiBhbiBpc3N1ZSB3aXRoIFdp
bmRvd3MgcGFnaW5nIG91dCB0aGUgcGFnZSB0aGUgZGF0YSBmb3IgdGhlCj4+IFJFUCBPVVRTVyBp
cyBjb21pbmcgZnJvbSB3aGlsZSB0aGUgcG9ydCBJL08gcGFydCBvZiB0aGUgb3BlcmF0aW9uCj4+
IGlzIHBlbmRpbmcgcWVtdSdzIGNvbXBsZXRpb24uIFVwb24gcmV0cnkgdGhlIGxpbmVhci0+cGh5
c2ljYWwKPj4gdHJhbnNsYXRpb24gZmFpbHMsIGFuZCB3ZSBsZWF2ZSBpbmNvcnJlY3Qgc3RhdGUg
aW4gcGxhY2UuCj4+IAo+PiBJIHRob3VnaHQgd2UgY2FjaGUgdGhlIHRyYW5zbGF0aW9uIHJlc3Vs
dCwgdGh1cyBhdm9pZGluZyB0aGUgbmVlZAo+PiBmb3IgYSB0cmFuc2xhdGlvbiBkdXJpbmcgdGhl
IHJldHJ5IGN5Y2xlLCBzbyBlaXRoZXIgSSdtIG1pc3JlbWVtYmVyaW5nCj4+IG9yIHRoaXMgZG9l
c24ndCB3b3JrIGFzIGludGVuZGVkLiBBbmQgaW4gZmFjdCBkb2luZyB0aGUgdHJhbnNsYXRpb24g
YQo+PiBzZWNvbmQgdGltZSAod2l0aCB0aGUgcG90ZW50aWFsIG9mIGl0IGZhaWxpbmcpIGlzIHdy
b25nIGhlcmUgLSB3aGVuIHRoZQo+PiBwb3J0IGFjY2VzcyBoYXMgb2NjdXJyZWQsIHdlIG11c3Qg
bm90IGZhaWwgdGhlIGVtdWxhdGlvbiBhbnltb3JlCj4+IChyZXBlYXRpbmcgdGhlIHBvcnQgd3Jp
dGUgd291bGQgcHJvYmFibHkgYmUgZmluZSBmb3IgdGhlIFZHQSwgYnV0Cj4+IHdvdWxkIGhhcmRs
eSBiZSBmaW5lIGZvciBlLmcuIGFuIElERSBpbnRlcmZhY2UpLgo+IAo+IFllcywgSSB0aG91Z2h0
IHdlIG1hZGUgc3VyZSBhbGwgcmVwcyB3ZXJlIGNvbXBsZXRlZCB1c2luZyBjYWNoZWQgCj4gdHJh
bnNsYXRpb25zIGJlZm9yZSByZXR1cm5pbmcgdG8gZ3Vlc3QuCgpXZSBkbyB0aGlzIG9ubHkgZm9y
IGFjdHVhbCBNTUlPIGFjY2Vzc2VzLCBub3QgZm9yIFJBTSBvbmVzLAphZmFpY3MuCgpJIHRoaW5r
IEkgc2VlIGEgd2F5IHRvIGRlYWwgd2l0aCB0aGUgc3BlY2lmaWMgY2FzZSBoZXJlLCBidXQgd2Un
bGwKY2VydGFpbmx5IG5lZWQgdG8gbWFrZSB0aGluZ3Mgd29yayBwcm9wZXJseSBpbiB0aGUgZ2Vu
ZXJhbCBjYXNlLgpUaGF0J3Mgbm90IHNvbWV0aGluZyByZWFzb25hYmxlIHRvIGJlIGRvbmUgZm9y
IDQuMTEgdGhvdWdoLgoKU3VwcHJlc3NpbmcgdGhlIHN0ZHZnYSBwb3J0IGludGVyY2VwdHMgaGFz
LCBidHcsIG5vdCBoZWxwZWQgdGhlCnNpdHVhdGlvbi4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
