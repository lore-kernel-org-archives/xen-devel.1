From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 31 Jan 2019 03:28:04 -0700
Message-ID: <5C52CDB402000078002129A8@prv1-mh.provo.novell.com>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <1548064795-18160-5-git-send-email-christopher.w.clark@gmail.com>
 <20190121175527.cxrla436wy4fi67m@mac>
 <CACMJ4GZR6+DKUrFSLyqgmw4wx8V_Mw9FOvrcLv-4U0Vi5qdtmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gp9Zo-0005mR-Jf
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 10:28:08 +0000
In-Reply-To: <CACMJ4GZR6+DKUrFSLyqgmw4wx8V_Mw9FOvrcLv-4U0Vi5qdtmg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDA1OjA2LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IE9uIE1vbiwgSmFuIDIxLCAyMDE5IGF0IDk6NTUgQU0gUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEphbiAyMSwgMjAxOSBh
dCAwMTo1OTo0NEFNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPj4gPiArc3RhdGlj
IHZvaWQKPj4gPiArcGVuZGluZ19yZW1vdmVfYWxsKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBhcmdvX3JpbmdfaW5mbyAqcmluZ19pbmZvKQo+PiA+ICt7Cj4+ID4gKyAgICBzdHJ1Y3Qg
bGlzdF9oZWFkICpyaW5nX3BlbmRpbmcgPSAmcmluZ19pbmZvLT5wZW5kaW5nOwo+PiA+ICsgICAg
c3RydWN0IHBlbmRpbmdfZW50ICplbnQ7Cj4+ID4gKwo+PiA+ICsgICAgQVNTRVJUKExPQ0tJTkdf
TDMoZCwgcmluZ19pbmZvKSk7Cj4+ID4gKwo+PiA+ICsgICAgLyogRGVsZXRlIGFsbCBwZW5kaW5n
IG5vdGlmaWNhdGlvbnMgZnJvbSB0aGlzIHJpbmcncyBsaXN0LiAqLwo+PiA+ICsgICAgd2hpbGUg
KCAhbGlzdF9lbXB0eShyaW5nX3BlbmRpbmcpICkKPj4KPj4gTml0OiB5b3UgY291bGQgdXNlIGxp
c3RfZmlyc3RfZW50cnlfb3JfbnVsbCB0aGF0IGpvaW5zIHRoZSBsaXN0X2VtcHR5Cj4+IGFuZCBs
aXN0X2VudHJ5IGNhbGxzLgo+IAo+IFRoZXJlIGFyZSBubyBleGlzdGluZyB1c2VycyBvZiBsaXN0
X2ZpcnN0X2VudHJ5X29yX251bGwgYW55d2hlcmUgaW4gWGVuLAo+IGFuZCBhcHBseWluZyBpdCB0
byB0aGlzIGxvb3AgcmVzdWx0cyBpbiBhbiBhc3NpZ25tZW50IHdpdGhpbiB0aGUKPiB3aGlsZSBj
b25kaXRpb24sIHdoaWNoIGFsc28gYXBwZWFycyB0byBiZSB2ZXJ5IHJhcmUgY29uc3RydWN0IHdp
dGhpbiBYZW4sCj4gc28gSSBqdXN0IHVzZWQgdGhlIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSBt
YWNyby4KCkknbSBub3QgZnVsbHkgZm9sbG93aW5nIHdoeSBsYWNrIG9mIHVzZSBvZiBhIGNvbnN0
cnVjdCBlbHNld2hlcmUgaW4gdGhlCnRyZWUgd291bGQgYmUgYSByZWFzb24gbm90IHRvIHVzZSBp
dCBoZXJlLiBJZiB5b3Ugd2VyZSB0byB1c2Ugb25seQpjb25zdHJ1Y3RzIGFscmVhZHkgaW4gdXNl
IGluIGNvbW1vbiBjb2RlLCB5b3Ugc2hvdWxkIGFsc28gbm90IGhhdmUKaGFkIGEgbmVlZCB0byBl
LmcuIGludHJvZHVjZSBmb3IgQXJtIChhbmQgdXNlKSBndWVzdF9oYW5kbGVfZm9yX2ZpZWxkKCku
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
