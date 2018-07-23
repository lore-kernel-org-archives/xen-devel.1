From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V3] xen/altp2m: set access_required properly
 for all altp2ms
Date: Mon, 23 Jul 2018 14:00:50 +0100
Message-ID: <6e93d9a4-f75a-09b7-cb60-b7dc42053479@citrix.com>
References: <1530172441-2553-1-git-send-email-rcojocaru@bitdefender.com>
 <CABfawhmXsLgj==MxmXFOW25qW21OFvxaqRgUWHq5BGDmF7nJvQ@mail.gmail.com>
 <49d57a24-5f94-e00e-634a-ab4651e7d9bb@bitdefender.com>
 <5B4C5CF302000078001D42EE@prv1-mh.provo.novell.com>
 <4e7e8388-fe9f-d423-d69c-63e9e099e556@citrix.com>
 <5252abfd-f242-fb5f-b383-1889aa63c8f4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5252abfd-f242-fb5f-b383-1889aa63c8f4@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, tamas@tklengyel.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjMvMjAxOCAwMTo1OCBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIzLzA3LzE4IDEyOjQwLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAwNy8xNi8yMDE4IDA5
OjUzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDE2LjA3LjE4IGF0IDEwOjM1LCA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMDYvMjgvMjAxOCAwNzox
OSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEp1biAyOCwgMjAxOCBh
dCAxOjU0IEFNIFJhenZhbiBDb2pvY2FydQo+Pj4+PiA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNv
bT4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gRm9yIHRoZSBob3N0cDJtLCBhY2Nlc3NfcmVxdWlyZWQg
c3RhcnRzIG9mZiBhcyAwLCB0aGVuIGl0IGNhbiBiZQo+Pj4+Pj4gc2V0IHdpdGggeGNfZG9tYWlu
X3NldF9hY2Nlc3NfcmVxdWlyZWQoKS4gSG93ZXZlciwgYWxsIHRoZSBhbHRwMm1zCj4+Pj4+PiBz
ZXQgaXQgdG8gMSBvbiBpbml0LCBhbmQgaWdub3JlIGJvdGggdGhlIGhvc3RwMm0gYW5kIHRoZSBo
eXBlcmNhbGwuCj4+Pj4+PiBUaGlzIHBhdGNoIHNldHMgYWNjZXNzX3JlcXVpcmVkIHRvIHRoZSB2
YWx1ZSBmcm9tIHRoZSBob3N0cDJtCj4+Pj4+PiBvbiBhbHRwMm0gaW5pdCwgYW5kIHByb3BhZ2F0
ZXMgdGhlIHZhbHVlcyByZWNlaXZlZCB2aWEgaHlwZXJjYWxsCj4+Pj4+PiB0byBhbGwgdGhlIGFj
dGl2ZSBhbHRwMm1zLCB3aGVuIGFwcGxpY2FibGUuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+Pj4+Pgo+Pj4+
PiBMR1RNCj4+Pj4+Cj4+Pj4+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+Cj4+Pj4KPj4+PiBUaGFua3MgVGFtYXMhCj4+Pj4KPj4+PiBEb2VzIHRoZSBwYXRj
aCBuZWVkIGFkZGl0aW9uYWwgYWN0aW9uIGJlZm9yZSBpdCBjYW4gZ28gaW4gKHNvcnJ5IGZvcgo+
Pj4+IHRoZQo+Pj4+IG5vaXNlIGlmIGl0IG9ubHkgaGFzbid0IGdvbmUgaW4gYmVjYXVzZSBpdCBh
dCB0aGUgYmFjayBvZiB0aGUgcXVldWUpLgo+Pj4KPj4+IE9uY2UgYWdhaW4gLSBHZW9yZ2UncyBh
Y2sgaXMgbWlzc2luZy4gUGxlYXNlIHJlbWVtYmVyIHRoYXQgZ2VuZXJhbGx5Cj4+PiBpdCdzIHRo
ZSBzdWJtaXR0ZXIgdG8gY2hhc2UgYWNrLXMsIG5vdCByZXZpZXdlcnMgb3IgY29tbWl0dGVycy4K
Pj4KPj4gRG8gd2UgbmVlZCBKdWxpZW4ncyBhY2sgdG9vPwo+IAo+IFJhdnphbiBhbmQgVGFtYXMg
YXJlIG1haW50YWluaW5nIGFybS9tZW1fYWNjZXNzLmMuIFNvIFRhbWFzJ3MgYWNrIHNob3VsZAo+
IGJlIGVub3VnaCBoZXJlLgoKQWgsIGdvdCBpdC4KCj4gSnVzdCBpbiBjYXNlOgo+IAo+IEFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKVGhhbmtzLgogLUcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
