From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 16:13:51 +0100
Message-ID: <e63442e2-9e89-b546-e968-e90eda791d06@citrix.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fclw=mk=citrix.com=prvs=802ed00fe=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g5uSo-00086I-QJ
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:13:54 +0000
In-Reply-To: <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDkvMTggMTY6MTIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMjgsIDIwMTgg
YXQgMDk6MDg6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI4LjA5LjE4
IGF0IDEwOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJp
dmVycy9jaGFyL2NvbnNvbGUuYwo+Pj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMK
Pj4+IEBAIC05MSw3ICs5MSw4IEBAIHN0YXRpYyB1aW50MzJfdCBjb25yaW5nYywgY29ucmluZ3A7
Cj4+PiAgc3RhdGljIGludCBfX3JlYWRfbW9zdGx5IHNlcmNvbl9oYW5kbGUgPSAtMTsKPj4+ICAK
Pj4+ICAjaWZkZWYgQ09ORklHX1g4Ngo+Pj4gLXN0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb3B0
X2NvbnNvbGVfeGVuOyAvKiBjb25zb2xlPXhlbiAqLwo+Pj4gKy8qIFNldCB0byB0cnVlIGF0IHN0
YXJ0IG9mIGRheSB0byBjYXRjaCBlYXJseSBib290IGlzc3VlcyAqLwo+Pj4gK3N0YXRpYyBib29s
IF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuID0gdHJ1ZTsgLyogY29uc29sZT14ZW4gKi8K
Pj4gV2hlbiBBbmRyZXcgc3VnZ2VzdGVkIHRoaXMsIGlpcmMgaGUgc2FpZCB0byBtYWtlIHRoZSB2
YXJpYWJsZQo+PiB0cmlzdGF0ZS4gT3RoZXJ3aXNlIC4uLgo+IEkgZmlndXJlIGl0IGRvZXNuJ3Qg
bmVlZCB0byBiZSB0cmlzdGF0ZS4KPgo+Pj4gQEAgLTgyMSw2ICs4MjIsMTAgQEAgdm9pZCBfX2lu
aXQgY29uc29sZV9pbml0X3ByZWlycSh2b2lkKQo+Pj4gIAo+Pj4gICAgICBzZXJpYWxfaW5pdF9w
cmVpcnEoKTsKPj4+ICAKPj4+ICsjaWZkZWYgQ09ORklHX1g4Ngo+Pj4gKyAgICBvcHRfY29uc29s
ZV94ZW4gPSBmYWxzZTsKPj4+ICsjZW5kaWYKPj4gLi4uIHlvdSBwb3NzaWJseSBvdmVycmlkZSBh
IHVzZXIgc3BlY2lmaWVkICJ0cnVlIiBoZXJlLgo+IERvIEk/IFRoaXMgaXMgcmlnaHQgYmVmb3Jl
IG9wdGlvbiBwYXJzaW5nLCBkdXJpbmcgd2hpY2ggb3B0X2NvbnNvbGVfeGVuCj4gaXMgc2V0LgoK
VGhpcyBpcyBmaW5lIGluIHByaW5jaXBsZSwgYnV0IHlvdSBjYW4ndCBpbml0aWFsaXNlIGl0IHRv
IHRydWUgYXQKY29tcGlsZSB0aW1lLCBvciBuYXRpdmUgYm9vdHMgd2lsbCB0cnkgdXNpbmcgaHlw
ZXJjYWxscyAvIHBvcnQgMHhlOS4KClRoZSBiZXN0IGJldCBpcyB0byBzZXQgaXQgdG8gdHJ1ZSBp
biB0aGUgUFZIIGVudHJ5IGFzbS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
