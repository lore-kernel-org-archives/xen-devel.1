From: "Kang, Luwei" <luwei.kang@intel.com>
Subject: Re: [PATCH RESEND v1 0/7] Intel Processor Trace
 virtulization enabling
Date: Tue, 16 Jan 2018 09:45:49 +0000
Message-ID: <82D7661F83C1A047AF7DC287873BF1E167E77966@SHSMSX101.ccr.corp.intel.com>
References: <1516039953-2988-1-git-send-email-luwei.kang@intel.com>
 <5A5DC8D3020000780019EFC1@prv-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E167E77917@SHSMSX101.ccr.corp.intel.com>
 <5A5DD444020000780019F029@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A5DD444020000780019F029@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "tim@xen.org" <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiA+Pj4gT24gMTYuMDEuMTggYXQgMTA6MDIsIDxsdXdlaS5rYW5nQGludGVsLmNvbT4gd3JvdGU6
Cj4gPj4gPj4+IE9uIDE1LjAxLjE4IGF0IDE5OjEyLCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdy
b3RlOgo+ID4+ID4gTHV3ZWkgS2FuZyAoNyk6Cj4gPj4gPiAgIHg4NjogYWRkIGEgZmxhZyB0byBl
bmFibGUgSW50ZWwgcHJvY2Vzc29yIHRyYWNlCj4gPj4gPiAgIHg4NjogY29uZmlndXJlIHZtY3Mg
Zm9yIEludGVsIHByb2Nlc3NvciB0cmFjZSB2aXJ0dWFsaXphdGlvbgo+ID4+ID4gICB4ODY6IGFk
ZCBpbnRlbCBwcm9lY2Vzc29yIHRyYWNlIHN1cHBvcnQgZm9yIGNwdWlkCj4gPj4gPiAgIHg4Njog
YWRkIGludGVsIHByb2Nlc3NvciB0cmFjZSBjb250ZXh0Cj4gPj4gPiAgIHg4NjogSW1wbGVtZW50
IEludGVsIFByb2Nlc3NvciBUcmFjZSBjb250ZXh0IHN3aXRjaAo+ID4+ID4gICB4ODY6IEltcGxl
bWVudCBJbnRlbCBQcm9jZXNzb3IgVHJhY2UgTVNScyByZWFkL3dyaXRlCj4gPj4gPiAgIHg4Njog
RGlzYWJsZSBJbnRlbCBQcm9jZXNzb3IgVHJhY2Ugd2hlbiBWTVhPTiBpbiBMMSBndWVzdAo+ID4+
Cj4gPj4gSG93IGNhbiB0aGlzIGJlIGEgcmUtc2VuZCBvZiB2MSB3aGVuIHRoZSBvcmlnaW5hbCB2
MSBjb25zaXN0ZWQgb2YganVzdCA2IHBhdGNoZXM/Cj4gPj4KPiA+Cj4gPiBZZXMsIEkgbWFrZSBz
b21lIGNoYW5nZSBpbiBJbnRlbCBQVCBjb250ZXh0IHN3aXRjaChvbmx5IHNhdmUgL2xvYWQKPiA+
IGd1ZXN0IHN0YXRlIHdoZW4gSW50ZWwgUFQgaXMgZW5hYmxlZCBpbiBndWVzdCksIEludGVsIFBU
IE1TUnMgcGFzcwo+ID4gdGhyb3VnaCBzdHJhdGVneSAob25seSBwYXNzdGhyb3VnaCBNU1JzIHdo
ZW4gUFQgaXMgZW5hYmxlZCBpbiBndWVzdCkKPiA+IGFuZCAgYWRkIGEgcGF0Y2ggKHBhdGNoCj4g
PiA3KSB0byBkaXNhYmxlIEludGVsIFBULVZNWCBpbiBuZXN0ZWQuCj4gPiBCZWNhdXNlIG9mIHRo
ZXJlIGp1c3QgaGF2ZSBzb21lIGhpZ2ggbGV2ZWwgY29tbWVudHMgZnJvbSBjb21tdW5pdHkgYW5k
Cj4gPiBhYm92ZSBhbGwgY2hhbmdlcyBpcyBmcm9tIG15IHBvaW50IG9mIHZpZXcuIFNvIEkgcmUt
c2VuZCB0aGlzIHBhdGNoIHNldCBzdGlsbCBhcyB2MS4KPiAKPiBBbnkgY2hhbmdlIG1ha2VzIGl0
IGEgbmV3IHZlcnNpb24uIElmIHlvdSBkb24ndCB3YW50IHRvIHVzZSB2MiwgdXNlIHYxLjUgb3Ig
djEuMSBpbiBzdWNoIGEgY2FzZS4KPiAKCkdldCBpdC4KClRoYW5rcywKTHV3ZWkgS2FuZwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
