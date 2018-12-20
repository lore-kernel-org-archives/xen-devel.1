From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/3] x86/mm-locks: apply a bias to lock
 levels for current domain
Date: Thu, 20 Dec 2018 14:24:54 +0000
Message-ID: <0f2e1fab-f268-c935-4465-fbfab18f57bf@citrix.com>
References: <20181218160542.56173-1-roger.pau@citrix.com>
 <20181218160542.56173-4-roger.pau@citrix.com>
 <6475a09e-07c8-cb0e-36eb-d7c024b5239f@citrix.com>
 <20181219121027.foezgrkovz7yddl2@mac>
 <2704c247-c835-6ec7-c15e-0ee24642c887@citrix.com>
 <20181219144007.ossqqsvve5cbir6m@mac>
 <c05baf2f-0b03-a63b-3d0d-5d06878d5d31@citrix.com>
 <20181219145959.amgvrsj3prmkxc6w@mac>
 <f5f94010-54d6-43c7-1913-a611b63aa03b@citrix.com>
 <20181220090545.bmwdljnywumrys5j@mac.citrite.net>
 <abb521de-317a-69d5-e05a-a3f5335ffb79@citrix.com>
 <5C1BA0C00200007800208101@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z86S=O5=citrix.com=prvs=885450f5c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gZzGE-0001jf-9u
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:25:14 +0000
In-Reply-To: <5C1BA0C00200007800208101@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMjAvMTggMjowMSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoZSBwcmFjdGljYWwg
aW1wbGljYXRpb24gb2YgZG9tMCBiaWFzIGlzIHRoYXQgYW55IGh5cGVyY2FsbCB3aGljaCBncmFi
cwo+PiB0d28gbW0gbG9ja3MsIG9uZSBvZiB0d28gdGhpbmdzIG11c3QgYmUgdHJ1ZToKPj4gKiBX
aGVuIGl0IGlzIGNhbGxlZCBmcm9tIG9uZSBkb21VIHRvIGFub3RoZXIgZG9tVSwgbG9ja3MgbXVz
dCBmb2xsb3cgdGhlCj4+ICJub3JtYWwiIGxvY2tpbmcgb3JkZXIgbGlzdGVkIGluIG1tLWxvY2tz
LmgKPiAKPiBUaGlzIHdvdWxkIGJlIGEgcHJvYmxlbSBpbiB0aGUgc3R1YmRvbSBjYXNlLgoKU3Vy
ZTsgYnV0IGV2ZXJ5dGhpbmcgZXh0ZW5kcyBuYXR1cmFsbHkgZnJvbSB0aGUgMi1sZXZlbCBjYXNl
IChkb20wIC8KZG9tVSkgdG8gdGhlIDMtbGV2ZWwgY2FzZSAoZG9tMCAvIHN0dWJkb20gLyBkb21V
KS4KCj4+ICogV2hlbiBpdCBpcyBjYWxsZWQgYmV0d2VlbiBhIGRvbTAgYW5kIGEgZG9tVSwgaXQg
bXVzdCBiZSBjb25zaXN0ZW5seQo+PiBjYWxsZWQgZWl0aGVyIG9uZSB3YXkgb3IgdGhlIG90aGVy
OyBpLmUuLCBpdCBtdXN0IGFsd2F5cyBiZSBkb20wIGNhbGxpbmcKPj4gaXQgd2l0aCBhIGRvbVUg
dGFyZ2V0LCBvciBkb21VIGNhbGxpbmcgaXQgd2l0aCBhIGRvbTAgdGFyZ2V0IChvdGhlcndpc2UK
Pj4gdGhlIGRvbTAgLyBkb21VIGxvY2tpbmcgb3JkZXIgaXMgdmlvbGF0ZWQpLgo+IAo+IE9idmlv
dXNseSAoSSBob3BlKSAiZG9tVSBjYWxsaW5nIGl0IHdpdGggYSBkb20wIHRhcmdldCIgaXMgYW4K
PiB1bmludGVyZXN0aW5nIGNhc2UsIGJlY2F1c2Ugd2UgZG9uJ3QgYWxsb3cgYSBkb21VIHRvIGFj
dCBvbgo+IGRvbTAuIEhlbmNlIHRoZSBjb25zaXN0ZW5jeSBpcyBhY2hpZXZlZCBieSBpdCBhbHdh
eXMgZ29pbmcKPiB0byBiZSAiZG9tMCBjYWxsaW5nIGl0IHdpdGggYSBkb21VIHRhcmdldCIuCgpX
ZSBhbGxvdyBkb21VIHRvIHNlbmQgZXZlbnQgY2hhbm5lbHMgdG8gZG9tMCwgZm9yIGluc3RhbmNl
OyBhbmQKcHJlc3VtYWJseSBBcmdvcyBhbGxvd3MgZG9tVSB0byBzZW5kIHRoaW5ncyB0byBkb20w
IGFzIHdlbGwgYXMgZm9yIGRvbTAKdG8gc2VuZCB0aGluZ3MgdG8gZG9tVS4gIEkgZG9uJ3Qga25v
dyBpZiB0aG9zZSByZXF1aXJlIHRoZSBtbSBsb2NrcyBvZgpib3RoIGRvbWFpbnMsIGJ1dCBpZiB0
aGV5IGRpZCwgdGhlbiB3ZSdkIHJ1biBpbnRvIGEgcHJvYmxlbSBhZ2Fpbi4KCiAtR2VvcmdlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
