From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v9 03/11] x86/msr: Emulation of
 MSR_{SPEC_CTRL, PRED_CMD} for guests
Date: Fri, 19 Jan 2018 11:05:54 +0000
Message-ID: <c41707e1-b4b0-b5e4-2669-2e22909e1bbd@citrix.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-4-git-send-email-andrew.cooper3@citrix.com>
 <5A61DA6302000078001A0497@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A61DA6302000078001A0497@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andi Kleen <ak@linux.intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>, Asit K Mallick <asit.k.mallick@intel.com>, "tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>, Xen-devel <xen-devel@lists.xen.org>, Peter Zijlstra <peterz@infradead.org>, "arjan.van.de.ven@intel.com" <arjan.van.de.ven@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Ashok Raj <ashok.raj@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDEvMTggMTA6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjAxLjE4IGF0
IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0xNTMsMTQg
KzE2OCw0NCBAQCBpbnQgZ3Vlc3Rfd3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwg
dWludDY0X3QgdmFsKQo+PiAgewo+PiAgICAgIGNvbnN0IHN0cnVjdCB2Y3B1ICpjdXJyID0gY3Vy
cmVudDsKPj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+PiArICAgIGNvbnN0
IHN0cnVjdCBjcHVpZF9wb2xpY3kgKmNwID0gZC0+YXJjaC5jcHVpZDsKPj4gICAgICBzdHJ1Y3Qg
bXNyX2RvbWFpbl9wb2xpY3kgKmRwID0gZC0+YXJjaC5tc3I7Cj4+ICAgICAgc3RydWN0IG1zcl92
Y3B1X3BvbGljeSAqdnAgPSB2LT5hcmNoLm1zcjsKPj4gIAo+PiAgICAgIHN3aXRjaCAoIG1zciAp
Cj4+ICAgICAgewo+PiAgICAgIGNhc2UgTVNSX0lOVEVMX1BMQVRGT1JNX0lORk86Cj4+ICsgICAg
Y2FzZSBNU1JfQVJDSF9DQVBBQklMSVRJRVM6Cj4+ICsgICAgICAgIC8qIFJlYWQtb25seSAqLwo+
PiAgICAgICAgICBnb3RvIGdwX2ZhdWx0Owo+PiAgCj4+ICsgICAgY2FzZSBNU1JfU1BFQ19DVFJM
Ogo+PiArICAgICAgICBpZiAoICFjcC0+ZmVhdC5pYnJzYiApCj4+ICsgICAgICAgICAgICBnb3Rv
IGdwX2ZhdWx0OyAvKiBNU1IgYXZhaWxhYmxlPyAqLwo+PiArCj4+ICsgICAgICAgIC8qCj4+ICsg
ICAgICAgICAqIE5vdGU6IFNQRUNfQ1RSTF9TVElCUCBpcyBzcGVjaWZpZWQgYXMgc2FmZSB0byB1
c2UgKGkuZS4gaWdub3JlZCkKPj4gKyAgICAgICAgICogd2hlbiBTVElCUCBpc24ndCBlbnVtZXJh
dGVkIGluIGhhcmR3YXJlLgo+PiArICAgICAgICAgKi8KPj4gKwo+PiArICAgICAgICBpZiAoIHZh
bCAmIH4oU1BFQ19DVFJMX0lCUlMgfCBTUEVDX0NUUkxfU1RJQlApICkKPj4gKyAgICAgICAgICAg
IGdvdG8gZ3BfZmF1bHQ7IC8qIFJzdmQgYml0IHNldD8gKi8KPj4gKwo+PiArICAgICAgICB2cC0+
c3BlY19jdHJsLnJhdyA9IHZhbDsKPj4gKyAgICAgICAgYnJlYWs7Cj4gRGlkIHlvdSBjaGVjayAo
b3IgaW5xdWlyZSkgd2hldGhlciByZWFkaW5nIGJhY2sgdGhlIHZhbHVlIG9uIGEKPiBzeXN0ZW0g
d2hpY2ggaWdub3JlcyB0aGUgd3JpdGUgdG8gMSBhY3R1YWxseSBwcm9kdWNlcyB0aGUKPiB3cml0
dGVuIHZhbHVlPyBJJ2Qgc29ydCBvZiBleHBlY3QgemVybyB0byBjb21lIGJhY2sgaW5zdGVhZC4K
ClZlcnkgZ29vZCBxdWVzdGlvbi7CoCBJIHNhZGx5IGRvbid0IGhhdmluZyBhIHN1aXRhYmxlIGhh
cmR3YXJlL21pY3JvY29kZQpjb21iaW5hdGlvbiB0byBleHBlcmltZW50IHdpdGggYXQgdGhlIG1v
bWVudC4KCkdpdmVuIHRoYXQgdGhlIHBvaW50IG9mIGlnbm9yaW5nIHRoZSB3cml0ZSB0byAxIHdh
cyB0byBtYWtlIHRoaW5ncwplYXNpZXIgZm9yIHZpcnQvbWlncmF0aW9uIHNjZW5hcmlvcywgSSBy
ZWFsbHkgaG9wZSB0aGUgYW5zd2VyIGlzICJyZWFkCmFzIHdyaXR0ZW4iLCByYXRoZXIgdGhhbiAi
cmVhZCBhcyB6ZXJvIi4KCkNDJ2luZyBhIGJ1bmNoIG9mIHBlb3BsZSBpbiB0aGUgaG9wZXMgdGhh
dCBzb21lb25lIG1pZ2h0IGhhdmUgYW4gYW5zd2VyLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
