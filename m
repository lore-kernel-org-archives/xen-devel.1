From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 2/2] libxl: fix build (missing
 CLONE_NEWIPC) on astonishingly old systems
Date: Mon, 14 Jan 2019 14:22:11 +0000
Message-ID: <23612.39699.704402.366144@mariner.uk.xensource.com>
References: <20190111182706.GA2199@perard.uk.xensource.com>
 <20190111192328.25242-1-ian.jackson@eu.citrix.com>
 <4C7EABEB02000006B8D7C7D4@prv1-mh.provo.novell.com>
 <9E406FBD020000569DFFD529@prv1-mh.provo.novell.com>
 <9E4077BD020000969DFFD529@prv1-mh.provo.novell.com>
 <81E41643020000ABCFD95477@prv1-mh.provo.novell.com>
 <CE47AFED020000429DFFD529@prv1-mh.provo.novell.com>
 <5C3C5ACE020000780020D1C3@prv1-mh.provo.novell.com>
 <20190114113739.wv5an34y3jdtmb35@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3TbD=PW=citrix.com=prvs=910b85111=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gj39X-00044T-S0
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 14:23:47 +0000
In-Reply-To: <20190114113739.wv5an34y3jdtmb35@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDIvMl0gbGlieGw6IGZpeCBidWlsZCAobWlz
c2luZyBDTE9ORV9ORVdJUEMpIG9uIGFzdG9uaXNoaW5nbHkgb2xkIHN5c3RlbXMiKToKPiBPbiBN
b24sIEphbiAxNCwgMjAxOSBhdCAwMjo0Nzo1OEFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+IE9uIDExLjAxLjE5IGF0IDIwOjIzLCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiA+IENMT05FX05FV0lQQyB3YXMgaW50cm9kdWNlZCBpbiBMaW51eCAyLjYuMTksIG9u
IHRoZSAyOXRoIG9mIE5vdmVtYmVyCj4gPiA+IDIwMDYsIHdoaWNoIHdhcyAxMiB5ZWFycywgMSBt
b250aCwgYW5kIDE0IGRheXMgYWdvLgo+ID4gCj4gPiBUaGFua3MgZm9yIHRoZSB2ZXJ5IHByZWNp
c2UgY291bnRpbmcsIHRoZSBsYXR0ZXIgcGFydCB3aGljaCB3aWxsIGJlCj4gPiB3cm9uZyAtIGV2
ZW4gaWYganVzdCBzbGlnaHRseSAtIGJ5IHRoZSB0aW1lIHlvdSBjb21taXQgaXQgOy0pCi4uLgo+
ID4gU2FkbHkgdGhlIHNpdHVhdGlvbiBpcyBtb3JlIGNvbXBsaWNhdGVkOiBUaGUgY2hlY2sgdG8g
ZGlzYWxsb3cKPiA+IHVua25vd24gZmxhZ3Mgd2FzIGludHJvZHVjZWQgb25seSBpbiAyLjYuMTcg
WzFdLCBhbmQgYXBwYXJlbnRseQo+ID4gbmV2ZXIgYmFja3BvcnRlZCB0byAyLjYuMTYgb3Igb2xk
ZXIgc3RhYmxlIHRyZWVzIGRlc3BpdGUgdGhlCj4gPiBkZXNjcmlwdGlvbiB0YWxraW5nIGFib3V0
IGl0IGdvaW5nIGludG8gMi42LjE2LiBTaW5jZSBpdCBkaWRuJ3QKPiA+IG1hdHRlciBpbiBteSB2
YXJpYW50IG9mIHRoZSB3b3JrYXJvdW5kLCBJIGRpZG4ndCBtZW50aW9uIHRoaXMuCgpHb29kIGdy
aWVmLgoKPiA+IE9mIGNvdXJzZSBhIHByZXR0eSByZWFzb25hYmxlIHBvc2l0aW9uIHRvIHRha2Ug
d291bGQgYmUgdG8KPiA+IGNvbnNpZGVyIHRoZSAyLjYuMTgtYmFzZWQgWGVub0xpbnV4IHRyZWUg
YSAiYmFzZWxpbmUiLCBiZXlvbmQKPiA+IHdoaWNoIHdlIGRvbid0IGNhcmUgYWJvdXQgdW5kZXNp
cmFibGUgYmVoYXZpb3IgaGVyZS4KPiAKPiBJIHRoaW5rIHVzaW5nIDIuNi4xOCBhcyBiYXNlbGlu
ZSBpcyB2ZXJ5IHJlYXNvbmFibGUuIAoKSSBndWVzcyB3ZSBuZWVkIHRvIHdyaXRlIHRoaXMgaW4g
dGhlIFNVUFBPUlQubWQgc3RhdGVtZW50IGZvcgpkbV9yZXN0cmljdC4KClRCSCBob3cgYWJvdXQg
d3JpdGluZyBzb21ld2hlcmUgZ2VuZXJhbCBpbiBTVVBQT1JULm1kIHRoYXQgImFsbCBiZXRzCmFy
ZSBvZmYgaWYgeW91IHVzZSBMaW51eCBiZWZvcmUgMi42LjE4IiA/ICBEbyB3ZSBldmVuIGhhdmUg
YSBsaW1pdAphbnl3aGVyZSBmb3Igc2VjdXJpdHkgc3VwcG9ydGVkIExpbnV4IHZlcnNpb25zID8K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
