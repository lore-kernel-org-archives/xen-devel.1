From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 15:05:00 +0200
Message-ID: <20180320145402-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyGxB-0006rA-Fp
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 13:05:25 +0000
Content-Disposition: inline
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDM6NTQ6MzZBTSArMDIwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOgo+IFFFTVUgY29kaW5nIHN0eWxlIGF0IHRoZSBtb21lbnQgYXNrcyBmb3IgYWxs
IG5vbi1zeXN0ZW0KPiBpbmNsdWRlIGZpbGVzIHRvIGJlIHVzZWQgd2l0aCAjaW5jbHVkZSAiZm9v
LmgiLgo+IEhvd2V2ZXIgdGhpcyBydWxlIGFjdHVhbGx5IGRvZXMgbm90IG1ha2Ugc2Vuc2UgYW5k
Cj4gY3JlYXRlcyBpc3N1ZXMgZm9yIHdoZW4gdGhlIGluY2x1ZGVkIGZpbGUgaXMgZ2VuZXJhdGVk
Lgo+IAo+IEluIEMsIGluY2x1ZGUgImZpbGUiIG1lYW5zIGxvb2sgaW4gY3VycmVudCBkaXJlY3Rv
cnksCj4gdGhlbiBvbiBpbmNsdWRlIHNlYXJjaCBwYXRoLiBDdXJyZW50IGRpcmVjdG9yeSBoZXJl
Cj4gbWVhbnMgdGhlIHNvdXJjZSBmaWxlIGRpcmVjdG9yeS4KPiBCeSBjb21wYXJpc29uIGluY2x1
ZGUgPGZpbGU+IG1lYW5zIGxvb2sgb24gaW5jbHVkZSBzZWFyY2ggcGF0aC4KPiAKPiBBcyBnZW5l
cmF0ZWQgZmlsZXMgYXJlIG5vdCBpbiB0aGUgc2VhcmNoIGRpcmVjdG9yeSAodW5sZXNzIHRoZSBi
dWlsZAo+IGRpcmVjdG9yeSBoYXBwZW5zIHRvIG1hdGNoIHRoZSBzb3VyY2UgZGlyZWN0b3J5KSwg
aXQgZG9lcyBub3QgbWFrZSBzZW5zZQo+IHRvIGluY2x1ZGUgdGhlbSB3aXRoICIiIC0gZG9pbmcg
c28gaXMgbWVyZWx5IG1vcmUgd29yayBmb3IgcHJlcHJvY2Vzc29yCj4gYW5kIGEgc291cmNlIG9y
IGVycm9ycyBpZiBhIHN0YWxlIGZpbGUgaGFwcGVucyB0byBleGlzdCBpbiB0aGUgc291cmNlCj4g
ZGlyZWN0b3J5Lgo+IAo+IFRoaXMgY2hhbmdlcyBpbmNsdWRlIGRpcmVjdGl2ZXMgZm9yIGFsbCBn
ZW5lcmF0ZWQgZmlsZXMsIGFjcm9zcyB0aGUKPiB0cmVlLiBUaGUgaWRlYSBpcyB0byBhdm9pZCBz
ZW5kaW5nIGEgaHVnZSBhbW91bnQgb2YgZW1haWwuICBCdXQgd2hlbgo+IG1lcmdpbmcsIHRoZSBj
aGFuZ2VzIHdpbGwgYmUgc3BsaXQgd2l0aCBvbmUgY29tbWl0IHBlciBmaWxlLCBlLmcuIGZvcgo+
IGVhc2Ugb2YgYmlzZWN0IGluIGNhc2Ugb2YgYnVpbGQgZmFpbHVyZXMsIGFuZCB0byBlYXNlIG1l
cmdpbmcuCj4gCj4gTm90ZSB0aGF0IHNob3VsZCBzb21lIGdlbmVyYXRlZCBmaWxlcyBiZSBtaXNz
ZWQgYnkgdGhpcyB0cmVlLXdpZGUKPiByZWZhY3RvcmluZywgaXQgaXNuJ3QgYSBiaWcgZGVhbCAt
IHRoaXMgbWVyZWx5IG1haW50YWlucyB0aGUgc3RhdHVzIHF1bywKPiBhbmQgdGhpcyBjYW4gYmUg
YWRkcmVzc2VkIGJ5IGEgc2VwYXJhdGUgcGF0Y2ggb24gdG9wLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CgoKRm9yIHRoZSByZWNvcmQsIHRo
ZSBzdGF0ZWQgYWR2YW50YWdlIGlzIHRoYXQgb25lIGNhbgpoYXZlIGEgaGVhZGVyIGZpbGUgdGhh
dCBoYXBwZW5zIHRvIG1hdGNoIHRoZSBzeXN0ZW0KaGVhZGVyLgoKVG8gcHV0IGl0IGJsdW50bHkg
dGhhdCBkb2VzIG5vdCB3b3JrIGFzIGRlc2lnbmVkLgoKRm9yIGV4YW1wbGUsIGlmIGEgc3lzdGVt
IGhlYWRlciBmb28uaCBzb21ld2hlcmUgaGFzICNpbmNsdWRlIDx0cmFjZS5oPgp0aGVuIHRoZSBj
b21waWxlciB3aWxsIGhhcHBpbHkgcHVsbCBpbiBvdXIgb3duIHZlcnNpb24gKHNpbmNlIHRoYXQg
aXMgaW4KdGhlIC1JIHBhdGgpIGFuZCBjb21wbGV0ZWx5IGlnbm9yZSB0aGUgc3lzdGVtIG9uZSwg
YnJlYWtpbmcgdGhpbmdzIGluCnRoZSBwcm9jZXNzLgoKV2hlbiBkb2VzIGl0IG1ha2Ugc2Vuc2Ug
dG8gdXNlIGluY2x1ZGUgIiI/IFdoZW4gdGhlIGhlYWRlciBpcwphIGRpcmVjdG9yeS1zcGVjaWZp
YyBvbmUsIGxvY2F0ZWQgd2l0aCB0aGUgc291cmNlLgpUaGlzIGFwcHJvYWNoIHdvdWxkIGJvdGgg
YmUgZW5mb3JjZWQgYnkgdGhlIGNvbXBpbGVyCmFuZCBoZWxwIHBlb3BsZSBrbm93IHdoZXJlIHRv
IGZpbmQgdGhlIGhlYWRlci4KCi0tIApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
