From: Juergen Gross <jgross@suse.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Tue, 3 Jul 2018 12:30:57 +0200
Message-ID: <9b1f5a1b-5638-40ec-d563-d39dd72ae6aa@suse.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hguy=jt=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1faIaM-0005eB-KA
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 10:31:02 +0000
In-Reply-To: <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Lars Kurth <lars.kurth@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Rich Persaud <persaur@gmail.com>, Doug Goldstein <cardoe@cardoe.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, "committers@xenproject.org" <committers@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDcvMTggMTI6MDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBKdWwg
MDIsIDIwMTggYXQgMDY6MDM6MzlQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90ZToKPj4gV2UgdGhl
biBoYWQgYSBkaXNjdXNzaW9uIGFyb3VuZCB3aHkgdGhlIHBvc2l0aXZlIGJlbmVmaXRzIGRpZG4n
dCBtYXRlcmlhbGl6ZToKPj4gKiBBbmRyZXcgYW5kIGEgZmV3IG90aGVyIGJlbGlldmUgdGhhdCB0
aGUgbW9kZWwgaXNuJ3QgYnJva2VuLCBidXQgdGhhdCB0aGUgaXNzdWUgaXMgd2l0aCBob3cgd2Ug
Cj4+IMKgwqBkZXZlbG9wLiBJbiBvdGhlciB3b3JkcywgbW92aW5nIHRvIGEgOSBtb250aHMgbW9k
ZWwgd2lsbCAqbm90KiBmaXggdGhlIHVuZGVybHlpbmcgaXNzdWVzLCBidXQgCj4+IMKgwqBtZXJl
bHkgcHJvdmlkZSBhbiBpbmNlbnRpdmUgbm90IHRvIGZpeCB0aGVtLgo+PiAqIElzc3VlcyBoaWdo
bGlnaHRlZCB3ZXJlOgo+PiDCoCAqIDItMyBtb250aHMgc3RhYmlsaXppbmcgcGVyaW9kIGlzIHRv
byBsb25nCj4gCj4gSSB0aGluayBvbmUgb2YgdGhlIGdvYWxzIHdpdGggdGhlIDYgbW9udGggcmVs
ZWFzZSBjeWNsZSB3YXMgdG8gc2hyaW5rCj4gdGhlIHN0YWJpbGl6aW5nIHBlcmlvZCwgYnV0IGl0
IGRpZG4ndCB0dXJuIHRoYXQgd2F5LCBhbmQgdGhlCj4gc3RhYmlsaXppbmcgcGVyaW9kIGlzIHF1
aXRlIHNpbWlsYXIgd2l0aCBhIDYgb3IgYSA5IG1vbnRoIHJlbGVhc2UKPiBjeWNsZS4KCkkgZ3Vl
c3MgdGhhdCBpcyB0byBiZSBleHBlY3RlZC4KCkl0cyBub3QgYXMgaWYgT1NTVEVTVCB3b3VsZCBy
dW4gb25seSBkdXJpbmcgdGhlIHN0YWJpbGl6aW5nIHBlcmlvZC4KVGhlIHN0YWJpbGl6aW5nIHBl
cmlvZCB3aWxsIGJlIHVzZWQgdG8gY2F0Y2ggdGhlIGJ1Z3MgaW50cm9kdWNlZCBzaW5jZQp0aGUg
bGFzdCBzdWNjZXNzZnVsIE9TU1RFU1QgcnVuICh3aGljaCBzaG91bGRuJ3QgYmUgb2xkZXIgdGhh
biBhYm91dApvbmUgbW9udGgpIGFuZCB0byBmaW5kIHNvbWUgcmFyZWx5IHRyaWdnZXJpbmcgYnVn
cywgd2hpY2ggY291bGQgZWFzaWx5CmJlIHByZXNlbnQgaW4gb2xkZXIgcmVsZWFzZXMsIHRvbyAo
ZS5nLiB0aGUgaHlwZXJjYWxsIGJ1ZmZlciBpc3N1ZQpmb3VuZCBvbmx5IG5vdykuCgo8c2FyY2Fz
bT4KVGhpcyB3b3VsZCBsZWFkIHRvIHRoZSBjb25jbHVzaW9uIHRoYXQgdGhlIHN0YWJpbGl6aW5n
IHBlcmlvZCBjYW4gYmUKbWFkZSBzaG9ydGVyIG9ubHkgYnkgc2hvcnRlbmluZyB0aGUgZGV2ZWxv
cG1lbnQgcGVyaW9kIHRvIGxlc3MgdGhhbgp0aGUgYXZlcmFnZSB0aW1lIGJldHdlZW4gT1NTVEVT
VCBwdXNocy4KCk9yIElPVzogd2UgY2FuIG1heGltaXplIHRoZSByYXRpbyBkZXZlbG9wbWVudC9z
dGFiaWxpemluZyBieSBtYWtpbmcKdGhlIGRldmVsb3BtZW50IHBlcmlvZCBhcyBsb25nIGFzIHBv
c3NpYmxlLgo8L3NhcmNhc20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
