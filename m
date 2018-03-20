From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-block] [PATCH] qemu: include generated files
 with <> and not ""
Date: Tue, 20 Mar 2018 15:30:15 +0200
Message-ID: <20180320152446-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <20180320131041.GB24329@stefanha-x1.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyHLO-0000f7-9E
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:30:26 +0000
Content-Disposition: inline
In-Reply-To: <20180320131041.GB24329@stefanha-x1.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>, Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDE6MTA6NDFQTSArMDAwMCwgU3RlZmFuIEhham5vY3pp
IHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDIwLCAyMDE4IGF0IDAzOjU0OjM2QU0gKzAyMDAsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+IFFFTVUgY29kaW5nIHN0eWxlIGF0IHRoZSBtb21lbnQg
YXNrcyBmb3IgYWxsIG5vbi1zeXN0ZW0KPiA+IGluY2x1ZGUgZmlsZXMgdG8gYmUgdXNlZCB3aXRo
ICNpbmNsdWRlICJmb28uaCIuCj4gPiBIb3dldmVyIHRoaXMgcnVsZSBhY3R1YWxseSBkb2VzIG5v
dCBtYWtlIHNlbnNlIGFuZAo+ID4gY3JlYXRlcyBpc3N1ZXMgZm9yIHdoZW4gdGhlIGluY2x1ZGVk
IGZpbGUgaXMgZ2VuZXJhdGVkLgo+ID4gCj4gPiBJbiBDLCBpbmNsdWRlICJmaWxlIiBtZWFucyBs
b29rIGluIGN1cnJlbnQgZGlyZWN0b3J5LAo+ID4gdGhlbiBvbiBpbmNsdWRlIHNlYXJjaCBwYXRo
LiBDdXJyZW50IGRpcmVjdG9yeSBoZXJlCj4gPiBtZWFucyB0aGUgc291cmNlIGZpbGUgZGlyZWN0
b3J5Lgo+ID4gQnkgY29tcGFyaXNvbiBpbmNsdWRlIDxmaWxlPiBtZWFucyBsb29rIG9uIGluY2x1
ZGUgc2VhcmNoIHBhdGguCj4gPiAKPiA+IEFzIGdlbmVyYXRlZCBmaWxlcyBhcmUgbm90IGluIHRo
ZSBzZWFyY2ggZGlyZWN0b3J5ICh1bmxlc3MgdGhlIGJ1aWxkCj4gPiBkaXJlY3RvcnkgaGFwcGVu
cyB0byBtYXRjaCB0aGUgc291cmNlIGRpcmVjdG9yeSksIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UK
PiA+IHRvIGluY2x1ZGUgdGhlbSB3aXRoICIiIC0gZG9pbmcgc28gaXMgbWVyZWx5IG1vcmUgd29y
ayBmb3IgcHJlcHJvY2Vzc29yCj4gPiBhbmQgYSBzb3VyY2Ugb3IgZXJyb3JzIGlmIGEgc3RhbGUg
ZmlsZSBoYXBwZW5zIHRvIGV4aXN0IGluIHRoZSBzb3VyY2UKPiA+IGRpcmVjdG9yeS4KPiA+IAo+
ID4gVGhpcyBjaGFuZ2VzIGluY2x1ZGUgZGlyZWN0aXZlcyBmb3IgYWxsIGdlbmVyYXRlZCBmaWxl
cywgYWNyb3NzIHRoZQo+ID4gdHJlZS4gVGhlIGlkZWEgaXMgdG8gYXZvaWQgc2VuZGluZyBhIGh1
Z2UgYW1vdW50IG9mIGVtYWlsLiAgQnV0IHdoZW4KPiA+IG1lcmdpbmcsIHRoZSBjaGFuZ2VzIHdp
bGwgYmUgc3BsaXQgd2l0aCBvbmUgY29tbWl0IHBlciBmaWxlLCBlLmcuIGZvcgo+ID4gZWFzZSBv
ZiBiaXNlY3QgaW4gY2FzZSBvZiBidWlsZCBmYWlsdXJlcywgYW5kIHRvIGVhc2UgbWVyZ2luZy4K
PiA+IAo+ID4gTm90ZSB0aGF0IHNob3VsZCBzb21lIGdlbmVyYXRlZCBmaWxlcyBiZSBtaXNzZWQg
YnkgdGhpcyB0cmVlLXdpZGUKPiA+IHJlZmFjdG9yaW5nLCBpdCBpc24ndCBhIGJpZyBkZWFsIC0g
dGhpcyBtZXJlbHkgbWFpbnRhaW5zIHRoZSBzdGF0dXMgcXVvLAo+ID4gYW5kIHRoaXMgY2FuIGJl
IGFkZHJlc3NlZCBieSBhIHNlcGFyYXRlIHBhdGNoIG9uIHRvcC4KPiAKPiBTdGFsZSBoZWFkZXIg
ZmlsZXMgYXJlIGEgcGFpbi4gIEkgb2Z0ZW4gZG8gbWFrZSBkaXN0Y2xlYW4gYmVmb3JlCj4gY2hl
Y2tpbmcgb3V0IGEgcmFkaWNhbGx5IGRpZmZlcmVudCBRRU1VIHZlcnNpb24gdG8gYXZvaWQgdGhl
IHByb2JsZW0uCj4gCj4gVGhpcyBwYXRjaCB0cmFkZXMgb2ZmIHRoZSBzdGFsZSBoZWFkZXIgZmls
ZSBpc3N1ZSBmb3IgYSBuZXcgYXBwcm9hY2ggdG8KPiB1c2luZyA8PiB2cyAiIiwgd2hpY2ggd2ls
bCBiZSBoYXJkIHRvIHVzZSBjb25zaXN0ZW50bHkKClRoZSBwcm9wb3NlZCBydWxlIGlzIHRvIHVz
ZSA8PiBldmVyeXdoZXJlIGV4Y2VwdCBpZiB0aGUgZmlsZSBpcyBpbiB0aGUKc291cmNlIGRpcmVj
dG9yeS4gIEl0IHdpbGwgYmUgdmVyeSBlYXN5IHRvIHVzZSBjb25zaXN0ZW50bHkgZm9yIHRoZQpz
aW1wbGUgcmVhc29uIHRoYXQgY29tcGlsZXIgd2lsbCBlbmZvcmNlIGl0LiAgSWYgeW91IHVzZSA8
PiBmb3IgYSBoZWFkZXIKaW4gdGhlIGN1cnJlbnQgZGlyZWN0b3J5IGJ1aWxkIGZhaWxzLiBTbyB5
b3UgYXJlIGZvcmNlZCB0byB1c2UgIiIuCgo+IGluIHRoZSBmdXR1cmUKPiBzaW5jZSBpdCBpcyB1
bmNvbnZlbnRpb25hbC4KCkFsbCBjb21waWxlcnMgSSBrbm93IHdpdGhvdXQgZXhjZXB0aW9uIGlt
cGxlbWVudAppbmNsdWRlIDw+IG1lYW5pbmcgbG9vayBpbiAtSSBzZWFyY2ggcGF0aCwgYW5kCmlu
Y2x1ZGUgIiIgbWVhbmluZyBsb29rIGluIGN1cnJlbnQgZGlyZWN0b3J5IHRoZW4KaW4gLUkgc2Vh
cmNoIHBhdGguCgpMb29rcyBjb252ZW50aW9uYWwgdG8gbWUuCgo+IElzIHRoZSBidWlsZCB0aW1l
IGltcHJvdmVtZW50IHdvcnRoIGl0IChwbGVhc2UgcG9zdCBudW1iZXJzKT8KPiAKPiBTdGVmYW4K
CkhhdmVuJ3QgdGVzdGVkIGl0IGZyYW5rbHkuIFdpbGwgaXQgY29udmluY2UgYW55b25lIGlmIGl0
J3MgbWFyZ2luYWxseQpmYXN0ZXI/CgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
