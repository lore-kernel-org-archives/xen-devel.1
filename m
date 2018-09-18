From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 12:20:42 +0100
Message-ID: <78501912-e586-faa9-3569-3b2fd2fef9f5@citrix.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@suse.com>
 <f8bc94ca-9eee-a5a2-5c32-0ca1ed0cbf5d@suse.com>
 <5BA0DF3702000078001E9444@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cr/b=ma=citrix.com=prvs=792583d5e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g2E3k-0001UT-6m
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:20:48 +0000
In-Reply-To: <5BA0DF3702000078001E9444@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTgvMjAxOCAxMjoxOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTguMDku
MTggYXQgMTM6MDIsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAxOC8wOS8xOCAxMjoz
MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAxOC4wOS4xOCBhdCAwODowMiwgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4gSW5zdGVhZCBvZiB1c2luZyBiaW5hcnkgaHlwZXJ2aXNv
ciBpbnRlcmZhY2VzIGZvciBuZXcgcGFyYW1ldGVycyBvZgo+Pj4+IGRvbWFpbnMgb3IgY3B1cG9v
bHMgdGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBnZW5lcmljIHRleHQKPj4+PiBi
YXNlZCBwYXJhbWV0ZXIgcGFyc2luZy4KPj4+Pgo+Pj4+IFBhcmFtZXRlcnMgYXJlIGRlZmluZWQg
dmlhIG5ldyBtYWNyb3Mgc2ltaWxhciB0byB0aG9zZSBvZiBib290Cj4+Pj4gcGFyYW1ldGVycy4g
UGFyc2luZyBvZiBwYXJhbWV0ZXIgc3RyaW5ncyBpcyBkb25lIHZpYSB0aGUgYWxyZWFkeQo+Pj4+
IGV4aXN0aW5nIGJvb3QgcGFyYW1ldGVyIHBhcnNpbmcgZnVuY3Rpb24gd2hpY2ggaXMgZXh0ZW5k
ZWQgYSBsaXR0bGUKPj4+PiBiaXQuCj4+Pj4KPj4+PiBQYXJhbWV0ZXIgc2V0dGluZ3MgY2FuIGVp
dGhlciBiZSBzcGVjaWZpZWQgaW4gY29uZmlndXJhdGlvbiBmaWxlcyBvZgo+Pj4+IGRvbWFpbnMg
b3IgY3B1cG9vbHMsIG9yIHRoZXkgY2FuIGJlIHNldCB2aWEgbmV3IHhsIHN1Yi1jb21tYW5kcy4K
Pj4+Cj4+PiBXaXRob3V0IGhhdmluZyBsb29rZWQgYXQgYW55IG9mIHRoZSBwYXRjaGVzIHlldCAo
bm90IGV2ZW4gdGhlaXIKPj4+IGRlc2NyaXB0aW9ucykgSSdtIHN0aWxsIHdvbmRlcmluZyB3aGF0
IHRoZSBiZW5lZml0IG9mIHRleHR1YWwgcGFyYW1ldGVycwo+Pj4gcmVhbGx5IGlzOiBKdXN0IGxp
a2UgImJpbmFyeSIgb25lcywgdGhleSBiZWNvbWUgcGFydCBvZiB0aGUgcHVibGljCj4+PiBpbnRl
cmZhY2UsIGFuZCBoZW5jZSBzdWJzZXF1ZW50bHkgY2FuJ3QgYmUgY2hhbmdlZCBhbnkgbW9yZSBv
cgo+Pj4gbGVzcyB0aGFuIHRoZSBvbmVzIHdlIGN1cnJlbnRseSBoYXZlIChpbiBwYXJ0aWN1bGFy
LCBhbnl0aGluZyB2YWxpZCBpbgo+Pj4gYSBndWVzdCBjb25maWcgZmlsZSB3aWxsIGltbyBuZWVk
IHRvIHJlbWFpbiB0byBiZSB2YWxpZCBhbmQgbWVhbmluZ2Z1bAo+Pj4gZG93biB0aGUgcm9hZCku
Cj4+Pgo+Pj4gSWYgdGhpcyBpcyBzb2xlbHkgb3IgbWFpbmx5IGFib3V0IGRlZmVycmluZyB0aGUg
cGFyc2luZyBmcm9tIHRoZSB0b29sCj4+PiBzdGFjayB0byB0aGUgaHlwZXJ2aXNvciwgdGhlbiBJ
J20gbm90IGF0IGFsbCBjb252aW5jZWQgb2YgdGhlIGFwcHJvYWNoCj4+PiAoSSdkIGV2ZW4gYmUg
dGVtcHRlZCB0byBjYWxsIGl0IGJhY2t3YXJkcykuCj4+Cj4+IFRoZSBtYWluIGFkdmFudGFnZSBp
cyB0aGF0IGl0IHdvdWxkIGJlIG11Y2ggZWFzaWVyIHRvIGJhY2twb3J0IG5ldwo+PiBwYXJhbWV0
ZXJzIGxpa2UgdGhlIHhwdGkgcGVyLWRvbWFpbiBvbmUuIE5vIG5lZWQgdG8gYnVtcCBzeXNjdGwv
ZG9tY3RsCj4+IGludGVyZmFjZSB2ZXJzaW9ucyBmb3IgdGhhdC4KPiAKPiBBZGRpdGlvbnMgdG8g
c3lzY3RsL2RvbWN0bCBpbnRlcmZhY2VzIGRvbid0IHJlcXVpcmUgc3VjaCBhIGJ1bXAuCj4gCj4+
IEl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIHN1cHBvcnQgbWFuZGF0b3J5IGFuZCBvcHRpb25h
bCBwYXJhbWV0ZXJzCj4+IGluIHRoZSBndWVzdCBjb25maWcuIE9wdGlvbmFsIHBhcmFtZXRlcnMg
bm90IHN1cHBvcnRlZCBieSB0aGUgaHlwZXJ2aXNvcgo+PiB3b3VsZCB0aGVuIGJlIGlnbm9yZWQg
aW5zdGVhZCBvZiBsZWFkaW5nIHRvIGZhaWx1cmUgYXQgZ3Vlc3QgY3JlYXRpb24KPj4gdGltZS4K
PiAKPiBFeGNlcHQgdGhhdCBvdmVyIHRpbWUgb3BpbmlvbnMgbWF5IGNoYW5nZSB3aGF0IGlzIHN1
cHBvc2VkIHRvCj4gYmUgb3B0aW9uYWwgdnMgbWFuZGF0b3J5LgoKSSB0aG91Z2h0IHRoZSBpZGVh
IHdvdWxkIGJlIHRoYXQgdGhlIGFkbWluIHdvdWxkIHNwZWNpZnkgd2hpY2ggb25lcyB3ZXJlCm9w
dGlvbmFsIG9yIG1hbmRhdG9yeS4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
