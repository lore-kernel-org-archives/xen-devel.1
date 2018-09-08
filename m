From: Valentin Vidic <Valentin.Vidic@CARNet.hr>
Subject: Re: [DRBD-user] [PATCH] xen-blkback: Switch to closed
 state after releasing the backing device
Date: Sat, 8 Sep 2018 09:34:32 +0200
Message-ID: <20180908073432.GP26705__8312.80737552351$1536392031$gmane$org@gavran.carpriv.carnet.hr>
References: <20180829065214.23546-1-Valentin.Vidic@CARNet.hr>
 <20180905103649.edugijsjx4v2fbxd@mac.bytemobile.com>
 <20180905162756.GA26705@gavran.carpriv.carnet.hr>
 <20180907120337.GB11834@soda.linbit>
 <20180907121348.GM26705@gavran.carpriv.carnet.hr>
 <20180907132828.GC11834@soda.linbit>
 <20180907164500.GN26705@gavran.carpriv.carnet.hr>
 <20180907171459.GO26705@gavran.carpriv.carnet.hr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=++iv=lw=carnet.hr=valentin.vidic@srs-us1.protection.inumbo.net>)
 id 1fyXlS-00070t-RE
 for xen-devel@lists.xenproject.org; Sat, 08 Sep 2018 07:34:42 +0000
Content-Disposition: inline
In-Reply-To: <20180907171459.GO26705@gavran.carpriv.carnet.hr>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: drbd-user@lists.linbit.com
Cc: Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDc6MTQ6NTlQTSArMDIwMCwgVmFsZW50aW4gVmlkaWMg
d3JvdGU6Cj4gSW4gZmFjdCB0aGUgZmlyc3Qgb25lIGlzIHRoZSBvcmlnaW5hbCBjb2RlIHBhdGgg
YmVmb3JlIEkgbW9kaWZpZWQKPiBibGtiYWNrLiAgVGhlIHByb2JsZW0gaXMgaXQgZ2V0cyBleGVj
dXRlZCBhc3luYyBmcm9tIHdvcmtxdWV1ZSBzbwo+IGl0IG1pZ2h0IG5vdCBhbHdheXMgcnVuIGJl
Zm9yZSB0aGUgY2FsbCB0byBkcmJkYWRtIHNlY29uZGFyeS4KCkFzIHRoZSBEUkJEIGRldmljZSBn
ZXRzIHJlbGVhc2VkIG9ubHkgd2hlbiB0aGUgbGFzdCBJTyByZXF1ZXN0CmhhcyBmaW5pc2hlZCwg
SSBmb3VuZCBhIHdheSB0byBjaGVjayBhbmQgd2FpdCBmb3IgdGhpcyBpbiB0aGUKYmxvY2stZHJi
ZCBzY3JpcHQ6CgotLS0gYmxvY2stZHJiZC5vcmlnICAgICAyMDE4LTA5LTA4IDA5OjA3OjIzLjQ5
OTY0ODUxNSArMDIwMAorKysgYmxvY2stZHJiZCAgMjAxOC0wOS0wOCAwOToyODoxMi44OTIxOTM2
NDkgKzAyMDAKQEAgLTIzMCw2ICsyMzAsMjQgQEAKIGFuZCBzbyBjYW5ub3QgYmUgbW91bnRlZCAk
e20yfSR7d2hlbn0uIgogfQogCit3YWl0X2Zvcl9pbmZsaWdodCgpCit7CisgIGxvY2FsIGRldj0i
JDEiCisgIGxvY2FsIGluZmxpZ2h0PSIvc3lzL2Jsb2NrLyR7ZGV2Iy9kZXYvfS9pbmZsaWdodCIK
KyAgbG9jYWwgcmQgd3IKKworICBpZiAhIFsgLWYgIiRpbmZsaWdodCIgXTsgdGhlbgorICAgIHJl
dHVybgorICBmaQorCisgIHdoaWxlIHRydWU7IGRvCisgICAgcmVhZCByZCB3ciA8ICRpbmZsaWdo
dAorICAgIGlmIFsgIiRyZCIgPSAiMCIgLWEgIiR3ciIgPSAiMCIgXTsgdGhlbgorICAgICAgcmV0
dXJuCisgICAgZmkKKyAgICBzbGVlcCAxCisgIGRvbmUKK30KIAogdD0kKHhlbnN0b3JlX3JlYWRf
ZGVmYXVsdCAiJFhFTkJVU19QQVRIL3R5cGUiICdNSVNTSU5HJykKIApAQCAtMjg1LDYgKzMwMyw4
IEBACiAgICAgICAgIGRyYmRfbHJvbGU9IiR7ZHJiZF9yb2xlJSUvKn0iCiAgICAgICAgIGRyYmRf
ZGV2PSIkKGRyYmRhZG0gc2gtZGV2ICRkcmJkX3Jlc291cmNlKSIKIAorICAgICAgICB3YWl0X2Zv
cl9pbmZsaWdodCAkZHJiZF9kZXYKKwogICAgICAgICBpZiBbICIkZHJiZF9scm9sZSIgIT0gJ1Nl
Y29uZGFyeScgXTsgdGhlbgogICAgICAgICAgIGRyYmRhZG0gc2Vjb25kYXJ5ICRkcmJkX3Jlc291
cmNlCiAgICAgICAgIGZpCgotLSAKVmFsZW50aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
