From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] xen/debug: make debugtrace more clever
 regarding repeating entries
Date: Thu, 14 Mar 2019 15:36:21 +0100
Message-ID: <7532c991-df5b-565c-62b0-eacc006b5bfa@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4RT6-0004sJ-Vs
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:36:25 +0000
References: =?UTF-8?B?PDIwMTkwMzE0MDkzNzMzLjE4MTc177+977+977+977+9Me+/vQ==?=
 =?UTF-8?B?77+977+977+9amdyb3NzQHN1c2UuY29tPiA8MjAxOTAzMTQwOTM3MzMuMTgxNzU=?=
 =?UTF-8?B?77+977+977+977+9M++/ve+/ve+/ve+/vWpncm9zc0BzdXNlLmNvbT4gPDVDOEE1?=
 =?UTF-8?B?ODQyMDIwMDAwNzgwMDIxRUEzRUBzdXNlLmNvbT4gPDk4Nzc2ZWQ177+977+977+9?=
 =?UTF-8?B?77+9NDJmN++/ve+/ve+/ve+/vTJjNDLvv73vv73vv73vv71hYWNi77+977+977+9?=
 =?UTF-8?B?77+9YWNjOWI1NDk1OThmQHN1c2UuY29tPiA8Y2RjMmJlM2Tvv71iMWVk77+9Zjk1?=
 =?UTF-8?B?Yu+/vTc4MmLvv71hNzYwMTkxMmMyZDBAY2l0cml4LmNvbT4gPDVDOEE2MUNCMDIw?=
 =?UTF-8?Q?000780021EB19=40suse=2ecom=3e_=3cba20dba4-51b8-584d-1cc1-c5e766aa?=
 =?UTF-8?Q?e955=40suse=2ecom=3e_=3c5C8A65C9020000780021EBA3=40suse=2ecom=3e?=
Content-Language: de-DE
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

T24gMTQvMDMvMjAxOSAxNTozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTkg
YXQgMTU6MjgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAxNC8wMy8yMDE5IDE1OjE0
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjQwLCA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTQvMDMvMjAxOSAxMzozOCwgSnVl
cmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gT24gMTQvMDMvMjAxOSAxNDozMywgSmFuIEJldWxpY2gg
d3JvdGU6Cj4+Pj4+Pj4+PiBPbiAxNC4wMy4xOSBhdCAxMDozNywgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6Cj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPj4+Pj4+PiAr
KysgYi94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+Pj4+Pj4+IEBAIC0xMjI1LDEzICsxMjI1
LDI4IEBAIHZvaWQgZGVidWd0cmFjZV9kdW1wKHZvaWQpCj4+Pj4+Pj4gICAgICB3YXRjaGRvZ19l
bmFibGUoKTsKPj4+Pj4+PiAgfQo+Pj4+Pj4+ICAKPj4+Pj4+PiArc3RhdGljIHZvaWQgZGVidWd0
cmFjZV9hZGRfdG9fYnVmKGNoYXIgKmJ1ZikKPj4+Pj4+PiArewo+Pj4+Pj4+ICsgICAgY2hhciAq
cDsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICBmb3IgKCBwID0gYnVmOyAqcCAhPSAnXDAnOyBwKysg
KQo+Pj4+Pj4+ICsgICAgewo+Pj4+Pj4+ICsgICAgICAgIGRlYnVndHJhY2VfYnVmW2RlYnVndHJh
Y2VfcHJkKytdID0gKnA7Cj4+Pj4+Pj4gKyAgICAgICAgLyogQWx3YXlzIGxlYXZlIGEgbnVsIGJ5
dGUgYXQgdGhlIGVuZCBvZiB0aGUgYnVmZmVyLiAqLwo+Pj4+Pj4+ICsgICAgICAgIGlmICggZGVi
dWd0cmFjZV9wcmQgPT0gKGRlYnVndHJhY2VfYnl0ZXMgLSAxKSApCj4+Pj4+Pj4gKyAgICAgICAg
ICAgIGRlYnVndHJhY2VfcHJkID0gMDsKPj4+Pj4+PiArICAgIH0KPj4+Pj4+PiArfQo+Pj4+Pj4+
ICsKPj4+Pj4+PiAgdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikK
Pj4+Pj4+PiAgewo+Pj4+Pj4+IC0gICAgc3RhdGljIGNoYXIgICAgYnVmWzEwMjRdOwo+Pj4+Pj4+
IC0gICAgc3RhdGljIHUzMiBjb3VudDsKPj4+Pj4+PiArICAgIHN0YXRpYyBjaGFyIGJ1ZlsxMDI0
XTsKPj4+Pj4+PiArICAgIHN0YXRpYyBjaGFyIGxhc3RfYnVmWzEwMjRdOwo+Pj4+Pj4+ICsgICAg
c3RhdGljIHUzMiBjb3VudCwgbGFzdF9jb3VudDsKPj4+Pj4+IFBsZWFzZSBjaGFuZ2UgdG8gdWlu
dDMyX3Qgb3IgZXZlbiBiZXR0ZXIgc2ltcGx5IHRvIHVuc2lnbmVkIGludC4KPj4+Pj4gT2theS4K
Pj4+Pj4KPj4+Pj4+PiBAQCAtMTI0MywyNSArMTI1OCwzMiBAQCB2b2lkIGRlYnVndHJhY2VfcHJp
bnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+Pj4+ICAKPj4+Pj4+PiAgICAgIEFTU0VSVChk
ZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0gMCk7Cj4+Pj4+Pj4gIAo+Pj4+
Pj4+IC0gICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiV1ICIsICsrY291bnQpOwo+Pj4+
Pj4+IC0KPj4+Pj4+PiAgICAgIHZhX3N0YXJ0KGFyZ3MsIGZtdCk7Cj4+Pj4+Pj4gLSAgICAodm9p
ZCl2c25wcmludGYoYnVmICsgc3RybGVuKGJ1ZiksIHNpemVvZihidWYpIC0gc3RybGVuKGJ1Ziks
IGZtdCwgYXJncyk7Cj4+Pj4+Pj4gKyAgICAodm9pZCl2c25wcmludGYoYnVmLCBzaXplb2YoYnVm
KSwgZm10LCBhcmdzKTsKPj4+Pj4+IFBsZWFzZSB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgZHJv
cCB0aGUgc3RyYXkgY2FzdC4KPj4+Pj4gV2lsbCBkby4KPj4+Pgo+Pj4+IEJvdGggY2FuIGJlIGRv
bmUgb24gY29tbWl0LCBzdXJlbHk/Cj4+Pgo+Pj4gUGVyaGFwcywgYWxiZWl0IGlpcmMgdGhlIGZp
cnN0IHdvdWxkIGFtb3VudCB0byBtb3JlIHRoYW4ganVzdCBzL3UzMi8uLi4vCj4+PiBvbiB0aGUg
bGluZSBpbiBxdWVzdGlvbi4KPj4KPj4gV2hhdCBlbHNlIHdvdWxkIHlvdSB3YW50IHRvIGRvPwo+
IAo+IEZvbGQgaXQgd2l0aCB0aGUgYWRqYWNlbnQgdW5zaWduZWQgaW50IGRlY2xhcmF0aW9uIChp
aXJjIHRoZXJlIHdhcyBvbmUpLgoKSSBjYW4gcG9zdCBhIFYzIGlmIHlvdSB3YW50IGluY2x1ZGlu
ZyB0aGUgZm9sZGluZy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
