From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 17 Jan 2019 01:18:15 -0800
Message-ID: <20190117091815.GA7090__6027.1188304343$1547716621$gmane$org@infradead.org>
References: <20190115140420.4652-1-andr2000@gmail.com>
 <20190116063002.jq3aas6ofhaogmyk@sirius.home.kraxel.org>
 <20190116063631.GA10881@infradead.org>
 <042fe794-dec6-6d9d-5b68-6f142790f5c7@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jXvm=PZ=bombadil.srs.infradead.org=batv+bd442da0e4c2cc164bb2+5625+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gk3oa-0003kU-Iw
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 09:18:20 +0000
Content-Disposition: inline
In-Reply-To: <042fe794-dec6-6d9d-5b68-6f142790f5c7@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@infradead.org>, "noralf@tronnes.org" <noralf@tronnes.org>, Gerd Hoffmann <kraxel@redhat.com>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDY6NDM6MjlBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gPiBUaGlzIHdob2xlIGlzc3VlIGtlZXBzIGdldHRpbmcgbW9yZSBh
bmQgbW9yZSBjb25mdXNpbmcuCj4gV2VsbCwgSSBkb24ndCByZWFsbHkgZG8gRE1BIGhlcmUsIGJ1
dCBpbnN0ZWFkIHRoZSBidWZmZXJzIGluCj4gcXVlc3Rpb24gYXJlIHNoYXJlZCB3aXRoIG90aGVy
IFhlbiBkb21haW4sIHNvIGVmZmVjdGl2ZWx5IGl0Cj4gY291bGQgYmUgdGhvdWdodCBvZiBzb21l
IHNvcnQgb2YgRE1BIGhlcmUsIHdoZXJlIHRoZSAiZGV2aWNlIiBpcwo+IHRoYXQgcmVtb3RlIGRv
bWFpbi4gSWYgdGhlIGJ1ZmZlcnMgYXJlIG5vdCBmbHVzaGVkIHRoZW4gdGhlCj4gcmVtb3RlIHBh
cnQgc2VlcyBzb21lIGluY29uc2lzdGVuY3kgd2hpY2ggaW4gbXkgY2FzZSByZXN1bHRzCj4gaW4g
YXJ0aWZhY3RzIG9uIHNjcmVlbiB3aGlsZSBkaXNwbGF5aW5nIHRoZSBidWZmZXJzLgo+IFdoZW4g
YnVmZmVycyBhcmUgYWxsb2NhdGVkIHZpYSBETUEgQVBJIHRoZW4gdGhlcmUgYXJlIG5vIGFydGlm
YWN0czsKPiBpZiBidWZmZXJzIGFyZSBhbGxvY2F0ZWQgd2l0aCBzaG1lbSArIERNQSBtYXBwaW5n
IHRoZW4gdGhlcmUgYXJlIG5vCj4gYXJ0aWZhY3RzIGFzIHdlbGwuCj4gVGhlIG9ubHkgb2ZmZW5k
aW5nIHVzZS1jYXNlIGlzIHdoZW4gSSB1c2Ugc2htZW0gYmFja2VkIGJ1ZmZlcnMsCj4gYnV0IGRv
IG5vdCBmbHVzaCB0aGVtCgpUaGUgcmlnaHQgYW5zd2VyIHdvdWxkIGJlIHRvIGltcGxlbWVudCBj
YWNoZSBtYWludGFpbmFuY2UgaG9va3MgZm9yCnRoaXMgY2FzZSBpbiB0aGUgWGVuIGFyY2ggY29k
ZS4gIFRoZXNlIHdvdWxkIGJhc2ljYWxseSBsb29rIHRoZSBzYW1lCmFzIHRoZSBsb3ctbGV2ZWwg
Y2FjaGUgbWFpbnRhaW5hbmNlIHVzZWQgYnkgdGhlIERNQSBvcHMsIGJ1dCB3aXRob3V0CmdvaW5n
IHRocm91Z2ggdGhlIERNQSBtYXBwaW5nIGxheWVyLCBpbiBmYWN0IHRoZXkgc2hvdWxkIHByb2Jh
Ymx5CnJldXNlIHRoZSBzYW1lIGxvdy1sZXZlbCBhc3NlbWJseSByb3V0aW5lcy4KCkkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcyB0aGUgZmlyc3QgdXNhZ2Ugb2Ygc3VjaCBYZW4gYnVmZmVyIHNoYXJpbmcs
IHNvCndoYXQgZG8gdGhlIG90aGVyIHVzZXJzIGRvPwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
