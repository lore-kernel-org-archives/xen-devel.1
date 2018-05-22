From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Add fake_s3 command-line option for
 testing
Date: Tue, 22 May 2018 04:53:25 -0600
Message-ID: <5B03F6A502000078001C4967@prv1-mh.provo.novell.com>
References: <20180521141600.5516-1-george.dunlap@citrix.com>
 <72b85eed-79e8-25da-0558-c431e71761b9@citrix.com>
 <7328297b-69c8-3a86-633f-27a29b1f1bc1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qj7d=ij=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fL4v3-0005zQ-Np
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 10:53:29 +0000
In-Reply-To: <7328297b-69c8-3a86-633f-27a29b1f1bc1@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Ben Guthro <benjamin.guthro@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA1LjE4IGF0IDE3OjMzLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwNS8yMS8yMDE4IDAzOjI4IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAy
MS8wNS8xOCAxNToxNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IE1vc3Qgc2VydmVyLWNsYXNz
IGhhcmR3YXJlIGRvZXNuJ3Qgc3VwcG9ydCBBQ1BJIFMzIHN1c3BlbmQ7IGJ1dCBtb3N0Cj4+PiBi
dWdzIHdlJ2xsIHJ1biBhY3Jvc3Mgd29uJ3QgbmVlZCBhY3R1YWwgUzMgdG8gdHJpZ2dlci4gIEFk
ZCBhCj4+PiBjb21tYW5kLWxpbmUgcGFyYW1ldGVyIGZvciBhICJmYWtlIiBTMywgd2hpY2ggd2ls
bCBkbyBldmVyeXRoaW5nCj4+PiBkdXJpbmcgc3VzcGVuZC9yZXN0b3JlIGV4Y2VwdCBhY3R1YWxs
eSBjYWxsaW5nIGludG8gdGhlIEFDUEkgUzMKPj4+IGhhbmRsZXIuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogQmVuIEd1dGhybyA8YmVuamFtaW4uZ3V0aHJvQGNpdHJpeC5jb20+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+PiAtLS0K
Pj4+IFRoaXMgd2FzIG9yaWdpbmFsbHkgcG9zdGVkIGluIDIwMTMsIGJ1dCBuZXZlciBhY3R1YWxs
eSBjaGVja2VkIGluLgo+Pj4KPj4+IEkndmUgcmVtb3ZlZCBhbiBleHRyYW5lb3VzIGxpbmUsIGFu
ZCBjaGFuZ2VkIHRoZSB1bmRlcnNjb3JlIGluIHRoZQo+Pj4gb3B0aW9uIGludG8gYSBkYXNoIChh
cyBKYW4gc2VlbXMgdG8gcHJlZmVyKS4KPj4+Cj4+PiBDb21waWxlLXRlc3RlZCBvbmx5Lgo+Pj4K
Pj4+IElmIHdlIHdhbnQgb3NzdGVzdCB0byBiZSBhYmxlIHRvIHRlc3QgdGhpcyBmdW5jdGlvbmFs
aXR5IGl0IHNob3VsZAo+Pj4gcHJvYmFibHkgYmUgYmFja3BvcnRlZC4KPj4+Cj4+PiBDQzogSWFu
IEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cj4+PiBDQzogRGFyaW8gRmFnZ2lvbGkg
PGRmYWdnaW9saUBzdXNlLmNvbT4KPj4+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+Pj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+
IENDOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+Cj4+IAo+PiBib29sX3QgPT4gYm9vbCwgZHJvcCB0aGUgcmVkdW5kYW50IGluaXRp
YWxpc2VyLCBhbmQgeW91IG5lZWQgdG8gcGF0Y2gKPj4geGVuLWNvbW1hbmQtbGluZS5tYXJrZG93
bi4KPiAKPiBIbW0sIGFjdHVhbGx5IC0tIHdvdWxkIGl0IG1ha2UgbW9yZSBzZW5zZSB0byBhZGQg
dGhpcyBhcyBhbiBvcHRpb24gdG8KPiBhY3BpX3NsZWVwPyAgZS5nLiwgImFjcGlfc2xlZXA9czNf
ZmFrZSI/ICAoQWxvbmcgd2l0aCBzM19iaW9zIGFuZCBzM19tb2RlPykKCisxCgpKYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
