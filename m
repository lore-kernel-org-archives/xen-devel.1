From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 19:29:37 +0100
Message-ID: <CAKMK7uF8hmO=z4jy+1b1z5ELLWpjcZpqmLoRiP2BJvwnNpOFeg__34541.8323217475$1545330512$gmane$org@mail.gmail.com>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
 <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
 <20181220173950.GA19641@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hsjg=O5=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1ga34x-0004xT-4u
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 18:29:51 +0000
Received: by mail-it1-x142.google.com with SMTP id g76so3432217itg.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 10:29:49 -0800 (PST)
In-Reply-To: <20181220173950.GA19641@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgNjozOSBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDU6NDk6MzlQ
TSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gPiBUaGlzIGlzIHRoZSBv
bmx5IHBhdGNoIFsxXSwgbm8gc2VyaWVzLiBBbmQgYXQgdGhlIG1vbWVudCBJIHRoaW5rCj4gPiB0
aGVyZSBpcyBub3RoaW5nIHRvIHJldmlldyBhcyBJIGFtIG5vdCBzdXJlIGhvdyB0byBkZWFsIHdp
dGggdGhvc2UKPiA+IHNobWVtIHBhZ2VzOiB0aGlzIHBhdGNoIGlzIHJhdGhlciB0byBzdGFydCBh
IGRpc2N1c3Npb24gb24gaG93IHNobWVtCj4gPiBwYWdlcyBjYW4gYmUgZmx1c2hlZCBvbiBBUk0g
KHRoZSBvbmx5IHdvcmthcm91bmQgSSBoYXZlIHNvIGZhciBpcwo+ID4gaW4gdGhpcyBwYXRjaCB3
aGljaCB1c2VzIERNQSBBUEkpLiBUaGlzIGlzIHdoZXJlIEkgYW0gbG9va2luZyBmb3IKPiA+IHNv
bWUgYWR2aWNlLCBzbyBJIGNhbiBpbXBsZW1lbnQgdGhlIHBhdGNoIHRoZSByaWdodCB3YXkuCj4K
PiBzaG1lbSBpcyBiYXNpY2FsbHkgcGFnZSBjYWNoZS4gIFNvIHlvdSBuZWVkIHRvIHVzZSB0aGUg
RE1BIHN0cmVhbWluZwo+IEFQSSAoZG1hX21hcF8qKSB0byBtYXAgaXQgZm9yIERNQS4gIFlvdSBu
ZWVkIHRvIG1ha2Ugc3VyZSBubyBvbmUKPiBhY2Nlc3MgdGhlIGtlcm5lbCBtYXBwaW5nIGF0IHRo
ZSBzYW1lIHRpbWUgYXMgeW91IGRvIERNQSB0byBpdCwKPiBzbyB0aGUgcGFnZXMgc2hvdWxkIGJl
IGxvY2tlZC4gIFRoaXMgaXMgaG93IHRoZSBub3JtYWwgZmlsZSBzeXN0ZW0KPiBJL08gcGF0aCB3
b3Jrcy4KCkkgd2Fzbid0IGFyb3VuZCBiYWNrIHRoZW4sIGJ1dCBhZmFpdWkgZHJtIHVzZXMgc2ht
ZW0gYmVjYXVzZSB0aGF0IHdhcwp0aGUgb25seSB3YXkgbW0gZm9sa3MgbGV0IHVzIGhhdmUgc3dh
cHBhYmxlIG1lbW9yeS4gV2UgcHJvcG9zZWQgYQpnZW1mcyBhIHdoaWxlIGFnbyB0byBiZSBhYmxl
IHRvIG1peCB1cCBvdXIgb3duIGFsbG9jYXRvciB3aXRoIHRoYXQsCndhc24ndCBhcHByb3ZlZC4K
CldoYXQgd2UgbW9zdCBkZWZpbml0ZWx5IG5vdCB3YW50IHRvIGVuZCB1cCB3aXRoIHRob3VnaCBp
cyBhY3R1YWxseQpzdHJlYW1pbmcgZG1hLCBiZWNhdXNlIHdpdGggdGhhdCBhbGwgdGhlIHplcm8g
Y29weSBidWZmZXIgc2hhcmluZwp0cmlja3MgYmVjb21lIHBvaW50bGVzcy4gVGhlcmUncyBwcmV0
dHkgZXBpYyBhbW91bnRzIG9mIGhhY2tzIHRvIHdvcmsKYXJvdW5kIHRoaXMsIEkgaGF2ZSBubyBp
ZGVhIHdoYXQncyBzdXBwb3NlZCB0byBnaXZlIGhlcmUuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0
ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3
IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
