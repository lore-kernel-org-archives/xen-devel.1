From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/8] viridian: move the code into its own
 sub-directory
Date: Wed, 31 Oct 2018 10:30:37 +0000
Message-ID: <37925c0de5324f4b96ecf46734aebd17@AMSPEX02CL03.citrite.net>
References: <20181029180211.2155-1-paul.durrant@citrix.com>
 <20181029180211.2155-2-paul.durrant@citrix.com>
 <5BD9814E02000078001F6ACE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z2zh=nl=citrix.com=prvs=83522333a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gHnls-0002Xh-20
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 10:30:44 +0000
In-Reply-To: <5BD9814E02000078001F6ACE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMzEgT2N0b2JlciAyMDE4IDEwOjE4Cj4gVG86IFBh
dWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIg
PEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1Cj4gPHdlaS5saXUyQGNpdHJpeC5j
b20+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEvOF0gdmlyaWRpYW46IG1vdmUgdGhlIGNvZGUgaW50byBpdHMgb3duIHN1
Yi0KPiBkaXJlY3RvcnkKPiAKPiA+Pj4gT24gMjkuMTAuMTggYXQgMTk6MDIsIDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBpbnRyb2R1
Y2Ugc3VwcG9ydCBmb3IgbW9yZSB2aXJpZGlhbgo+IGVubGlnaHRlbm1lbnRzCj4gPiB3aGljaCB3
aWxsIG1ha2UgYSBzaW5nbGUgc291cmNlIG1vZHVsZSBxdWl0ZSBsZW5ndGh5Lgo+ID4KPiA+IFRo
aXMgcGF0Y2ggdGhlcmVmb3JlIGNyZWF0ZXMgYSBuZXcgYXJjaC94ODYvaHZtL3ZpcmlkaWFuIHN1
Yi1kaXJlY3RvcnkKPiBhbmQKPiA+IG1vdmVzIHZpcmlkaWFuLmMgaW50byB0aGF0Lgo+ID4KPiA+
IFRoZSBwYXRjaCBhbHNvIGZpeGVzIHNvbWUgYmFkIHdoaXRlc3BhY2Ugd2hpbHN0IG1vdmluZyB0
aGUgY29kZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
PiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNo
L3g4Ni9odm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ICB4ZW4vYXJjaC94
ODYvaHZtL3ZpcmlkaWFuL01ha2VmaWxlICAgICAgICAgfCAxICsKPiA+ICB4ZW4vYXJjaC94ODYv
aHZtL3sgPT4gdmlyaWRpYW59L3ZpcmlkaWFuLmMgfCA0ICsrLS0KPiA+ICAzIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi9NYWtlZmlsZQo+ID4gIHJlbmFtZSB4ZW4vYXJj
aC94ODYvaHZtL3sgPT4gdmlyaWRpYW59L3ZpcmlkaWFuLmMgKDk5JSkKPiAKPiBBY3R1YWxseSwg
SSBub3cgcmVhbGl6ZSB0aGF0IG15IGFjayBpcyBkZXBlbmRlbnQgb24geW91IGFsc28KPiBhZGp1
c3RpbmcgLi9NQUlOVEFJTkVSUyBoZXJlLCBvciBlbHNlIHlvdSB3aWxsIGNlYXNlIHRvIGJlCj4g
bWFpbnRhaW5lciBvZiB0aGlzIGNvZGUuCj4gCgpPaC4gR29vZCBzcG90LiBJJ2xsIGZvbGQgdGhh
dCBjaGFuZ2UgaW50byB2MiBvZiB0aGlzIHBhdGNoLgoKICBQYXVsCgo+IEphbgo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
