From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/IRQ: ACKTYPE_NONE cannot make it
 into irq_guest_eoi_timer_fn()
Date: Thu, 16 May 2019 08:48:29 -0600
Message-ID: <5CDD783D020000780022FC70@prv1-mh.provo.novell.com>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
 <20190516135208.h4njprgd477gfww2@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRHgP-0007FU-1O
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 14:48:33 +0000
In-Reply-To: <20190516135208.h4njprgd477gfww2@Air-de-Roger>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgTWF5IDA4LCAyMDE5IGF0IDA2OjQ4OjE2QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBhY3Rpb24tPmFja190eXBlIGlzIHNldCBvbmNlIGJlZm9yZSB0aGUgdGltZXIgZXZl
biBnZXRzIGluaXRpYWxpemVkLCBhbmQKPj4gaXMgbmV2ZXIgY2hhbmdlZCBsYXRlci4gVGhlIHRp
bWVyIGdldHMgYWN0aXZhdGVkIG9ubHkgZm9yIEVPSSBhbmQgVU5NQVNLCj4+IHR5cGVzLiBIZW5j
ZSB0aGVyZSdzIG5vIG5lZWQgdG8gaGF2ZSBhIHJlc3BlY3RpdmUgaWYoKSBpbiB0aGVyZS4gUmVw
bGFjZQo+PiBpdCBieSBhbiBBU1NFUlQoKS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgo+PiBAQCAtMTExNCwxOSArMTExNCwx
OCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3RpbWVyX2ZuKHZvaWQKPj4gIAo+PiAgICAg
IGFjdGlvbiA9IChpcnFfZ3Vlc3RfYWN0aW9uX3QgKilkZXNjLT5hY3Rpb247Cj4+ICAKPj4gKyAg
ICBBU1NFUlQoYWN0aW9uLT5hY2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUpOwo+PiArCj4+ICAgICAg
aWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24tPmVvaV90
aW1lcikgKQo+PiAgICAgICAgICBnb3RvIG91dDsKPj4gIAo+PiAtICAgIGlmICggYWN0aW9uLT5h
Y2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUgKQo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9u
LT5ucl9ndWVzdHM7IGkrKyApCj4+ICAgICAgewo+PiAtICAgICAgICB1bnNpZ25lZCBpbnQgaTsK
Pj4gLSAgICAgICAgZm9yICggaSA9IDA7IGkgPCBhY3Rpb24tPm5yX2d1ZXN0czsgaSsrICkKPj4g
LSAgICAgICAgewo+PiAtICAgICAgICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGFjdGlvbi0+Z3Vl
c3RbaV07Cj4gCj4gSSB0aGluayB5b3UgY291bGQgY29uc3RpZnkgZCBoZXJlLgoKQWggeWVzLCB0
aGlzIHNob3VsZCB3b3JrLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
