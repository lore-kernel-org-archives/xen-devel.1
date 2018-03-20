From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qemu: include generated files with <> and
 not ""
Date: Tue, 20 Mar 2018 19:12:59 +0200
Message-ID: <20180320191156-mutt-send-email-mst__20553.1723252081$1521565939$gmane$org@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
 <8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
 <20180320094406.GD4530@redhat.com>
 <20180320141107-mutt-send-email-mst@kernel.org>
 <20180320121841.GN4530@redhat.com>
 <20180320142756-mutt-send-email-mst@kernel.org>
 <20180320123900.GO4530@redhat.com>
 <20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
 <20180320134117.GS4530@redhat.com>
 <8e14f681-6572-062b-c503-c5ad091793d7@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bav8=gk=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1eyKpD-0006HX-H3
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 17:13:27 +0000
Content-Disposition: inline
In-Reply-To: <8e14f681-6572-062b-c503-c5ad091793d7@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Max Reitz <mreitz@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Li Zhijian <lizhijian@cn.fujitsu.com>, David Hildenbrand <david@redhat.com>, Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>, Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, Ben Warren <ben@skyportsystems.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDI6NTQ6MzdQTSArMDEwMCwgTWF4IFJlaXR6IHdyb3Rl
Ogo+IEJ1dCBJIGd1ZXNzIHRoZSBtYWluIGFkdmFudGFnZSB3aXRoIHVzaW5nIHRoaXMgcnVsZSBJ
IHNlZSBpcyB0aGF0IGl0J3MKPiBiZXR0ZXIgZm9yIHBlb3BsZSByZWFkaW5nIHRoZSBjb2RlLiAg
SXQncyBqdXN0IG5pY2UgdG8ga25vdyB3aGV0aGVyIGEKPiBmaWxlIGJlbG9uZ3MgdG8gcWVtdSBv
ciBub3QgYnkganVzdCBsb29raW5nIGF0IHRoZSAjaW5jbHVkZSBzdGF0ZW1lbnQuCj4gKE5vdGUg
dGhhdCB0aGlzIGltcGxpZXMgdGhhdCBpdCBpcyBpbmRlZWQgbW9yZSBkaWZmaWN1bHQgdG8gZGV0
ZXJtaW5lCj4gd2hldGhlciBhIGhlYWRlciBiZWxvbmdzIHRvIHFlbXUgdGhhbiB3aGV0aGVyIGl0
IHNpdHMgaW4gdGhlIHNhbWUKPiBkaXJlY3RvcnkgYXMgdGhlIEMgZmlsZSwgdGhvdWdoISkgIFNv
IEkgdGhpbmsgdGhlIG9sZCAoY3VycmVudCkgcnVsZSBpcwo+IGJldHRlciBmb3IgcmVhZGluZyBj
b2RlLCBNaWNoYWVsJ3MgcnVsZSB3b3VsZCBiZSBiZXR0ZXIgZm9yIHdyaXRpbmcKPiBjb2RlLiAg
SSB0aGluayByZWFkaW5nIGNvZGUgaXMgd2hhdCBzaG91bGQgYmUgZWFzaWVyLgoKSG93IGFib3V0
IHByZWZpeGluZyBhbGwgaW50ZXJuYWwgaGVhZGVycyB3aXRoIHFlbXUvID8KClRoYXQncyBhIHdh
eSB0byBhdm9pZCBuYW1lc3BhY2UgY29sbGlzaW9ucyB0aGF0IGlzIGFjdHVhbGx5IHN0YW5kYXJk
LgoKLS0gCk1TVCAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
