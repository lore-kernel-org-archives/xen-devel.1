From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 19 Dec 2017 16:46:37 +0100
Message-ID: <3c4b702d-3029-3c38-c3da-1d83b722cef4@suse.com>
References: <20171201141407.21993-1-jgross@suse.com>
 <20171219153802.355ha2zrocgb6mes@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bixb=dp=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eRK6M-00050K-3g
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 15:46:42 +0000
In-Reply-To: <20171219153802.355ha2zrocgb6mes@MacBook-Pro-de-Roger.local>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMTcgMTY6MzgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBEZWMg
MDEsIDIwMTcgYXQgMDM6MTQ6MDdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW5z
dGVhZCBvZiBsb2NhdGluZyB0aGUgUlNEUCB0YWJsZSBiZWxvdyAxTUIgcHV0IGl0IGp1c3QgYmVs
b3cgNEdCCj4+IGxpa2UgdGhlIHJlc3Qgb2YgdGhlIEFDUEkgdGFibGVzIGluIGNhc2Ugb2YgUFZI
IGd1ZXN0cy4gVGhpcyB3aWxsCj4+IGF2b2lkIHB1bmNoaW5nIG1vcmUgaG9sZXMgdGhhbiBuZWNl
c3NhcnkgaW50byB0aGUgbWVtb3J5IG1hcC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+PiBBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KPj4gLS0tCj4+ICB0b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMgfCAyICst
Cj4+ICB0b29scy9saWJ4bC9saWJ4bF94ODZfYWNwaS5jICAgfCA1ICsrLS0tCj4+ICAyIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhjL3hjX2RvbV9odm1sb2FkZXIuYyBiL3Rvb2xzL2xpYnhjL3hjX2RvbV9o
dm1sb2FkZXIuYwo+PiBpbmRleCA1OWY5NGU1MWU1Li4zZjBiZDY1NTQ3IDEwMDY0NAo+PiAtLS0g
YS90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMKPj4gKysrIGIvdG9vbHMvbGlieGMveGNf
ZG9tX2h2bWxvYWRlci5jCj4+IEBAIC0xMzYsNyArMTM2LDcgQEAgc3RhdGljIGludCBtb2R1bGVf
aW5pdF9vbmUoc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tLAo+PiAgICAgIHN0cnVjdCB4Y19kb21f
c2VnIHNlZzsKPj4gICAgICB2b2lkICpkZXN0Owo+PiAgCj4+IC0gICAgaWYgKCBtb2R1bGUtPmxl
bmd0aCApCj4+ICsgICAgaWYgKCBtb2R1bGUtPmxlbmd0aCAmJiAhbW9kdWxlLT5ndWVzdF9hZGRy
X291dCApCj4gCj4gSXNuJ3QgdGhhdCBraW5kIG9mIGEgc2VwYXJhdGUgZml4PyBBRkFJQ1QgdGhp
cyBqdXN0IHByZXZlbnRzCj4gYWxsb2NhdGluZyBtZW1vcnkgaWYgZ3Vlc3RfYWRkcl9vdXQgaXMg
YWxyZWFkeSBzZXQgdG8gYSBmaXhlZAo+IHBvc2l0aW9uLgoKTm8sIHRoaXMgaXMgbWFuZGF0b3J5
LCBhcyBJIGhhdmUgdG8gc2tpcCB0aGUgYWxsb2NhdGlvbiBmb3IgUFZILCB3aGlsZQpIVk0gZ3Vl
c3RzIHJlYWxseSB3YW50IHRoZSBhbGxvY2F0aW9uIHRvIHRha2UgcGxhY2UuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
