From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 0/6] xen: simplify suspend/resume handling
Date: Thu, 28 Mar 2019 14:43:50 +0000
Message-ID: <5cd28084-d50e-5d5d-9194-59f839ead5b2@arm.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <CAOcqxo2Jq7GVGPs=tg17_4pHy_W6+SrvGdP5y0AHARUNe7X+fQ@mail.gmail.com>
 <705a456a-15f9-9b24-e0b1-dc373f7d3e99@arm.com>
 <CAOcqxo1KcE_ZE2OJfyPPEvFJk_hZ+DEsKffNzKHbeN4MoH8a8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mKej=R7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9WG5-0007Cr-3b
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 14:43:57 +0000
In-Reply-To: <CAOcqxo1KcE_ZE2OJfyPPEvFJk_hZ+DEsKffNzKHbeN4MoH8a8w@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzLzI4LzE5IDE6NTYgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IE9uIFRo
dSwgMjggTWFyIDIwMTkgYXQgMTU6MzMsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+IHdyb3RlOgo+PiBPbiAzLzI4LzE5IDE6MDEgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3Rl
Ogo+Pj4gT24gVGh1LCAyOCBNYXIgMjAxOSBhdCAxNDowOSwgSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPiAKPj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPj4+IChYRU4pIFBhbmljIG9uIENQVSAwOgo+Pj4gKFhFTikgUFNDSSBj
cHUgb2ZmIGZhaWxlZCBmb3IgQ1BVMCBlcnI9LTMKPj4+IChYRU4pICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioKPj4KPj4gUFNDSSBDUFUgb2ZmIGZhaWxpbmcgaXMgbmV2
ZXIgYSBnb29kIG5ld3MuIEhlcmUsIHRoZSBjb21tYW5kIGhhcyBiZWVuCj4+IGRlbmllZCBieSBQ
U0NJIG1vbml0b3IuIEJ1dC4uLiB3aHkgZG9lcyBDUFUgb2ZmIGlzIGFjdHVhbGx5IGNhbGxlZCBv
bgo+PiBDUFUwPyBTaG91bGRuJ3Qgd2UgaGF2ZSB0dXJuZWQgb2ZmIHRoZSBwbGF0Zm9ybSBpbnN0
ZWFkPwo+IEkgdGhpbmssIHRoaXMgaXMgYmVjYXVzZSBDUFUxIGlzIHBlcmZvcm1pbmcgbWFjaGlu
ZV9yZXN0YXJ0KCksIHNvIGl0Cj4gYXNrZWQgQ1BVMCB0byBoYWx0IGl0c2VsZi4KClRoZSBQU0NJ
IGNhbGwgU1lTVEVNX09GRi9TWVNURU1fUkVTRVQgcmVxdWlyZXMgYWxsIHRoZSBDUFVzIHRvIGJl
IGluIGEgCmtub3duIHN0YXRlLiBUaGUgUFNDSSBzcGVjIGFjdHVhbGx5IHN1Z2dlc3QgdG8gdHVy
biBhbGwgdGhlIENQVXMgYnV0IG9uZSAKb2ZmLiBBbm90aGVyIGFsdGVybmF0aXZlIGlzIHRvIHB1
dCB0aGVtIGluIGEgcXVpZXNjZW50IHN0YXRlLgoKQ1BVX09GRiB3aWxsIHJldHVybiAtMyAoaS5l
IERFTklFRCkgaWYgdGhlIFRydXN0ZWQgT1MgaXMgVW5pcHJvY2Vzc29yIAphbmQgcmVzaWRlcyBv
biB0aGUgY29yZSB0aGF0IHlvdSBhcmUgYWJvdXQgdG8gdHVybiBvZmYuIEkgYXNzdW1lIHlvdXIg
CnBsYXRmb3JtIGhhdmUgYSBUT1MgVVAgYW5kIGN1cnJlbnRseSByZXNpZGVzIG9uIENQVTAuCgpT
WVNURU1fT0ZGL1NZU1RFTV9SRVNFVCBjYWxsIGNhbiBiZSBkb25lIGZyb20gYW55IENQVXMuIElm
IHdlIHdhbnQgdG8gCmF2b2lkIHRoZSBwcm9ibGVtIHdpdGggQ1BVX09GRiwgdGhlbiB0aGUgYmVz
dCBvcHRpb25zIGlzIHRvIHB1dCB0aGUgYWxsIApDUFVzIGJ1dCBvbmUgaW4gYSBxdWllc2NlbnQg
c3RhdGUgKHNvbWV0aGluZyBsaWtlIHdoaWxlICgxKSBjcHVfcmVsYXgvd2ZpKS4KCk9uIGEgc2lk
ZSBub2RlLCB3ZSBzaG91bGQgcHJvYmFibHkgd2FudCB0byByZW1vdmUgdGhlIHBhbmljIGluIApj
YWxsX3BzY2lfY3B1X29mZiBhcyB0aGlzIHdpbGwgYmUgdXNlZCBieSB0aGUgc3VzcGVuZCBjb2Rl
LiBJbmRlZWQsIHRoZSAKdHJ1c3RlZCBPUyBtYXkgbm90IHJlc2lkZSBvbiB0aGUgYm9vdCBDUFUs
IHNvIHlvdSBtYXkgaGl0IHRoZSBwYW5pYyBhcyB3ZWxsLgoKPiAKPj4KPj4+IChYRU4pCj4+PiAo
WEVOKSBSZWJvb3QgaW4gZml2ZSBzZWNvbmRzLi4uCj4+Cj4+IEFyZSB0aGUgbG9ncyBiZWxvdyBh
Y3R1YWxseSBhIG1pc3Rha2VuIHBhc3RlPwo+IE5vLCB0aGlzIGlzIHdoYXQgSSdtIHNlZWluZyBp
biBteSBzZXJpYWwgY29uc29sZS4KCkkgZ3Vlc3MgdGhpcyBpcyBoYXBwZW5pbmcgYmVjYXVzZSB3
ZSByZWN1cnNlIGluIG1hY2hpbmVfaGFsdCgpLiBXZSAKcHJvYmFibHkgd2FudCB0byBkcm9wIGFu
eSBwYW5pYyBpbiB0aGF0IGNvZGUgcGF0aC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
