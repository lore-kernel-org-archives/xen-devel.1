From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] xen: add interface for obtaining
 .config from hypervisor
Date: Fri, 15 Mar 2019 15:01:53 +0100
Message-ID: <2074de60-afa4-5776-64b9-bddc2e73a41c@suse.com>
References: <20190314115937.26394-1-jgross@suse.com>
 <20190314115937.26394-2-jgross@suse.com> <5C8BAF5A020000780021F53D@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YWx5=RS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4nPL-0002tM-4r
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 14:01:59 +0000
In-Reply-To: <5C8BAF5A020000780021F53D@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxNDo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTkg
YXQgMTI6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBBZGQgYSBzeXNjdGwgaW50ZXJm
YWNlIGZvciBvYnRhaW5pbmcgdGhlIC5jb25maWcgZmlsZSB1c2VkIHRvIGJ1aWxkCj4+IHRoZSBo
eXBlcnZpc29yLiBUaGUgbWVjaGFuaXNtIGlzIGluc3BpcmVkIGJ5IHRoZSBMaW51eCBrZXJuZWwn
cyBvbmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gKGFwYXJ0
IGZyb20gWFNNIGNoYW5nZXMpCj4+IC0tLQo+PiBWMjoKPj4gLSBidW1wIHN5c2N0bCBpbnRlcmZh
Y2UgdmVyc2lvbgo+IAo+IEp1ZGdpbmcgZnJvbSB0aGUgc3R5bGUgeW91IHVzZSBmb3Igb3RoZXIg
ZW50cmllcyBoZXJlIHRoaXMgd2Fzbid0Cj4gYSByZXN1bHQgb2YgcmV2aWV3IGZlZWRiYWNrLiBX
aHkgZGlkIHlvdSBkbyB0aGlzPyBUaGUgY2hhbmdlIGlzCgpWMSB3YXMgcG9zdGVkIGJlZm9yZSA0
LjEyIHdhcyBicmFuY2hlZCBhd2F5LCBzbyBidW1waW5nIHdvdWxkIGhhdmUKY2xlYXJseSBiZSB3
cm9uZyBhdCB0aGF0IHRpbWUuCgo+IGEgcGxhaW4gYWRkaXRpb24gdG8gdGhlIGludGVyZmFjZSwg
d2hpY2ggZG9lc24ndCByZXF1aXJlIGNhbGxlcgo+IGF3YXJlbmVzcy4gTXkgUi1iIGRvZXMgbm90
IGhvbGQgd2l0aCB0aGlzIGluIHBsYWNlLgoKQWgsIEkgd2Fzbid0IGF3YXJlIG9mIHRoaXMgcnVs
ZS4gSSdsbCByZW1vdmUgdGhlIGJ1bXBpbmcgaW4gY2FzZSB0aGlzCmNhbid0IGJlIGRvbmUgd2hl
biBjb21taXR0aW5nLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
