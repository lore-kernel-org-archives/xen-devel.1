From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] xen/x86: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Fri, 7 Sep 2018 15:00:04 +0100
Message-ID: <f32217cc-9efa-24e8-01a7-afeed1068e84@citrix.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-5-git-send-email-andrew.cooper3@citrix.com>
 <5B92330A02000078001E6324@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B92330A02000078001E6324@prv1-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMDk6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjA5LjE4IGF0
IDE0OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvbWNoZWNrL21jZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNr
L21jZS5jCj4+IEBAIC01MzUsOSArNTM1LDEyIEBAIHZvaWQgbWNoZWNrX2Ntbl9oYW5kbGVyKGNv
bnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQo+PiAgICAgICAgICAgICAgbWNfcGFuaWMo
Ik1DRTogTm8gQ1BVIGZvdW5kIHZhbGlkIE1DRSwgbmVlZCByZXNldCIpOwo+PiAgICAgICAgICBp
ZiAoICFjcHVtYXNrX2VtcHR5KCZtY2VfZmF0YWxfY3B1cykgKQo+PiAgICAgICAgICB7Cj4+IC0g
ICAgICAgICAgICBjaGFyICplYnVmcCwgZWJ1Zls5Nl0gPSAiTUNFOiBGYXRhbCBlcnJvciBoYXBw
ZW5lZCBvbiBDUFVzICI7Cj4+IC0gICAgICAgICAgICBlYnVmcCA9IGVidWYgKyBzdHJsZW4oZWJ1
Zik7Cj4+IC0gICAgICAgICAgICBjcHVtYXNrX3NjbnByaW50ZihlYnVmcCwgOTUgLSBzdHJsZW4o
ZWJ1ZiksICZtY2VfZmF0YWxfY3B1cyk7Cj4+ICsgICAgICAgICAgICBjaGFyIGVidWZbOTZdOwo+
PiArCj4+ICsgICAgICAgICAgICBzbnByaW50ZihlYnVmLCBzaXplb2YoZWJ1ZiksCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAiTUNFOiBGYXRhbCBlcnJvciBoYXBwZW5lZCBvbiBDUFVzICUqcGQi
LAo+IERZTSAlKnBiIGhlcmU/CgpPb3BzIHllcy4KCj4gIFdpdGggdGhpcyBjb3JyZWN0ZWQKPiBS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmtzLAoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
