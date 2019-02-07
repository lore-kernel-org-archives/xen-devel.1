From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 for-4.12 10/17] argo: implement the
 notify op
Date: Thu, 07 Feb 2019 06:08:22 -0700
Message-ID: <5C5C2DC60200007800214A36@prv1-mh.provo.novell.com>
References: <1549443308-24448-1-git-send-email-christopher.w.clark@gmail.com>
 <1549443308-24448-11-git-send-email-christopher.w.clark@gmail.com>
 <5c9d887c-7329-35a9-d98d-a9f6fe3b7486@arm.com>
 <CACMJ4GZj+_YJY7O+SaxZQfWKzan+T2bKGb70EtXfXu2+P4LnSQ@mail.gmail.com>
 <ca56b2ef-ba5f-071d-306d-61b6e00a2426@arm.com>
 <5415B79C-0D71-4719-A2A5-4F49D6D31B7E@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grjPk-0001II-Nt
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 13:08:24 +0000
In-Reply-To: <5415B79C-0D71-4719-A2A5-4F49D6D31B7E@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rich Persaud <persaur@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDEwOjE1LCA8cGVyc2F1ckBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IEZlYiA3LCAyMDE5LCBhdCAwNDowNCwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4gd3JvdGU6Cj4+PiBPbiAyLzcvMTkgNjozMiBBTSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6
Cj4+PiBJdCB1c2VzIHRoYXQgbnVsbCB0ZXN0IGJlY2F1c2UgYm90aCBhcmUgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSB0eXBlIGluCj4+PiB0aGUgZnVuY3Rpb24gc2lnbmF0dXJlOgo+Pj4gbG9uZyBk
b19hcmdvX29wKAo+Pj4gICAgIHVuc2lnbmVkIGludCBjbWQsCj4+PiAgICAgWEVOX0dVRVNUX0hB
TkRMRV9QQVJBTSh2b2lkKSBhcmcxLAo+Pj4gICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9p
ZCkgYXJnMiwKPj4+ICAgICB1bnNpZ25lZCBsb25nIGFyZzMsCj4+PiAgICAgdW5zaWduZWQgbG9u
ZyBhcmc0KTsKPj4+IGFuZCBzaW5jZSBpdCBkb2VzIHRoYXQsIHRoZSBjb21tZW50IHN0YXRlcyBO
VUxMIHJhdGhlciB0aGFuIHplcm8uCj4+PiBJdCBpcyBYZW4ncyBkZWZpbml0aW9uIGZvciBOVUxM
IHRoYXQgaXMgdXNlZCwgc28gdGhlIGV4cGVjdGVkIHZhbHVlIGluCj4+PiB0aGUgcmVnaXN0ZXIg
d2hlbiB0aGUgaHlwZXJjYWxsIGlzIGludm9rZWQgaXM6IHplcm8uCj4+IAo+PiBBcyBhYm92ZSwg
SSBkb24ndCB0aGluayBpdCBpcyBjbGVhcmx5IGRlZmluZSBpbiB0aGUgaGVhZGVycyB0aGF0IE5V
TEwgbWVhbnMgCj4gMC4gVGhpcyBpcyByYXRoZXIgYW4gaW1wbGljaXQgd3JpdHRlbiBydWxlcyBp
biB0aGUgaG9wZSB0aGF0IGV2ZXJ5IE9TIGFyZSAKPiBnb2luZyB0byBmb2xsb3cgdGhhdC4KPj4g
Cj4+IEkga25vdywgSSBhbSBwZWRhbnRpYyBoZXJlIChoZW5jZSB0aGUgTklUKSA6KS4gQW5kIEkg
cmVhbGl6ZSB0aGlzIGlzIG5vdCAKPiByZWxhdGVkIHRvIHRoaXMgc2VyaWVzIGFuZCBhIGZldyBw
bGFjZXMgaW4gdGhlIGNvZGUgYXNzdW1lcyB0aGUgc2FtZS4KPj4gCj4+Pj4+ICsgKiBhcmczOiAw
IChaRVJPKQo+Pj4+PiArICogYXJnNDogMCAoWkVSTykKPj4+PiAKPj4+PiBOSVQ6IEkgZ3Vlc3Mg
dGhvc2UgdG8gd2lsbCBiZSAwIGluIGFuIHVuc2lnbmVkIGxvbmcgdmFsdWU/Cj4+PiBZZXMuCj4+
IAo+PiBDYW4gdGhpcyBiZSBjbGFyaWZpZWQgaW4gYSBmb2xsb3ctdXAgcGF0Y2g/Cj4gCj4gU2lu
Y2UgdGhpcyBpcyBhIGNvbW1lbnQgcmV2aXNpb24sIGNvdWxkIGl0IGJlIG1hZGUgYnkgdGhlIGNv
bW1pdHRlciBkdXJpbmcgCj4gdGhlIGltbWluZW50IG1lcmdlIG9mIHRoaXMgQXJnbyBzZXJpZXM/
CgpJJ20gbm90IGdvaW5nIHRvIGFsdGVyIHRoZSBjb21tZW50cywgYXMgSSBkb24ndCByZWFsbHkg
c2VlIHdoYXQgaXMgaW4gbmVlZApvZiBjbGFyaWZpY2F0aW9uIGhlcmUuIElmIGFueSBjbGFyaWZp
Y2F0aW9uIGlzIGluZGVlZCBuZWVkZWQsIHRoaXMgd2lsbCBuZWVkIHRvCmhhcHBlbiBpbiBmb2xs
b3ctb24gcGF0Y2hlcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
