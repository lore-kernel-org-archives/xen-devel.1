From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 05:20:54 -0600
Message-ID: <5BA0DF9602000078001E9448@prv1-mh.provo.novell.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@prv1-mh.provo.novell.com>
 <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2E3v-0001WH-3f
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:20:59 +0000
In-Reply-To: <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA5LjE4IGF0IDEzOjEwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
OC8wOS8xOCAxMjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4LjA5LjE4IGF0IDA4
OjAyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IEluc3RlYWQgb2YgdXNpbmcgYmluYXJ5
IGh5cGVydmlzb3IgaW50ZXJmYWNlcyBmb3IgbmV3IHBhcmFtZXRlcnMgb2YKPj4+IGRvbWFpbnMg
b3IgY3B1cG9vbHMgdGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBnZW5lcmljIHRl
eHQKPj4+IGJhc2VkIHBhcmFtZXRlciBwYXJzaW5nLgo+Pj4KPj4+IFBhcmFtZXRlcnMgYXJlIGRl
ZmluZWQgdmlhIG5ldyBtYWNyb3Mgc2ltaWxhciB0byB0aG9zZSBvZiBib290Cj4+PiBwYXJhbWV0
ZXJzLiBQYXJzaW5nIG9mIHBhcmFtZXRlciBzdHJpbmdzIGlzIGRvbmUgdmlhIHRoZSBhbHJlYWR5
Cj4+PiBleGlzdGluZyBib290IHBhcmFtZXRlciBwYXJzaW5nIGZ1bmN0aW9uIHdoaWNoIGlzIGV4
dGVuZGVkIGEgbGl0dGxlCj4+PiBiaXQuCj4+Pgo+Pj4gUGFyYW1ldGVyIHNldHRpbmdzIGNhbiBl
aXRoZXIgYmUgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPj4+IGRvbWFpbnMg
b3IgY3B1cG9vbHMsIG9yIHRoZXkgY2FuIGJlIHNldCB2aWEgbmV3IHhsIHN1Yi1jb21tYW5kcy4K
Pj4gCj4+IFdpdGhvdXQgaGF2aW5nIGxvb2tlZCBhdCBhbnkgb2YgdGhlIHBhdGNoZXMgeWV0IChu
b3QgZXZlbiB0aGVpcgo+PiBkZXNjcmlwdGlvbnMpIEknbSBzdGlsbCB3b25kZXJpbmcgd2hhdCB0
aGUgYmVuZWZpdCBvZiB0ZXh0dWFsIHBhcmFtZXRlcnMKPj4gcmVhbGx5IGlzOiBKdXN0IGxpa2Ug
ImJpbmFyeSIgb25lcywgdGhleSBiZWNvbWUgcGFydCBvZiB0aGUgcHVibGljCj4+IGludGVyZmFj
ZSwgYW5kIGhlbmNlIHN1YnNlcXVlbnRseSBjYW4ndCBiZSBjaGFuZ2VkIGFueSBtb3JlIG9yCj4+
IGxlc3MgdGhhbiB0aGUgb25lcyB3ZSBjdXJyZW50bHkgaGF2ZSAoaW4gcGFydGljdWxhciwgYW55
dGhpbmcgdmFsaWQgaW4KPj4gYSBndWVzdCBjb25maWcgZmlsZSB3aWxsIGltbyBuZWVkIHRvIHJl
bWFpbiB0byBiZSB2YWxpZCBhbmQgbWVhbmluZ2Z1bAo+PiBkb3duIHRoZSByb2FkKS4KPiAKPiBT
byBsZXRzIGxvb2sgd2hhdCB3b3VsZCBiZSBuZWVkZWQgZm9yIGFkZGluZyBzb21ldGhpbmcgbGlr
ZSB0aGUKPiBwZXItZG9tYWluIHhwdGkgcGFyYW1ldGVyIHVzaW5nIGJpbmFyeSBpbnRlcmZhY2Vz
Ogo+IAo+IDEgYW4gZXh0ZW5zaW9uIG9mIHNvbWUgZG9tY3RsIGludGVyZmFjZSwgbWF5YmUgYnVt
cGluZyBvZiB0aGUgZG9tY3RsCj4gICBpbnRlcmZhY2UgdmVyc2lvbgo+IDIgYWRkaW5nIHRoZSBs
b2dpYyB0byBkb21jdGwgaGFuZGxpbmcKPiAzIGFkZGluZyBsaWJ4YyBzdXBwb3J0Cj4gNCBhZGRp
bmcgbGlieGwgc3VwcG9ydAo+IDUgYWRkaW5nIGEgbmV3IHhsIHN1Yi1jb21tYW5kCj4gNiBhZGRp
bmcgZG9tYWluIGNvbmZpZyBzdXBwb3J0Cj4gNyBhZGRpbmcgZG9jdW1lbnRhdGlvbgo+IAo+IFdp
dGggbXkgYXBwcm9hY2ggb25seSAyIChpbiBhIG1vZGlmaWVkIGZvcm0sIHBhcmFtZXRlciBoYW5k
bGluZyBpbnN0ZWFkCj4gb2YgZG9tY3RsLCBidXQgY29tcGFyYWJsZSBpbiB0aGUgbmVlZGVkIGVm
Zm9ydCkgYW5kIDcgYXJlIG5lZWRlZC4KPiAKPiBTbyBvbmNlIHRoZSBmcmFtZXdvcmsgaXMgaW4g
cGxhY2UgaXQgaXMgX211Y2hfIGVhc2llciB0byBhZGQgbmV3Cj4gZmVhdHVyZXMuCgpBbGwgdGhl
IGFib3ZlIHdvdWxkIGhvbGQgaWYgdGhlIGluZGl2aWR1YWwgb3B0aW9ucyB3ZXJlIGV4cHJlc3Nl
ZCBhcwplLmcuIGZsYWdzIGluIGFuIGV4dGVuc2libGUgYml0IHZlY3Rvci4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
