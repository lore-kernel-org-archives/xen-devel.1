From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] bitops: speed up hweight<N>()
Date: Mon, 3 Jun 2019 11:04:45 +0100
Message-ID: <3586e8b8-3db3-929f-3fbd-72e94f7fb0dd@citrix.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9360200007800233E01@prv1-mh.provo.novell.com>
 <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
 <5CF4F02E0200007800234874@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXjpm-00064A-64
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:04:54 +0000
In-Reply-To: <5CF4F02E0200007800234874@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDYvMjAxOSAxMTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMzEuMDUuMTkg
YXQgMjE6NDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMzEvMDUv
MjAxOSAwMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
Yml0b3BzLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaAo+Pj4gQEAgLTE1Myw0
MSArMTUzLDU0IEBAIHN0YXRpYyBfX2lubGluZV9fIGludCBnZXRfY291bnRfb3JkZXIodW4KPj4+
ICAKPj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGludCBnZW5lcmljX2h3ZWlnaHQzMih1bnNp
Z25lZCBpbnQgdykKPj4+ICB7Cj4+PiAtICAgIHVuc2lnbmVkIGludCByZXMgPSAodyAmIDB4NTU1
NTU1NTUpICsgKCh3ID4+IDEpICYgMHg1NTU1NTU1NSk7Cj4+PiAtICAgIHJlcyA9IChyZXMgJiAw
eDMzMzMzMzMzKSArICgocmVzID4+IDIpICYgMHgzMzMzMzMzMyk7Cj4+PiAtICAgIHJlcyA9IChy
ZXMgJiAweDBGMEYwRjBGKSArICgocmVzID4+IDQpICYgMHgwRjBGMEYwRik7Cj4+PiAtICAgIHJl
cyA9IChyZXMgJiAweDAwRkYwMEZGKSArICgocmVzID4+IDgpICYgMHgwMEZGMDBGRik7Cj4+PiAt
ICAgIHJldHVybiAocmVzICYgMHgwMDAwRkZGRikgKyAoKHJlcyA+PiAxNikgJiAweDAwMDBGRkZG
KTsKPj4+ICsgICAgdyAtPSAodyA+PiAxKSAmIDB4NTU1NTU1NTU7Cj4+PiArICAgIHcgPSAgKHcg
JiAweDMzMzMzMzMzKSArICgodyA+PiAyKSAmIDB4MzMzMzMzMzMpOwo+Pj4gKyAgICB3ID0gICh3
ICsgKHcgPj4gNCkpICYgMHgwZjBmMGYwZjsKPj4+ICsKPj4+ICsjaWZkZWYgQ09ORklHX0hBU19G
QVNUX01VTFRJUExZCj4+PiArICAgIHJldHVybiAodyAqIDB4MDEwMTAxMDEpID4+IDI0Owo+Pj4g
KyNlbHNlCj4+PiArICAgIHcgKz0gdyA+PiA4Owo+Pj4gKwo+Pj4gKyAgICByZXR1cm4gKHcgKyAo
dyA+PiAxNikpICYgMHhmZjsKPj4+ICsjZW5kaWYKPj4gVGhpcyB3b3VsZCBiZSBzbGlnaHRseSBz
aG9ydGVyLCBsZXNzIGxpYWJsZSB0byBiaXRyb3QsIGFuZCBJTU8gY2xlYW5lciwKPj4gdG8gZG8K
Pj4KPj4gaWYgKCBJU19FTkFCTEVEKENPTkZJR19IQVNfRkFTVF9NVUxUSVBMWSkgKQo+PiAgICAg
dyA9IHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKPj4gZWxzZQo+PiAgICAgdyArPSB3ID4+IDg7Cj4+
Cj4+IHJldHVybiB3Owo+IFdvdWxkIHlvdSBiZSBva2F5IHdpdGgKPgo+IHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgaW50IGdlbmVyaWNfaHdlaWdodDMyKHVuc2lnbmVkIGludCB3KQo+IHsKPiAgICAg
dyAtPSAodyA+PiAxKSAmIDB4NTU1NTU1NTU7Cj4gICAgIHcgPSAgKHcgJiAweDMzMzMzMzMzKSAr
ICgodyA+PiAyKSAmIDB4MzMzMzMzMzMpOwo+ICAgICB3ID0gICh3ICsgKHcgPj4gNCkpICYgMHgw
ZjBmMGYwZjsKPgo+ICAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0hBU19GQVNUX01VTFRJUExZ
KSApCj4gICAgICAgICByZXR1cm4gKHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKPgo+ICAgICB3ICs9
IHcgPj4gODsKPgo+ICAgICByZXR1cm4gKHcgKyAodyA+PiAxNikpICYgMHhmZjsKPiB9Cj4KPiBk
ZXNwaXRlIHRoZXJlIHRoZW4gc3RpbGwgYmVpbmcgdHdvIHJldHVybiBzdGF0ZW1lbnRzPwoKWWVh
aCAtIHRoaXMgZm9ybSBkb2VzIHJlYWQgbGlrZSBhIHJlZ3VsYXIgZnVuY3Rpb24uCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
