From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/xstate: Make errors in xstate
 calculations more obvious by crashing the domain
Date: Fri, 27 Jul 2018 14:35:48 +0100
Message-ID: <dfc9d085-c0ad-aa73-edd1-3fd161795442@citrix.com>
References: <1532000683-23429-1-git-send-email-andrew.cooper3@citrix.com>
 <1532000683-23429-3-git-send-email-andrew.cooper3@citrix.com>
 <5B5B1D2602000078001D879C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B5B1D2602000078001D879C@prv1-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDcvMTggMTQ6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA3LjE4IGF0
IDEzOjQ0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94c3RhdGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYveHN0YXRlLmMKPj4gQEAgLTcw
NywxMiArNzA3LDMyIEBAIGludCBoYW5kbGVfeHNldGJ2KHUzMiBpbmRleCwgdTY0IG5ld19idikK
Pj4gICAgICBpZiAoIGluZGV4ICE9IFhDUl9YRkVBVFVSRV9FTkFCTEVEX01BU0sgKQo+PiAgICAg
ICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICAKPj4gLSAgICBpZiAoIChuZXdfYnYgJiB+eGNy
MF9tYXgpIHx8Cj4+IC0gICAgICAgICAobmV3X2J2ICYgfnhmZWF0dXJlX21hc2spIHx8ICF2YWxp
ZF94Y3IwKG5ld19idikgKQo+PiArICAgIC8qCj4+ICsgICAgICogVGhlIENQVUlEIGxvZ2ljIHNo
b3VsZG4ndCBiZSBhYmxlIHRvIGhhbmQgb3V0IGFuIFhDUjAgZXhjZWVkaW5nIFhlbidzCj4+ICsg
ICAgICogbWF4aW11bSBmZWF0dXJlcywgYnV0IGtlZXAgdGhlIGNoZWNrIGZvciByb2J1c3RuZXNz
Lgo+PiArICAgICAqLwo+PiArICAgIGlmICggdW5saWtlbHkoeGNyMF9tYXggJiB+eGZlYXR1cmVf
bWFzaykgKQo+PiArICAgIHsKPj4gKyAgICAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLAo+PiArICAg
ICAgICAgICAgICAgICJ4Y3IwX21heCAlMDE2IiBQUkl4NjQgIiBleGNlZWRzIGhhcmR3YXJlIG1h
eCAlMDE2IiBQUkl4NjQgIlxuIiwKPj4gKyAgICAgICAgICAgICAgICBuZXdfYnYsIHhmZWF0dXJl
X21hc2spOwo+IEkndmUgb25seSBub3RpY2VkIHRoaXMgd2hpbGUgZG9pbmcgdGhlIDQuOCBiYWNr
cG9ydDogSSBkb24ndCB0aGluayB5b3UndmUKPiBtZWFudCB0byBsb2cgbmV3X2J2IGhlcmUsIHJh
dGhlciB0aGFuIHhjcjBfbWF4LgoKT29wcyAtIHlvdSdyZSBjb21wbGV0ZWx5IGNvcnJlY3QuCgpU
aGF0IGlzIGFuIG92ZXJzaWdodCBmcm9tIHJlYXJyYW5naW5nIHRoZSBsb2dpYy4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
