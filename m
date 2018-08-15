From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v16 09/13] x86/hvm: Introduce
 lapic_save_regs_one func
Date: Wed, 15 Aug 2018 07:26:43 -0600
Message-ID: <5B742A1302000078001DE6BC@prv1-mh.provo.novell.com>
References: <1533806461-7428-1-git-send-email-aisaila@bitdefender.com>
 <1533806461-7428-10-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1533806461-7428-10-git-send-email-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA4LjE4IGF0IDExOjIwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IFRoaXMgaXMgdXNlZCB0byBzYXZlIGRhdGEgZnJvbSBhIHNpbmdsZSBpbnN0YW5jZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNv
bT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmFsYmVpdCBJ
J20gYSBsaXR0bGUgcHV6emxlZCB3aHkgLi4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmxh
cGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jCj4gQEAgLTE0NTgsMjYgKzE0
NTgsMzMgQEAgc3RhdGljIGludCBsYXBpY19zYXZlX2hpZGRlbihzdHJ1Y3QgZG9tYWluICpkLCBo
dm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPiAgICAgIHJldHVybiBlcnI7Cj4gIH0KPiAgCj4gK3N0
YXRpYyBpbnQgbGFwaWNfc2F2ZV9yZWdzX29uZShzdHJ1Y3QgdmNwdSAqdiwgaHZtX2RvbWFpbl9j
b250ZXh0X3QgKmgpCj4gK3sKPiArICAgIGlmICggIWhhc192bGFwaWModi0+ZG9tYWluKSApCj4g
KyAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgaWYgKCBodm1fZnVuY3Muc3luY19waXJfdG9f
aXJyICkKPiArICAgICAgICBodm1fZnVuY3Muc3luY19waXJfdG9faXJyKHYpOwo+ICsKPiArICAg
IHJldHVybiBodm1fc2F2ZV9lbnRyeShMQVBJQ19SRUdTLCB2LT52Y3B1X2lkLCBoLCB2Y3B1X3Zs
YXBpYyh2KS0+cmVncyk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgbGFwaWNfc2F2ZV9yZWdzKHN0
cnVjdCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+ICB7Cj4gICAgICBzdHJ1
Y3QgdmNwdSAqdjsKPiAtICAgIHN0cnVjdCB2bGFwaWMgKnM7Cj4gLSAgICBpbnQgcmMgPSAwOwo+
ICsgICAgaW50IGVyciA9IDA7Cj4gIAo+ICAgICAgaWYgKCAhaGFzX3ZsYXBpYyhkKSApCj4gICAg
ICAgICAgcmV0dXJuIDA7CgouLi4geW91IGxlYXZlIHRoaXMgaGVyZSB3aGVuIGluIHBhdGNoIDgg
eW91J3ZlIGRyb3BwZWQgdGhlCmVxdWl2YWxlbnQgdGhlcmUuIEJ1dCB0aGUgZnVuY3Rpb24gYXMg
YSB3aG9sZSB3aWxsIGdvIGF3YXkgYW55d2F5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
