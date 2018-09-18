From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:24:54 +0200
Message-ID: <b1cf4a8c-aa52-4fe9-d223-276a8a7c782e@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@suse.com>
 <f8bc94ca-9eee-a5a2-5c32-0ca1ed0cbf5d@suse.com>
 <5BA0DF3702000078001E9444@prv1-mh.provo.novell.com>
 <78501912-e586-faa9-3569-3b2fd2fef9f5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2E7l-0001zN-3j
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:24:57 +0000
In-Reply-To: <78501912-e586-faa9-3569-3b2fd2fef9f5@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTM6MjAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMDkvMTgvMjAxOCAx
MjoxOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4LjA5LjE4IGF0IDEzOjAyLCA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IE9uIDE4LzA5LzE4IDEyOjMyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+PiBPbiAxOC4wOS4xOCBhdCAwODowMiwgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6Cj4+Pj4+IEluc3RlYWQgb2YgdXNpbmcgYmluYXJ5IGh5cGVydmlzb3IgaW50ZXJmYWNl
cyBmb3IgbmV3IHBhcmFtZXRlcnMgb2YKPj4+Pj4gZG9tYWlucyBvciBjcHVwb29scyB0aGlzIHBh
dGNoIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGdlbmVyaWMgdGV4dAo+Pj4+PiBiYXNlZCBwYXJh
bWV0ZXIgcGFyc2luZy4KPj4+Pj4KPj4+Pj4gUGFyYW1ldGVycyBhcmUgZGVmaW5lZCB2aWEgbmV3
IG1hY3JvcyBzaW1pbGFyIHRvIHRob3NlIG9mIGJvb3QKPj4+Pj4gcGFyYW1ldGVycy4gUGFyc2lu
ZyBvZiBwYXJhbWV0ZXIgc3RyaW5ncyBpcyBkb25lIHZpYSB0aGUgYWxyZWFkeQo+Pj4+PiBleGlz
dGluZyBib290IHBhcmFtZXRlciBwYXJzaW5nIGZ1bmN0aW9uIHdoaWNoIGlzIGV4dGVuZGVkIGEg
bGl0dGxlCj4+Pj4+IGJpdC4KPj4+Pj4KPj4+Pj4gUGFyYW1ldGVyIHNldHRpbmdzIGNhbiBlaXRo
ZXIgYmUgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPj4+Pj4gZG9tYWlucyBv
ciBjcHVwb29scywgb3IgdGhleSBjYW4gYmUgc2V0IHZpYSBuZXcgeGwgc3ViLWNvbW1hbmRzLgo+
Pj4+Cj4+Pj4gV2l0aG91dCBoYXZpbmcgbG9va2VkIGF0IGFueSBvZiB0aGUgcGF0Y2hlcyB5ZXQg
KG5vdCBldmVuIHRoZWlyCj4+Pj4gZGVzY3JpcHRpb25zKSBJJ20gc3RpbGwgd29uZGVyaW5nIHdo
YXQgdGhlIGJlbmVmaXQgb2YgdGV4dHVhbCBwYXJhbWV0ZXJzCj4+Pj4gcmVhbGx5IGlzOiBKdXN0
IGxpa2UgImJpbmFyeSIgb25lcywgdGhleSBiZWNvbWUgcGFydCBvZiB0aGUgcHVibGljCj4+Pj4g
aW50ZXJmYWNlLCBhbmQgaGVuY2Ugc3Vic2VxdWVudGx5IGNhbid0IGJlIGNoYW5nZWQgYW55IG1v
cmUgb3IKPj4+PiBsZXNzIHRoYW4gdGhlIG9uZXMgd2UgY3VycmVudGx5IGhhdmUgKGluIHBhcnRp
Y3VsYXIsIGFueXRoaW5nIHZhbGlkIGluCj4+Pj4gYSBndWVzdCBjb25maWcgZmlsZSB3aWxsIGlt
byBuZWVkIHRvIHJlbWFpbiB0byBiZSB2YWxpZCBhbmQgbWVhbmluZ2Z1bAo+Pj4+IGRvd24gdGhl
IHJvYWQpLgo+Pj4+Cj4+Pj4gSWYgdGhpcyBpcyBzb2xlbHkgb3IgbWFpbmx5IGFib3V0IGRlZmVy
cmluZyB0aGUgcGFyc2luZyBmcm9tIHRoZSB0b29sCj4+Pj4gc3RhY2sgdG8gdGhlIGh5cGVydmlz
b3IsIHRoZW4gSSdtIG5vdCBhdCBhbGwgY29udmluY2VkIG9mIHRoZSBhcHByb2FjaAo+Pj4+IChJ
J2QgZXZlbiBiZSB0ZW1wdGVkIHRvIGNhbGwgaXQgYmFja3dhcmRzKS4KPj4+Cj4+PiBUaGUgbWFp
biBhZHZhbnRhZ2UgaXMgdGhhdCBpdCB3b3VsZCBiZSBtdWNoIGVhc2llciB0byBiYWNrcG9ydCBu
ZXcKPj4+IHBhcmFtZXRlcnMgbGlrZSB0aGUgeHB0aSBwZXItZG9tYWluIG9uZS4gTm8gbmVlZCB0
byBidW1wIHN5c2N0bC9kb21jdGwKPj4+IGludGVyZmFjZSB2ZXJzaW9ucyBmb3IgdGhhdC4KPj4K
Pj4gQWRkaXRpb25zIHRvIHN5c2N0bC9kb21jdGwgaW50ZXJmYWNlcyBkb24ndCByZXF1aXJlIHN1
Y2ggYSBidW1wLgo+Pgo+Pj4gSXQgbWlnaHQgYmUgYSBnb29kIGlkZWEgdG8gc3VwcG9ydCBtYW5k
YXRvcnkgYW5kIG9wdGlvbmFsIHBhcmFtZXRlcnMKPj4+IGluIHRoZSBndWVzdCBjb25maWcuIE9w
dGlvbmFsIHBhcmFtZXRlcnMgbm90IHN1cHBvcnRlZCBieSB0aGUgaHlwZXJ2aXNvcgo+Pj4gd291
bGQgdGhlbiBiZSBpZ25vcmVkIGluc3RlYWQgb2YgbGVhZGluZyB0byBmYWlsdXJlIGF0IGd1ZXN0
IGNyZWF0aW9uCj4+PiB0aW1lLgo+Pgo+PiBFeGNlcHQgdGhhdCBvdmVyIHRpbWUgb3BpbmlvbnMg
bWF5IGNoYW5nZSB3aGF0IGlzIHN1cHBvc2VkIHRvCj4+IGJlIG9wdGlvbmFsIHZzIG1hbmRhdG9y
eS4KPiAKPiBJIHRob3VnaHQgdGhlIGlkZWEgd291bGQgYmUgdGhhdCB0aGUgYWRtaW4gd291bGQg
c3BlY2lmeSB3aGljaCBvbmVzIHdlcmUKPiBvcHRpb25hbCBvciBtYW5kYXRvcnkuCgpSaWdodC4K
CgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
