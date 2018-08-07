From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 31/32] libxl_disk: Cut libxl_cdrom_insert
 into step
Date: Tue, 7 Aug 2018 16:18:21 +0200
Message-ID: <20180807141821.qsn3xly7bv2kuhpj@mac>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-32-anthony.perard@citrix.com>
 <20180802155052.pwzahw3yb4fovsvu@mac>
 <20180806172050.GR1327@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sgab=kw=citrix.com=prvs=7501c17f6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fn2sy-0006Eb-Nj
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 14:22:56 +0000
Content-Disposition: inline
In-Reply-To: <20180806172050.GR1327@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMDYsIDIwMTggYXQgMDY6MjA6NTBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDU6NTA6NTJQTSArMDIwMCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDI3LCAyMDE4IGF0IDAzOjA2OjEzUE0g
KzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gQ2FuIHlvdSBwcm92aWRlIGEgY29tbWVu
dCBleHBsYWluaW5nIGhvdyBpcyB0aGlzIHN1cHBvc2VkIHRvIHdvcms/IFRoZQo+ID4gY3VycmVu
dCBjb2RlIGlzIGFscmVhZHkgcXVpdGUgY29udm9sdXRlZCBJTU8gKG1heWJlIGJlY2F1c2UgSSdt
IG5vdAo+ID4gZmFtaWxpYXIgd2l0aCBpdCksIHNvIEkgdGhpbmsgYSBjb21tZW50IHdvdWxkIGhl
bHAgcmV2aWV3ZXJzLgo+IAo+IEhhdmUgeW91IHJlYWQgdGhlIENPRElOR19TVFlMRSBmaWxlPyBJ
IHRoaW5rIHlvdSdsbCBmaW5kIHRoYXQgdGhlCj4gc2VjdGlvbiAiQVNZTkNIUk9OT1VTL0xPTkct
UlVOTklORyBPUEVSQVRJT05TIiB3aWxsIGdpdmUgeW91IHNvbWUgYW5zd2VyCj4geW91IGFyZSBs
b29raW5nIGZvci4gSSdtIG5vdCBzdXJlIEknbSBmb2xsb3dpbmcgaXQgcGVyZmVjdGx5LCBidXQg
YXQKPiBsZWFzdCBwYXJ0aWFsbHkuCgpPaCwgSSBkaWRuJ3QgbWVhbiBjb21tZW50cyBhYm91dCB0
aGUgYXN5bmMgb3BlcmF0aW9ucywgYnV0IEkgd291bGQgYWRkCmEgbm90ZSB0byBjbGFyaWZ5IHRo
YXQgeW91IGZpcnN0IGVtcHR5IHRoZSBDRFJPTSBhbmQgdGhlbiB5b3UgYXR0YWNoCnRoZSBzcGVj
aWZpZWQgaW1hZ2UuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
