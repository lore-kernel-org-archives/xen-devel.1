From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH L1TF v8 2/9] x86/vioapic: block speculative
 out-of-bound accesses
Date: Mon, 25 Feb 2019 21:03:01 +0100
Message-ID: <cacc3c26-f7d0-317a-1820-def3eea2b537@suse.com>
References: <1551101683-996-1-git-send-email-nmanthey@amazon.de>
 <1551101683-996-3-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gyMSu-0000aH-NJ
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 20:03:04 +0000
In-Reply-To: <1551101683-996-3-git-send-email-nmanthey@amazon.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDIvMjAxOSAxNDozNCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IFdoZW4gaW50ZXJh
Y3Rpbmcgd2l0aCBpbyBhcGljLCBhIGd1ZXN0IGNhbiBzcGVjaWZ5IHZhbHVlcyB0aGF0IGFyZSB1
c2VkCj4gYXMgaW5kZXggdG8gc3RydWN0dXJlcywgYW5kIHdob3NlIHZhbHVlcyBhcmUgbm90IGNv
bXBhcmVkIGFnYWluc3QKPiB1cHBlciBib3VuZHMgdG8gcHJldmVudCBzcGVjdWxhdGl2ZSBvdXQt
b2YtYm91bmQgYWNjZXNzZXMuIFRoaXMgY2hhbmdlCj4gcHJldmVudHMgdGhlc2Ugc3BlY3VsYXRp
dmUgYWNjZXNzZXMuCj4gCj4gRnVydGhlcm1vcmUsIHZhcmlhYmxlcyBhcmUgaW5pdGlhbGl6ZWQg
YW5kIHRoZSBjb21waWxlciBpcyBhc2tlZCB0byBub3QKPiBvcHRpbWl6ZWQgdGhlc2UgaW5pdGlh
bGl6YXRpb25zLCBhcyB0aGUgdW5pbml0aWFsaXplZCB2YXJpYWJsZXMgbWlnaHQgYmUKPiB1c2Vk
IGluIGEgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzcy4gT3V0IG9mIHRoZSBmb3VyIGlu
aXRpYWxpemVkCj4gdmFyaWFibGVzLCB0d28gYXJlIHBvdGVudGlhbGx5IHByb2JsZW1hdGljLCBu
YW1lbHkgb25lcyBpbiB0aGUgZnVuY3Rpb25zCj4gdmlvYXBpY19pcnFfcG9zaXRpdmVfZWRnZSBh
bmQgdmlvYXBpY19nZXRfdHJpZ2dlcl9tb2RlLgo+IAo+IEFzIHRoZSB0d28gcHJvYmxlbWF0aWMg
dmFyaWFibGVzIGFyZSBib3RoIHVzZWQgaW4gdGhlIGNvbW1vbiBmdW5jdGlvbgo+IGdzaV92aW9h
cGljLCB0aGUgbWl0aWdhdGlvbiBpcyBpbXBsZW1lbnRlZCB0aGVyZS4gQXMgdGhlIGFjY2VzcyBw
YXR0ZXJuCj4gb2YgdGhlIGN1cnJlbnRseSBub24tZ3Vlc3QtY29udHJvbGxlZCBmdW5jdGlvbnMg
bWlnaHQgY2hhbmdlIGluIHRoZQo+IGZ1dHVyZSBhcyB3ZWxsLCB0aGUgb3RoZXIgdmFyaWFibGVz
IGFyZSBpbml0aWFsaXplZCBhcyB3ZWxsLgo+IAo+IFRoaXMgaXMgcGFydCBvZiB0aGUgc3BlY3Vs
YXRpdmUgaGFyZGVuaW5nIGVmZm9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRo
ZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
