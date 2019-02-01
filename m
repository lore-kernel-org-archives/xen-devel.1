From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.12] automation: introduce a QEMU smoke
 test for PVH Dom0
Date: Fri, 1 Feb 2019 15:09:00 +0000
Message-ID: <20190201150900.2bsypoiuvjxibsb3@zion.uk.xensource.com>
References: <20190124152411.20304-1-wei.liu2@citrix.com>
 <20190201134204.rj2lbojxtdg7u5yl@doug-macbook.localdomain>
 <5cce0402-be4d-efd0-2908-a8cb79d2fef9@suse.com>
 <20190201150255.rlmlro4jyyhjh62u@zion.uk.xensource.com>
 <924e71bd-b8fd-628e-4e1a-f992cb66b4a1@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0/j=QI=citrix.com=prvs=928b35cd2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gpaRX-0003qh-FF
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 15:09:23 +0000
Content-Disposition: inline
In-Reply-To: <924e71bd-b8fd-628e-4e1a-f992cb66b4a1@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDEsIDIwMTkgYXQgMDQ6MDY6MTNQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwMS8wMi8yMDE5IDE2OjAyLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gRnJpLCBG
ZWIgMDEsIDIwMTkgYXQgMDM6NTk6NThQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiA+
PiBPbiAwMS8wMi8yMDE5IDE0OjQyLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPiA+Pj4gT24gVGh1
LCBKYW4gMjQsIDIwMTkgYXQgMDM6MjQ6MTFQTSArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+Pj4+
IE1ha2UgcWVtdS1zbW9rZS14ODYtNjQuc2ggdGFrZSBhIHZhcmlhbnQgYXJndW1lbnQuIE1ha2Ug
dHdvIG5ldyB0ZXN0cwo+ID4+Pj4gaW4gdGVzdC55YW1sLgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4+Cj4gPj4+IEFja2VkLWJ5
OiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4gPj4+Cj4gPj4+IFRoaXMgaXMg
YSBnb29kIGltcHJvdmVtZW50IHRvIGluY3JlYXNlIG91ciB0ZXN0IGNvdmVyYWdlLiBUaGFua3Mg
Zm9yCj4gPj4+IGRvaW5nIHRoaXMgV2VpLgo+ID4+Cj4gPj4gSSdtIHF1aXRlIGhlc2l0YW50IHRv
IGFjY2VwdCB0aGF0IGluIHRoZSBSQy1waGFzZSBvZiA0LjEyLiBDb3VsZCB5b3UgZG8KPiA+PiBz
b21lIHRlc3Qgcm91bmRzIHRvIGVuc3VyZSB0aGlzIHRlc3Qgd29uJ3QgYmUgYmxvY2tpbmcgZHVl
IHRvCj4gPj4gaW50ZXJtaXR0ZW50IGZhaWx1cmVzPwo+ID4gCj4gPiBUaGlzIGlzbid0IGEgcGF0
Y2ggdG8gb3NzdGVzdC4gSXQgaXMgYSBwYXRjaCB0byBHaXRsYWIgQ0ksIHdoaWNoIGRvZXNuJ3QK
PiA+IGJsb2NrIG9zc3Rlc3QgaW4gYW55IHdheS4KPiA+IAo+ID4gSSBhbHNvIHJhbiBhbiBhZGhv
YyBwaXBlbGluZSB0byBtYWtlIHN1cmUgaXQgd29ya2VkLgo+IAo+IEFoLCBva2F5LiBUaGVuIHlv
dSBjYW4gaGF2ZSBteToKPiAKPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgpUaGFuayB5b3UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
