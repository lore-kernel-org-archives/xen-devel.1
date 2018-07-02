From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] tools/libxc: Drop xc_cpuid_to_str()
Date: Mon, 2 Jul 2018 13:15:10 +0100
Message-ID: <88e87b02-9853-3106-22ae-4fa902b16606@citrix.com>
References: <1530525447-28347-1-git-send-email-andrew.cooper3@citrix.com>
 <1530525447-28347-2-git-send-email-andrew.cooper3@citrix.com>
 <20180702104156.ojtwqwxgqctnkzm7@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180702104156.ojtwqwxgqctnkzm7@mac.bytemobile.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDcvMTggMTE6NDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBKdWwg
MDIsIDIwMTggYXQgMTA6NTc6MjVBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhp
cyBoZWxwZXIgYXBwZWFycyB0byBoYXZlIGJlZW4gaW50cm9kdWNlZCAxMCB5ZWFycyBhZ28gYnkg
Yy9zIDVmMTRhODdjZWIKPj4gIng4NiwgaHZtOiBHdWVzdCBDUFVJRCBjb25maWd1cmF0aW9uIiBh
bmQgbmV2ZXIgaGFkIGFueSB1c2VycyBhdCBhbGwuCj4+Cj4+IGFsbG9jX3N0cigpIGlzIGFjdHVh
bGx5IGFuIG9wZW5jb2RlZCBjYWxsb2MoKSwgYW5kIG5vdyBvbmx5IGhhcyBhIHNpbmdsZQo+PiBj
YWxsZXIuICBVc2UgY2FsbG9jKCkgZGlyZWN0bHkgYW5kIGRyb3AgYWxsb2Nfc3RyKCkuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
VGhhbmtzLAoKPgo+PiBAQCAtODMyLDcgKzgwOSw3IEBAIGludCB4Y19jcHVpZF9zZXQoCj4+ICAg
ICAgICAgICAgICBjb250aW51ZTsKPj4gICAgICAgICAgfQo+PiAgICAgICAgICAKPj4gLSAgICAg
ICAgY29uZmlnX3RyYW5zZm9ybWVkW2ldID0gYWxsb2Nfc3RyKCk7Cj4+ICsgICAgICAgIGNvbmZp
Z190cmFuc2Zvcm1lZFtpXSA9IGNhbGxvYygzMywgMSk7IC8qIDMyIGJpdHMsIE5VTCB0ZXJtaW5h
dG9yLiAqLwo+IEkgd291bGQgcmF0aGVyIGRvIHNpemVvZigqY29uZmlnX3RyYW5zZm9ybWVkW2ld
KSwgYnV0IEknbSBub3QgZ29pbmcgdG8KPiBpbnNpc3QuCgpXaXRob3V0IGEgc3RydWN0dXJlIG9m
IHRoZSBmb3JtOgoKc3RydWN0IHsKwqDCoMKgIGNoYXIgY2ZnWzMzXTsKfTsKCm5vdCBhbW91bnQg
b2Ygc2l6ZW9mIHRyaWNrZXJ5IHdpbGwgd29yayBoZXJlLsKgIFlvdXIgZXhhbXBsZSByZWR1Y2Vz
IHRvCnNpemVvZihjaGFyKSwgcmF0aGVyIHRoYW4gMzIvMzMuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
