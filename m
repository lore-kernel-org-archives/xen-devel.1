From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] libxl: fix build (missing
 CLONE_NEWIPC) on astonishingly old systems
Date: Mon, 14 Jan 2019 07:27:54 -0700
Message-ID: <5C3C9C6A020000780020D4C1@prv1-mh.provo.novell.com>
References: <20190111182706.GA2199@perard.uk.xensource.com>
 <20190111192328.25242-1-ian.jackson@eu.citrix.com>
 <4C7EABEB02000006B8D7C7D4@prv1-mh.provo.novell.com>
 <9E406FBD020000569DFFD529@prv1-mh.provo.novell.com>
 <9E4077BD020000969DFFD529@prv1-mh.provo.novell.com>
 <81E41643020000ABCFD95477@prv1-mh.provo.novell.com>
 <CE47AFED020000429DFFD529@prv1-mh.provo.novell.com>
 <5C3C5ACE020000780020D1C3@prv1-mh.provo.novell.com>
 <20190114113739.wv5an34y3jdtmb35@zion.uk.xensource.com>
 <23612.39699.704402.366144@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gj3FV-0004LF-8y
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 14:29:57 +0000
In-Reply-To: <23612.39699.704402.366144@mariner.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAxLjE5IGF0IDE1OjIyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDIvMl0gbGlieGw6IGZpeCBidWlsZCAo
bWlzc2luZyBDTE9ORV9ORVdJUEMpIAo+IG9uIGFzdG9uaXNoaW5nbHkgb2xkIHN5c3RlbXMiKToK
Pj4gT24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMDI6NDc6NThBTSAtMDcwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+ID4gT24gMTEuMDEuMTkgYXQgMjA6MjMsIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPiB3cm90ZToKPj4gPiA+IENMT05FX05FV0lQQyB3YXMgaW50cm9kdWNlZCBpbiBMaW51eCAy
LjYuMTksIG9uIHRoZSAyOXRoIG9mIE5vdmVtYmVyCj4+ID4gPiAyMDA2LCB3aGljaCB3YXMgMTIg
eWVhcnMsIDEgbW9udGgsIGFuZCAxNCBkYXlzIGFnby4KPj4gPiAKPj4gPiBUaGFua3MgZm9yIHRo
ZSB2ZXJ5IHByZWNpc2UgY291bnRpbmcsIHRoZSBsYXR0ZXIgcGFydCB3aGljaCB3aWxsIGJlCj4+
ID4gd3JvbmcgLSBldmVuIGlmIGp1c3Qgc2xpZ2h0bHkgLSBieSB0aGUgdGltZSB5b3UgY29tbWl0
IGl0IDstKQo+IC4uLgo+PiA+IFNhZGx5IHRoZSBzaXR1YXRpb24gaXMgbW9yZSBjb21wbGljYXRl
ZDogVGhlIGNoZWNrIHRvIGRpc2FsbG93Cj4+ID4gdW5rbm93biBmbGFncyB3YXMgaW50cm9kdWNl
ZCBvbmx5IGluIDIuNi4xNyBbMV0sIGFuZCBhcHBhcmVudGx5Cj4+ID4gbmV2ZXIgYmFja3BvcnRl
ZCB0byAyLjYuMTYgb3Igb2xkZXIgc3RhYmxlIHRyZWVzIGRlc3BpdGUgdGhlCj4+ID4gZGVzY3Jp
cHRpb24gdGFsa2luZyBhYm91dCBpdCBnb2luZyBpbnRvIDIuNi4xNi4gU2luY2UgaXQgZGlkbid0
Cj4+ID4gbWF0dGVyIGluIG15IHZhcmlhbnQgb2YgdGhlIHdvcmthcm91bmQsIEkgZGlkbid0IG1l
bnRpb24gdGhpcy4KPiAKPiBHb29kIGdyaWVmLgo+IAo+PiA+IE9mIGNvdXJzZSBhIHByZXR0eSBy
ZWFzb25hYmxlIHBvc2l0aW9uIHRvIHRha2Ugd291bGQgYmUgdG8KPj4gPiBjb25zaWRlciB0aGUg
Mi42LjE4LWJhc2VkIFhlbm9MaW51eCB0cmVlIGEgImJhc2VsaW5lIiwgYmV5b25kCj4+ID4gd2hp
Y2ggd2UgZG9uJ3QgY2FyZSBhYm91dCB1bmRlc2lyYWJsZSBiZWhhdmlvciBoZXJlLgo+PiAKPj4g
SSB0aGluayB1c2luZyAyLjYuMTggYXMgYmFzZWxpbmUgaXMgdmVyeSByZWFzb25hYmxlLiAKPiAK
PiBJIGd1ZXNzIHdlIG5lZWQgdG8gd3JpdGUgdGhpcyBpbiB0aGUgU1VQUE9SVC5tZCBzdGF0ZW1l
bnQgZm9yCj4gZG1fcmVzdHJpY3QuCgpBaCB5ZXMsIHdlIHNob3VsZC4KCj4gVEJIIGhvdyBhYm91
dCB3cml0aW5nIHNvbWV3aGVyZSBnZW5lcmFsIGluIFNVUFBPUlQubWQgdGhhdCAiYWxsIGJldHMK
PiBhcmUgb2ZmIGlmIHlvdSB1c2UgTGludXggYmVmb3JlIDIuNi4xOCIgPyAgRG8gd2UgZXZlbiBo
YXZlIGEgbGltaXQKPiBhbnl3aGVyZSBmb3Igc2VjdXJpdHkgc3VwcG9ydGVkIExpbnV4IHZlcnNp
b25zID8KCkkgZG9uJ3QgdGhpbmsgc28sIGFuZCBsZWF2aW5nIHRoaXMgc3BlY2lmaWMgY2FzZSBh
c2lkZSBpdCdzIGFsc28KdW5jbGVhciB0byBtZSB3aHkgd2Ugc2hvdWxkLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
