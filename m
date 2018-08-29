From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-blkback: Switch to closed state after
 releasing the backing device
Date: Wed, 29 Aug 2018 10:43:48 +0200
Message-ID: <b67866fc-13b7-ef88-c8db-2745127e5f6a__41203.5064110116$1535532162$gmane$org@suse.com>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <1701ccef-3ebb-973b-de32-059a8816d31c@suse.com>
 <20180829082731.GX26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cgjg=lm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fuw4u-0005mk-1z
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 08:43:52 +0000
In-Reply-To: <20180829082731.GX26705@gavran.carpriv.carnet.hr>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTA6MjcsIFZhbGVudGluIFZpZGljIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDI5
LCAyMDE4IGF0IDEwOjE2OjA5QU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IERpZCB5
b3UgdGVzdCB3aGV0aGVyIGl0IGlzIG9rYXkgdG8gbm90IGNoYW5nZSBzdGF0ZSBpbiBjYXNlIHRo
ZSBkZXZpY2UKPj4gaXMgc3RpbGwgb25saW5lPwo+IAo+IE5vdCBzdXJlIGhvdyB0byBzaW11bGF0
ZSB0aGF0LiBNYXliZSB1c2luZyB4bCBibG9jay1kZXRhY2ggb3Igc29tZXRoaW5nIGVsc2U/Cj4g
CgpJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGFuIGFjdGlvbiB0cmlnZ2VyZWQgYnkgdGhlIGZyb250
ZW5kLCBub3QgYnkgZG9tMAooeGVuIHRvb2xzIHdpbGwgYWx3YXlzIHNldCAib25saW5lIiB0byAw
IHdoZW4gcmVtb3ZpbmcgYSBkZXZpY2UsIEFGQUlLKS4KCkknbSBub3Qgc3VyZSB0aGlzIGlzIHJl
bGV2YW50LCBidXQgSSByZWFsaXplZCB0aGlzIGJlaGF2aW9yIGlzIGNoYW5nZWQKYnkgeW91ciBw
YXRjaC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
