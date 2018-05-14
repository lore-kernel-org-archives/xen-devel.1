From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/5] libxc/pvh: set default MTRR type to
 write-back
Date: Mon, 14 May 2018 17:02:47 +0100
Message-ID: <20180514160247.fyvfgu3hstupexe5@MacBook-Pro-de-Roger.local>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-5-roger.pau@citrix.com>
 <20180514160051.uf3idifgc4n6p7wl@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xph0=ib=citrix.com=prvs=66538a94f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fIFwO-0004xq-1V
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:03:12 +0000
Content-Disposition: inline
In-Reply-To: <20180514160051.uf3idifgc4n6p7wl@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMDU6MDA6NTFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIE1heSAxMCwgMjAxOCBhdCAwNjoxNTowNFBNICswMTAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBAQCAtMTAxNCw2ICsxMDM0LDMwIEBAIHN0YXRpYyBpbnQgdmNwdV9odm0o
c3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQo+ID4gICAgICBpZiAoIGRvbS0+c3RhcnRfaW5mb19z
ZWcucGZuICkKPiA+ICAgICAgICAgIGJzcF9jdHguY3B1LnJieCA9IGRvbS0+c3RhcnRfaW5mb19z
ZWcucGZuIDw8IFBBR0VfU0hJRlQ7Cj4gPiAgCj4gPiArICAgIC8qIFNldCB0aGUgTVRSUi4gKi8K
PiA+ICsgICAgYnNwX2N0eC5tdHJyX2QudHlwZWNvZGUgPSBIVk1fU0FWRV9DT0RFKE1UUlIpOwo+
ID4gKyAgICBic3BfY3R4Lm10cnJfZC5pbnN0YW5jZSA9IDA7Cj4gPiArICAgIGJzcF9jdHgubXRy
cl9kLmxlbmd0aCA9IEhWTV9TQVZFX0xFTkdUSChNVFJSKTsKPiA+ICsKPiA+ICsgICAgbXRycl9y
ZWNvcmQgPSBodm1fZ2V0X3NhdmVfcmVjb3JkKGZ1bGxfY3R4LCBIVk1fU0FWRV9DT0RFKE1UUlIp
LCAwKTsKPiA+ICsgICAgaWYgKCAhbXRycl9yZWNvcmQgKQo+ID4gKyAgICB7Cj4gPiArICAgICAg
ICB4Y19kb21fcGFuaWMoZG9tLT54Y2gsIFhDX0lOVEVSTkFMX0VSUk9SLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICIlczogdW5hYmxlIHRvIGdldCBNVFJSIHNhdmUgcmVjb3JkIiwgX19mdW5j
X18pOwo+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgIH0KPiAKPiBXaWxsIHRoaXMgYnJl
YWsgY3Jvc3MgdmVyc2lvbiBtaWdyYXRpb24gd2hlbiB0aGUgb2xkZXIgaHlwZXJ2aXNvcgo+IGRv
ZXNuJ3QgaGF2ZSBzdWNoIHJlY29yZD8KClRoaXMgbWlncmF0aW9uIHJlY29yZCBpcyBhbHJlYWR5
IHByZXNlbnQsIGl0J3Mgbm90IGludHJvZHVjZWQgaW4gdGhpcwpwYXRjaCBzZXJpZXMuIEknbSBz
aW1wbHkgbWFraW5nIHVzZSBvZiBpdCBpbiBvcmRlciB0byBzZXQgYSB2YWxpZAppbml0aWFsIE1U
UlIgc3RhdGUuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
