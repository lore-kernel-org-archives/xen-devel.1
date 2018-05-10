From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/pvh: enable and set default MTRR
 type
Date: Thu, 10 May 2018 12:52:06 +0100
Message-ID: <20180510115206.nbkthffhksy3l4g5__36245.3363756233$1525953057$gmane$org@citrix.com>
References: <20180509102129.14832-1-roger.pau@citrix.com>
 <20180509102129.14832-2-roger.pau@citrix.com>
 <fbe18be3-0e2e-723f-a625-015c6aad89a3@citrix.com>
 <20180509113016.tavac64ba5fu3tob@MacBook-Pro-de-Roger.local>
 <20180509151139.nytwuepervqjkcat@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zqgd=h5=citrix.com=prvs=66156bf31=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fGk7G-000495-7j
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 11:52:10 +0000
Content-Disposition: inline
In-Reply-To: <20180509151139.nytwuepervqjkcat@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMDksIDIwMTggYXQgMDQ6MTE6MzlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIE1heSAwOSwgMjAxOCBhdCAxMjozMDoxNlBNICswMTAwLCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMDksIDIwMTggYXQgMTE6NTY6NDBB
TSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+ID4gT24gMDkvMDUvMTggMTE6MjEsIFJv
Z2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4gSSdtIG5vdCBzdXJlIHRoYXQgc2V0dGluZyB0aGUg
ZGVmYXVsdCBNVFJSIHR5cGUgaXMgZ29pbmcgdG8gYmUgYQo+ID4gPiBjbGV2ZXIgaWRlYSBpbiBo
aW5kc2lnaHQgd2hlbiB3ZSBjb21lIHRvIGRvaW5nIFBDSSBQYXNzdGhyb3VnaCBzdXBwb3J0Lgo+
ID4gCj4gPiBTZXR0aW5nIHRoZSBkZWZhdWx0IHR5cGUgdG8gV0IgaXMgYWxzbyBzZXQgYnkgaHZt
bG9hZGVyLCBpdCdzIGp1c3QKPiA+IHRoYXQgaHZtbG9hZGVyIGFsc28gc2V0cyBzb21lIG9mIHRo
ZSBmaXhlZCBhbmQgdmFyaWFibGUgcmFuZ2VzIHRvIFVDCj4gPiBpbiBvcmRlciB0byBjb3ZlciB0
aGUgaW9tZW0gYXJlYXMuCj4gPiAKPiA+IFRoZSBleHBlY3RhdGlvbnMgd2hlbiBkb2luZyBwY2kt
cGFzc3Rocm91Z2ggaXMgdGhhdCB0aGUgZ3Vlc3Qgd2lsbAo+ID4gYWx3YXlzIHVzZSBwYWdpbmcg
YW5kIFBBVCBpbiBvcmRlciB0byBzZXQgdGhlIGFwcHJvcHJpYXRlIGNhY2hlCj4gPiBhdHRyaWJ1
dGVzLCBvciBlbHNlIHRoZSBndWVzdCBpdHNlbGYgd2lsbCBoYXZlIHRvIHByb2dyYW0gdGhlIFVD
IE1UUlIKPiA+IHJhbmdlcywgSSBhZG1pdCB0aGF0J3Mgbm90IHZlcnkgbmljZSBob3dldmVyLgo+
ID4gCj4gPiBXaGF0IGFib3V0IGVuYWJsaW5nIHRoZSBkZWZhdWx0IE1UUlIgdHlwZSBhbmQgc2V0
dGluZyBpdCB0byBXQiBpbiB0aGUKPiA+IHRvb2xzdGFjayBmb3IgUFZIPyBJTU8gZG9pbmcgaXQg
WGVuIGl0c2VsZiB3b3VsZCBiZSB3cm9uZy4KPiAKPiBJIGhhdmUgdGhlIGZvbGxvd2luZyBwYXRj
aCB0byBzZXQgdGhlIGRlZmF1bHQgTVRSUiB0eXBlLCBidXQgSSB0aGluawo+IGlmIHdlIGdvIGRv
d24gdGhpcyByb2FkIHRoZW4gd2Ugd2lsbCBhbHNvIGhhdmUgdG8gc2V0IFVDIE1UUlJzIGZvcgo+
IE1NSU8gYXJlYXMsIHdoaWNoIGFnYWluIHNlZW1zIGZpbmUgdG8gbWUuCj4gCgpDYW4geW91IHBs
ZWFzZSBkb2N1bWVudCB0aGUgZGVmYXVsdCB0eXBlKHMpIHRvIHB2aC5tYXJrZG93biBvbmNlCnRo
ZSBpc3N1ZSBpcyByZXNvbHZlZD8KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
