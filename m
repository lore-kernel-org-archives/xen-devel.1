From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 08/10] x86: Introduce a function to check
 the value of RTIT_CTL
Date: Tue, 03 Jul 2018 06:15:56 -0600
Message-ID: <5B3B68FC02000078001D04AE@prv1-mh.provo.novell.com>
References: <1527686884-5917-1-git-send-email-luwei.kang@intel.com>
 <1527686884-5917-9-git-send-email-luwei.kang@intel.com>
 <5B36488402000078001CF3EC@prv1-mh.provo.novell.com>
 <82D7661F83C1A047AF7DC287873BF1E168048205@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <82D7661F83C1A047AF7DC287873BF1E168048205@SHSMSX101.ccr.corp.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Luwei Kang <luwei.kang@intel.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEyOjE5LCA8bHV3ZWkua2FuZ0BpbnRlbC5jb20+IHdyb3RlOgo+
PiA+ICsgICAgLyoKPj4gPiArICAgICAqIEFueSBhdHRlbXB0IHRvIG1vZGlmeSBJQTMyX1JUSVRf
Q1RMIHdoaWxlIFRyYWNlRW4gaXMgc2V0IHdpbGwKPj4gPiArICAgICAqIHJlc3VsdCBpbiBhICNH
UCB1bmxlc3MgdGhlIHNhbWUgd3JpdGUgYWxzbyBjbGVhcnMgVHJhY2VFbi4KPj4gPiArICAgICAq
Lwo+PiA+ICsgICAgaWYgKCAoaXB0X2Rlc2MtPmlwdF9ndWVzdC5jdGwgJiBSVElUX0NUTF9UUkFD
RUVOKSAmJgo+PiA+ICsgICAgICAgICgoaXB0X2Rlc2MtPmlwdF9ndWVzdC5jdGwgXiBuZXcpICYg
flJUSVRfQ1RMX1RSQUNFRU4pICkKPj4gCj4+IFdoeSB0aGUgXiA/IFlvdSBvbmx5IG5lZWQgdG8g
Y2hlY2sgd2hldGhlciBuZXcgaGFzIHRoZSBiaXQgY2xlYXIuCj4gCj4gSSBtZWFuIGlmIGNoYW5n
ZSBhbnkgYml0cyAoc2V0IG9yIGNsZWFyLCBub3QgaW5jbHVkZSBSVElUX0NUTF9UUkFDRUVOKSB3
aXRoIAo+IFBUIGlzIGVuYWJsZWQgKFJUSVRfQ1RMX1RSQUNFRU4gaXMgc2V0KSB3aWxsIGluamVj
dCBhbiAjR1AuCgpIbW0sIG1heWJlIEkgd2FzIHdyb25nbHkgdGhpbmtpbmcgdGhhdCB0aGUgZWFy
bGllciBuZXcgIT0gb2xkIGNoZWNrCnJlbmRlcnMgcmVkdW5kYW50IHRoZSBjaGVjayBoZXJlLgoK
Pj4gPiBAQCAtMTcxLDYgKzI3OSw4IEBAIGludCBpcHRfZG9fd3Jtc3IodW5zaWduZWQgaW50IG1z
ciwgdWludDY0X3QgbXNyX2NvbnRlbnQpCj4+ID4gICAgICBzd2l0Y2ggKCBtc3IgKQo+PiA+ICAg
ICAgewo+PiA+ICAgICAgY2FzZSBNU1JfSUEzMl9SVElUX0NUTDoKPj4gPiArICAgICAgICBpZiAo
IHJ0aXRfY3RsX2NoZWNrKG1zcl9jb250ZW50LCBpcHRfZGVzYy0+aXB0X2d1ZXN0LmN0bCkgKQo+
PiA+ICsgICAgICAgICAgICByZXR1cm4gMTsKPj4gPiAgICAgICAgICBpcHRfZGVzYy0+aXB0X2d1
ZXN0LmN0bCA9IG1zcl9jb250ZW50Owo+PiA+ICAgICAgICAgIF9fdm13cml0ZShHVUVTVF9JQTMy
X1JUSVRfQ1RMLCBtc3JfY29udGVudCk7Cj4+ID4gICAgICAgICAgYnJlYWs7Cj4+IAo+PiBXaXRo
b3V0IHRoaXMgSSBkb24ndCBzZWUgaG93IHRoZSBwcmV2aW91cyBwYXRjaCBpcyBjb21wbGV0ZS4K
PiAKPiBXaGF0IGFib3V0IG1lcmdlIHRoaXMgcGF0Y2ggd2l0aCBwYXRjaCA3ID8KClRoYXQgd2Fz
IHRoZSBpbXBsaWVkIHN1Z2dlc3Rpb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
