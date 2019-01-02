From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/dom0: add verbose mode and print
 memory allocation stats
Date: Wed, 2 Jan 2019 12:35:17 +0000
Message-ID: <20190102123517.mca7dz4emuqdakq2@zion.uk.xensource.com>
References: <20181228111857.49444-1-roger.pau@citrix.com>
 <20181228111857.49444-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KZoQ=PK=citrix.com=prvs=89816f56d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gefk2-00087L-HD
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 12:35:22 +0000
Content-Disposition: inline
In-Reply-To: <20181228111857.49444-3-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMjgsIDIwMTggYXQgMTI6MTg6NTdQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEFkZCBhIHZlcmJvc2Ugb3B0aW9uIHRvIHRoZSBkb20wIGNvbW1hbmQgbGluZSwg
c28gdGhhdCBkb20wIGJ1aWxkZXIKPiBjYW4gcHJpbnQgZXh0cmEgZGVidWcgaW5mb3JtYXRpb24g
d2hlbiByZXF1aXJlZC4KPiAKPiBVc2UgdGhpcyBuZXcgdmVyYm9zZSBtb2RlIHRvIHByaW50IHN0
YXRpc3RpY3MgYWJvdXQgbWVtb3J5IGFsbG9jYXRpb25zCj4gd2hlbiBwb3B1bGF0aW5nIGRvbTAg
cDJtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4g
Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPiAtLS0KPiAgZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gfCAg
OCArKysrKysrLQo+ICB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgICB8ICAzICsr
Kwo+ICB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyAgICAgICB8IDE2ICsrKysrKysrKysr
KysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oICAgICAgICAgfCAgMSArCj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93biBiL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gaW5kZXggNzhiMjA3YzBkMC4uZTc5NzNlZTUwOSAx
MDA2NDQKPiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bgo+ICsrKyBi
L2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3duCj4gQEAgLTYzNyw3ICs2MzcsNyBA
QCB0cmFjZSBmZWF0dXJlIGlzIG9ubHkgZW5hYmxlZCBpbiBkZWJ1Z2dpbmcgYnVpbGRzIG9mIFhl
bi4KPiAgU3BlY2lmeSB0aGUgYml0IHdpZHRoIG9mIHRoZSBETUEgaGVhcC4KPiAgCj4gICMjIyBk
b20wICh4ODYpCj4gLT4gYD0gTGlzdCBvZiBbIHB2aCB8IHNoYWRvdyBdYAo+ICs+IGA9IExpc3Qg
b2YgWyBwdmggfCBzaGFkb3cgfCB2ZXJib3NlIF1gCj4gIAo+ICA+IFN1Yi1vcHRpb25zOgo+ICAK
PiBAQCAtNjU0LDYgKzY1NCwxMiBAQCBGbGFnIHRoYXQgbWFrZXMgYSBkb20wIGJvb3QgaW4gUFZI
djIgbW9kZS4KPiAgRmxhZyB0aGF0IG1ha2VzIGEgZG9tMCB1c2Ugc2hhZG93IHBhZ2luZy4gT25s
eSB3b3JrcyB3aGVuICJwdmgiIGlzCj4gIGVuYWJsZWQuCj4gIAo+ICs+IGB2ZXJib3NlYAo+ICsK
PiArPiBEZWZhdWx0OiBgZmFsc2VgCj4gKwo+ICtQcmludCBkZWJ1ZyBpbmZvcm1hdGlvbiBkdXJp
bmcgZG9tMCBidWlsZC4KPiArCgpJcyB0aGVyZSBwbGFuIHRvIGV4cGFuZCB0aGlzIHRvIFBWIGFz
IHdlbGw/IEEgdXNlciByZWFkaW5nIHRoaXMgbWF5CnNwZWNpZnkgZG9tMD12ZXJib3NlIGluIGEg
UFYgc2V0dXAgYnV0IGZpbmQgbm90aGluZyBpbiB0aGUgbG9nLgoKVGhlIHJlc3QgbG9va3MgY29y
cmVjdC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
