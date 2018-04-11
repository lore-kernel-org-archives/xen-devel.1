From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4] xen/privcmd: add
 IOCTL_PRIVCMD_MMAP_RESOURCE
Date: Wed, 11 Apr 2018 10:45:53 +0100
Message-ID: <8fff31d5-7eb4-33e8-0fc8-c5bb1ab47eba__24744.8079092012$1523439877$gmane$org@arm.com>
References: <20180410075820.11081-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ewnt=ha=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f6CKF-0002PS-4B
 for xen-devel@lists.xenproject.org; Wed, 11 Apr 2018 09:45:59 +0000
In-Reply-To: <20180410075820.11081-1-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMC8wNC8xOCAwODo1OCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ICtzdGF0aWMgbG9u
ZyBwcml2Y21kX2lvY3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgX191
c2VyICp1ZGF0YSkKPiArewo+ICsJc3RydWN0IHByaXZjbWRfZGF0YSAqZGF0YSA9IGZpbGUtPnBy
aXZhdGVfZGF0YTsKPiArCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gKwlz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKPiArCXN0cnVjdCBwcml2Y21kX21tYXBfcmVzb3Vy
Y2Uga2RhdGE7Cj4gKwl4ZW5fcGZuX3QgKnBmbnMgPSBOVUxMOwo+ICsJc3RydWN0IHhlbl9tZW1f
YWNxdWlyZV9yZXNvdXJjZSB4ZGF0YTsKPiArCWludCByYzsKPiArCj4gKwlpZiAoY29weV9mcm9t
X3VzZXIoJmtkYXRhLCB1ZGF0YSwgc2l6ZW9mKGtkYXRhKSkpCj4gKwkJcmV0dXJuIC1FRkFVTFQ7
Cj4gKwo+ICsJLyogSWYgcmVzdHJpY3Rpb24gaXMgaW4gcGxhY2UsIGNoZWNrIHRoZSBkb21pZCBt
YXRjaGVzICovCj4gKwlpZiAoZGF0YS0+ZG9taWQgIT0gRE9NSURfSU5WQUxJRCAmJiBkYXRhLT5k
b21pZCAhPSBrZGF0YS5kb20pCj4gKwkJcmV0dXJuIC1FUEVSTTsKPiArCj4gKwlkb3duX3dyaXRl
KCZtbS0+bW1hcF9zZW0pOwo+ICsKPiArCXZtYSA9IGZpbmRfdm1hKG1tLCBrZGF0YS5hZGRyKTsK
PiArCWlmICghdm1hIHx8IHZtYS0+dm1fb3BzICE9ICZwcml2Y21kX3ZtX29wcykgewo+ICsJCXJj
ID0gLUVJTlZBTDsKPiArCQlnb3RvIG91dDsKPiArCX0KPiArCj4gKwlwZm5zID0ga2NhbGxvYyhr
ZGF0YS5udW0sIHNpemVvZigqcGZucyksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFwZm5zKSB7Cj4g
KwkJcmMgPSAtRU5PTUVNOwo+ICsJCWdvdG8gb3V0Owo+ICsJfQo+ICsKPiArCWlmICh4ZW5fZmVh
dHVyZShYRU5GRUFUX2F1dG9fdHJhbnNsYXRlZF9waHlzbWFwKSkgewo+ICsJCXN0cnVjdCBwYWdl
ICoqcGFnZXM7Cj4gKwkJdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsJCXJjID0gYWxsb2NfZW1wdHlf
cGFnZXModm1hLCBrZGF0YS5udW0pOwo+ICsJCWlmIChyYyA8IDApCj4gKwkJCWdvdG8gb3V0Owo+
ICsKPiArCQlwYWdlcyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+ICsJCWZvciAoaSA9IDA7IGkg
PCBrZGF0YS5udW07IGkrKykKPiArCQkJcGZuc1tpXSA9IHBhZ2VfdG9fcGZuKHBhZ2VzW2ldKTsK
CkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBnb2luZyB0byB3b3JrIHdlbGwgaWYgdGhlIGh5cGVydmlz
b3IgaXMgdXNpbmcgYSAKZGlmZmVyZW50IGdyYW51bGFyaXR5IGZvciB0aGUgcGFnZS4KCkltYWdp
bmUgWGVuIGlzIHVzaW5nIDRLIGJ1dCB0aGUga2VybmVsIDY0Sy4gWW91IHdvdWxkIGVuZCB1cCB0
byBoYXZlIHRoZSAKcmVzb3VyY2Ugbm90IG1hcHBlZCBjb250aWd1b3VzbHkgaW4gdGhlIG1lbW9y
eS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
