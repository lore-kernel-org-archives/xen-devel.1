From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] xen-pciback: Fix error return in
 bar_write() and rom_write()
Date: Mon, 3 Dec 2018 13:35:19 +0100
Message-ID: <20181203123519.l34a4yx26qle3whb__24205.6602765389$1543840457$gmane$org@mac>
References: <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <f5ea0f3c2e29a96b59e409e4ae4c62de11a05fc8.1543772656.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evar=om=citrix.com=prvs=8687ba703=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gTnRg-0001Db-Tl
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 12:35:28 +0000
Content-Disposition: inline
In-Reply-To: <f5ea0f3c2e29a96b59e409e4ae4c62de11a05fc8.1543772656.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Dwayne Litzenberger <dlitz@dlitz.net>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBEZWMgMDIsIDIwMTggYXQgMDY6NDc6MzJQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IEZyb206IER3YXluZSBMaXR6ZW5iZXJnZXIgPGRsaXR6QGRs
aXR6Lm5ldD4KCkkgdGhpbmsgdGhpcyByZXF1aXJlcyBzb21lIGRlc2NyaXB0aW9uLiBBdCBsZWFz
dCBhIG5vdGUgdGhhdCB0aGUKZnVuY3Rpb24gaXMgbm90IGFsdGVyZWQsIGp1c3QgZXJyb3JzIGZy
b20gcGNpIHJlYWRzL3dyaXRlcyBhcmUgbm8KbG9uZ2VyIGlnbm9yZWQuCgo+IFNpZ25lZC1vZmYt
Ynk6IER3YXluZSBMaXR6ZW5iZXJnZXIgPGRsaXR6QGRsaXR6Lm5ldD4KPiAtLS0KPiAgZHJpdmVy
cy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZV9oZWFkZXIuYyB8IDI0ICsrKysrKysrKysrKysr
KystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2Vf
aGVhZGVyLmMgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9jb25mX3NwYWNlX2hlYWRlci5jCj4g
aW5kZXggMTBhZTI0Yi4uNjk3ZDBhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNp
YmFjay9jb25mX3NwYWNlX2hlYWRlci5jCj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2sv
Y29uZl9zcGFjZV9oZWFkZXIuYwo+IEBAIC0xMzUsNiArMTM1LDcgQEAgc3RhdGljIGludCBjb21t
YW5kX3dyaXRlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCBvZmZzZXQsIHUxNiB2YWx1ZSwgdm9p
ZCAqZGF0YSkKPiAgCj4gIHN0YXRpYyBpbnQgcm9tX3dyaXRlKHN0cnVjdCBwY2lfZGV2ICpkZXYs
IGludCBvZmZzZXQsIHUzMiB2YWx1ZSwgdm9pZCAqZGF0YSkKPiAgewo+ICsJaW50IGVyciA9IDA7
Cj4gIAlzdHJ1Y3QgcGNpX2Jhcl9pbmZvICpiYXIgPSBkYXRhOwo+ICAKPiAgCWlmICh1bmxpa2Vs
eSghYmFyKSkgewo+IEBAIC0xNTAsMTcgKzE1MSwyMiBAQCBzdGF0aWMgaW50IHJvbV93cml0ZShz
dHJ1Y3QgcGNpX2RldiAqZGV2LCBpbnQgb2Zmc2V0LCB1MzIgdmFsdWUsIHZvaWQgKmRhdGEpCj4g
IAkJYmFyLT53aGljaCA9IDE7Cj4gIAllbHNlIHsKPiAgCQl1MzIgdG1wdmFsOwo+IC0JCXBjaV9y
ZWFkX2NvbmZpZ19kd29yZChkZXYsIG9mZnNldCwgJnRtcHZhbCk7Cj4gKwkJZXJyID0gcGNpX3Jl
YWRfY29uZmlnX2R3b3JkKGRldiwgb2Zmc2V0LCAmdG1wdmFsKTsKPiArCQlpZiAoZXJyKQo+ICsJ
CQlnb3RvIG91dDsKCkkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhlIG91dCBsYWJlbCwgeW91IGNv
dWxkIGp1c3QgcmV0dXJuIGVyci4KQWRkaW5nIHRoZSBsYWJlbCBkb2Vzbid0IGhlbHAgaW4gYW55
IHdheSBJTU8sIGp1c3QgbWFrZXMgdGhlIGZ1bmN0aW9uCm9uZSBsaW5lIGxvbmdlciBmb3Igbm8g
cmVhc29uLgoKU2FtZSBmb3IgdGhlIG91dCBsYWJlbCBhZGRlZCB0byBiYXJfd3JpdGUuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
