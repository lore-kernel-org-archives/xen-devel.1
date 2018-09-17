From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/pvh: copy data from low 1MB to Dom0
 physmap instead of mapping it
Date: Mon, 17 Sep 2018 11:41:45 +0100
Message-ID: <20180917104145.trpnx5mo73kxppt6@zion.uk.xensource.com>
References: <20180914111611.23008-1-roger.pau@citrix.com>
 <20180917102756.4y2hthoqutvcj7zn@zion.uk.xensource.com>
 <20180917103419.knc5oynp3g2czrgp@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ktui=l7=citrix.com=prvs=791268a98=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g1qyT-00013C-VO
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 10:41:49 +0000
Content-Disposition: inline
In-Reply-To: <20180917103419.knc5oynp3g2czrgp@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <rogewr.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMTcsIDIwMTggYXQgMTI6MzQ6MTlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKWy4uLl0KPiA+ID4gIHN0YXRpYyBfX2luaXQgdm9pZCBwdmhfc2V0dXBfZTgyMChz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQo+ID4gPiAgewo+ID4gPiAg
ICAgIHN0cnVjdCBlODIwZW50cnkgKmVudHJ5LCAqZW50cnlfZ3Vlc3Q7Cj4gPiA+IEBAIC00MjAs
MTYgKzM5MywyNCBAQCBzdGF0aWMgaW50IF9faW5pdCBwdmhfc2V0dXBfcDJtKHN0cnVjdCBkb21h
aW4gKmQpCj4gPiAKPiA+IAo+ID4gU29tZXdoZXJlIGFib3ZlIHRoZSBodW5rIHlvdSBtb2RpZmll
ZCwgdGhlcmUgaXMgYSBjb21tZW50IHNheWluZyAiTWVtb3J5Cj4gPiBiZWxvdyAxTUIgaXMgaWRl
bnRpdHkgbWFwcGVkIi4gRG9uJ3QgeW91IG5lZWQgdG8gY2hhbmdlIHRoYXQgYXMgd2VsbD8KPiA+
IE90aGVyd2lzZSBmaXJzdCAxTUIgc3RpbGwgMToxIG1hcHMgdG8gMU1CIG1hY2hpbmUgbWVtb3J5
IGluIGd1ZXN0IHAybS4KPiAKPiBOb24tUkFNIHJlZ2lvbnMgYXJlIHN0aWxsIGlkZW50aXR5IG1h
cHBlZC4KCkkgc2VlLiBHb3QgY29uZnVzZWQgYmVjYXVzZSBpdCBzYWlkICJtZW1vcnkiLgoKTWF5
IEkgc3VnZ2VzdCB5b3UgdXBkYXRlIHRoZSBjb21tZW50IGEgYml0IHRvIGJlIG1vcmUgcHJlY2lz
ZSwgc29tZXRoaW5nCmxpa2U6CgovKgogKiBSZWdpb24gYmVsb3cgMU1CIGlzIGlkZW50aXR5IG1h
cHBlZCBoZXJlLCBidXQgUkFNIGJlbG93IDFNQiB3aWxsIGJlCiAqIHBvcHVsYXRlZCBsYXRlciB3
aGVuIHByb2Nlc3NpbmcgRTgyMCBtYXAuCiAqLwoKSW4gYW55IGNhc2UsIHRoZSBjb2RlIGxvb2tz
IGZpbmU6CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
