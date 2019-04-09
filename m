From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/cameraif: add ABI for para-virtual
 camera
Date: Tue, 9 Apr 2019 10:19:11 +0100
Message-ID: <20190409091911.GJ1986__14162.9908861191$1554801609$gmane$org@zion.uk.xensource.com>
References: <20190409091546.9606-1-andr2000@gmail.com>
 <20190409091832.GA2164@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDmuS-0004O2-NF
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:19:16 +0000
Content-Disposition: inline
In-Reply-To: <20190409091832.GA2164@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Wei Liu <wei.liu2@citrix.com>, konrad.wilk@oracle.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, hverkuil@xs4all.nl, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDksIDIwMTkgYXQgMTA6MTg6MzJBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEFwciAwOSwgMjAxOSBhdCAxMjoxNTo0NlBNICswMzAwLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToKPiA+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiA+IAo+ID4gVGhpcyBpcyB0aGUgQUJJIGZv
ciB0aGUgdHdvIGhhbHZlcyBvZiBhIHBhcmEtdmlydHVhbGl6ZWQKPiA+IGNhbWVyYSBkcml2ZXIg
d2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFiaWxpdGllcyBldmVuCj4g
PiBmdXJ0aGVyIGVuYWJsaW5nIGl0IGZvciB2aWRlbyBjb25mZXJlbmNpbmcsIEluLVZlaGljbGUg
SW5mb3RhaW5tZW50LAo+ID4gaGlnaCBkZWZpbml0aW9uIG1hcHMgZXRjLgo+ID4gCj4gPiBUaGUg
aW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQgbW9zdCBuZWVkZWQgZnVuY3Rpb25hbGl0eSB3aXRo
IHRoZQo+ID4gZmluYWwgaWRlYSB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGV4dGVuZCB0aGUgcHJv
dG9jb2wgaWYgbmVlZCBiZToKPiA+IAo+ID4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFzZSB2aXJ0
dWFsIGRldmljZSBjb25maWd1cmF0aW9uOgo+ID4gIC0gcGl4ZWwgZm9ybWF0cwo+ID4gIC0gcmVz
b2x1dGlvbnMKPiA+ICAtIGZyYW1lIHJhdGVzCj4gPiAyLiBTdXBwb3J0IGJhc2ljIGNhbWVyYSBj
b250cm9sczoKPiA+ICAtIGNvbnRyYXN0Cj4gPiAgLSBicmlnaHRuZXNzCj4gPiAgLSBodWUKPiA+
ICAtIHNhdHVyYXRpb24KPiA+IDMuIFN1cHBvcnQgc3RyZWFtaW5nIGNvbnRyb2wKPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPgo+IAo+IHY2IHdhcyBwdXNoZWQgeWVzdGVyZGF5LiBJcyB0aGVyZSBh
bnl0aGluZyBuZXcgaW4gdGhpcyB2ZXJzaW9uPwoKT2ggbXkgYmFkLiBUaGlzIGlzIGEgcGF0Y2gg
dG8gTGludXguIElnbm9yZSB0aGF0IHF1ZXN0aW9uLgoKV2VpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
