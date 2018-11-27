From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Tue, 27 Nov 2018 08:37:17 +0100
Message-ID: <48ce4285-ed04-13e3-6fd7-9a70964d51bf@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mF6G=OG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRXvt-0001mP-0Q
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 07:37:21 +0000
References: =?UTF-8?B?PDIwMTgxMTIzMTMyNTE2LjI4Njgx77+977+977+977+977+977+9?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+9Me+/ve+/ve+/ve+/ve+/vQ==?=
 =?UTF-8?B?77+977+977+977+977+977+977+977+977+977+977+9amdyb3NzQHN1c2UuY29t?=
 =?UTF-8?Q?=3e_=3c5BFBD1C602000078001FFE09=40suse=2ecom=3e_=3cd38b1c33?=
 =?UTF-8?B?77+977+977+977+9NWNjYe+/ve+/ve+/ve+/vTU3MmHvv73vv73vv73vv71hOTQy?=
 =?UTF-8?B?77+977+977+977+9YjFkYjhjYTMwOWEyQHN1c2UuY29tPiA8NUJGQkZDRDMwMjAw?=
 =?UTF-8?B?MDA3ODAwMjAwMDRGQHN1c2UuY29tPiA8OTU1YmVjMGTvv71mNTc077+9NTNjNQ==?=
 =?UTF-8?B?77+9OTFhNe+/vTFkNmVhMGJjNGYyYUBzdXNlLmNvbT4gPDVCRkMwQTEzMDIwMDAw?=
 =?UTF-8?B?NzgwMDIwMDBFMUBzdXNlLmNvbT4gPDA2NTkyNzM377+9NDExZu+/vWQ1MTjvv71k?=
 =?UTF-8?B?OTcy77+9NmI0Y2RjNzA0ZDliQHN1c2UuY29tPiA8NGM3MTU4YjTvv71kNGRh77+9?=
 =?UTF-8?B?OTk0Ze+/vTU0NWLvv704ZjVkZWM5N2RiYjZAYXJtLmNvbT4gPDJiMDQwZWRlLTIx?=
 =?UTF-8?Q?03-b93c-c005-5ff39ae21c4c=40suse=2ecom=3e_=3c5BFC2462020000780020?=
 =?UTF-8?Q?022A=40suse=2ecom=3e?=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTEvMjAxOCAxNzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMTEuMTgg
YXQgMTc6MTcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJIHJlYWxseSBmYWlsIHRvIHNl
ZSB3aHkgaXQgaXMgc28gYmFkIHRvIG5vdCBjbG9iYmVyIGRhdGEgaW4gYSBjYXNlCj4+IHdoaWNo
IG5vcm1hbGx5IHNob3VsZCBuZXZlciBvY2N1ci4KPiAKPiBTZWUgQW5kcmV3J3Mgb3JpZ2luYWwg
cmVwbHkuIFlvdSdyZSBhbHNvIGNsb2JiZXJpbmcgb24gcG90ZW50aWFsCj4gc3VjY2VzcyBwYXRo
cy4KCkkgdGhpbmsgeW91IGFyZSBtaXNzaW5nIGEgIm5vdCIgaGVyZS4KCkJ1dCB5ZXMsIEkgYWdy
ZWUuIFRoaXMgaXMgYSBkb3duc2lkZSBfSV8gdGhpbmsgd2UgY2FuIGxpdmUgd2l0aC4KCkhvdyBt
YW55IGNhc2VzICh3aXRoIHByb2R1Y3RpdmUgaHlwZXJ2aXNvcnMpIGFyZSBrbm93biB3aGVyZSBt
dWx0aWNhbGwKcGFyYW1ldGVycyBoYXZlIGJlZW4gaWxsZWdhbGx5IHJlLXVzZWQ/IEkgZ3Vlc3Mg
dGhlIG51bWJlciBpcyBleGFjdGx5IDAuCgpJIGtub3cgb2YgbGVhc3Qgb25lIGNhc2Ugd2hlcmUg
bm90IGNsb2JiZXJpbmcgd291bGQgYmUgdXNlZnVsIGZvcgpkaWFnbm9zdGljIHJlYXNvbnMuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
