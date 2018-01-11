From: Hans van Kranenburg <hans@knorrie.org>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Thu, 11 Jan 2018 16:25:03 +0100
Message-ID: <49d1ecfb-8528-1e54-9be3-8f5728696b6b@knorrie.org>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CAFLBxZbsNZR5h1a9aCHZwMs7xiq6_qOs+2Ptj4A7qWTtNqE6iA@mail.gmail.com>
 <alpine.DEB.2.10.1801090821190.4603@sstabellini-ThinkPad-X260>
 <CA+aC4kuWr00CmQeLAh0szYZDdNRCWBLSqu65TaQ1hBWTuXcnFA@mail.gmail.com>
 <5A550AF5020000780019CDF4@prv-mh.provo.novell.com>
 <819ffe6b-6399-507c-4e31-2f0babb49684@cardoe.com>
 <alpine.DEB.2.10.1801090951520.4603@sstabellini-ThinkPad-X260>
 <83F1313F-A31A-42FF-B1A3-A169729A391F@gmail.com>
 <554aa43b-1776-339d-dbd1-61e667d397bd@knorrie.org>
 <e64a4bc5-b93f-6717-07cd-782d05722dbc@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=lx43=eg=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1eZej9-0000lR-TG
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 15:25:11 +0000
In-Reply-To: <e64a4bc5-b93f-6717-07cd-782d05722dbc@suse.com>
Content-Language: en_US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMjAxOCAwNjo1MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwOS8wMS8x
OCAyMzoxMSwgSGFucyB2YW4gS3JhbmVuYnVyZyB3cm90ZToKPj4gT24gMDEvMDkvMjAxOCAwNzoy
MiBQTSwgUmljaCBQZXJzYXVkIHdyb3RlOgo+Pj4KPj4KPj4+IFNpbmNlIHRoZSBwcmltYXJ5IGF1
ZGllbmNlIGZvciBzZWN1cml0eSBmaXhlcyBhcmUgcHJvZHVjdGlvbgo+Pj4gZGVwbG95bWVudHMg
b2YgWGVuIHdoZXJlIGN1c3RvbWVyIGFzc2V0cyBhcmUgYXQgcmlzaywgaXMgdGhlcmUgYW4KPj4+
IGVzdGltYXRlIGZvciB0aGUgcGVyY2VudGFnZS9zaXplIG9mIFhlbiBkZXBsb3ltZW50cyB3aGVy
ZSBQVkggKG5vdAo+Pj4gb25seSBYZW4gNC4xMCkgaGFzIGFscmVhZHkgYmVlbiBkZXBsb3llZCBm
b3IgcHJvZHVjdGlvbiBjdXN0b21lcnM/Cj4+PiBUaGF0IGNvdWxkIGdpdmUgb3RoZXIgY3VzdG9t
ZXJzIG1vcmUgY29uZmlkZW5jZSBpbiBkZXBsb3lpbmcgUFZIIGluCj4+PiBwcm9kdWN0aW9uLgo+
PiArMQo+Pgo+PiBJIGhhdmUgYmVlbiBoZWFyaW5nIG1vc3RseS12ZXJ5LXBvc2l0aXZlIHN0b3Jp
ZXMgYXJvdW5kLCBleGNlcHQgZm9yIHRoZQo+PiBtaXNzaW5nIHB2Z3J1YjIgc3VwcG9ydC4gOikK
PiAKPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0x
MS9tc2cwMTc5NS5odG1sCgpBaCB0aGFua3MuIEkgYWxzbyBmb3VuZCB0aGUgbGlua3MgdG8ga2Vy
bmVsIGNoYW5nZXMgYW5kIGEgeGVuIGNoYW5nZS4KCmh0dHA6Ly9saXN0cy5nbnUub3JnL2FyY2hp
dmUvaHRtbC9ncnViLWRldmVsLzIwMTctMTIvbXNnMDAwMDIuaHRtbAoKSSdtIGdvaW5nIHRvIHBs
YXkgYXJvdW5kIHdpdGggaXQsIHNlZSBpZiBJIGNhbiBnZXQgaXQgcnVubmluZy4gQmVpbmcKYWJs
ZSB0byB1c2UgcHZncnViMiB3aWxsIG1lYW4gZW5kaW5nIHVwIHdpdGggYW4gaW5jcmVkaWJseSBz
bW9vdGgKbWlncmF0aW9uIHBhdGggdG8gWGVuIDQuMTAgYW5kIFBWSHYyLi4uCgpIYW5zCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
