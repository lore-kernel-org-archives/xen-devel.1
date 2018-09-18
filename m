From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Tue, 18 Sep 2018 17:21:18 +0100
Message-ID: <ca97a565-47ac-cb91-db50-52ef397237e5@citrix.com>
References: <20180913163848.32216-1-george.dunlap@citrix.com>
 <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
 <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
 <20180914090213.i7qamzxai2cudczo@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cr/b=ma=citrix.com=prvs=792583d5e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g2Ike-00010Q-6O
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 16:21:24 +0000
In-Reply-To: <20180914090213.i7qamzxai2cudczo@zion.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTQvMjAxOCAxMDowMiBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIFNlcCAxNCwg
MjAxOCBhdCAwMjo0NTozNUFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMu
MDkuMTggYXQgMTg6NTEsIDxkZmFnZ2lvbGlAc3VzZS5jb20+IHdyb3RlOgo+Pj4gT24gVGh1LCAy
MDE4LTA5LTEzIGF0IDE3OjM4ICswMTAwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4+IENyZWRp
dDIgd2FzIGRlY2xhcmVkICJzdXBwb3J0ZWQiIGluIDQuOCwgYW5kIGFzIG9mIDQuMTAgaGFkIHR3
byBvdGhlcgo+Pj4+IGNyaXRpY2FsIGZlYXR1cmVzIGltcGxlbWVudGVkIChzb2Z0IGFmZmluaXR5
IC8gTlVNQSBhbmQgY2FwcykuCj4+Pj4KPj4+PiBbLi5dCj4+Pj4KPj4+PiBDcmVkaXQyLCBsaWtl
IGNyZWRpdCwgaGFzIGEgbnVtYmVyIG9mIHdvcmtsb2FkcyAvIHNldHVwcyBmb3Igd2hpY2gKPj4+
PiBwZXJmb3JtYW5jZSBjb3VsZCBiZSBpbXByb3ZlZC4gIFBlcnNvbmFsbHkgSSB0aGluayBuZXR3
b3JraW5nIGFuZAo+Pj4+IHBhcnRpYWxseS1sb2FkZWQgc3lzdGVtcyBpcyBnb2luZyB0byBiZSBt
b3JlIHJlcHJlc2VudGF0aXZlIG9mIHdoYXQKPj4+PiBYZW4gaXMgYWN0dWFsbHkgdXNlZCBmb3I7
IHNvIEkgdGhpbmsgY3JlZGl0MiBpcyBvbiB0aGUgd2hvbGUgdGhlCj4+Pj4gYmV0dGVyIHNjaGVk
dWxlciB0byB1c2UgYnkgZGVmYXVsdC4gIEFuZCBpbiBhbnkgY2FzZSwgbWFraW5nIHRob3NlCj4+
Pj4gaW1wcm92ZW1lbnRzIG9uIGNyZWRpdDIgd2lsbCBiZSBlYXNpZXIgdGhhbiBvbiBjcmVkaXQu
Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+Cj4+Pj4KPj4+IEFmdGVyIGFsbCB0aGUgZWZmb3J0IHdlJ3ZlIHNwZW50IG9uIHRo
aXMsIEknbSByZWFsbHksIHJlYWxseSBoYXBweSB0bwo+Pj4gc2VlIHRoaXMgKHRyeWluZyB0bykg
aGFwcGVuLiBUaGFua3MgZm9yIHNlbmRpbmcgdGhlIHBhdGNoLiA6LSkKPj4+Cj4+PiBJIGZ1bGx5
IGFncmVlIHdpdGggYW5kIHNlY29uZCBHZW9yZ2UncyByZWFzb25pbmcsIGFuZCBmZWVsIDEwMCUg
bGlrZQo+Pj4gcHJvdmlkaW5nIG15Ogo+Pj4KPj4+IEFja2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8
ZGZhZ2dpb2xpQHN1c2UuY29tPgo+Pgo+PiBBbmQgdGhhdCdzIGRlc3BpdGUgInNjaGVkPWNyZWRp
dDIgY3Jhc2hlcyBzeXN0ZW0gd2hlbiB1c2luZwo+PiBjcHVwb29scyI/IFdoaWxlIEkgYWdyZWUg
dGhhdCB3ZSBzaG91bGRuJ3QgZGVsYXkgdGhlIHN3aXRjaCBmb3IKPiAKPiBVcmdoLCB0aGlzIGlz
IGEgcmVhbGx5IG5hc3R5IGJ1Zy4KPiAKPj4gbXVjaCBsb25nZXIsIGluIHBhcnRpY3VsYXIgd2l0
aCB0aGVyZSBhbHJlYWR5IGJlaW5nIGEgZml4IGF2YWlsYWJsZQo+PiBmcm9tIHlvdSBJIHRoaW5r
IHRoYXQgb25lIHNob3VsZCBnbyBpbiBiZWZvcmUgdGhlIG9uZSBoZXJlLgo+IAo+ICsxLgoKVGhl
IG90aGVyIGZpeCBpcyBpbi4gIEknbGwgd2FpdCBhIGZldyBkYXlzIGFuZCBwdXNoIHRoaXMgY2hh
bmdlLCBpZgp0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
