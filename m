From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3] xen/altp2m: set access_required properly
 for all altp2ms
Date: Mon, 23 Jul 2018 13:58:14 +0100
Message-ID: <5252abfd-f242-fb5f-b383-1889aa63c8f4@arm.com>
References: <1530172441-2553-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmXsLgj==MxmXFOW25qW21OFvxaqRgUWHq5BGDmF7nJvQ@mail.gmail.com>
 <49d57a24-5f94-e00e-634a-ab4651e7d9bb@bitdefender.com>
 <5B4C5CF302000078001D42EE@prv1-mh.provo.novell.com>
 <4e7e8388-fe9f-d423-d69c-63e9e099e556@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4e7e8388-fe9f-d423-d69c-63e9e099e556@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, tamas@tklengyel.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy8wNy8xOCAxMjo0MCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAwNy8xNi8y
MDE4IDA5OjUzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTYuMDcuMTggYXQgMTA6
MzUsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+IE9uIDA2LzI4LzIwMTgg
MDc6MTkgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiBPbiBUaHUsIEp1biAyOCwgMjAx
OCBhdCAxOjU0IEFNIFJhenZhbiBDb2pvY2FydQo+Pj4+IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIu
Y29tPiB3cm90ZToKPj4+Pj4KPj4+Pj4gRm9yIHRoZSBob3N0cDJtLCBhY2Nlc3NfcmVxdWlyZWQg
c3RhcnRzIG9mZiBhcyAwLCB0aGVuIGl0IGNhbiBiZQo+Pj4+PiBzZXQgd2l0aCB4Y19kb21haW5f
c2V0X2FjY2Vzc19yZXF1aXJlZCgpLiBIb3dldmVyLCBhbGwgdGhlIGFsdHAybXMKPj4+Pj4gc2V0
IGl0IHRvIDEgb24gaW5pdCwgYW5kIGlnbm9yZSBib3RoIHRoZSBob3N0cDJtIGFuZCB0aGUgaHlw
ZXJjYWxsLgo+Pj4+PiBUaGlzIHBhdGNoIHNldHMgYWNjZXNzX3JlcXVpcmVkIHRvIHRoZSB2YWx1
ZSBmcm9tIHRoZSBob3N0cDJtCj4+Pj4+IG9uIGFsdHAybSBpbml0LCBhbmQgcHJvcGFnYXRlcyB0
aGUgdmFsdWVzIHJlY2VpdmVkIHZpYSBoeXBlcmNhbGwKPj4+Pj4gdG8gYWxsIHRoZSBhY3RpdmUg
YWx0cDJtcywgd2hlbiBhcHBsaWNhYmxlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4+Pj4KPj4+PiBMR1RNCj4+
Pj4KPj4+PiBBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+
Pj4KPj4+IFRoYW5rcyBUYW1hcyEKPj4+Cj4+PiBEb2VzIHRoZSBwYXRjaCBuZWVkIGFkZGl0aW9u
YWwgYWN0aW9uIGJlZm9yZSBpdCBjYW4gZ28gaW4gKHNvcnJ5IGZvciB0aGUKPj4+IG5vaXNlIGlm
IGl0IG9ubHkgaGFzbid0IGdvbmUgaW4gYmVjYXVzZSBpdCBhdCB0aGUgYmFjayBvZiB0aGUgcXVl
dWUpLgo+Pgo+PiBPbmNlIGFnYWluIC0gR2VvcmdlJ3MgYWNrIGlzIG1pc3NpbmcuIFBsZWFzZSBy
ZW1lbWJlciB0aGF0IGdlbmVyYWxseQo+PiBpdCdzIHRoZSBzdWJtaXR0ZXIgdG8gY2hhc2UgYWNr
LXMsIG5vdCByZXZpZXdlcnMgb3IgY29tbWl0dGVycy4KPiAKPiBEbyB3ZSBuZWVkIEp1bGllbidz
IGFjayB0b28/CgpSYXZ6YW4gYW5kIFRhbWFzIGFyZSBtYWludGFpbmluZyBhcm0vbWVtX2FjY2Vz
cy5jLiBTbyBUYW1hcydzIGFjayBzaG91bGQgCmJlIGVub3VnaCBoZXJlLiBKdXN0IGluIGNhc2U6
CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
