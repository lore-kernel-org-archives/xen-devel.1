From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12 V2] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Mon, 11 Feb 2019 10:20:52 +0200
Message-ID: <4ff03d71-b785-33d4-a4bc-c064efbf4f7f@bitdefender.com>
References: <1549634431-30571-1-git-send-email-rcojocaru@bitdefender.com>
 <5C5DA5600200007800215233@prv1-mh.provo.novell.com>
 <47000945-b550-19da-f2a2-d2d83ffbacfd@bitdefender.com>
 <5C5DB1F2020000780021528D@prv1-mh.provo.novell.com>
 <38297844-2f50-0c28-22c5-ea954ab88a6a@bitdefender.com>
 <5C612D4C02000078002157D0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O7zb=QS=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gt6po-0006Nl-Q7
 for xen-devel@lists.xenproject.org; Mon, 11 Feb 2019 08:21:00 +0000
In-Reply-To: <5C612D4C02000078002157D0@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+PiBSaWdodCwgSSBub3cgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFudCBieSByZW1vdmluZyAi
aWYgKCBvc3RhdGUgKSIgLQo+PiB5b3UnZCBsaWtlIGQtPmFyY2guYWx0cDJtX2FjdGl2ZSB0byBv
bmx5IGJlIHNldCBfYWZ0ZXJfIHRoZSBmb3IsIGZvciB0aGUKPj4gZW5hYmxlLCBhcyB3ZWxsIGFz
IGZvciB0aGUgZGlzYWJsZSBjYXNlLgo+IAo+IE5vLCBjZXJ0YWlubHkgbm90LiBFeGFjdGx5IGJl
Y2F1c2Ugb2YgLi4uCj4gCj4+IEhvd2V2ZXIsIEkgd2FudGVkIHRvIGtlZXAgYm90aCBpZigpcyB0
byBhdm9pZCBhbm90aGVyIHByb2JsZW0gd2l0aCB0aGlzCj4+IGNvZGU6Cj4+IFsuLi5dCj4+IFNv
IGZvciB0aGUgZGlzYWJsZSBjYXNlLCBJIHdhbnRlZCBhbHRwMm1fYWN0aXZlKHYtPmRvbWFpbikg
dG8gcmV0dXJuCj4+IGZhbHNlIGltbWVkaWF0ZWx5IHNvIHRoYXQgdGhpcyBjb2RlIHdvbid0IGJl
IHRyaWdnZXJlZC4gT3RoZXJ3aXNlLAo+PiBhc3N1bWluZyB0aGUgZm9sbG93aW5nIHNjZW5hcmlv
Ogo+IAo+IC4uLiB0aGlzLiBBcHBhcmVudGx5ICJhbmQga2VlcCB3aGF0IGlzIG5vdyB0aGUgYm9k
eSIgd2FzIHN0aWxsIG5vdCBjbGVhcgo+IGVub3VnaC4KPiAKPiBUYWtpbmcgeW91ciBvcmlnaW5h
bCBjb2RlLCBJIG1lYW4KPiAKPiAgICAgICAgICBpZiAoIG5zdGF0ZSAhPSBvc3RhdGUgJiYKPiAg
ICAgICAgICAgICAgIChvc3RhdGUgfHwgIShyYyA9IHAybV9pbml0X2FsdHAybV9ieV9pZChkLCAw
KSkpICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIC8qIEZpcnN0IG1hcmsgYWx0cDJtIGFz
IGRpc2FibGVkLCB0aGVuIGFsdHAybV92Y3B1X2Rlc3Ryb3koKS4gKi8KPiAgICAgICAgICAgICAg
ZC0+YXJjaC5hbHRwMm1fYWN0aXZlID0gZmFsc2U7Cj4gCj4gICAgICAgICAgICAgIGZvcl9lYWNo
X3ZjcHUoIGQsIHYgKQo+ICAgICAgICAgICAgICBbLi4uXQo+IAo+ICAgICAgICAgICAgICBpZiAo
IG9zdGF0ZSApCj4gICAgICAgICAgICAgICAgICBwMm1fZmx1c2hfYWx0cDJtKGQpOwo+ICAgICAg
ICAgICAgICAvKgo+ICAgICAgICAgICAgICAgKiBXYWl0IHVudGlsIGFsdHAybV92Y3B1X2luaXRp
YWxpc2UoKSBpcyBkb25lIGJlZm9yZSBtYXJraW5nCj4gICAgICAgICAgICAgICAqIGFsdHAybSBh
cyBiZWluZyBlbmFibGVkIGZvciB0aGUgZG9tYWluLgo+ICAgICAgICAgICAgICAgKi8KPiAgICAg
ICAgICAgICAgZC0+YXJjaC5hbHRwMm1fYWN0aXZlID0gbnN0YXRlOwo+ICAgICAgICAgIH0KCkFo
ISBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgoKPj4gTm93LCB5b3UncmUgcmlnaHQgdGhh
dCBwMm1fZ2V0X2FsdHAybSgpIG1heSBoYW5kIG92ZXIgYSBwb2ludGVyIHRvIGFuCj4+IGFsdHAy
bSBiZXR3ZWVuIHRoZSBtb21lbnQgd2hlcmUgZC0+YXJjaC5hbHRwMm1fYWN0aXZlIGlzIGZhbHNl
IGFuZCB0aGUKPj4gcG9pbnQgd2hlcmUgdi0+cDJtaWR4IGFjdHVhbGx5IGJlY29tZXMgSU5WQUxJ
RF9BTFRQMk0gd2l0aCBteSBjb2RlOyBidXQKPj4gSSB0aGluayBpdCBjYW4gYmUgYXJndWVkIHRo
YXQgSSBzaG91bGQgcmF0aGVyIGZpeCBwMm1fZ2V0X2FsdHAybSgpLCB0bwo+PiByZXR1cm4gTlVM
TCBpZiBhbHRwMm1fYWN0aXZlKCkgPT0gZmFsc2UgYW5kIGtlZXAgdGhlIGlmKClzICh3aGljaCBJ
J3ZlCj4+IGhvcGVmdWxseSBiZWVuIG1vcmUgZWxvcXVlbnQgYWJvdXQgbm93KS4KPiAKPiBZZXMs
IHRoYXQgbG9va3MgdG8gYmUgYW4gb3B0aW9uLCBwcm92aWRlZCBpdCBkb2Vzbid0IHZpb2xhdGUg
YXNzdW1wdGlvbnMKPiBlbHNld2hlcmUuCgpJdCBkb2Vzbid0LCBBRkFJQ1QuIEFkZGl0aW9uYWxs
eSwgaXQgY2FuIGJlIGFyZ3VlZCB0aGF0IGlmIGNvZGUgcmVsaWVzIApvbiBwMm1fZ2V0X2FsdHAy
bSgpIHJldHVybmluZyBub3QtTlVMTCB3aGVuICFhbHRwMm1fYWN0aXZlKCksIHNhaWQgY29kZSAK
aXMgYnJva2VuLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
