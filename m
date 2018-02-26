From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/2] vmx/hap: optimize CR4 trapping
Date: Mon, 26 Feb 2018 10:12:20 +0000
Message-ID: <20180226101220.2squy3o4xejwfmdh@MacBook-Pro-de-Roger.local>
References: <20180220085647.25459-1-roger.pau@citrix.com>
 <20180220085647.25459-3-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D191015327@SHSMSX101.ccr.corp.intel.com>
 <20180223101755.oow5adp5weal6obd@MacBook-Pro-de-Roger.local>
 <AADFC41AFE54684AB9EE6CBC0274A5D19101739F@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=4q6f=fu=citrix.com=prvs=588a07e6a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eqFlk-0002nZ-IM
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:12:28 +0000
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19101739F@SHSMSX101.ccr.corp.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBGZWIgMjQsIDIwMTggYXQgMDE6NDc6MzdBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5j
b21dCj4gPiBTZW50OiBGcmlkYXksIEZlYnJ1YXJ5IDIzLCAyMDE4IDY6MTggUE0KPiA+IAo+ID4g
T24gRnJpLCBGZWIgMjMsIDIwMTggYXQgMDQ6NTY6MzhBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1QGNpdHJp
eC5jb21dCj4gPiA+ID4gKyAgICAgICAgX192bXdyaXRlKENSNF9HVUVTVF9IT1NUX01BU0ssIHYt
Cj4gPiA+ID4gPmFyY2guaHZtX3ZjcHUuY3I0X2hvc3RfbWFzayk7Cj4gPiA+ID4gKwo+ID4gPgo+
ID4gPiB3aGF0IGFib3V0IGRvaW5nIGEgY29tcGFyaXNvbiB0byBhdm9pZCB2bXdyaXRlIGlmIG5v
dGhpbmcgY2hhbmdlZD8KPiA+IAo+ID4gSSBjYW4gZG8gdGhhdCwgYnV0IGl0IGRvZXNuJ3Qgc2Vl
bSBsaWtlIG90aGVyIHdyaXRlcyBpbiB0aGUgc2FtZQo+ID4gZnVuY3Rpb24gZG8gdGhpcyAoc2Vl
IEdVRVNUX0NSNCB1bmNvbmRpdGlvbmFsIHdyaXRlIGFib3ZlIGZvcgo+ID4gZXhhbXBsZSkuCj4g
PiAKPiA+IElzIGl0IHJlYWxseSBiZXR0ZXIgZnJvbSBhIHBlcmZvcm1hbmNlIFBvViB0byBhdm9p
ZCB0aGUgd3JpdGU/IChvcgo+ID4gdGFrZSB0aGUgcGVuYWx0eSBvZiBkb2luZyBhIHJlYWQgKyB3
cml0ZT8pCj4gPiAKPiAKPiBub3QgbXVjaC4ganVzdCBwZXJzb25hbCBmYXZvcml0ZS4gOi0pCj4g
Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKVGhlIEFN
RCBndXlzIHJlcXVlc3RlZCBzb21lIGNoYW5nZXMgc28gSSBoYWQgdG8gc2xpZ2h0bHkgY2hhbmdl
IHRoZQpwYXRjaCBhbmQgZGlkbid0IGtlZXAgeW91IGFjay4gQ291bGQgeW91IHBsZWFzZSB0YWtl
IGEgbG9vayBhdDoKCmh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE1MTk2Mzk2NDMx
Nzg5NAoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
