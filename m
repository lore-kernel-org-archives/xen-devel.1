From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 6/6] xen-blkfront: prepare request locally,
 only then put it on the shared ring
Date: Tue, 1 May 2018 10:15:26 +0100
Message-ID: <20180501091526.6b6j6h6rh62646fx__33619.7139266462$1525166098$gmane$org@MacBook-Pro-de-Roger.local>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
 <951a221b0e655b3077d1f96ac365194320bc8809.1525122026.git-series.marmarek@invisiblethingslab.com>
 <20180501082231.dzdbcghtwvlbkoys@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w7/l=hu=citrix.com=prvs=652d33fe9=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fDRO6-0006te-Tr
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 09:15:54 +0000
Content-Disposition: inline
In-Reply-To: <20180501082231.dzdbcghtwvlbkoys@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, "open list:BLOCK LAYER" <linux-block@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMDEsIDIwMTggYXQgMDk6MjI6MzFBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEFwciAzMCwgMjAxOCBhdCAxMTowMTo1MFBNICswMjAwLCBNYXJl
ayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4gPiAgCQkJCQkgICAgc3RydWN0IHJlcXVl
c3QgKnJlcSwKPiA+IC0JCQkJCSAgICBzdHJ1Y3QgYmxraWZfcmVxdWVzdCAqKnJpbmdfcmVxKQo+
ID4gKwkJCQkJICAgIHN0cnVjdCBibGtpZl9yZXF1ZXN0ICpyaW5nX3JlcSkKPiA+ICB7Cj4gPiAg
CXVuc2lnbmVkIGxvbmcgaWQ7Cj4gPiAgCj4gPiAtCSpyaW5nX3JlcSA9IFJJTkdfR0VUX1JFUVVF
U1QoJnJpbmZvLT5yaW5nLCByaW5mby0+cmluZy5yZXFfcHJvZF9wdnQpOwo+ID4gLQlyaW5mby0+
cmluZy5yZXFfcHJvZF9wdnQrKzsKPiA+IC0KPiA+ICAJaWQgPSBnZXRfaWRfZnJvbV9mcmVlbGlz
dChyaW5mbyk7Cj4gPiAgCXJpbmZvLT5zaGFkb3dbaWRdLnJlcXVlc3QgPSByZXE7Cj4gPiAgCXJp
bmZvLT5zaGFkb3dbaWRdLnN0YXR1cyA9IFJFUV9XQUlUSU5HOwo+ID4gIAlyaW5mby0+c2hhZG93
W2lkXS5hc3NvY2lhdGVkX2lkID0gTk9fQVNTT0NJQVRFRF9JRDsKPiA+ICAKPiA+IC0JKCpyaW5n
X3JlcSktPnUucncuaWQgPSBpZDsKPiA+ICsJcmluZ19yZXEtPnUucncuaWQgPSBpZDsKPiA+ICAK
PiA+ICAJcmV0dXJuIGlkOwo+ID4gIH0KPiA+IEBAIC01NDUsMjMgKzU0MiwyOCBAQCBzdGF0aWMg
dW5zaWduZWQgbG9uZyBibGtpZl9yaW5nX2dldF9yZXF1ZXN0KHN0cnVjdCBibGtmcm9udF9yaW5n
X2luZm8gKnJpbmZvLAo+ID4gIHN0YXRpYyBpbnQgYmxraWZfcXVldWVfZGlzY2FyZF9yZXEoc3Ry
dWN0IHJlcXVlc3QgKnJlcSwgc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8pCj4gPiAg
ewo+ID4gIAlzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyA9IHJpbmZvLT5kZXZfaW5mbzsKPiA+
IC0Jc3RydWN0IGJsa2lmX3JlcXVlc3QgKnJpbmdfcmVxOwo+ID4gKwlzdHJ1Y3QgYmxraWZfcmVx
dWVzdCByaW5nX3JlcSA9IHsgMCB9Owo+ID4gIAl1bnNpZ25lZCBsb25nIGlkOwo+ID4gIAo+ID4g
IAkvKiBGaWxsIG91dCBhIGNvbW11bmljYXRpb25zIHJpbmcgc3RydWN0dXJlLiAqLwo+ID4gIAlp
ZCA9IGJsa2lmX3JpbmdfZ2V0X3JlcXVlc3QocmluZm8sIHJlcSwgJnJpbmdfcmVxKTsKPiAKPiBN
YXliZSBJJ20gbWlzc2luZyBzb21ldGhpbmcgb2J2aW91cyBoZXJlLCBidXQgeW91IGFyZSBhZGRp
bmcgYSBzdHJ1Y3QKPiBhbGxvY2F0ZWQgb24gdGhlIHN0YWNrIHRvIHRoZSBzaGFkb3cgcmluZyBj
b3B5LCBpc24ndCB0aGlzIGRhbmdlcm91cz8KClRoZSBhYm92ZSBjb21tZW50IGlzIHdyb25nLCB5
b3UgYXJlIHN0b3JpbmcgYSBwb2ludGVyIHRvICdyZXEnIGluIHRoZQpzaGFkb3cgcmluZyBjb3B5
LCB3aGljaCBpcyBmaW5lIGFuZCBpcyBub3QgdGhlIHJpbmcgcmVxdWVzdC4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
