From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 13:26:32 +0200
Message-ID: <b7b8bf3e-816d-4d6a-111a-9063dafa82a6@suse.com>
References: =?UTF-8?Q?<20180918060309.7186=ef=bf=bd1=ef=bf=bdjgross@suse.com?=
 =?UTF-8?Q?>_<5BA0D44602000078001E93EA@suse.com>_<f8bc94ca-9eee-a5a2-5c32-0c?=
 =?UTF-8?Q?a1ed0cbf5d@suse.com>_<5BA0DF3702000078001E9444@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pqiu=ma=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2E9L-00027b-W1
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:26:36 +0000
In-Reply-To: <5BA0DF3702000078001E9444@suse.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMTM6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA5LjE4IGF0
IDEzOjAyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTgvMDkvMTggMTI6MzIsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTguMDkuMTggYXQgMDg6MDIsIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+IEluc3RlYWQgb2YgdXNpbmcgYmluYXJ5IGh5cGVydmlzb3IgaW50
ZXJmYWNlcyBmb3IgbmV3IHBhcmFtZXRlcnMgb2YKPj4+PiBkb21haW5zIG9yIGNwdXBvb2xzIHRo
aXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgZ2VuZXJpYyB0ZXh0Cj4+Pj4gYmFzZWQg
cGFyYW1ldGVyIHBhcnNpbmcuCj4+Pj4KPj4+PiBQYXJhbWV0ZXJzIGFyZSBkZWZpbmVkIHZpYSBu
ZXcgbWFjcm9zIHNpbWlsYXIgdG8gdGhvc2Ugb2YgYm9vdAo+Pj4+IHBhcmFtZXRlcnMuIFBhcnNp
bmcgb2YgcGFyYW1ldGVyIHN0cmluZ3MgaXMgZG9uZSB2aWEgdGhlIGFscmVhZHkKPj4+PiBleGlz
dGluZyBib290IHBhcmFtZXRlciBwYXJzaW5nIGZ1bmN0aW9uIHdoaWNoIGlzIGV4dGVuZGVkIGEg
bGl0dGxlCj4+Pj4gYml0Lgo+Pj4+Cj4+Pj4gUGFyYW1ldGVyIHNldHRpbmdzIGNhbiBlaXRoZXIg
YmUgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPj4+PiBkb21haW5zIG9yIGNw
dXBvb2xzLCBvciB0aGV5IGNhbiBiZSBzZXQgdmlhIG5ldyB4bCBzdWItY29tbWFuZHMuCj4+Pgo+
Pj4gV2l0aG91dCBoYXZpbmcgbG9va2VkIGF0IGFueSBvZiB0aGUgcGF0Y2hlcyB5ZXQgKG5vdCBl
dmVuIHRoZWlyCj4+PiBkZXNjcmlwdGlvbnMpIEknbSBzdGlsbCB3b25kZXJpbmcgd2hhdCB0aGUg
YmVuZWZpdCBvZiB0ZXh0dWFsIHBhcmFtZXRlcnMKPj4+IHJlYWxseSBpczogSnVzdCBsaWtlICJi
aW5hcnkiIG9uZXMsIHRoZXkgYmVjb21lIHBhcnQgb2YgdGhlIHB1YmxpYwo+Pj4gaW50ZXJmYWNl
LCBhbmQgaGVuY2Ugc3Vic2VxdWVudGx5IGNhbid0IGJlIGNoYW5nZWQgYW55IG1vcmUgb3IKPj4+
IGxlc3MgdGhhbiB0aGUgb25lcyB3ZSBjdXJyZW50bHkgaGF2ZSAoaW4gcGFydGljdWxhciwgYW55
dGhpbmcgdmFsaWQgaW4KPj4+IGEgZ3Vlc3QgY29uZmlnIGZpbGUgd2lsbCBpbW8gbmVlZCB0byBy
ZW1haW4gdG8gYmUgdmFsaWQgYW5kIG1lYW5pbmdmdWwKPj4+IGRvd24gdGhlIHJvYWQpLgo+Pj4K
Pj4+IElmIHRoaXMgaXMgc29sZWx5IG9yIG1haW5seSBhYm91dCBkZWZlcnJpbmcgdGhlIHBhcnNp
bmcgZnJvbSB0aGUgdG9vbAo+Pj4gc3RhY2sgdG8gdGhlIGh5cGVydmlzb3IsIHRoZW4gSSdtIG5v
dCBhdCBhbGwgY29udmluY2VkIG9mIHRoZSBhcHByb2FjaAo+Pj4gKEknZCBldmVuIGJlIHRlbXB0
ZWQgdG8gY2FsbCBpdCBiYWNrd2FyZHMpLgo+Pgo+PiBUaGUgbWFpbiBhZHZhbnRhZ2UgaXMgdGhh
dCBpdCB3b3VsZCBiZSBtdWNoIGVhc2llciB0byBiYWNrcG9ydCBuZXcKPj4gcGFyYW1ldGVycyBs
aWtlIHRoZSB4cHRpIHBlci1kb21haW4gb25lLiBObyBuZWVkIHRvIGJ1bXAgc3lzY3RsL2RvbWN0
bAo+PiBpbnRlcmZhY2UgdmVyc2lvbnMgZm9yIHRoYXQuCj4gCj4gQWRkaXRpb25zIHRvIHN5c2N0
bC9kb21jdGwgaW50ZXJmYWNlcyBkb24ndCByZXF1aXJlIHN1Y2ggYSBidW1wLgoKV2hhdCBhcmUg
WEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiBhbmQgWEVOX1NZU0NUTF9JTlRFUkZBQ0VfVkVS
U0lPTgpmb3IgdGhlbj8KCj4gCj4+IEl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIHN1cHBvcnQg
bWFuZGF0b3J5IGFuZCBvcHRpb25hbCBwYXJhbWV0ZXJzCj4+IGluIHRoZSBndWVzdCBjb25maWcu
IE9wdGlvbmFsIHBhcmFtZXRlcnMgbm90IHN1cHBvcnRlZCBieSB0aGUgaHlwZXJ2aXNvcgo+PiB3
b3VsZCB0aGVuIGJlIGlnbm9yZWQgaW5zdGVhZCBvZiBsZWFkaW5nIHRvIGZhaWx1cmUgYXQgZ3Vl
c3QgY3JlYXRpb24KPj4gdGltZS4KPiAKPiBFeGNlcHQgdGhhdCBvdmVyIHRpbWUgb3BpbmlvbnMg
bWF5IGNoYW5nZSB3aGF0IGlzIHN1cHBvc2VkIHRvCj4gYmUgb3B0aW9uYWwgdnMgbWFuZGF0b3J5
LgoKQW5kIHRoYXQgd291bGQgY2hhbmdlIGhvdyBpbiBjYXNlIG9mIGJpbmFyeSBpbnRlcmZhY2Vz
PwoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
