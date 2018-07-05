From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 12:16:09 +0100
Message-ID: <23357.65017.175500.267696@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <8E144174-5EFE-474C-9C00-F10D3469FBD0@citrix.com>
 <416f5015-93da-1832-aa63-abac54815e60@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb2FC-0001Up-65
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 11:16:14 +0000
In-Reply-To: <416f5015-93da-1832-aa63-abac54815e60@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3Vt
bWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhs
eSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPiBX
ZSBkaWRuJ3QgbG9vayBhdCB0aGUgc3BvcmFkaWMgZmFpbGluZyB0ZXN0cyB0aG9yb3VnaGx5IGVu
b3VnaC4gVGhlCj4gaHlwZXJjYWxsIGJ1ZmZlciBmYWlsdXJlIGhhcyBiZWVuIHRoZXJlIGZvciBh
Z2VzLCBhIG5ld2VyIGtlcm5lbCBqdXN0Cj4gbWFkZSBpdCBtb3JlIHByb2JhYmxlLiBUaGlzIHdv
dWxkIGhhdmUgc2F2ZWQgdXMgc29tZSB3ZWVrcy4KCkluIGdlbmVyYWwsIGFzIGEgY29tbXVuaXR5
LCB3ZSBhcmUgdmVyeSBiYWQgYXQgdGhpcyBraW5kIG9mIHRoaW5nLgoKSW4gbXkgZXhwZXJpZW5j
ZSwgdGhlIGRldmVsb3BtZW50IGNvbW11bml0eSBpcyBub3QgcmVhbGx5IGludGVyZXN0ZWQKaW4g
Zml4aW5nIGJ1Z3Mgd2hpY2ggYXJlbid0IGRpcmVjdGx5IGluIHRoZWlyIHdheS4KCllvdSBjYW4g
b2JzZXJ2ZSB0aGlzIGVhc2lseSBpbiB0aGUgd2F5IHRoYXQgcmVncmVzc2lvbiBpbiBMaW51eCwK
c3BvdHRlZCBieSBvc3N0ZXN0LCBhcmUgaGFuZGxlZC4gIExpbnV4IDQuOSBoYXMgYmVlbiBicm9r
ZW4gZm9yIDQzCmRheXMuICBMaW51eCBtYWlubGluZSBpcyBicm9rZW4gdG9vLgoKV2UgZG8gbm90
IGhhdmUgYSB0ZWFtIG9mIHBlb3BsZSByZWFkaW5nIHRoZXNlIHRlc3QgcmVwb3J0cywgYW5kCmNo
YXNpbmcgZGV2ZWxvcGVycyB0byBmaXggdGhlbS4gIEkgY2VydGFpbmx5IGRvIG5vdCBoYXZlIHRp
bWUgdG8gZG8KdGhpcyB0cmlhZ2UuICBPbiB0cmVlcyB3aGVyZSBvc3N0ZXN0IGZhaWx1cmVzIGRv
IG5vdCBibG9jawpkZXZlbG9wbWVudCwgdGhpbmdzIGdvIHVuZml4ZWQgZm9yIHdlZWtzLCBzb21l
dGltZXMgbW9udGhzLgoKQW5kIG92ZXJhbGwgbXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCB0ZXN0cyB3
aGljaCBmYWlsIGludGVybWl0dGVudGx5IGFyZQp1c3VhbGx5IGJsYW1lZCAoZXZlbiBpZiB0aGlz
IGlzIG5vdCBzdGF0ZWQgZXhwbGljaXRseSkgb24gcHJvYmxlbXMKd2l0aCBvc3N0ZXN0IG9yIHdp
dGggb3VyIHRlc3QgaW5mcmFzdHJ1Y3R1cmUuICBJdCBpcyBlYXN5IGZvcgpkZXZlbG9wZXJzIHRv
IHRoaW5rIHRoaXMgYmVjYXVzZSBpZiB0aGV5IHdhaXQsIHRoZSB0ZXN0IHdpbGwgZ2V0CiJsdWNr
eSIsIGFuZCBwYXNzLCBhbmQgc28gdGhlcmUgd2lsbCBiZSBhIHB1c2ggYW5kIHRoZSBkZXZlbG9w
ZXJzIGNhbgpjYXJyeSBvbi4KCkkgaGF2ZSBhIHZhZ3VlIHBsYW4gdG8gc2l0IGRvd24gYW5kIHRo
aW5rIGFib3V0IGhvdyBvc3N0ZXN0J3MKcmVzdWx0cyBhbmFseXNlcnMgY291bGQgcmVzcG9uZCBi
ZXR0ZXIgdG8gaW50ZXJtaXR0ZW50IGZhaWx1cmVzLiAgVGhlCklmIEkgY2FuLCBJIHdvdWxkIGxp
a2UgaW50ZXJtaXR0ZW50IGZhaWx1cmVzIHRvIGJsb2NrIHB1c2hlcy4gIFRoYXQKd291bGQgYXQg
bGVhc3QgaGVscCBhZGRyZXNzIHRoZSBwcm9ibGVtIG9mIGhlaXNlbmJ1Z3MgKHdoaWNoIGFyZSBv
ZnRlbgphY3R1YWxseSBxdWl0ZSBzZXJpb3VzIGlzc3Vlcykgbm90IGJlaW50IHRha2VuIHNlcmlv
dXNseS4KCkkgd291bGQgbG92ZSB0byBoZWFyIHN1Z2dlc3Rpb25zIGZvciBob3cgdG8gZ2V0IHBl
b3BsZSB0byBhY3R1YWxseSBmaXgKdGVzdCBmYWlsdXJlcyBpbiB0cmVlcyBub3QgbWFpbnRhaW5l
ZCBieSB0aGUgWGVuIFByb2plY3QgYW5kIHRoZXJlZm9yZQpub3QgZ2F0ZWQgYnkgb3NzdGVzdC4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
