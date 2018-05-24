From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] block drivers/block: Use octal not symbolic
 permissions
Date: Thu, 24 May 2018 06:47:11 -0600
Message-ID: <539cc400-28d7-66df-eb24-77fe95d617a2__48654.5349740938$1527165991$gmane$org@kernel.dk>
References: <5e97a292c1ba38a6b5a0caa271d85dc3de1b2aa7.1527105857.git.joe@perches.com>
 <6bf44255-145f-bf14-e254-860731ff9296@kernel.dk>
 <56ee8810463b6c537ca0c10c9f82e6d922acd1f1.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7zwj=il=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1fLpeN-0002l9-88
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 12:47:23 +0000
Received: by mail-it0-x243.google.com with SMTP id c3-v6so2158547itj.4
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 05:47:21 -0700 (PDT)
In-Reply-To: <56ee8810463b6c537ca0c10c9f82e6d922acd1f1.camel@perches.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Perches <joe@perches.com>, "Ed L. Cashin" <ed.cashin@acm.org>, Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, Jiri Kosina <jikos@kernel.org>, Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>, Sage Weil <sage@redhat.com>, Alex Elder <elder@kernel.org>, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, nbd@other.debian.org, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org, drbd-dev@lists.linbit.com
List-Id: xen-devel@lists.xenproject.org

T24gNS8yMy8xOCA0OjM1IFBNLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBXZWQsIDIwMTgtMDUt
MjMgYXQgMTU6MjcgLTA2MDAsIEplbnMgQXhib2Ugd3JvdGU6Cj4+IE9uIDUvMjMvMTggMjowNSBQ
TSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+PiBDb252ZXJ0IHRoZSBTXzxGT08+IHN5bWJvbGljIHBl
cm1pc3Npb25zIHRvIHRoZWlyIG9jdGFsIGVxdWl2YWxlbnRzIGFzCj4+PiB1c2luZyBvY3RhbCBh
bmQgbm90IHN5bWJvbGljIHBlcm1pc3Npb25zIGlzIHByZWZlcnJlZCBieSBtYW55IGFzIG1vcmUK
Pj4+IHJlYWRhYmxlLgo+Pj4KPj4+IHNlZTogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTYvOC8y
LzE5NDUKPj4+Cj4+PiBEb25lIHdpdGggYXV0b21hdGVkIGNvbnZlcnNpb24gdmlhOgo+Pj4gJCAu
L3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtZiAtLXR5cGVzPVNZTUJPTElDX1BFUk1TIC0tZml4LWlu
cGxhY2UgPGZpbGVzLi4uPgo+Pj4KPj4+IE1pc2NlbGxhbmVhOgo+Pj4KPj4+IG8gV3JhcHBlZCBt
b2RpZmllZCBtdWx0aS1saW5lIGNhbGxzIHRvIGEgc2luZ2xlIGxpbmUgd2hlcmUgYXBwcm9wcmlh
dGUKPj4+IG8gUmVhbGlnbiBtb2RpZmllZCBtdWx0aS1saW5lIGNhbGxzIHRvIG9wZW4gcGFyZW50
aGVzaXMKPj4KPj4gSG9uZXN0bHksIEkgc2VlIHRoaXMgYXMgcHJldHR5IG5lZWRsZXNzIGNodXJu
Lgo+IAo+IGJ0dzoKPiAKPiBUaGVyZSBpcyBjdXJyZW50bHkgYSBtaXh0dXJlIG9mIHN5bWJvbGlj
IGFuZCBvY3RhbAo+IHBlcm1pc3Npb25zIHVzZXMgaW4gYmxvY2sgYW5kIGRyaXZlcnMvYmxvY2sK
PiAKPiBpZTogOTQgb2N0YWwgYW5kIDE0NiBzeW1ib2xpYyB1c2VzLgo+IAo+IElmIHRoaXMgaXMg
YXBwbGllZCwgYWxsIHdvdWxkIGJlY29tZSBvY3RhbC4KClRoYXQgZG9lcyBoZWxwIGp1c3RpZnkg
dGhlIGNoYW5nZS4gTXkgbWFpbiB3b3JyeSBoZXJlIGlzIGNyZWF0aW5nCnVubmVjZXNzYXJ5IGNv
bmZsaWN0cywgd2hpY2ggaXMgYWx3YXlzIGFubm95aW5nLiBCdXQgaXQncyBldmVuIG1vcmUKYW5u
b3lpbmcgd2hlbiB0aGUgY2hhbmdlIGNyZWF0aW5nIHRoZSBjb25mbGljdCBpc24ndCByZWFsbHkg
dGhhdAppbXBvcnRhbnQgYXQgYWxsLiBDYXNlIGluIHBvaW50LCB0aGUgcGF0Y2ggZG9lc24ndCBh
cHBseSB0byB0aGUKZm9yLTQuMTgvYmxvY2sgYnJhbmNoIHRoYXQgaXQgc2hvdWxkIGdvIGludG8u
Li4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
