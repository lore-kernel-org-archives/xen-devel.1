From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 5/5] xen/keyhandler: Drop
 keyhandler_scratch
Date: Tue, 30 Oct 2018 09:52:56 -0600
Message-ID: <5BD87E5802000078001F6678@prv1-mh.provo.novell.com>
References: <1540213082-616-1-git-send-email-andrew.cooper3@citrix.com>
 <1540213082-616-6-git-send-email-andrew.cooper3@citrix.com>
 <5BD330DF02000078001F54B8@prv1-mh.provo.novell.com>
 <20181030153215.bssybxba5sc75qxj@zion.uk.xensource.com>
 <5BD87B6102000078001F6627@prv1-mh.provo.novell.com>
 <20181030154623.f6gwtwlgzgedwav6@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181030154623.f6gwtwlgzgedwav6@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDE2OjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMDk6NDA6MTdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAzMC4xMC4xOCBhdCAxNjozMiwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IE9uIEZyaSwgT2N0IDI2LCAyMDE4IGF0IDA5OjIxOjAzQU0gLTA2MDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+PiA+PiA+Pj4gT24gMjIuMTAuMTggYXQgMTQ6NTgsIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vY29tbW9uL2VmaS9ib290
LmMKPj4gPj4gPiArKysgYi94ZW4vY29tbW9uL2VmaS9ib290LmMKPj4gPj4gPiBAQCAtNDg3LDYg
KzQ4Nyw3IEBAIHN0YXRpYyBFRklfRklMRV9IQU5ETEUgX19pbml0IAo+IGdldF9wYXJlbnRfaGFu
ZGxlKEVGSV9MT0FERURfSU1BR0UgKmxvYWRlZF9pbWFnZSwKPj4gPj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ0hBUjE2ICoqbGVhZikKPj4gPj4g
PiAgewo+PiA+PiA+ICAgICAgc3RhdGljIEVGSV9HVUlEIF9faW5pdGRhdGEgZnNfcHJvdG9jb2wg
PSBTSU1QTEVfRklMRV9TWVNURU1fUFJPVE9DT0w7Cj4+ID4+ID4gKyAgICBzdGF0aWMgQ0hBUjE2
IF9faW5pdGRhdGEgYnVmZmVyWzI1Nl07Cj4+ID4+IAo+PiA+PiBEaWQgeW91IGludGVudGlvbmFs
bHkgaGFsdmUgdGhlIHNpemUgb2YgdGhlIGJ1ZmZlcj8KPj4gPiAKPj4gPiAKPj4gPiBTZWVpbmcg
dGhlIGxlbmd0aCBmaWVsZCBjb25zaXN0cyBvZiB0d28gdWludDgsIHRoZSBtYXhpbXVtIGxlbmd0
aCBvZiB0aGUKPj4gPiBwYXRoIGlzIDI1Ni4KPj4gCj4+IFdpdGgKPj4gCj4+ICNkZWZpbmUgRGV2
aWNlUGF0aE5vZGVMZW5ndGgoYSkgICAgICggKChhKS0+TGVuZ3RoWzBdKSB8ICgoYSktPkxlbmd0
aFsxXSA8PCA4KSApCj4+IAo+PiBJJ2QgcmF0aGVyIHNheSA2NTUzNi4KPiAKPiBZZXMgeW91J3Jl
IHJpZ2h0LiBDYW4ndCBkbyBjYWxjdWxhdGlvbiB3aGVuIEknbSBoYXZpbmcgYSBjb2xkLiA6LSgK
PiBCdXQgaGF2aW5nIDY1NTM2IGlzIHVucmVhbGlzdGljLgoKU3VyZSwgSSBjZXJ0YWlubHkgZG9u
J3QgbWVhbiB0aGUgYnVmZmVyIHRvIGdyb3cgdGhhdCBsYXJnZSwgYnV0IEknZApwcmVmZXIgaWYg
aXQgZGlkbid0IHNocmluayBjb21wYXJlZCB0byB0aGUgb3JpZ2luYWwuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
