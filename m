From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] libxl: make vkbd tunable for HVM guests
Date: Wed, 15 May 2019 10:53:14 +0100
Message-ID: <20190515095314.GD3977@zion.uk.xensource.com>
References: <20190514084325.43928-1-elnikety@amazon.com>
 <20190515094711.GM2798@zion.uk.xensource.com>
 <3b441efd-c459-eee5-12c9-6c749fc18689@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQqbO-0002tc-RN
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:53:34 +0000
Content-Disposition: inline
In-Reply-To: <3b441efd-c459-eee5-12c9-6c749fc18689@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6NDk6NThBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wNS8yMDE5IDEwOjQ3LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gVHVlLCBN
YXkgMTQsIDIwMTkgYXQgMDg6NDM6MjVBTSArMDAwMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4g
Pj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2JhY2tlbmQg
cGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiA+PiBUaGlzIGNvbnN1bWVzIGhvc3QgcmVzb3VyY2Vz
IHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNlIGZvcgo+ID4+IHZrYmQu
IE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1pbmlzdHJhdG9yIHRv
IGNob29zZS4gVGhlCj4gPj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0t
IEhWTSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gPj4gc3BlY2lmaWVkIG90aGVyd2lz
ZS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6
b24uY29tPgo+ID4+IC0tLQo+ID4+ICAgICBDaGFuZ2VzIGluIHYyOgo+ID4+ICAgICAgICAgLSBB
ZGRlZCBhIG1pc3NpbmcgaHVuayAvIHNldHRpbmcgdmtiX2RldmljZSBwZXIgY29uZmlnCj4gPj4K
PiA+PiAgICAgQ2hhbmdlcyBpbiB2MzoKPiA+PiAgICAgICAgIC0gQWRkZWQgZW50cmllcyBpbiBs
aWJ4bC5oIGFuZCBpbiBkb2N1bWVudGF0aW9uCj4gPj4gLS0tCj4gPj4gIGRvY3MvbWFuL3hsLmNm
Zy5wb2QuNS5pbiAgICB8IDQgKysrKwo+ID4gSSB3b25kZXIgd2hlcmUgeW91IGdvdCB0aGlzIGZp
bGUuIDpwCj4gPgo+ID4gVGhlIGNvcnJlY3QgZmlsZSBuYW1lIGlzIHhsLmNmZy41LnBvZC5pbi4K
PiAKPiBJIHJldmVyc2VkIHRoZSAucG9kIGFuZCAuNSBpbiA4NDEwZmNiNTRhYzgwOGMxOWEwMzBj
NmYwZWM2NGU3NjBhYzY0Y2E1Cj4gCj4gVGhpcyBpcyBsaWtlbHkgYSBwYXRjaCBhZ2FpbnN0IDQu
MTEgb3IgZWFybGllci4KCk9oLCB0aGF0IGV4cGxhaW5zIGl0LgoKV2VpLgoKPiAKPiB+QW5kcmV3
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
