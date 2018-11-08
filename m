From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 5/7] vpci: fix execution of long running
 operations
Date: Thu, 8 Nov 2018 14:20:48 +0100
Message-ID: <20181108132048.o4bnxvojp6deotwq@mac.citrite.net>
References: <20181030154123.4218-6-roger.pau@citrix.com>
 <5BE0762D02000078001F8356@prv1-mh.provo.novell.com>
 <20181107111146.ksaemioxod3uk5p4@mac.citrite.net>
 <5BE2FF5802000078001F9313@prv1-mh.provo.novell.com>
 <20181107171517.7p34q6vjpggmzb4i@mac.citrite.net>
 <5BE4082C02000078001F97FE@prv1-mh.provo.novell.com>
 <20181108112959.7oc4guik3icb7nls@mac.citrite.net>
 <5BE42CC202000078001F9A29@prv1-mh.provo.novell.com>
 <20181108124727.34nyejn4ukggd4co@mac.citrite.net>
 <5BE4344B02000078001F9A7B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/xu1=nt=citrix.com=prvs=843091f4c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gKkF2-0002e1-VL
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 13:21:00 +0000
Content-Disposition: inline
In-Reply-To: <5BE4344B02000078001F9A7B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDY6MDQ6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDEzOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gTXkgcG9pbnQgd291bGQgYmUgdGhhdCBvbiB4ODYgSSB0aGluayB0aGUgb25seSB3
YXkgdG8gaGF2ZSBwcmVlbXB0aWJsZQo+ID4gbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMgaW5zaWRl
IG9mIFhlbiBpcyB0byBibG9jayB0aGUgZ3Vlc3QgdkNQVSBhbmQKPiA+IHJ1biB0aGVtIGluIGEg
dGFza2xldCwgb3IgYXQgbGVhc3QgdGhpcyBzZWVtcyB0aGUgbGVzcyBpbnZhc2l2ZSBvbmUuCj4g
PiAKPiA+IERvIHlvdSBzdGlsbCBoYXZlIG9iamVjdGlvbnMgdG8gdGhpcyBwYXRjaC9hcHByb2Fj
aD8KPiAKPiBXZWxsLCBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdSB0aGluayB5b3Ug
bmVlZCB0byBpbnRyb2R1Y2UKPiBhIHRhc2tsZXQgaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGF0J3Mg
YmVjYXVzZSBJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQKPiB3aGF0IHlvdSB0aGluayBpcyB3cm9u
ZyB3aXRoIHRoZSBjdXJyZW50IGFwcHJvYWNoIChsZWF2aW5nIGFzaWRlCj4gdGhlIGV4YWN0IHBs
YWNlbWVudCBvZiB3aGVyZSB0aGUgdnBjaSBob29rIG5lZWRzIHRvIGJlIGNhbGxlZCkuCgpUaGUg
Y3VycmVudCBhcHByb2FjaCBkb2Vzbid0IHByZXZlbnQgdGhlIHZDUFUgZnJvbSByZXR1cm5pbmcg
dG8gZ3Vlc3QKY29udGV4dCB3aXRoIHBlbmRpbmcgd29yay4KClBsYWNpbmcgdGhlIHBlbmRpbmcg
d29yayBob29rICh2cGNpX3Byb2Nlc3NfcGVuZGluZykgaW4gaHZtX2RvX3Jlc3VtZQppcyBub3Qg
Z29pbmcgdG8gc29sdmUgdGhpcyB1bmxlc3Mgd2UgcmFpc2UgYW5kIHByb2Nlc3MgYSBzY2hlZHVs
ZXIKc29mdGlycSwgYW5kIHRoZW4gdGhpcyBsZWFkcyB0byB0aGUgcmVjdXJzaW9uIHByb2JsZW0u
CgpTbyBvdmVyYWxsIEkgZG9uJ3Qgc2VlIGhvdyBpdCdzIHBvc3NpYmxlIHRvIGhhdmUgdGhpcyBs
b25nIHJ1bm5pbmcKcHJlZW1wdGlibGUgb3BlcmF0aW9ucyBpbnNpZGUgdGhlIGh5cGVydmlzb3Ig
aWYgaXQncyBub3QgdXNpbmcgYQp0YXNrbGV0LgoKU29ycnkgZm9yIG1ha2luZyB0aGlzIGRpc2N1
c3Npb24gc28gbG9uZywgaG9wZSB0aGlzIGlzIG1vcmUgY2xlYXIgdGhhbgpteSBwcmV2aW91cyBy
ZXBsaWVzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
