From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Fri, 6 Jul 2018 09:44:29 +0100
Message-ID: <a49de547-1762-3844-1f2d-99def74bbd24@citrix.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <8E144174-5EFE-474C-9C00-F10D3469FBD0@citrix.com>
 <416f5015-93da-1832-aa63-abac54815e60@suse.com>
 <23357.65017.175500.267696@mariner.uk.xensource.com>
 <20180705181311.tqt43urlygigkfhs@doug-macbook.localdomain>
 <5B3F291002000078001D1C5D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=khol=jw=citrix.com=prvs=7188636b3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fbMLw-0005vB-Pn
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 08:44:32 +0000
In-Reply-To: <5B3F291002000078001D1C5D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, advisory-board@lists.xenproject.org, Rich Persaud <persaur@gmail.com>, committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDcvMjAxOCAwOTozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEplbmtpbnMgdXNlcyB3
ZWF0aGVyIGljb25zIHRvIGF0dGVtcHQgdG8gY29udmV5IGlmIHRoaXMgdGVzdCBpcwo+PiB0cmVu
ZGluZyB3b3JzZSBvciBiZXR0ZXIgb3Igc3VjY2Vzc2Z1bCBvciBicm9rZW4uIElmIGl0IGZhaWxz
IGJ1dCBub3QKPj4gZXZlcnkgdGltZSBhbmQgdGhlIGFtb3VudCBvZiBmYWlsdXJlcyBpcyBpbmNy
ZWFzaW5nIG92ZXIgdGltZSB0aGVuIGl0cwo+PiBnb3Qgc3Rvcm0gY2xvdWRzLiBJZiB0aGUgYW1v
dW50IG9mIGZhaWx1cmVzIGlzIGRlY3JlYXNpbmcgdGhlcmUncyBhCj4+IGxpdHRsZSBiaXQgb2Yg
c3VuIHBlYWtpbmcgb3V0Lgo+Pgo+PiBKdXN0IHNvbWUga2luZCBvZiBkYXNoYm9hcmQgd2hpY2gg
d291bGQgdGVsbCBtZSB3aGF0IHdvdWxkIHByb3ZpZGUgdGhlCj4+IG1vc3QgdmFsdWUgdG8gZHJp
bGwgaW50byB3b3VsZCBsaWtlbHkgZ28gYSBsb25nIHdheS4gQnV0IGFnYWluLCB0aGlzIGlzCj4+
IGp1c3QgYW4gYXNzdW1wdGlvbiBhbmQgY291bGQgYmUgYSB0aW1lIHdhc3RlLgo+IEkgdGhpbmsg
ZXZlcnkgdGVzdCBmYWlsdXJlIHdhcnJhbnRzIGxvb2tpbmcgaW50by4gSXQgaXMganVzdCB0aGUg
Y2FzZSB0aGF0Cj4gYWZ0ZXIgaGF2aW5nIHNlZW4gYSBjZXJ0YWluICJ1bmludGVyZXN0aW5nIiBj
YXNlIGEgbnVtYmVyIG9mIHRpbWVzLCBJCj4gZm9yIGluc3RhbmNlIG1ha2UgZnVydGhlciBpbXBs
aWNhdGlvbnMgZnJvbSB0aGF0IG9uIGxhdGVyIGZsaWdodCByZXBvcnRzLgo+IE1heWJlIEkgc2hv
dWxkbid0LCBidXQgSSBhbHNvIGNhbid0IGFmZm9yZCBzcGVuZGluZyBlbmRsZXNzIGhvdXJzIG9u
Cj4gbG9va2luZyBhbGwgdGhlIGRldGFpbHMgb2YgYWxsIHRoZSBmbGlnaHRzLgoKVGhlIHJlc3Vs
dHMgb2YgdGVzdGluZyBzaG91bGQgYmUgYSBzaW5nbGUgYml0LsKgIFllcyBvciBOby4KCk5vIG1l
YW5zIHRoYXQgc29tZW9uZSBuZWVkcyB0byBpbnZlc3RpZ2F0ZSBhbmQgZ2V0IGl0IGJhY2sgdG8g
c2F5aW5nIFllcy4KCkkndmUgc2FpZCB0aGlzIGJlZm9yZSwgYnV0IGNhdGVnb3JpZXMgbGlrZSAi
ZmFpbCBuZXZlciBwYXNzIiBhbmQgImZhaWwKbm90IGJsb2NraW5nIiBvbmx5IG11ZGR5IHRoZSB3
YXRlciBhbmQgdHJhaW4gcGVvcGxlIHRvIGdldCBjb21wbGFjZW50IGF0CnRoZSByZXN1bHRzLsKg
IChBbHNvLCBmYWlsIG5ldmVyIHBhc3MgaXMgYSAxMDAlIHdhc3RlIG9mIHRpbWUgcnVubmluZyBp
bgp0aGUgZmlyc3QgcGxhY2UsIGFuZCB0aGlzIGlzbid0IHRoZSBmaXJzdCB0aW1lIEkndmUgc3Vn
Z2VzdGVkIHRoYXQgaXQgaXMKdGhlIGxvd2VzdCBoYW5naW5nIG9mIHRoZSBsb3cgaGFuZ2luZyBm
cnVpdC4uLikKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
