From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/3] tools/libxc: Drop xc_cpuid_to_str()
Date: Mon, 2 Jul 2018 15:36:42 +0200
Message-ID: <20180702133642.33zlcgbyo7fwmnzg@mac.bytemobile.com>
References: <1530525447-28347-1-git-send-email-andrew.cooper3@citrix.com>
 <1530525447-28347-2-git-send-email-andrew.cooper3@citrix.com>
 <20180702104156.ojtwqwxgqctnkzm7@mac.bytemobile.com>
 <88e87b02-9853-3106-22ae-4fa902b16606@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <88e87b02-9853-3106-22ae-4fa902b16606@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMDE6MTU6MTBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMi8wNy8xOCAxMTo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgSnVsIDAyLCAyMDE4IGF0IDEwOjU3OjI1QU0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4gPj4gVGhpcyBoZWxwZXIgYXBwZWFycyB0byBoYXZlIGJlZW4gaW50cm9kdWNlZCAxMCB5
ZWFycyBhZ28gYnkgYy9zIDVmMTRhODdjZWIKPiA+PiAieDg2LCBodm06IEd1ZXN0IENQVUlEIGNv
bmZpZ3VyYXRpb24iIGFuZCBuZXZlciBoYWQgYW55IHVzZXJzIGF0IGFsbC4KPiA+Pgo+ID4+IGFs
bG9jX3N0cigpIGlzIGFjdHVhbGx5IGFuIG9wZW5jb2RlZCBjYWxsb2MoKSwgYW5kIG5vdyBvbmx5
IGhhcyBhIHNpbmdsZQo+ID4+IGNhbGxlci4gIFVzZSBjYWxsb2MoKSBkaXJlY3RseSBhbmQgZHJv
cCBhbGxvY19zdHIoKS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzLAo+IAo+ID4KPiA+PiBAQCAtODMy
LDcgKzgwOSw3IEBAIGludCB4Y19jcHVpZF9zZXQoCj4gPj4gICAgICAgICAgICAgIGNvbnRpbnVl
Owo+ID4+ICAgICAgICAgIH0KPiA+PiAgICAgICAgICAKPiA+PiAtICAgICAgICBjb25maWdfdHJh
bnNmb3JtZWRbaV0gPSBhbGxvY19zdHIoKTsKPiA+PiArICAgICAgICBjb25maWdfdHJhbnNmb3Jt
ZWRbaV0gPSBjYWxsb2MoMzMsIDEpOyAvKiAzMiBiaXRzLCBOVUwgdGVybWluYXRvci4gKi8KPiA+
IEkgd291bGQgcmF0aGVyIGRvIHNpemVvZigqY29uZmlnX3RyYW5zZm9ybWVkW2ldKSwgYnV0IEkn
bSBub3QgZ29pbmcgdG8KPiA+IGluc2lzdC4KPiAKPiBXaXRob3V0IGEgc3RydWN0dXJlIG9mIHRo
ZSBmb3JtOgo+IAo+IHN0cnVjdCB7Cj4gwqDCoMKgIGNoYXIgY2ZnWzMzXTsKPiB9Owo+IAo+IG5v
dCBhbW91bnQgb2Ygc2l6ZW9mIHRyaWNrZXJ5IHdpbGwgd29yayBoZXJlLsKgIFlvdXIgZXhhbXBs
ZSByZWR1Y2VzIHRvCj4gc2l6ZW9mKGNoYXIpLCByYXRoZXIgdGhhbiAzMi8zMy4KCkkgd2FzIHRo
aW5raW5nIGFib3V0IHVzaW5nOgoKY29uZmlnX3RyYW5zZm9ybWVkW2ldID0gY2FsbG9jKDMzLCAq
Y29uZmlnX3RyYW5zZm9ybWVkW2ldKTsKClNvIGp1c3QgY2hhbmdlIHRoZSBsYXN0IGhhcmRjb2Rl
ZCAnMScuCgpBbHRob3VnaCB1c2luZyBzb21lIGtpbmQgb2Ygc3RydWN0dXJlIHRvIGNvbnZleSB0
aGlzIGluZm9ybWF0aW9uCmluc3RlYWQgb2YgYSBwbGFpbiBjaGFyIGFycmF5IGRvZXNuJ3Qgc2Vl
bSBiYWQgSU1ITy4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
