From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 3/9] spec: add l1tf-barrier
Date: Fri, 22 Feb 2019 06:13:20 -0700
Message-ID: <5C6FF57002000078002192CB@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-4-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAfj-0006QH-RZ
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:15:23 +0000
In-Reply-To: <1550737003-25779-4-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBU
byBjb250cm9sIHRoZSBydW50aW1lIGJlaGF2aW9yIG9uIEwxVEYgdnVsbmVyYWJsZSBwbGF0Zm9y
bXMgYmV0dGVyLCB0aGUKPiBjb21tYW5kIGxpbmUgb3B0aW9uIGwxdGYtYmFycmllciBpcyBpbnRy
b2R1Y2VkLiBUaGlzIG9wdGlvbiBjb250cm9scwo+IHdoZXRoZXIgb24gdnVsbmVyYWJsZSB4ODYg
cGxhdGZvcm1zIHRoZSBsZmVuY2UgaW5zdHJ1Y3Rpb24gaXMgdXNlZCB0bwo+IHByZXZlbnQgc3Bl
Y3VsYXRpdmUgZXhlY3V0aW9uIGZyb20gYnlwYXNzaW5nIHRoZSBldmFsdWF0aW9uIG9mCj4gY29u
ZGl0aW9uYWxzIHRoYXQgYXJlIHByb3RlY3RlZCB3aXRoIHRoZSBldmFsdWF0ZV9ub3NwZWMgbWFj
cm8uCj4gCj4gQnkgbm93LCBYZW4gaXMgY2FwYWJsZSBvZiBpZGVudGlmeWluZyBMMVRGIHZ1bG5l
cmFibGUgaGFyZHdhcmUuIEhvd2V2ZXIsCj4gdGhpcyBpbmZvcm1hdGlvbiBjYW5ub3QgYmUgdXNl
ZCBmb3IgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcsIGFzIGEgQ1BVIGZlYXR1cmUKPiBpcyByZXF1aXJl
ZC4gVG8gY29udHJvbCBhbHRlcm5hdGl2ZSBwYXRjaGluZyB3aXRoIHRoZSBjb21tYW5kIGxpbmUg
b3B0aW9uLAo+IGEgbmV3IHg4NiBmZWF0dXJlICJYODZfRkVBVFVSRV9TQ19MMVRGX1ZVTE4iIGlz
IGludHJvZHVjZWQuIFRoaXMgZmVhdHVyZQo+IGlzIHVzZWQgdG8gcGF0Y2ggdGhlIGxmZW5jZSBp
bnN0cnVjdGlvbiBpbnRvIHRoZSBhcmNoX2JhcnJpZXJfbm9zcGVjX3RydWUKPiBmdW5jdGlvbi4g
VGhlIGZlYXR1cmUgaXMgZW5hYmxlZCBvbmx5IGlmIEwxVEYgdnVsbmVyYWJsZSBoYXJkd2FyZSBp
cwo+IGRldGVjdGVkIGFuZCB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiBkb2VzIG5vdCBwcmV2ZW50
IHVzaW5nIHRoaXMgZmVhdHVyZS4KPiAKPiBUaGUgc3RhdHVzIG9mIGh5cGVydGhyZWFkaW5nIGlz
IGNvbnNpZGVyZWQgd2hlbiBhdXRvbWF0aWNhbGx5IGVuYWJsaW5nCj4gYWRkaW5nIHRoZSBsZmVu
Y2UgaW5zdHJ1Y3Rpb24uIFNpbmNlIHBsYXRmb3JtcyB3aXRob3V0IGh5cGVydGhyZWFkaW5nIGNh
bgo+IHN0aWxsIGJlIHZ1bG5lcmFibGUgdG8gTDFURiBpbiBjYXNlIHRoZSBMMSBjYWNoZSBpcyBu
b3QgZmx1c2hlZCBwcm9wZXJseSwKPiB0aGUgYWRkaXRpb25hbCBsZmVuY2UgaW5zdHJ1Y3Rpb25z
IGFyZSBwYXRjaGVkIGluIGlmIGVpdGhlciBoeXBlcnRocmVhZGluZwo+IGlzIGVuYWJsZWQsIG9y
IEwxIGNhY2hlIGZsdXNoaW5nIGlzIG1pc3NpbmcuCj4gCj4gVGhpcyBpcyBwYXJ0IG9mIHRoZSBz
cGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQg
TWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbmUgcmVtYXJrOgoKPiBAQCAtODQyLDYgKzg0OSwxMiBA
QCB2b2lkIF9faW5pdCBpbml0X3NwZWN1bGF0aW9uX21pdGlnYXRpb25zKHZvaWQpCj4gICAgICBl
bHNlIGlmICggb3B0X2wxZF9mbHVzaCA9PSAtMSApCj4gICAgICAgICAgb3B0X2wxZF9mbHVzaCA9
IGNwdV9oYXNfYnVnX2wxdGYgJiYgIShjYXBzICYgQVJDSF9DQVBTX1NLSVBfTDFERkwpOwo+ICAK
PiArICAgIC8qIEJ5IGRlZmF1bHQsIGVuYWJsZSBMMVRGX1ZVTE4gb24gTDFURi12dWxuZXJhYmxl
IGhhcmR3YXJlICovCj4gKyAgICBpZiAoIG9wdF9sMXRmX2JhcnJpZXIgPT0gLTEgKQo+ICsgICAg
ICAgIG9wdF9sMXRmX2JhcnJpZXIgPSBjcHVfaGFzX2J1Z19sMXRmICYmIChvcHRfc210ICE9IDAg
fHwgb3B0X2wxZF9mbHVzaCA9PSAwKTsKCldlIGNvbW1vbmx5IG9taXQgIiE9IDAiIGFuZCB1c2Ug
ISBpbnN0ZWFkIG9mICI9PSAwIi4gSWYgSSBlbmQKdXAgY29tbWl0dGluZyB0aGlzLCBJIG1heSB0
YWtlIHRoZSBsaWJlcnR5IG9mIGNoYW5naW5nIHRoZXNlLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
