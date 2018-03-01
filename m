From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] x86/hvm: Handle viridian MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Thu, 1 Mar 2018 12:29:52 +0000
Message-ID: <425255ae-b4f1-77db-720d-8c1a8060083d@citrix.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
 <5A96E9A602000078001ACF6E@prv-mh.provo.novell.com>
 <7b6ec804-665e-1e4e-f9ac-d7313d6bd21b@citrix.com>
 <5A97DCF102000078001AD2D4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A97DCF102000078001AD2D4@prv-mh.provo.novell.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, PaulDurrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDMvMTggMDk6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+Pj4gQEAgLTE3MywxMSAr
MTc1LDI2IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3Qg
bXNyLCAgdWludDY0X3QgKnZhbCkKPj4+PiAgICAgICAgICAgICAgICAgX01TUl9NSVNDX0ZFQVRV
UkVTX0NQVUlEX0ZBVUxUSU5HOwo+Pj4+ICAgICAgICAgIGJyZWFrOwo+Pj4+ICAKPj4+PiArICAg
IGNhc2UgMHg0MDAwMDAwMCAuLi4gMHg0MDAwMDFmZjoKPj4+IEFzIHdhcyBhbHJlYWR5IHN1Z2dl
c3RlZCwgdGhlc2Ugd2FudCB0byBnYWluICNkZWZpbmUtcy4KPj4+Cj4+PiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gd2l0aCBhdCBsZWFzdCB0aGUgbGF0
dGVyIHRha2VuIGNhcmUgb2YuCj4+IEp1c3QgbGlrZSBvbiB0aGUgQ1BVSUQgc2lkZSwgdGhlIHJh
bmdlIG9mIHZhbGlkIE1TUnMgZGVwZW5kIG9uIHRoZQo+PiBmYWxsdGhyb3VnaCBwYXR0ZXJuLCBh
bmQgd2hpY2ggaHlwZXJ2aXNvcihzKSB3ZSBhcmUgZW11bGF0aW5nIGZvci4KPj4KPj4gVGhpcyBp
cyBjbGVhcmVyIGJ5IHRoZSBlbmQgb2YgdGhlIHN1YnNlcXVlbnQgcGF0Y2gsIGJ1dCB0aGUgbG9n
aWMgaXMgZmFyCj4+IGVhc2llciB0byBmb2xsb3cgd2l0aG91dCB0aGVzZSBudW1iZXJzIGJlaW5n
IGhpZGRlbi4KPiBJIGRpc2FncmVlIChpdCdzIHNpbXBseSBpbXBvc3NpYmxlIHRvIG1ha2UgdGhl
IGNvbm5lY3Rpb24gYmV0d2Vlbgo+IHRoZSByZWFkIHNpZGUgYW5kIHRoZSByaWdodCBzaWRlIHRo
aXMgd2F5LCBiZWNhdXNlIHRoZSBudW1iZXJzCj4gY291bGQgYWxzbyBqdXN0IGhhcHBlbiB0byBi
ZSB0aGUgc2FtZSwgbm9yIGlzIGl0IHBvc3NpYmxlIHRvCj4gcmVhc29uYWJseSBmaW5kIGFsbCB1
c2VzIG9mIHRob3NlIG51bWJlcnMgdmlhIGUuZy4gZ3JlcCksIGJ1dCB3ZWxsLAo+IEkgZG9uJ3Qg
d2FudCB0byBibG9jayB0aGUgcGF0Y2ggb3ZlciB0aGlzLgoKSSdtIG5vdCBsb29raW5nIHRvIHRy
eSBhbmQgcmFpbHJvYWQgdGhpcyB0aHJvdWdoLgoKSWYgeW91IGRpc2FncmVlLCB0aGVuIHdoYXQg
bmFtaW5nIHdvdWxkIHlvdSBzdWdnZXN0IGluc3RlYWQ/wqAgSSdkIGJlCmhhcHB5IHRvIHVzZSBh
bnkgbmFtaW5nIHdoaWNoIGRvZXNuJ3QgaW1wZWRlIHRoZSBjbGFyaXR5IG9mIHRoZSBsb2dpYywK
YnV0IEkgaGF2ZSBzcGVudCBhIGxvbmcgdGltZSB0cnlpbmcgdG8gZmluZCBzb21ldGhpbmcgc3Vp
dGFibGUsIGFuZApmYWlsZWQgdG8gZG8gc28uwqAgUmF3IG51bWJlcnMgcmVhbGx5IGFyZSBjbGVh
cmVyIHRvIGZvbGxvdyB0aGFuIGFueQpuYW1pbmcgc2NoZW1lIEkgdHJpZWQuwqAgVGhlIHJvb3Qg
b2YgdGhlIHByb2JsZW0gaXMgd2l0aCB0aGUgZmFjdCB0aGF0CnRoZSBNU1Igc3BhY2VzIG92ZXJs
YXAsIGJ1dCB0aGlzIGluZm9ybWF0aW9uIGRpc2FwcGVhcnMgd2hlbiB5b3UgdHJ5IHRvCnB1dCBu
YW1lZCBjb25zdGFudHMgaW4uwqAgQWxzbyBub3RpY2UgdGhhdCB0aGUgbnVtYmVyIG9mIENQVUlE
IGxlYXZlcyBhbmQKdGhlIG51bWJlciBvZiBNU1IgbGVhdmVzIGhhdmUgYSBkaWZmZXJlbnQgc3Ry
aWRlLCB3aGljaCBhZGRzIG1vcmUKY29tcGxleGl0eS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
