From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
Date: Wed, 1 May 2019 10:47:49 +0100
Message-ID: <23753.27461.546649.855744@mariner.uk.xensource.com>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
 <23752.23708.661076.214573@mariner.uk.xensource.com>
 <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLlqD-0007UM-V6
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 09:47:53 +0000
In-Reply-To: <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBsaW51eCA0LjE5IHhlbnN0
b3JlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgUmU6IFtsaW51eC00LjE5IHRlc3RdIDEzNTQy
MDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDM6MzM6
MDBQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBJIHdpbGwgbGVhdmUgYW5zd2VyaW5n
IHRoaXMgdG8gdGhlIGJsa2Zyb250L2xpbnV4IGZvbGtzLi4uCj4gCj4gSSB0aGluayB0aG9zZSBh
bGxvY2F0aW9ucyB1c2VkIHRvIGJlIHNtYWxsIGVub3VnaCB0aGF0IGtjYWxsb2Mgd2FzCj4gbGlr
ZWx5IGZpbmUuIE5vdyB3aXRoIG11bHRpcGxlIHJpbmdzLCBhbmQgbXVsdGlwbGUgcGFnZXMgcGVy
IHJpbmcKPiB0aG9zZSBoYXZlIGdyb3duIHRvIGEgcG9pbnQgd2hlcmUga2NhbGxvYyBpcyBub3Qg
ZmluZSBhbnltb3JlLiBJIHdpbGwKPiBwcmVwYXJlIGEgcGF0Y2ggdG8gc3dpdGNoIHRvIGt2Y2Fs
bG9jLgoKVGhhbmtzLgoKRllJIHRoaXMgc2FtZSBpc3N1ZSB3YXMgcmVwb3J0ZWQgYnkgb3NzdGVz
dCBpbgogIFN1YmplY3Q6IFtsaW51eC1saW51cyB0ZXN0XSAxMzU0MjY6IHJlZ3Jlc3Npb25zIC0g
RkFJTAppZSBvbiBsaW51eCBtYXN0ZXIuCgpJU1RNIHRoYXQgdGhpcyBwYXRjaCB5b3UgcHJvcG9z
ZSB3aWxsIGhhdmUgdG8gZ28gdG8gc3RhYmxlIGJyYW5jaGVzCnRvbyA/Cgo+ID4gSSB3b3VsZCBo
YXZlIGhvcGVkIHRoYXQgaXQgd291bGQgcmVzdWx0IGluIHNvbWV0aGluZyBvdGhlciB0aGFuIGEK
PiA+IGhhbmcuICBBdCB3b3JzdCwgYmxrZnJvbnQgb3VnaHQgdG8gZ28gaW50byBhIHN0YXRlIHdo
ZXJlIGl0ICprbm93cyoKPiA+IHRoYXQgaXQgaXMgdXR0ZXJseSBicm9rZW4gYW5kIHJlcG9ydHMg
dGhpcyBwcm9wZXJseS4KPiAKPiBJIGhhdmVuJ3QgeWV0IGNoZWNrZWQgYWxsIHRoZSBwb3NzaWJs
ZSBlcnJvciBwYXRocywgYnV0IHRoZSBvbmVzIEkndmUKPiBsb29rZWQgYXQgdXNlIHhlbmJ1c19k
ZXZfZmF0YWwgd2hpY2ggc3dpdGNoZXMgdGhlIGRldmljZSBzdGF0ZSB0bwo+IGNsb3NpbmcgYW5k
IHdyaXRlcyB0aGUgZXJyb3IgbWVzc2FnZSBpbnRvIHhlbnN0b3JlLgoKV2hhdCBpZiB5b3UgY2Fu
J3Qgd3JpdGUgdG8geGVuc3RvcmUgPyAgQ2FuIHdlIGF0IGxlYXN0IGhhdmUgYSBjb3B5IGluCnRo
ZSBrZXJuZWwgbG9nID8gIFRoZXJlIG1pZ2h0IGJlIG90aGVyIGVycm9ycyBiZXNpZGVzIHRoaXMg
bWVtb3J5CmV4aGF1c3Rpb24sIHN1cmVseS4KCkVycm9yIGhhbmRsaW5nIHdoZW4gdGhlIHVzdWFs
IGVycm9yIHJlcG9ydGluZyBwYXRoIGlzIGJ1c3RlZCBpcwpkaWZmaWN1bHQgaW5kZWVkLCBidXQg
aXQgaXMgdmVyeSBoZWxwZnVsIHRvIGhhdmUgYSBmYWxsYmFjay4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
