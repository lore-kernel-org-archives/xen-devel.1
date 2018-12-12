From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/dom0: improve paging memory
 usage calculations
Date: Wed, 12 Dec 2018 12:19:51 +0100
Message-ID: <20181212111951.4g5oh7fgextqdlhi@mac>
References: <20181205145500.11989-1-roger.pau@citrix.com>
 <20181205145500.11989-3-roger.pau@citrix.com>
 <5C0FD5860200007800205220@prv1-mh.provo.novell.com>
 <20181211153651.kgltzqwy5cbj5rpq@mac>
 <5C0FE4090200007800205338@prv1-mh.provo.novell.com>
 <20181212093718.cyyfhdo73slsbpt3@mac>
 <5C10DC0E020000780020561B@prv1-mh.provo.novell.com>
 <20181212101648.fqww462x7jiwsjpp@mac>
 <5C10E9A5020000780020569D@prv1-mh.provo.novell.com>
 <20181212111453.xr4teivupq2k3ggx@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9xWB=OV=citrix.com=prvs=87720dd39=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gX2Yz-0002kG-29
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 11:20:25 +0000
Content-Disposition: inline
In-Reply-To: <20181212111453.xr4teivupq2k3ggx@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMTI6MTQ6NTNQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIERlYyAxMiwgMjAxOCBhdCAwMzo1Nzo0MUFNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAxMi4xMi4xOCBhdCAxMToxNiwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gVGhlcmUgYXJlIGFsc28gZnVydGhlciBpc3N1ZXMgdGhh
dCBJIHdhbnRlZCB0byBkaXNjdXNzIGluIGEgc2VwYXJhdGUKPiA+ID4gdGhyZWFkLCB3aGF0IGFi
b3V0IGZvcmVpZ24gbWFwcGluZ3M/IERvbTAgd2lsbCBsaWtlbHkgbWFwIGEgbm9uCj4gPiA+IHRy
aXZpYWwgYW1vdW50IG9mIGdyYW50cyBhbmQgZm9yZWlnbiBtYXBwaW5ncywgd2hpY2ggd2lsbCBh
bHNvIHJlcXVpcmUKPiA+ID4gcDJtL0lPTU1VIHBhZ2UgdGFibGUgZW50cmllcy4KPiA+IAo+ID4g
SG1tLCBnb29kIHBvaW50LiBUaGVuIGFnYWluIHRoaXMgaXMgYSBydW50aW1lIHJlcXVpcmVtZW50
LAo+ID4gd2hlcmVhcyBoZXJlIHdlIHdhbnQgdG8gZ2V0IHRoZSBib290IHRpbWUgZXN0aW1hdGUg
cmlnaHQuIEF0Cj4gPiBydW50aW1lIGxhY2sgb2YgbWVtb3J5IGZvciBQMk0gdGFibGVzIHdpbGwg
c2ltcGx5IHJlc3VsdCBpbgo+ID4gLUVOT01FTS4KPiAKPiBCdXQgWGVuIHJ1bnRpbWUgbWVtb3J5
IGlzIGFsc28gdGllZCB0byB0aGUgYm9vdCBlc3RpbWF0ZXMgaWYgdGhlcmUncwo+IG5vIGRvbTBf
bWVtIHBhcmFtZXRlciBzcGVjaWZpZWQgb24gdGhlIGNvbW1hbmQgbGluZS4gSSB3b3VsZCBleHBl
Y3QKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXiB3b3VsZG4ndAo+IERvbTAgdG8gYmFsbG9vbiBkb3duIG1lbW9yeSB3aGVuIGl0IGF0dGVt
cHRzIHRvIG1hcCBCQVJzLCBldmVuIGF0Cj4gcnVudGltZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
