From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Mon, 11 Feb 2019 14:16:13 +0100
Message-ID: <20190211131613.3mbrgkkikgssyvl3@mac>
References: <4da92f88-34ea-30fb-9ff2-5ef72455dab7@eikelenboom.it>
 <20190124101100.iuflmkbbuol3eluz@mac>
 <823f206d-1838-1ed9-0c9f-aaea5afaff3e@eikelenboom.it>
 <20190124120431.hdiojrypvost77pm@mac>
 <20190125143853.3lx7owqixflnygwj@mac>
 <d1414107-2fc8-f686-79ab-77bb38a60b89@eikelenboom.it>
 <20190208151053.573gy7jnr7jymu4e@mac>
 <0c10c9b7-5705-eb98-4ff7-eb1200aba86b@eikelenboom.it>
 <20190208164741.lfk2arp3ce66t65q@mac>
 <1d6f7531-b716-7391-21c1-2f5497b15811@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TcXE=QS=citrix.com=prvs=938cbf5a0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gtBRc-0005cv-Va
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 13:16:21 +0000
Content-Disposition: inline
In-Reply-To: <1d6f7531-b716-7391-21c1-2f5497b15811@eikelenboom.it>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDgsIDIwMTkgYXQgMDg6MzY6NTRQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IE9uIDA4LzAyLzIwMTkgMTc6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBGcmksIEZlYiAwOCwgMjAxOSBhdCAwNToxNToyMlBNICswMTAwLCBTYW5kZXIgRWlr
ZWxlbmJvb20gd3JvdGU6Cj4gPj4gT24gMDgvMDIvMjAxOSAxNjoxMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+Pj4gT24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDc6NDQ6NDBQTSArMDEwMCwg
U2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+ID4+Pj4gT24gMjUvMDEvMjAxOSAxNTozOCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4+PiBPbiBUaHUsIEphbiAyNCwgMjAxOSBhdCAwMTow
NDozMVBNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+Pj4+IFNvcnJ5LCBmaXhp
bmcgdGhhdCBlcnJvciB0b29rIGxvbmdlciB0aGFuIGV4cGVjdGVkLCBhbmQgcmVxdWlyZXMKPiA+
Pj4+PiBtb2RpZnlpbmcgcXVpdGUgYSBsb3Qgb2YgY29kZSwgc28gSSdtIG5vdCBzdXJlIHdoZXRo
ZXIgaXQncyBzb21ldGhpbmcKPiA+Pj4+PiB0byBjb25zaWRlciBmb3IgNC4xMiwgSSBoYXZlIHRv
IHRoaW5rIGFib3V0IGl0Lgo+ID4+Pj4KPiA+Pj4+IEkgdW5kZXJzdGFuZCwgZXNwZWNpYWxseSBz
aW5jZSBQVkggZG9tMCBpcyBtYXJrZWQgYXMgZXhwZXJpbWVudGFsLgo+ID4+Pj4KPiA+Pj4+PiBJ
biB0aGUgbWVhbnRpbWUsIGNhbiB5b3UgcGxlYXNlIHRlc3QgdGhlIGZvbGxvd2luZyBicmFuY2g6
Cj4gPj4+Pj4KPiA+Pj4+PiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcGVvcGxlL3JveWdlci94ZW4u
Z2l0IGlvbW11LWZpeGVzLXYyCj4gPj4+Pj4KPiA+Pj4+PiBJJ3ZlIGJlZW4gYWJsZSB0byBzdWNj
ZXNzZnVsbHkgY3JlYXRlIGEgUFZIIGd1ZXN0IGZyb20gYSBQVkggZG9tMCBvbgo+ID4+Pj4+IEFN
RCBoYXJkd2FyZSB1c2luZyB0aGlzIGJyYW5jaC4KPiA+Pj4+Cj4gPj4+PiBPbiB0aGUgb3RoZXIg
aGFuZCwgd2l0aCBhIHF1aWNrIHRlc3QgSSBjYW4gY29uZmlybSB0aGF0IGJvb3RpbmcgYSBQVkgg
Z3Vlc3QgZnJvbSBhIFBWSCBkb20wIG5vdyB3b3JrcyBmb3IgbWUgYXMgd2VsbCAhIAo+ID4+Pj4g
KGFuZCBib290aW5nIHRoaXMgYnVpbGQgYXMgUFYgZG9tMCwgd2l0aCBteSBub3JtYWwgUFZIL0hW
TSBtaXggb2YgZ3Vlc3RzIHN0aWxsIHdvcmtzLCBubyByZWdyZXNzaW9ucyBmb3IgbWUgc28gZmFy
KQo+ID4+Cj4gPj4KPiA+PiAgCj4gPj4+IFNvcnJ5IGZvciBib3RoZXJpbmcgeW91IGFnYWluLCBi
dXQgY291bGQgeW91IGdpdmUgdGhlIGZvbGxvd2luZyBicmFuY2gKPiA+Pj4gYSB0ZXN0Ogo+ID4+
Cj4gPj4gTm8gcHJvYmxlbSwgaGFwcHkgdG8ga2VlcCB0ZXN0aW5nIHVudGlsIGl0IHdvcmtzIGFu
ZCBpcyBpbiBnb29kIGVub3VnaCBzaGFwZSB0byBnZXQgY29tbWl0dGVkLgo+ID4+Cj4gPj4gQW5k
IGZvcnR1bmF0ZWx5IHlvdSBhc2tlZCwgYmVjYXVzZSB1bmZvcnR1bmF0ZWx5IGl0IGRvZXNuJ3Qg
Ym9vdCBhcyBwdmhkb20wLCBzZXJpYWwgbG9nIGlzIGF0dGFjaGVkLgo+ID4gCj4gPiBUaGFua3Mh
Cj4gPiAKPiA+IENhbiB5b3UgdHJ5IHdpdGggdGhlIGZvbGxvd2luZyBkZWJ1ZyBwYXRjaCBvbiB0
b3A/IFRoaXMgc2hvdWxkIHByaW50IGEKPiA+IG1lc3NhZ2UgYmVmb3JlIGhpdHRpbmcgdGhlIGFz
c2VydCwgaG9wZWZ1bGx5IGdpdmluZyB1cyBtb3JlCj4gPiBpbmZvcm1hdGlvbi4KPiA+IAo+ID4g
Um9nZXIuCj4gCj4gU3VyZSwgSSB3YXMgYWxzbyBtaXNzaW5nIGEgc3luY19jb25zb2xlIG9uIHRo
ZSBYZW4gY21kbGluZSwKPiBzZXJpYWwgbG9nIGF0dGFjaGVkLgoKVGhhbmtzLCBJJ3ZlIGdvdCBh
bm90aGVyIGJyYW5jaCBmb3IgeW91IHRvIHRyeToKCmdpdDovL3hlbmJpdHMueGVuLm9yZy9wZW9w
bGUvcm95Z2VyL3hlbi5naXQgZml4ZXMtNC4xMi12Mi4xCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
