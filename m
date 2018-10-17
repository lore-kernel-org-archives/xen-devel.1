From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH RFC] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Wed, 17 Oct 2018 16:32:08 +0300
Message-ID: <3522780f-44ba-511c-3668-06321c8c74a7@bitdefender.com>
References: <1535963136-31751-1-git-send-email-rcojocaru@bitdefender.com>
 <a44355eb-79ab-30ee-26d1-4d611dc8eeb7@citrix.com>
 <ac06731a-a44c-fce7-0638-eecf68579176@citrix.com>
 <d0358c5a-1f63-e64c-d988-d5475caa766f@bitdefender.com>
 <5BB62FA902000078001EE6BC@prv1-mh.provo.novell.com>
 <d66b5a9f-4e88-7d67-9238-3f813e665d1d@bitdefender.com>
 <7cc2d3bf-a1dc-b803-cfec-8dd8020b3b10@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rnu4=m5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gClvq-0008Dw-1S
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 13:32:14 +0000
In-Reply-To: <7cc2d3bf-a1dc-b803-cfec-8dd8020b3b10@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, george.dunlap@citrix.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTcvMTggNDozMCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8xMC8xOCAx
NDoyNiwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBPbiAxMC80LzE4IDY6MjAgUE0sIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gUm9nZXIgcmVjZW50bHkgaGFzIHBvc3RlZCBhIHBhdGNoIGFkZGlu
ZyByYW5nZXNldF9tZXJnZSgpLCB3aGljaCBJIHRoaW5rCj4+PiBpcyBtb3JlIGdlbmVyYWwgdGhh
biB5b3VyIHJhbmdlc2V0X2NvcHkoKS4gVGhhdCBzYWlkLCBJJ20gaW4gbm8gd2F5Cj4+PiBjb252
aW5jZWQgY29weWluZyAoYW5kIHRoZW4ga2VlcGluZyBpbiBzeW5jKSB0aGUgcmFuZ2Ugc2V0cyBh
Y3Jvc3MgdGhlCj4+PiBhbHRwMm0tcyBpcyB0aGUgYmVzdCBhcHByb2FjaC4gSXQgbWF5IHdlbGwg
YmUgdGhhdCB0aGUgb3B0aW1hbCBzb2x1dGlvbiBpcwo+Pj4gc29tZXdoZXJlIGluIHRoZSBtaWRk
bGUgYmV0d2VlbiBzaGFyaW5nIGV2ZXJ5dGhpbmcgYW5kIGNvcHlpbmcKPj4+IGV2ZXJ5dGhpbmcu
Cj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGdldCBSb2dlcidzIHBhdGNoIGludG8gc3RhZ2lu
Zz8KPj4KPj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE4LTA2L21zZzAxMzMxLmh0bWwKPj4KPj4gSXQgbG9va3Mgc2ltcGxlIGVub3VnaCBh
bmQgaXQgaGFzIGFscmVhZHkgYWNrZWQgYnkgV2VpLgo+IAo+IExvb2tzIGdvb2QgZW5vdWdoIHRv
IG1lLsKgIFB1c2hlZC4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
