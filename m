From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Tue, 15 Jan 2019 09:06:52 +0000
Message-ID: <bc97d808-2702-511e-b1f1-a910a573f068@citrix.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <90a21420-9f9f-7a8f-32e5-b00e3e3bd1d0@citrix.com>
 <CACMJ4GZHU+8431ToXqPjU=_a1MhYiih-R=OcPqXei88a0=yJZA@mail.gmail.com>
 <5C3DA180020000780020DA53@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3OYV=PX=citrix.com=prvs=91139fb13=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gjKgT-0001VF-TE
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 09:06:57 +0000
In-Reply-To: <5C3DA180020000780020DA53@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Tim Deegan <tim@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAwOTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTUuMDEuMTkg
YXQgMDg6MjEsIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9uIE1v
biwgSmFuIDE0LCAyMDE5IGF0IDY6NTggQU0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiAwNy8wMS8yMDE5IDA3OjQyLCBDaHJpc3RvcGhlciBD
bGFyayB3cm90ZToKPj4+PiAtLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MK
Pj4+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPj4+PiBAQCAtMTgy
LDYgKzE4MiwxNyBAQCBQZXJtaXQgWGVuIHRvIHVzZSAiQWx3YXlzIFJ1bm5pbmcgQVBJQyBUaW1l
ciIgc3VwcG9ydCBvbiBjb21wYXRpYmxlIGhhcmR3YXJlCj4+Pj4gIGluIGNvbWJpbmF0aW9uIHdp
dGggY3B1aWRsZS4gIFRoaXMgb3B0aW9uIGlzIG9ubHkgZXhwZWN0ZWQgdG8gYmUgdXNlZnVsIGZv
cgo+Pj4+ICBkZXZlbG9wZXJzIHdpc2hpbmcgWGVuIHRvIGZhbGwgYmFjayB0byBvbGRlciB0aW1p
bmcgbWV0aG9kcyBvbiBuZXdlciBoYXJkd2FyZS4KPj4+Pgo+Pj4+ICsjIyMgYXJnbwo+Pj4+ICs+
IGA9IDxib29sZWFuPmAKPj4+PiArCj4+Pj4gKz4gRGVmYXVsdDogYGZhbHNlYAo+Pj4+ICsKPj4+
PiArRW5hYmxlIHRoZSBBcmdvIGh5cGVydmlzb3ItbWVkaWF0ZWQgaW50ZXJkb21haW4gY29tbXVu
aWNhdGlvbiBtZWNoYW5pc20uCj4+Pj4gKwo+Pj4+ICtUaGlzIGFsbG93cyBkb21haW5zIGFjY2Vz
cyB0byB0aGUgQXJnbyBoeXBlcmNhbGwsIHdoaWNoIHN1cHBvcnRzIHJlZ2lzdHJhdGlvbgo+Pj4+
ICtvZiBtZW1vcnkgcmluZ3Mgd2l0aCB0aGUgaHlwZXJ2aXNvciB0byByZWNlaXZlIG1lc3NhZ2Vz
LCBzZW5kaW5nIG1lc3NhZ2VzIHRvCj4+Pj4gK290aGVyIGRvbWFpbnMgYnkgaHlwZXJjYWxsIGFu
ZCBxdWVyeWluZyB0aGUgcmluZyBzdGF0dXMgb2Ygb3RoZXIgZG9tYWlucy4KPj4+IFBsZWFzZSBk
byBpbmNsdWRlIGEgbm90ZSBhYm91dCBDT05GSUdfQVJHTy4gIEkga25vdyB0aGlzIGRvYyBpcwo+
Pj4gaW5jb25zaXN0ZW50IG9uIHRoZSBtYXR0ZXIgKGFzIEtjb25maWcgcG9zdGRhdGVzIHRoZSB3
cml0dGVuIGVudHJpZXMKPj4+IGhlcmUpLCBidXQgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIGZpeCB1
cCwgYW5kIG5vdyBhYm91dCBoYWxmIG9mIHRoZQo+Pj4gZG9jdW1lbnRhdGlvbiBkb2VzIG1lbnRp
b24gYXBwcm9wcmlhdGUgS2NvbmZpZyBpbmZvcm1hdGlvbi4KPj4gQWNrLCBub3RlIGFkZGVkLgo+
IEp1c3QgdG8gdm9pY2UgbXkgdmlldyBoZXJlOiBXaGlsZSBJIGFncmVlIHRoYXQgc29tZSBmb3Jt
IG9mIGluZGljYXRpb24KPiBzaG91bGQgYmUgYWRkZWQsIEkgZG9uJ3QgdGhpbmsgQ09ORklHX0FS
R08gc2hvdWxkIGJlIG1lbnRpb25lZC4KPiBDT05GSUdfKiBpbiBnZW5lcmFsIGFyZSBsaWtlbHkg
bWVhbmluZ2xlc3MgdG8gdGhlIG1haW4gYXVkaWVuY2Ugb2YKPiB0aGlzIGZpbGUgKGFkbWlucyBy
YXRoZXIgdGhhbiBkZXZlbG9wZXJzKS4gSGVuY2UgdGhlIHdvcmRpbmcgc2hvdWxkIGJlCj4gbW9z
dGx5IGluZGVwZW5kZW50IG9mIHRoZSBwcmVjaXNlIGNvbmZpZyBvcHRpb24gbmFtZTsgdGhlcmUg
bWF5IHRoZW4KPiBiZSBhbiBhbm5vdGF0aW9uIG5hbWluZyB0aGUgb3B0aW9uLiBPbWl0dGluZyB0
aGUgb3B0aW9uIG5hbWUsIG90b2gsCj4gaGFzIHRoZSBiZW5lZml0IG9mIG5vdCBiZWFyaW5nIHRo
ZSByaXNrIG9mIGdvaW5nIHN0YWxlLgoKSSBjb21wbGV0ZWx5IGRpc2FncmVlLsKgIFRoZSBleGFj
dCBDT05GSUdfIG5hbWUgaXMgdmVyeSBpbXBvcnRhbnQgZm9yIHRoZQplbmQgdXNlciB3aG8gaXMg
bG9va2luZyBhdCB0aGUgZG9jdW1lbnRhdGlvbiB3b25kZXJpbmcgIndoeSBjYW4ndCBJIHNlZW0K
dG8gZW5hYmxlIEFSR08/IgoKIlRoaXMgb3B0aW9uIGlzIG9ubHkgYXZhaWxhYmxlIHdoZW4gQ09O
RklHX0FSR08gaXMgY29tcGlsZWQgaW4iIGlzbid0CmdvaW5nIHRvIHB1dCBhbnlvbmUgb2ZmIHJl
YWRpbmcgdGhlIGRvY3VtZW50LCBidXQgaXMgdXNlZnVsIGZvciBzb21lIHdobwphcmUgcmVhZGlu
ZyBpdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
