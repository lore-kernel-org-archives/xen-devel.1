From: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 11:12:00 -0500
Message-ID: <da3457a0-7f24-4759-7d98-9b2fdc87e87c__20843.8758775175$1521562299$gmane$org@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ctng=gk=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1eyJsO-0007cb-Kt
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 16:12:40 +0000
In-Reply-To: <1521510562-529051-1-git-send-email-mst@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org, Stefan Hajnoczi <stefanha@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, BALATON Zoltan <balaton@eik.bme.hu>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhangh
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTkvMjAxOCAwODo1NCBQTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+IFFFTVUg
Y29kaW5nIHN0eWxlIGF0IHRoZSBtb21lbnQgYXNrcyBmb3IgYWxsIG5vbi1zeXN0ZW0KPiBpbmNs
dWRlIGZpbGVzIHRvIGJlIHVzZWQgd2l0aCAjaW5jbHVkZSAiZm9vLmgiLgoKW0knbSByZXBseWlu
ZyB3aXRob3V0IGhhdmluZyByZWFkIHRoZSByZXN0IG9mIHRoZSB0aHJlYWQsIHNvIGJlYXIgd2l0
aCAKbWUgaWYgSSByZXBlYXQgc29tZSBvZiB0aGUgb3RoZXIgY29tbWVudHMgdGhhdCBoYXZlIGFs
cmVhZHkgYmVlbiBtYWRlXQoKQW5kIE1hcmt1cyBldmVuIGp1c3QgZGlkIGEgY2xlYW51cCBhbG9u
ZyB0aG9zZSBsaW5lcy4KCj4gSG93ZXZlciB0aGlzIHJ1bGUgYWN0dWFsbHkgZG9lcyBub3QgbWFr
ZSBzZW5zZSBhbmQKPiBjcmVhdGVzIGlzc3VlcyBmb3Igd2hlbiB0aGUgaW5jbHVkZWQgZmlsZSBp
cyBnZW5lcmF0ZWQuCj4gCj4gSW4gQywgaW5jbHVkZSAiZmlsZSIgbWVhbnMgbG9vayBpbiBjdXJy
ZW50IGRpcmVjdG9yeSwKPiB0aGVuIG9uIGluY2x1ZGUgc2VhcmNoIHBhdGguIEN1cnJlbnQgZGly
ZWN0b3J5IGhlcmUKPiBtZWFucyB0aGUgc291cmNlIGZpbGUgZGlyZWN0b3J5Lgo+IEJ5IGNvbXBh
cmlzb24gaW5jbHVkZSA8ZmlsZT4gbWVhbnMgbG9vayBvbiBpbmNsdWRlIHNlYXJjaCBwYXRoLgoK
SXQncyBhbHNvIG5pY2Ugd2hlbiAiZmlsZSIgbWVhbnMgZmlsZSBiZWxvbmdpbmcgdG8gb3VyIHBy
b2plY3QsIGFuZCAKPGZpbGU+IG1lYW5zIDNyZC1wYXJ0eSBmaWxlLiAgU28gd2UgaGF2ZSB0byBj
aG9vc2Ugd2hpY2ggc2VtYW50aWNzIGFyZSAKZWFzaWVyOyBwZXJoYXBzIGJldHRlciBNYWtlZmls
ZSBydWxlcyB0aGF0IHByZXZlbnQgdXMgZnJvbSBzZWVpbmcgc3RhbGUgCmZpbGVzIGlzIGEgYmV0
dGVyIHNvbHV0aW9uIHRoYW4gZmlndXJpbmcgb3V0IHdoaWNoIGZpbGVzIGFyZSBnZW5lcmF0ZWQu
Cgo+IAo+IEFzIGdlbmVyYXRlZCBmaWxlcyBhcmUgbm90IGluIHRoZSBzZWFyY2ggZGlyZWN0b3J5
ICh1bmxlc3MgdGhlIGJ1aWxkCj4gZGlyZWN0b3J5IGhhcHBlbnMgdG8gbWF0Y2ggdGhlIHNvdXJj
ZSBkaXJlY3RvcnkpLAoKV2h5IGNhbid0IHdlIGZpeCBNYWtlZmlsZSB0byBpbmNsdWRlIEJPVEgg
dGhlIGJ1aWxkIGFuZCB0aGUgc291cmNlIApkaXJlY3RvcmllcyAodG8gcGljayB1cCBnZW5lcmF0
ZWQgZmlsZXMgZmlyc3QsIGFuZCB0aGVuIAp2ZXJzaW9uLWNvbnRyb2xsZWQgZmlsZXMpLCBhbmQg
cG9zc2libHkgaW5jbHVkZSBsb2dpYyB0byBzaW1wbGlmeSB0byBhIApzaW5nbGUgLUkgaW5zdGVh
ZCBvZiB0d28gd2hlbiBkb2luZyBpbi10cmVlIGJ1aWxkcz8KCj4gaXQgZG9lcyBub3QgbWFrZSBz
ZW5zZQo+IHRvIGluY2x1ZGUgdGhlbSB3aXRoICIiIC0gZG9pbmcgc28gaXMgbWVyZWx5IG1vcmUg
d29yayBmb3IgcHJlcHJvY2Vzc29yCj4gYW5kIGEgc291cmNlIG9yIGVycm9ycyBpZiBhIHN0YWxl
IGZpbGUgaGFwcGVucyB0byBleGlzdCBpbiB0aGUgc291cmNlCj4gZGlyZWN0b3J5Lgo+IAo+IFRo
aXMgY2hhbmdlcyBpbmNsdWRlIGRpcmVjdGl2ZXMgZm9yIGFsbCBnZW5lcmF0ZWQgZmlsZXMsIGFj
cm9zcyB0aGUKPiB0cmVlLiBUaGUgaWRlYSBpcyB0byBhdm9pZCBzZW5kaW5nIGEgaHVnZSBhbW91
bnQgb2YgZW1haWwuICBCdXQgd2hlbgo+IG1lcmdpbmcsIHRoZSBjaGFuZ2VzIHdpbGwgYmUgc3Bs
aXQgd2l0aCBvbmUgY29tbWl0IHBlciBmaWxlLCBlLmcuIGZvcgo+IGVhc2Ugb2YgYmlzZWN0IGlu
IGNhc2Ugb2YgYnVpbGQgZmFpbHVyZXMsIGFuZCB0byBlYXNlIG1lcmdpbmcuCj4gCj4gTm90ZSB0
aGF0IHNob3VsZCBzb21lIGdlbmVyYXRlZCBmaWxlcyBiZSBtaXNzZWQgYnkgdGhpcyB0cmVlLXdp
ZGUKPiByZWZhY3RvcmluZywgaXQgaXNuJ3QgYSBiaWcgZGVhbCAtIHRoaXMgbWVyZWx5IG1haW50
YWlucyB0aGUgc3RhdHVzIHF1bywKPiBhbmQgdGhpcyBjYW4gYmUgYWRkcmVzc2VkIGJ5IGEgc2Vw
YXJhdGUgcGF0Y2ggb24gdG9wLgoKSSdtIG5vdCBzdXJlIEknbSBhIGZhbiBvZiB0aGlzIHBhdGNo
IHlldCwgaWYgdGhlcmUgbWF5IGJlIG90aGVyIAphbHRlcm5hdGl2ZXMgdGhhdCBzb2x2ZSB0aGUg
cmVhbCBpc3N1ZSBvZiBzdGFsZSBnZW5lcmF0ZWQgZmlsZXMgYnJlYWtpbmcgCmluY3JlbWVudGFs
IGJ1aWxkcy4KCi0tIApFcmljIEJsYWtlLCBQcmluY2lwYWwgU29mdHdhcmUgRW5naW5lZXIKUmVk
IEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjY2ClZpcnR1YWxpemF0aW9uOiAgcWVt
dS5vcmcgfCBsaWJ2aXJ0Lm9yZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
