From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: vpsci: Move PSCI function
 dispatching from vsmc.c to vpsci.c
Date: Fri, 26 Jan 2018 20:27:56 +0200
Message-ID: <8c4765dc-c22f-8159-6145-d98dd9070222@epam.com>
References: <20180124183445.23705-1-julien.grall@linaro.org>
 <20180124183445.23705-4-julien.grall@linaro.org>
 <b60c341e-c3bc-8fe4-a7fd-96be076f8ebf@epam.com>
 <96603159-92dc-aabb-4f13-61730b4f3c54@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <96603159-92dc-aabb-4f13-61730b4f3c54@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xen.org
Cc: sstabellini@kernel.org, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNi4wMS4xOCAyMDoxNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDI2LzAxLzE4IDE4OjA5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gT24gMjQuMDEuMTgg
MjA6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IC3CoMKgwqAgY2FzZSBQU0NJXzBfMl9GTjMy
KEFGRklOSVRZX0lORk8pOgo+Pj4gLcKgwqDCoCBjYXNlIFBTQ0lfMF8yX0ZONjQoQUZGSU5JVFlf
SU5GTyk6Cj4+PiArwqDCoMKgIHN3aXRjaCAoIGZpZCApCj4+PiDCoMKgwqDCoMKgIHsKPj4+IC3C
oMKgwqDCoMKgwqDCoCByZWdpc3Rlcl90IHRhZmYgPSBQU0NJX0FSRyhyZWdzLCAxKTsKPj4+IC3C
oMKgwqDCoMKgwqDCoCB1aW50MzJfdCBsYWZmID0gUFNDSV9BUkczMihyZWdzLCAyKTsKPj4+IC0K
Pj4+IC3CoMKgwqDCoMKgwqDCoCBwZXJmY19pbmNyKHZwc2NpX2NwdV9hZmZpbml0eV9pbmZvKTsK
Pj4+IC3CoMKgwqDCoMKgwqDCoCBQU0NJX1NFVF9SRVNVTFQocmVncywgZG9fcHNjaV8wXzJfYWZm
aW5pdHlfaW5mbyh0YWZmLCBsYWZmKSk7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7
Cj4+PiAtwqDCoMKgIH0KPj4+IC0KPj4+IMKgwqDCoMKgwqAgY2FzZSBBUk1fU01DQ0NfRlVOQ19D
QUxMX0NPVU5UKFNUQU5EQVJEKToKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmlsbF9m
dW5jdGlvbl9jYWxsX2NvdW50KHJlZ3MsIAo+Pj4gU1NTQ19TTUNDQ19GVU5DVElPTl9DT1VOVCk7
Cj4+IE5vdyBkZWZpbml0aW9uIFNTU0NfU01DQ0NfRlVOQ1RJT05fQ09VTlQgZGVwZW5kcyBvbiBj
b2RlIGluIHZzY3BpLmMuCj4+IE1heWJlIGl0IGlzIHRpbWUgdG8gaW50cm9kdWNlIGZ1bmN0aW9u
IGdldF9wc2NpXzBfMl9mbl9jb3VudCgpIGFuZCB1c2UgCj4+IGl0IHRoZXJlLCB3aGF0IGRvIHlv
dSB0aGluaz8KPiAKPiBEZWZpbml0ZWx5IG5vdCBhIGZ1bmN0aW9uLiBJdCBpcyBhIHN0YXRpYyBu
dW1iZXIuIEJ1dCBJIGNhbiB0aGluayBvZiAKPiBzZXBhcmF0ZSB0aGUgY2FsbCBjb3VudC4KWWVw
LCBzZXBhcmF0ZSBjYWxsIGNvdW50IGZvciB2UFNDSSBhbmQgZm9yIFNTU0MgaXRzZWxmIHdvdWxk
IGJlIGEgZ29vZCAKdGhpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
