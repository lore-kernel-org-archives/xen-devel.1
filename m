From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Tue, 27 Nov 2018 10:28:13 +0100
Message-ID: <a9a28a8e-5bfc-4491-4696-803dd42998ec@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mF6G=OG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRZfF-0001z0-Hy
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 09:28:17 +0000
References: =?UTF-8?B?PDIwMTgxMTIzMTMyNTE2LjI4Njgx77+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+9Me+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5BFBD1C602000078001FFE09=40suse=2ecom=3e_=3cd38b1c33?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+977+977+977+977+977+9?=
 =?UTF-8?B?NWNjYe+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+9NTcyYe+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+977+977+9YTk0Mu+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+977+977+977+977+9YjFkYjhjYTMwOWEyQHN1c2UuY29tPiA8NUJGQkZD?=
 =?UTF-8?B?RDMwMjAwMDA3ODAwMjAwMDRGQHN1c2UuY29tPiA8OTU1YmVjMGTvv73vv73vv70=?=
 =?UTF-8?B?77+9ZjU3NO+/ve+/ve+/ve+/vTUzYzXvv73vv73vv73vv705MWE177+977+977+9?=
 =?UTF-8?Q?=ef=bf=bd1d6ea0bc4f2a=40suse=2ecom=3e_=3c5BFC0A1302000078002000E1?=
 =?UTF-8?B?QHN1c2UuY29tPiA8MDY1OTI3Mzfvv73vv73vv73vv700MTFm77+977+977+977+9?=
 =?UTF-8?B?ZDUxOO+/ve+/ve+/ve+/vWQ5NzLvv73vv73vv73vv702YjRjZGM3MDRkOWJAc3Vz?=
 =?UTF-8?B?ZS5jb20+IDw0YzcxNThiNO+/ve+/ve+/ve+/vWQ0ZGHvv73vv73vv73vv705OTRl?=
 =?UTF-8?B?77+977+977+977+9NTQ1Yu+/ve+/ve+/ve+/vThmNWRlYzk3ZGJiNkBhcm0uY29t?=
 =?UTF-8?B?PiA8MmIwNDBlZGXvv70yMTAz77+9YjkzY++/vWMwMDXvv701ZmYzOWFlMjFjNGNA?=
 =?UTF-8?Q?suse=2ecom=3e_=3c5BFC2462020000780020022A=40suse=2ecom=3e_=3c48ce?=
 =?UTF-8?Q?4285-ed04-13e3-6fd7-9a70964d51bf=40suse=2ecom=3e_=3c5BFD0D4D02000?=
 =?UTF-8?Q?078002003CD=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxMDoyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMTEuMTgg
YXQgMDg6MzcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAyNi8xMS8yMDE4IDE3OjUw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI2LjExLjE4IGF0IDE3OjE3LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBJIHJlYWxseSBmYWlsIHRvIHNlZSB3aHkgaXQgaXMgc28g
YmFkIHRvIG5vdCBjbG9iYmVyIGRhdGEgaW4gYSBjYXNlCj4+Pj4gd2hpY2ggbm9ybWFsbHkgc2hv
dWxkIG5ldmVyIG9jY3VyLgo+Pj4KPj4+IFNlZSBBbmRyZXcncyBvcmlnaW5hbCByZXBseS4gWW91
J3JlIGFsc28gY2xvYmJlcmluZyBvbiBwb3RlbnRpYWwKPj4+IHN1Y2Nlc3MgcGF0aHMuCj4+Cj4+
IEkgdGhpbmsgeW91IGFyZSBtaXNzaW5nIGEgIm5vdCIgaGVyZS4KPj4KPj4gQnV0IHllcywgSSBh
Z3JlZS4gVGhpcyBpcyBhIGRvd25zaWRlIF9JXyB0aGluayB3ZSBjYW4gbGl2ZSB3aXRoLgo+Pgo+
PiBIb3cgbWFueSBjYXNlcyAod2l0aCBwcm9kdWN0aXZlIGh5cGVydmlzb3JzKSBhcmUga25vd24g
d2hlcmUgbXVsdGljYWxsCj4+IHBhcmFtZXRlcnMgaGF2ZSBiZWVuIGlsbGVnYWxseSByZS11c2Vk
PyBJIGd1ZXNzIHRoZSBudW1iZXIgaXMgZXhhY3RseSAwLgo+IAo+IEknbSBub3QgYXdhcmUgb2Yg
YW55IGVpdGhlciwgYnV0IHRoaXMgbWVhbnMgZXhhY3RseSBub3RoaW5nLgo+IAo+PiBJIGtub3cg
b2YgbGVhc3Qgb25lIGNhc2Ugd2hlcmUgbm90IGNsb2JiZXJpbmcgd291bGQgYmUgdXNlZnVsIGZv
cgo+PiBkaWFnbm9zdGljIHJlYXNvbnMuCj4gCj4gV2VsbCwgSSdtIGluIGFncmVlbWVudCB3aXRo
IEp1bGllbiB0aGF0IHRoZSBiZWhhdmlvciBiZXR3ZWVuIG9yZGluYXJ5Cj4gaHlwZXJjYWxscyBh
bmQgbXVsdGljYWxscyB3b3VsZCBiZXR0ZXIgYmUgYXMgY29uc2lzdGVudCBhcyBwb3NzaWJsZS4K
Ckkgd2lsbCBubyBsb25nZXIgcHVzaCBmb3IgdGhlIHBhdGNoIHRoZW4uIEkgc3RpbGwgYmVsaWV2
ZSB5b3VyIGRlY2lzaW9uCmlzIGJhc2VkIG9uIHdyb25nIHByaW9yaXRpZXMsIGJ1dCBJIGRvbid0
IHdhbnQgdG8gd2FzdGUgb3VyIHRpbWUgYW55Cmxvbmdlci4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
