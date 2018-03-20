From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 11/11] vpci/msix: add MSI-X handlers
Date: Tue, 20 Mar 2018 11:48:46 +0000
Message-ID: <20180320114846.t3qne5slrqbtgchf@MacBook-Pro-de-Roger.local>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-12-roger.pau@citrix.com>
 <5AB0F87D02000078001B3E0B@prv-mh.provo.novell.com>
 <20180320114300.xzadfq244eihcgn3@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=px6q=gk=citrix.com=prvs=610419324=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyFl9-0007oe-Fu
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 11:48:55 +0000
Content-Disposition: inline
In-Reply-To: <20180320114300.xzadfq244eihcgn3@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMTE6NDM6MDBBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIE1hciAyMCwgMjAxOCBhdCAwNTowMzowOUFNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAxNi4wMy4xOCBhdCAxNDozMCwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJO
SU5HCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byByZW1vdmUgTVNJWCB0YWJs
ZSBbJSIgUFJJX2dmbiAiLCAlIiBQUklfZ2ZuICJdOiAlZFxuIiwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICBQRk5fRE9XTihzdGFydCksIFBGTl9ET1dOKGVuZCksIHJjKTsKPiA+IAo+ID4gSW4g
Y2FzZXMgbGlrZSB0aGlzICh3aGVyZSB5b3UgZG9uJ3QgdXNlIHBsYWluIHN0YXJ0L2VuZCBhbnl3
aGVyZSwKPiA+IGJ1dCB5b3UgZG8gdXNlIHRoZSBzYW1lIGNhbGN1bGF0aW9uIG9uIHRoZW0gdHdp
Y2UgZWFjaCksIGl0J3MKPiA+IGNlcnRhaW5seSBtb3JlIGVmZmljaWVudCBmb3IgdGhlIGxvY2Fs
IHZhcmlhYmxlcyB0byBiZSBmcmFtZSBudW1iZXJzCj4gPiByaWdodCBhd2F5Lgo+IAo+IFJpZ2h0
LCBJJ3ZlIGZpeGVkIGl0IGFuZCBhbHNvIGNoYW5nZWQgdGhlIHByaW50ZiBmb3JtYXR0ZXJzIHRv
IGx1LCBJCj4gZ3Vlc3MgYXQgc29tZSBwb2ludCBpbiB0aGUgc2VyaWVzIEkgdXNlZCB0byBwcmlu
dCBnZm4gdmFsdWVzLgoKTWVhbnQgbHggbm90IGx1Li4uCgpTb3JyeS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
