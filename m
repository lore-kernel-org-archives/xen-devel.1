From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 34/34] RFC x86: introduce directio virt cap
Date: Tue, 21 Aug 2018 11:43:28 +0100
Message-ID: <20180821104328.tmrx6wvjvsf4rysq@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <84f9dde9a5f6253653fc267fd8f874d21e4f4a58.1534518694.git-series.wei.liu2@citrix.com>
 <20180821083218.ibkdoyouclvfthh3@mac>
 <20180821102558.htkmokaqznjni6xv@citrix.com>
 <20180821104022.rirzq57tscc7wpo3@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs48K-0001ui-3Q
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 10:43:32 +0000
Content-Disposition: inline
In-Reply-To: <20180821104022.rirzq57tscc7wpo3@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTI6NDA6MjJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEF1ZyAyMSwgMjAxOCBhdCAxMToyNTo1OEFNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMTA6MzI6MThBTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDQ6
MTI6NTJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+ID4gPiBodm1fZGlyZWN0aW8gaXMgc2V0
IHdoZW4gaW9tbXUgaXMgZW5hYmxlZCwgYnV0IGluIGZhY3QgaW9tbXUgaXMgbm90Cj4gPiA+ID4g
dGllZCB0byBIVk0uIEluIG9yZGVyIHRvIG5vdCBicmVhayBleGlzdGluZyB0b29scywgZXhwb3Nl
IGEgbmV3IGZsYWcKPiA+ID4gPiBkaXJlY3RpbyBmb3IgKGlvbW11X2VuYWJsZWQgJiYgIWh2bV9l
bmFibGVkKS4KPiA+ID4gPiAKPiA+ID4gPiBSRkMgVGhpcyBkb2Vzbid0IGJ1aWxkIGF0IHRoZSBt
b21lbnQuIERvIHdlIGNhcmUgYWJvdXQgdGhhdCBmbGFnIGJlaW5nCj4gPiA+ID4gaW5hY2N1cmF0
ZT8KPiA+ID4gCj4gPiA+IEkgdGhpbmsgdGhlcmUgaXMgbm8gaGFyZHdhcmUgb3V0IHRoZXJlIHdp
dGggYW4gSU9NTVUgdGhhdCBkb24ndCBoYXZlCj4gPiA+IHZpcnR1YWxpemF0aW9uIGV4dGVuc2lv
bnMgKGllOiBoYXZpbmcgVlRkIGJ1dCBub3QgVlR4IGZvciBleGFtcGxlKSwKPiA+ID4gYnV0IG1h
eWJlIEknbSB3cm9uZy4KPiA+IAo+ID4gVGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgaXQgbWFrZXMg
c2Vuc2UgdG8gZXhwb3NlIHRoZSBuYW1lICJodm1fZGlyZWN0aW8iCj4gPiBhdCBhbGwgd2hlbiB5
b3UgY2FuJ3QgcnVuIGFuIEhWTSBndWVzdCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gPiAKPiA+IEFs
c28gaW9tbXUgaXNuJ3QgYW4gSFZNIG9ubHkgZmVhdHVyZSwgUFYgZ3Vlc3RzIGNhbiBhbHNvIG1h
a2UgdXNlIG9mIGl0Cj4gPiBpZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBoZW5jZSB0aGUgc3Vn
Z2VzdGlvbiBvZiAiZGlyZWN0aW8iLgo+IAo+IFJpZ2h0LCBJIHNlZSB5b3VyIHBvaW50Lgo+IAo+
IENvdWxkIHdlIHJlbW92ZSB0aGlzIGh2bV9kaXJlY3RpbyBhcnRpZmFjdCBhbmQganVzdCBleHBv
c2UgYW4gaW9tbXUKPiBjYXBhYmlsaXR5Pwo+IAo+IFNpbmNlIHRoaXMgaXMgYSBzeXNjdGwgSSB0
aGluayB3ZSBjYW4gY2hhbmdlIHRoZSBpbnRlcmZhY2Ugd2l0aG91dAo+IGlzc3Vlcywgc28gSSB3
b3VsZCBqdXN0Cj4gcy9YRU5fU1lTQ1RMX1BIWVNDQVBfaHZtX2RpcmVjdGlvL1hFTl9TWVNDVExf
UEhZU0NBUF9pb21tdS8uCj4gCgpJIGFncmVlIGFuZCBhbSB2ZXJ5IHRlbXB0ZWQgYXQgdGhlIG1v
bWVudC4gQnV0IGxldCdzIHdhaXQgdG8gc2VlIGlmCnRoZXJlIGlzIG9iamVjdGlvbi4KCldlaS4K
Cj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
