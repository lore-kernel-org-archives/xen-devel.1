From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/HVM: alter completion-needed
 checking
Date: Mon, 09 Apr 2018 07:43:49 -0600
Message-ID: <5ACB8A3502000078001B99AC@prv1-mh.provo.novell.com>
References: <5ACB849B02000078001B9934@prv1-mh.provo.novell.com>
 <5ACB85AB02000078001B9950@prv1-mh.provo.novell.com>
 <4e7a4f94e0c941ed92f0b48227b3c30a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=shlr=g6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5X5O-00029c-IP
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 13:43:54 +0000
In-Reply-To: <4e7a4f94e0c941ed92f0b48227b3c30a@AMSPEX02CL03.citrite.net>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA0LjE4IGF0IDE1OjMzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDkgQXByaWwgMjAxOCAxNDoyNAo+PiBU
bzogeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4+IENjOiBBbmRy
ZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50Cj4+IDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVs
LmNvbT47IEtldmluCj4+IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPjsgSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSB4ODYvSFZNOiBhbHRl
ciBjb21wbGV0aW9uLW5lZWRlZCBjaGVja2luZwo+PiAKPj4gVGhlIGZ1bmN0aW9uIG9ubHkgbG9v
a3MgYXQgdGhlIGlvcmVxX3QsIHNvIHBhc3MgaXQgYSBwb2ludGVyIHRvIGp1c3QKPj4gdGhhdC4g
QWxzbyB1c2UgaXQgaW4gaHZtZW11bF9kb19pbygpLgo+PiAKPj4gU3VnZ2VzdGVkLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiBSRkM6IFdoaWxlIHRoaXMgYXZv
aWRzIHNvbWUgb3BlbiBjb2RpbmcsIGdlbmVyYXRlZCBjb2RlIGxvb2tzIHRvIGJlCj4+ICAgICAg
d29yc2UgZm9yIHRoYXQgcGFydGljdWxhciBjYXNlLiBJJ20gdGhlcmVmb3JlIG5vdCBjZXJ0YWlu
IHRoYXQgd2UKPj4gICAgICB3YW50IHRoaXMgY2hhbmdlIChvciBwZXJoYXBzIGp1c3QgdGhlIGZ1
bmN0aW9uIG5hbWUvc2lnbmF0dXJlCj4+ICAgICAgY2hhbmdlIHBvcnRpb24pLgo+PiAKPiAKPiBG
QU9EIG15IHJlYXNvbiBmb3Igc3VnZ2VzdGluZyBpdCB3YXMgc3VjaCB0aGF0IGV4YWN0bHkgdGhl
IHNhbWUgdGVzdCAKPiBpbXBsZW1lbnRhdGlvbiBpcyB1c2VkIGluIGFsbCBjYXNlcyB0byBkZWNp
ZGUgd2hldGhlciBJL08gY29tcGxldGlvbiBpcyAKPiBuZWVkZWQuCgpTbyBkb2VzIHRoYXQgbWVh
biB5b3UgdGhpbmsgdGhlIGNoYW5nZSBpcyB3b3J0aHdoaWxlPyBJZiBzbywgZG8KeW91IGhhdmUg
YW55IGNvbW1lbnRzLCBvciBhcmUgeW91IHdpbGxpbmcgdG8gYWNrIGl0IChkZXNwaXRlIGl0Cm5v
dCByZWFsbHkgYmVpbmcgYSA0LjExIGNhbmRpZGF0ZSBhdCB0aGlzIHBvaW50IGluIHRpbWUpPwoK
SmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
