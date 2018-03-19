From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v2 19/45] ARM: new VGIC: Add IRQ sync/flush
	framework
Date: Mon, 19 Mar 2018 17:32:53 +0000
Message-ID: <24f681d7-48b5-328e-fdb4-d1cfe1a27fa2@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-20-andre.przywara@linaro.org>
 <c2e311ef-7ad2-cead-219f-5b0ead8f60ad@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zik3=gj=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1exyeg-0007Xi-Hb
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 17:33:06 +0000
Received: by mail-wr0-x235.google.com with SMTP id s10so6625899wra.13
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 10:33:05 -0700 (PDT)
In-Reply-To: <c2e311ef-7ad2-cead-219f-5b0ead8f60ad@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxOS8wMy8xOCAxNDoxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDAzLzE1LzIwMTggMDg6MzAgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBJbXBsZW1lbnQg
dGhlIGZyYW1ld29yayBmb3Igc3luY2luZyBJUlFzIGJldHdlZW4gb3VyIGVtdWxhdGlvbiBhbmQg
dGhlCj4+IGxpc3QgcmVnaXN0ZXJzLCB3aGljaCByZXByZXNlbnQgdGhlIGd1ZXN0J3MgdmlldyBv
ZiBJUlFzLgo+PiBUaGlzIGlzIGRvbmUgaW4gdmdpY19zeW5jX2Zyb21fbHJzKCkgYW5kIHZnaWNf
c3luY190b19scnMoKSwgd2hpY2gKPj4gZ2V0IGNhbGxlZCBvbiBndWVzdCBlbnRyeSBhbmQgZXhp
dCwgcmVzcGVjdGl2ZWx5Lgo+PiBUaGUgY29kZSB0YWxraW5nIHRvIHRoZSBhY3R1YWwgR0lDdjIv
djMgaGFyZHdhcmUgaXMgYWRkZWQgaW4gdGhlCj4+IGZvbGxvd2luZyBwYXRjaGVzLgo+Pgo+PiBU
aGlzIGlzIGJhc2VkIG9uIExpbnV4IGNvbW1pdCAwOTE5ZTg0YzBmYzEsIHdyaXR0ZW4gYnkgTWFy
YyBaeW5naWVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6
eXdhcmFAbGluYXJvLm9yZz4KPj4gLS0tCj4+IENoYW5nZWxvZyB2MSAuLi4gdjI6Cj4+IC0gbWFr
ZSBmdW5jdGlvbnMgdm9pZAo+IAo+IEhtbW0sIHRoZSBmdW5jdGlvbiB3ZXJlIGFscmVhZHkgdm9p
ZCBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbi4gSG93ZXZlciwKPiB5b3Ugc3dpdGNoIGZyb20gc3Rh
dGljIGlubGluZSB0byBzdGF0aWMuIERpZCBJIG1pc3MgYW55dGhpbmc/CgpBaCByaWdodCwgSSBq
dXN0IHNhdyB0aGUgZGlmZiBoaXR0aW5nIG9uIHRoZSBwcm90b3R5cGUgbGluZSA7LSkKRm9yIHRo
ZSByZWNvcmRzOiBzdGF0aWMgaW5saW5lIGluIGEgLmMgZmlsZSBpcyBhIHJlZCBoZXJyaW5nOgpo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9sb2NhbC9pbmxpbmUuaHRtbApzdW1tYXJ5OiBVc2Ug
c3RhdGljIGlubGluZSBpbiBoZWFkZXIgZmlsZXMsIGp1c3Qgc3RhdGljIGluIC5jIGZpbGVzLgpp
bmxpbmUgaXMgYSBoaW50LCBhbmQgdGhlIGNvbXBpbGVyIGtub3dzIGJlc3Qgd2hhdCB0byBkby4g
UmVhbGx5LgoKV2lsbCBhZGp1c3QgdGhlIGNoYW5nZSBsb2cuCgpDaGVlcnMsCkFuZHJlLgoKPiAK
PiBbLi4uXQo+IAo+PiArc3RhdGljIHZvaWQgdmdpY19zZXRfdW5kZXJmbG93KHN0cnVjdCB2Y3B1
ICp2Y3B1KQo+PiArewo+PiArwqDCoMKgIEFTU0VSVCh2Y3B1ID09IGN1cnJlbnQpOwo+PiArCj4+
ICvCoMKgwqAgZ2ljX2h3X29wcy0+dXBkYXRlX2hjcl9zdGF0dXMoR0lDSF9IQ1JfVUlFLCAxKTsK
PiAKPiBUaGUgc2Vjb25kIGlzIGEgYm9vbGVhbiwgc28gcGxlYXNlIHVzZSB0cnVlLgo+IAo+IENo
ZWVycywKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
