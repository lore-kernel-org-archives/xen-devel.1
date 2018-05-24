From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] block drivers/block: Use octal not symbolic
 permissions
Date: Thu, 24 May 2018 13:40:04 -0600
Message-ID: <501407b0-ae9b-7943-0789-fb1c9959f7fe__44300.064436584$1527190752$gmane$org@kernel.dk>
References: <5e97a292c1ba38a6b5a0caa271d85dc3de1b2aa7.1527105857.git.joe@perches.com>
 <6bf44255-145f-bf14-e254-860731ff9296@kernel.dk>
 <56ee8810463b6c537ca0c10c9f82e6d922acd1f1.camel@perches.com>
 <539cc400-28d7-66df-eb24-77fe95d617a2@kernel.dk>
 <e64c2846b1b9102a52eba7b242f746e7bfff1464.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7zwj=il=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1fLw5r-00021L-7P
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 19:40:11 +0000
Received: by mail-io0-x244.google.com with SMTP id d73-v6so3713712iog.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 12:40:08 -0700 (PDT)
In-Reply-To: <e64c2846b1b9102a52eba7b242f746e7bfff1464.camel@perches.com>
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

T24gNS8yNC8xOCA3OjAxIEFNLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBUaHUsIDIwMTgtMDUt
MjQgYXQgMDY6NDcgLTA2MDAsIEplbnMgQXhib2Ugd3JvdGU6Cj4+IE9uIDUvMjMvMTggNDozNSBQ
TSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+PiBPbiBXZWQsIDIwMTgtMDUtMjMgYXQgMTU6MjcgLTA2
MDAsIEplbnMgQXhib2Ugd3JvdGU6Cj4+Pj4gT24gNS8yMy8xOCAyOjA1IFBNLCBKb2UgUGVyY2hl
cyB3cm90ZToKPj4+Pj4gQ29udmVydCB0aGUgU188Rk9PPiBzeW1ib2xpYyBwZXJtaXNzaW9ucyB0
byB0aGVpciBvY3RhbCBlcXVpdmFsZW50cyBhcwo+Pj4+PiB1c2luZyBvY3RhbCBhbmQgbm90IHN5
bWJvbGljIHBlcm1pc3Npb25zIGlzIHByZWZlcnJlZCBieSBtYW55IGFzIG1vcmUKPj4+Pj4gcmVh
ZGFibGUuCj4+Pj4+Cj4+Pj4+IHNlZTogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTYvOC8yLzE5
NDUKPj4+Pj4KPj4+Pj4gRG9uZSB3aXRoIGF1dG9tYXRlZCBjb252ZXJzaW9uIHZpYToKPj4+Pj4g
JCAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtZiAtLXR5cGVzPVNZTUJPTElDX1BFUk1TIC0tZml4
LWlucGxhY2UgPGZpbGVzLi4uPgo+Pj4+Pgo+Pj4+PiBNaXNjZWxsYW5lYToKPj4+Pj4KPj4+Pj4g
byBXcmFwcGVkIG1vZGlmaWVkIG11bHRpLWxpbmUgY2FsbHMgdG8gYSBzaW5nbGUgbGluZSB3aGVy
ZSBhcHByb3ByaWF0ZQo+Pj4+PiBvIFJlYWxpZ24gbW9kaWZpZWQgbXVsdGktbGluZSBjYWxscyB0
byBvcGVuIHBhcmVudGhlc2lzCj4+Pj4KPj4+PiBIb25lc3RseSwgSSBzZWUgdGhpcyBhcyBwcmV0
dHkgbmVlZGxlc3MgY2h1cm4uCj4+Pgo+Pj4gYnR3Ogo+Pj4KPj4+IFRoZXJlIGlzIGN1cnJlbnRs
eSBhIG1peHR1cmUgb2Ygc3ltYm9saWMgYW5kIG9jdGFsCj4+PiBwZXJtaXNzaW9ucyB1c2VzIGlu
IGJsb2NrIGFuZCBkcml2ZXJzL2Jsb2NrCj4+Pgo+Pj4gaWU6IDk0IG9jdGFsIGFuZCAxNDYgc3lt
Ym9saWMgdXNlcy4KPj4+Cj4+PiBJZiB0aGlzIGlzIGFwcGxpZWQsIGFsbCB3b3VsZCBiZWNvbWUg
b2N0YWwuCj4+Cj4+IFRoYXQgZG9lcyBoZWxwIGp1c3RpZnkgdGhlIGNoYW5nZS4gTXkgbWFpbiB3
b3JyeSBoZXJlIGlzIGNyZWF0aW5nCj4+IHVubmVjZXNzYXJ5IGNvbmZsaWN0cywgd2hpY2ggaXMg
YWx3YXlzIGFubm95aW5nLiBCdXQgaXQncyBldmVuIG1vcmUKPj4gYW5ub3lpbmcgd2hlbiB0aGUg
Y2hhbmdlIGNyZWF0aW5nIHRoZSBjb25mbGljdCBpc24ndCByZWFsbHkgdGhhdAo+PiBpbXBvcnRh
bnQgYXQgYWxsLiBDYXNlIGluIHBvaW50LCB0aGUgcGF0Y2ggZG9lc24ndCBhcHBseSB0byB0aGUK
Pj4gZm9yLTQuMTgvYmxvY2sgYnJhbmNoIHRoYXQgaXQgc2hvdWxkIGdvIGludG8uLi4KPiAKPiBE
b25lIGFnYWluc3QgbW9zdCByZWNlbnQgLW5leHQgYXMgaXQncyBiYXNpY2FsbHkgaW1wb3NzaWJs
ZQo+IHRvIGRvIGFueXRoaW5nIGFnYWluc3QgbXVsdGlwbGUgcHJpdmF0ZSB0cmVlcy4KPiAKPiBB
bHNvLCB0aGUgc2NyaXB0IHRoYXQgZ2VuZXJhdGVkIHRoZSBwYXRjaCBpcyBpbiB0aGUgY2hhbmdl
bG9nCj4gc28gaXQncyBzaW1wbGUgdG8gcmVydW4uCgpBbHJpZ2h0LCBhcHBsaWVkLCB0aGFua3Mu
CgotLSAKSmVucyBBeGJvZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
