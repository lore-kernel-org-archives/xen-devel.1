From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:30:37 +0200
Message-ID: <2389f7c7-88b9-b39c-9191-b9a796446a56@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@prv1-mh.provo.novell.com>
 <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
 <984047f6-4785-27e6-2ff8-63d990a9238a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2EDI-00031R-7K
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:30:40 +0000
In-Reply-To: <984047f6-4785-27e6-2ff8-63d990a9238a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTM6MTgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMDkvMTgvMjAxOCAx
MjoxMCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTgvMDkvMTggMTI6MzIsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMDkuMTggYXQgMDg6MDIsIDxqZ3Jvc3NAc3VzZS5j
b20+IHdyb3RlOgo+Pj4+IEluc3RlYWQgb2YgdXNpbmcgYmluYXJ5IGh5cGVydmlzb3IgaW50ZXJm
YWNlcyBmb3IgbmV3IHBhcmFtZXRlcnMgb2YKPj4+PiBkb21haW5zIG9yIGNwdXBvb2xzIHRoaXMg
cGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZ2VuZXJpYyB0ZXh0Cj4+Pj4gYmFzZWQgcGFy
YW1ldGVyIHBhcnNpbmcuCj4+Pj4KPj4+PiBQYXJhbWV0ZXJzIGFyZSBkZWZpbmVkIHZpYSBuZXcg
bWFjcm9zIHNpbWlsYXIgdG8gdGhvc2Ugb2YgYm9vdAo+Pj4+IHBhcmFtZXRlcnMuIFBhcnNpbmcg
b2YgcGFyYW1ldGVyIHN0cmluZ3MgaXMgZG9uZSB2aWEgdGhlIGFscmVhZHkKPj4+PiBleGlzdGlu
ZyBib290IHBhcmFtZXRlciBwYXJzaW5nIGZ1bmN0aW9uIHdoaWNoIGlzIGV4dGVuZGVkIGEgbGl0
dGxlCj4+Pj4gYml0Lgo+Pj4+Cj4+Pj4gUGFyYW1ldGVyIHNldHRpbmdzIGNhbiBlaXRoZXIgYmUg
c3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPj4+PiBkb21haW5zIG9yIGNwdXBv
b2xzLCBvciB0aGV5IGNhbiBiZSBzZXQgdmlhIG5ldyB4bCBzdWItY29tbWFuZHMuCj4+Pgo+Pj4g
V2l0aG91dCBoYXZpbmcgbG9va2VkIGF0IGFueSBvZiB0aGUgcGF0Y2hlcyB5ZXQgKG5vdCBldmVu
IHRoZWlyCj4+PiBkZXNjcmlwdGlvbnMpIEknbSBzdGlsbCB3b25kZXJpbmcgd2hhdCB0aGUgYmVu
ZWZpdCBvZiB0ZXh0dWFsIHBhcmFtZXRlcnMKPj4+IHJlYWxseSBpczogSnVzdCBsaWtlICJiaW5h
cnkiIG9uZXMsIHRoZXkgYmVjb21lIHBhcnQgb2YgdGhlIHB1YmxpYwo+Pj4gaW50ZXJmYWNlLCBh
bmQgaGVuY2Ugc3Vic2VxdWVudGx5IGNhbid0IGJlIGNoYW5nZWQgYW55IG1vcmUgb3IKPj4+IGxl
c3MgdGhhbiB0aGUgb25lcyB3ZSBjdXJyZW50bHkgaGF2ZSAoaW4gcGFydGljdWxhciwgYW55dGhp
bmcgdmFsaWQgaW4KPj4+IGEgZ3Vlc3QgY29uZmlnIGZpbGUgd2lsbCBpbW8gbmVlZCB0byByZW1h
aW4gdG8gYmUgdmFsaWQgYW5kIG1lYW5pbmdmdWwKPj4+IGRvd24gdGhlIHJvYWQpLgo+Pgo+PiBT
byBsZXRzIGxvb2sgd2hhdCB3b3VsZCBiZSBuZWVkZWQgZm9yIGFkZGluZyBzb21ldGhpbmcgbGlr
ZSB0aGUKPj4gcGVyLWRvbWFpbiB4cHRpIHBhcmFtZXRlciB1c2luZyBiaW5hcnkgaW50ZXJmYWNl
czoKPj4KPj4gMSBhbiBleHRlbnNpb24gb2Ygc29tZSBkb21jdGwgaW50ZXJmYWNlLCBtYXliZSBi
dW1waW5nIG9mIHRoZSBkb21jdGwKPj4gICBpbnRlcmZhY2UgdmVyc2lvbgo+PiAyIGFkZGluZyB0
aGUgbG9naWMgdG8gZG9tY3RsIGhhbmRsaW5nCj4+IDMgYWRkaW5nIGxpYnhjIHN1cHBvcnQKPj4g
NCBhZGRpbmcgbGlieGwgc3VwcG9ydAo+PiA1IGFkZGluZyBhIG5ldyB4bCBzdWItY29tbWFuZAo+
PiA2IGFkZGluZyBkb21haW4gY29uZmlnIHN1cHBvcnQKPj4gNyBhZGRpbmcgZG9jdW1lbnRhdGlv
bgo+Pgo+PiBXaXRoIG15IGFwcHJvYWNoIG9ubHkgMiAoaW4gYSBtb2RpZmllZCBmb3JtLCBwYXJh
bWV0ZXIgaGFuZGxpbmcgaW5zdGVhZAo+PiBvZiBkb21jdGwsIGJ1dCBjb21wYXJhYmxlIGluIHRo
ZSBuZWVkZWQgZWZmb3J0KSBhbmQgNyBhcmUgbmVlZGVkLgo+Pgo+PiBTbyBvbmNlIHRoZSBmcmFt
ZXdvcmsgaXMgaW4gcGxhY2UgaXQgaXMgX211Y2hfIGVhc2llciB0byBhZGQgbmV3Cj4+IGZlYXR1
cmVzLgo+IAo+IFNvIHRoZSBpZGVhIGhlcmUgaXMgdGhhdCB5b3UgcGFzcyBhIGZ1bGwgaHlwZXJ2
aXNvciBjb21tYW5kLWxpbmUgc3R5bGUKPiBzdHJpbmcgaW50byBhIGh5cGVyY2FsbCAtLSBzYXks
ICJjcmVkaXQyX2NhcF9wZXJpb2RfbXM9NSI/CgpZZXMuCgpJIGd1ZXNzIGl0IHdvdWxkIGJlIHF1
ZXN0aW9uYWJsZSB0byBoYXZlIG11bHRpcGxlIHdheXMgdG8gc2V0IGEKcHJvcGVydHksIHNvIG9u
bHkgbmV3IHByb3BlcnRpZXMgc2hvdWxkIGJlIHN1cHBvcnRlZC4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
