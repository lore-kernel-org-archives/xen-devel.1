From: Jason Cooper <xen@lakedaemon.net>
Subject: Re: reboot driver domain, vifX.Y = NO-CARRIER?
Date: Mon, 30 Apr 2018 18:17:54 +0000
Message-ID: <20180430181754.GK17249@io.lakedaemon.net>
References: <20180427150346.GA17249@io.lakedaemon.net>
 <1735e92a-7a38-a08d-2b5b-1481409b3dbd@citrix.com>
 <20180427153526.GB17249@io.lakedaemon.net>
 <d8a69ce8-f4ab-63a1-70d8-dc0ad73ef192@citrix.com>
 <20180427161416.GC17249@io.lakedaemon.net>
 <f8d5d228-ff93-c388-6e64-5e1d92c85f22@citrix.com>
 <20180427171352.wftxapwflz2gm6qn@citrix.com>
 <23271.13494.638544.432776@mariner.uk.xensource.com>
 <20180430161609.GH17249@io.lakedaemon.net>
 <CAFLBxZadX15mEQbFCa_C94WneY0NiaNfgXhz=Vw0xkjjmf4zqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jagd=ht=lakedaemon.net=xen@srs-us1.protection.inumbo.net>)
 id 1fDDNA-00045o-0L
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 18:18:00 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZadX15mEQbFCa_C94WneY0NiaNfgXhz=Vw0xkjjmf4zqQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VvcmdlLAoKT24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDU6Mzg6NTVQTSArMDEwMCwgR2Vv
cmdlIER1bmxhcCB3cm90ZToKPiBPbiBNb24sIEFwciAzMCwgMjAxOCBhdCA1OjE2IFBNLCBKYXNv
biBDb29wZXIgPHhlbkBsYWtlZGFlbW9uLm5ldD4gd3JvdGU6Cj4gPiBIaSBJYW4sCj4gPgo+ID4g
T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDQ6MjI6MzBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gPj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gcmVib290IGRyaXZlciBk
b21haW4sIHZpZlguWSA9IE5PLUNBUlJJRVI/Iik6Cj4gPj4gPiBUbyBpbXBsZW1lbnQgcmV1c2Vf
ZG9taWQgaW4gYSBzYW5lIHdheSwgZWl0aGVyIHRoZSB0b29sc3RhY2sgbmVlZHMgdG8KPiA+PiA+
IG1hbmFnZSBhbGwgZG9taWRzIGFuZCBhbHdheXMgc2V0cyBkb21pZCB3aGVuIGNyZWF0aW5nIGRv
bWFpbiBvciB0aGUKPiA+PiA+IGh5cGVydmlzb3IgbmVlZHMgdG8gY29vcGVyYXRlIC0tIHRvIGhh
dmUgaW50ZXJmYWNlIHRvIHJlc2VydmUgLwo+ID4+ID4gcHJlLWFsbG9jYXRlIGRvbWlkcy4KPiA+
Pgo+ID4+IEkgdGhpbmsgdGhpcyBpcyBlbnRpcmVseSB0aGUgd3JvbmcgYXBwcm9hY2guCj4gPgo+
ID4gV2hldy4gIEdsYWQgSSBkaWRuJ3Qgc3RhcnQgaGFja2luZyB5ZXQuLi4KPiA+Cj4gPj4gSSB0
aGluayB0aGUgcmlnaHQgYW5zd2VyIGlzIHRoYXQgdGhpcyBpcyBzaW1wbHkgYSBidWcgaW4gdGhl
Cj4gPj4gZnJvbnRlbmRzLiAgZnJvbnRlbmRzIHNob3VsZCBjb3BlIGlmIHRoZSBiYWNrZW5kIHBh
dGggcG9pbnRlciBpbiB0aGUKPiA+PiBmcm9udGVuZCBkaXJlY3RvcnkgaXMgdXBkYXRlZCwgYW5k
IHNob3VsZCBzdGFydCByZWFkaW5nIHRoZSBuZXcKPiA+PiBiYWNrZW5kIGluc3RlYWQuCj4gPgo+
ID4gT2ssIHNvIEknbSBuZXcgdG8gdGhlIGd1dHMgb2YgWGVuLiAgVGhlIGJ1ZywgYXQgYSBoaWdo
IGxldmVsLCBpcyB0aGF0Cj4gPiAiV2hlbiBhIGRyaXZlciBkb21haW4gaXMgcmVib290ZWQgKGRv
bWlkIGNoYW5nZWQpLCBwcmV2aW91c2x5IGNvbm5lY3RlZAo+ID4gY2xpZW50IGRvbVVzIGNhbid0
IGdhaW4gbmV0d29yayBjb25uZWN0aXZpdHkgdG8vdGhyb3VnaCB0aGUgZHJpdmVyCj4gPiBkb21h
aW4gdmlhICd4bCBuZXR3b3JrLWF0dGFjaCBjbGllbnRfZG9tdSBtYWM9Li4uIGJyaWRnZT0uLi4K
PiA+IGJhY2tlbmQ9ZHJ2X2RvbSciCj4gCj4gSGFuZyBvbiAtLSBqdXN0IHRvIGNsYXJpZnksIHNv
bWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgZG9lc24ndCB3b3JrCj4gKG9yIHdvdWxkbid0LCB5
b3Ugc3VzcGVjdCwgd29yayk/Cj4gCj4gKiBTdGFydCBkcml2ZXIgZG9tYWluCj4gKiBTdGFydCBk
b21VIEEgd2l0aCBubyBuZXR3b3JrCgpNeSBzZXR1cCBpcyBkaWZmZXJlbnQgaGVyZS4gIEkgaW5j
bHVkZSB0aGUgdmlmID0gWy4uLiBiYWNrZW5kPS4uLl0KZGVjbGFyYXRpb24gaW4gbXkgZG9tYWlu
IGNvbmZpZy4KCj4gKiB4bCBuZXR3b3JrLWF0dGFjaCBBIGJhY2tlbmQ9ZHJ2X2RvbQoKU28gSSBk
b24ndCBkbyB0aGlzIHN0ZXAgbWFudWFsbHkuCgo+ICogW2RvIHNvbWUgc3R1ZmZdCj4gKiB4bCBu
ZXR3b3JrLWRldGFjaCBBIFtuZXR3b3JrIGRldmlkXQo+ICogUmVzdGFydCBkcml2ZXIgZG9tYWlu
Cj4gKiB4bCBuZXR3b3JrLWF0dGFjaCBBIGJhY2tlbmQ9ZHJ2X2RvbQoKT3RoZXJ3aXNlLCB0aGlz
IGlzIGFsbCBjb3JyZWN0LiAgVGhlbiBJIGdldCB0aGUgTk8tQ0FSUklFUiBpbiBkb21VIEEuCgp0
aHgsCgpKYXNvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
