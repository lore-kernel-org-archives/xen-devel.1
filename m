From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 44/49] xen: round up max vcpus to
 scheduling granularity
Date: Mon, 1 Apr 2019 09:50:32 +0100
Message-ID: <dcf13161-a427-d9a9-9998-b97daa51f7e1@citrix.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-45-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSOb=SD=citrix.com=prvs=987a6ddbb=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hAseO-0005qW-NO
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:50:40 +0000
In-Reply-To: <20190329150934.17694-45-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxNTowOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBNYWtlIHN1cmUgdGhl
IG51bWJlciBvZiB2Y3B1cyBpcyBhbHdheXMgYSBtdWx0aXBsZSBvZiB0aGUgc2NoZWR1bGluZwo+
IGdyYW51bGFyaXR5LiBOb3RlIHRoYXQgd2UgZG9uJ3Qgc3VwcG9ydCBhIHNjaGVkdWxpbmcgZ3Jh
bnVsYXJpdHkgYWJvdmUKPiBvbmUgb24gQVJNLgoKSSdtIGFmcmFpZCB0aGF0IEkgZG9uJ3QgdGhp
bmsgdGhpcyBpcyBhIGNsZXZlciBtb3ZlLsKgIEluIHR1cm4sIHRoaXMKYnJpbmdzIGludG8gcXVl
c3Rpb24gdGhlIGFwcHJvYWNoIHRvIGlkbGUgaGFuZGxpbmcuCgpGaXJzdGx5LCB3aXRoIGEgcHJv
cG9zZWQgc29ja2V0IGdyYW51bGFyaXR5LCB0aGlzIHdvdWxkIGJlIDEyOCBvbiBzb21lCnN5c3Rl
bXMgd2hpY2ggZXhpc3QgdG9kYXkuwqAgRnVydGhlcm1vcmUsIGNvbnNpZGVyIHRoZSBjYXNlIHdo
ZXJlCmNwdXBvb2wwIGhhcyBhIGdyYW51bGFyaXR5IG9mIDEsIGFuZCBhIHNlY29uZCBwb29sIGhh
cyBhIGdyYW51bGFyaXR5IG9mCjIuwqAgQSBkb21haW4gY2FuIGJlIGNyZWF0ZWQgd2l0aCBhbiBv
ZGQgbnVtYmVyIG9mIHZjcHVzIGFuZCBvcGVyYXRlIGluCnBvb2wwIGZpbmUsIGJ1dCBjYW4ndCBu
b3cgYmUgbW92ZWQgdG8gcG9vbDEuCgpJZiBhdCBhbGwgcG9zc2libGUsIEkgdGhpbmsgaXQgd291
bGQgYmUgYmV0dGVyIHRvIHRyeSBhbmQgcmV1c2UgdGhlIGlkbGUKY3B1cyBmb3IgaG9sZXMgbGlr
ZSB0aGlzLsKgIFNlZWluZyBhcyB5b3UndmUgYmVlbiBwbGF5aW5nIHdpdGggdGhpcyBjb2RlCmEg
bG90LCB3aGF0IGlzIHlvdXIgYXNzZXNzbWVudD8KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
