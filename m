From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 5/5] RFC: test/depriv: Add a tool to check
 process-level depriv
Date: Fri, 26 Oct 2018 16:28:19 +0100
Message-ID: <97a4128d-9859-a2b4-644a-1940c3dbeb45@citrix.com>
References: <20181005165701.28030-1-george.dunlap@citrix.com>
 <20181005165701.28030-5-george.dunlap@citrix.com>
 <20181008162824.GD1331@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rdbn=ng=citrix.com=prvs=830c459d6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gG42I-00006x-RK
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 15:28:30 +0000
In-Reply-To: <20181008162824.GD1331@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDgvMjAxOCAwNToyOCBQTSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gRnJpLCBP
Y3QgMDUsIDIwMTggYXQgMDU6NTc6MDFQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4g
KyMgVEVTVDogUHJvY2VzcyAvIGdyb3VwIGlkCj4+ICsjCj4+ICsjIFJlYWQgL3Byb2MvPHFwaWQ+
L3N0YXR1cywgY2hlY2tpbmcgVWlkIGFuZCBHaWQgbGluZXMKPj4gKyMKPj4gKyMgVWlkIHNob3Vs
ZCBiZSB4ZW4tcWVtdXVzZXItcmFuZ2UtYmFzZSskZG9taWQKPj4gKyMgR2lkIHNob3VsZCBiZSA2
NTUzNCAoIm5vYm9keSIpCj4gCj4gVGhhdCBpcyB3cm9uZy4gR2lkIGRvZXNuJ3QgaGF2ZSB0byBi
ZSBub2JvZHkuIGdpZCBjYW4gYmUgY2hvc2VuIHdoZW4KPiBjcmVhdGluZyB0aGUgYmFzZSB1c2Vy
IGlkLiAoQW5kIEknbSBwcmV0dHkgc3VyZSAibm9ib2R5IiBzaG91bGQgYmUKPiBhdm9pZGVkLikK
Ck9oLCBhY3R1YWxseSwgNjU1MzQgaXMgIm5vZ3JvdXAiLCB3aGljaCBpcyB0aGUgZGVmYXVsdCB3
aGVuIHlvdSBkb24ndAphZGQgYSBzcGVjaWZpYyBncm91cC4KClNob3VsZCB3ZSByZWNvbW1lbmQg
Y3JlYXRpbmcgYSBzZXBhcmF0ZSBncm91cCBmb3IgdGhlIFhlbiBxZW11cyBpbiBvdXIKZmVhdHVy
ZSBkb2M/ICBPciBzaG91bGQgd2UganVzdCBtZW50aW9uIHRoZSBwb3NzaWJpbGl0eSwgYnV0IGxl
YXZlIHRoZQphY3R1YWwgZXhhbXBsZSB0byB0aGUgZGVmYXVsdCAod2hpY2ggd2lsbCBub3JtYWxs
eSBlbmQgdXAgd2l0aCB0aGUKYG5vZ3JvdXBgIGdyb3VwKT8KCj4gCj4+ICsjIEZJWE1FOiBkZWFs
IHdpdGggb3RoZXIgVUlEIGNvbmZpZ3VyYXRpb25zPwo+PiArZWNobyAtbiAiUHJvY2VzcyBVSUQ6
ICIKPj4gK3RndF91aWQ9JChpZCAtdSB4ZW4tcWVtdXVzZXItcmFuZ2UtYmFzZSkKPj4gK3RndF91
aWQ9JCgoICR0Z3RfdWlkICsgJGRvbWlkICkpCj4+ICsKPj4gKyMgRXhhbXBsZSBpbnB1dDoKPj4g
KyMgVWlkOgkxMTkzCTExOTMJMTE5MwkxMTkzCj4+ICtpbnB1dD0kKGdyZXAgXlVpZDogL3Byb2Mv
JGRtcGlkL3N0YXR1cykKPj4gK2lmIFtbICIkaW5wdXQiID1+IF5VaWQ6W1s6c3BhY2U6XV0rKFsw
LTldKylbWzpzcGFjZTpdXSsoWzAtOV0rKVtbOnNwYWNlOl1dKyhbMC05XSspW1s6c3BhY2U6XV0r
KFswLTldKykkIF1dIDsgdGhlbgo+PiArICAgIHJlc3VsdD0iUEFTU0VEIgo+PiArICAgIGZvciBp
IGluIHsxLi40fTsgZG8KPj4gKwlpZiBbWyAiJHtCQVNIX1JFTUFUQ0hbJGldfSIgIT0gIiR0Z3Rf
dWlkIiBdXSA7IHRoZW4KPj4gKwkgICAgcmVzdWx0PSJGQUlMRUQiCj4+ICsJICAgIGZhaWxlZD0i
dHJ1ZSIKPj4gKwkgICAgYnJlYWsKPj4gKwlmaQo+PiArICAgIGRvbmUKPj4gK2Vsc2UKPj4gKyAg
ICByZXN1bHQ9IkZBSUxFRCIKPj4gKyAgICBmYWlsZWQ9InRydWUiCj4+ICtmaQo+PiArZWNobyAk
cmVzdWx0Cj4+ICsKPj4gKyMgRXhhbXBsZSBpbnB1dDoKPj4gKyMgR2lkOgkxMDAyMAkxMDAyMAkx
MDAyMAkxMDAyMAo+PiArZWNobyAtbiAiUHJvY2VzcyBHSUQ6ICIKPj4gK3RndF9naWQ9JChpZCAt
ZyBub2JvZHkpCj4gCj4gVGhpcyBzaG91bGQgYmUgYGlkIC1nIHhlbi1xZW11dXNlci1yYW5nZS1i
YXNlYC4KCkdvdCBpdAoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
