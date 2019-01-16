From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Tue, 15 Jan 2019 22:36:31 -0800
Message-ID: <20190116063631.GA10881__16405.7128750303$1547620522$gmane$org@infradead.org>
References: <20190115140420.4652-1-andr2000@gmail.com>
 <20190116063002.jq3aas6ofhaogmyk@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=48CU=PY=bombadil.srs.infradead.org=batv+5904bcf6edd61f802369+5624+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gjeoW-0002O1-MR
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 06:36:36 +0000
Content-Disposition: inline
In-Reply-To: <20190116063002.jq3aas6ofhaogmyk@sirius.home.kraxel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@infradead.org, noralf@tronnes.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDc6MzA6MDJBTSArMDEwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gKwlpZiAoIWRtYV9tYXBfc2coZGV2LT5kZXYsIHhlbl9vYmot
PnNndC0+c2dsLCB4ZW5fb2JqLT5zZ3QtPm5lbnRzLAo+ID4gKwkJCURNQV9CSURJUkVDVElPTkFM
KSkgewo+ID4gKwkJcmV0ID0gLUVGQVVMVDsKPiA+ICsJCWdvdG8gZmFpbF9mcmVlX3NndDsKPiA+
ICsJfQo+IAo+IEhtbSwgc28gaXQgc2VlbXMgdGhlIGFybSBndXlzIGNvdWxkIG5vdCBjb21lIHVw
IHdpdGggYSBzdWdnZXN0aW9uIGhvdyB0bwo+IHNvbHZlIHRoYXQgb25lIGluIGEgYmV0dGVyIHdh
eS4gIE9rLCBsZXRzIGdvIHdpdGggdGhpcyB0aGVuLgo+IAo+IEJ1dCBkaWRuJ3Qgd2UgYWdyZWUg
dGhhdCB0aGlzIGRlc2VydmVzIGEgY29tbWVudCBleG1wbGFpbmluZyB0aGUgcHVycG9zZQo+IG9m
IHRoZSBkbWFfbWFwX3NnKCkgY2FsbCBpcyB0byBmbHVzaCBjYWNoZXMgYW5kIHRoYXQgdGhlcmUg
aXMgbm8gYWN0dWFsCj4gRE1BIGhhcHBlbmluZyBoZXJlPwoKVXNpbmcgYSBkbWEgbWFwcGluZyBj
YWxsIHRvIGZsdXNoIGNhY2hlcyBpcyBjb21wbGV0ZSBuby1nby4gIEJ1dCB0aGUKcmVhbCBxdWVz
dGlvbiBpcyB3aHkgeW91J2QgZXZlbiB3YW50IHRvIGZsdXNoIGNhc2hlcyBpZiB5b3UgZG8gbm90
CndhbnQgYSBkbWEgbWFwcGluZz8KClRoaXMgd2hvbGUgaXNzdWUga2VlcHMgZ2V0dGluZyBtb3Jl
IGFuZCBtb3JlIGNvbmZ1c2luZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
