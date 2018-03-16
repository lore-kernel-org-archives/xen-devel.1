From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 09/11] vpci/msi: add MSI handlers
Date: Fri, 16 Mar 2018 09:05:44 -0600
Message-ID: <5AABEB5802000078001B2E24@prv-mh.provo.novell.com>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-10-roger.pau@citrix.com>
 <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
 <20180316143412.lkqyavr2vepsdktc@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewqvU-0004Wj-UX
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 15:05:48 +0000
In-Reply-To: <20180316143412.lkqyavr2vepsdktc@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE1OjM0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgTWFyIDE2LCAyMDE4IGF0IDA4OjA0OjU1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTYuMDMuMTggYXQgMTQ6MzAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKPj4gPiArKysgYi94ZW4v
ZHJpdmVycy92cGNpL3ZwY2kuYwo+PiA+IEBAIC00Nyw2ICs0Nyw3IEBAIHZvaWQgdnBjaV9yZW1v
dmVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+PiA+ICAgICAgICAgIHhmcmVlKHIpOwo+
PiA+ICAgICAgfQo+PiA+ICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOwo+PiA+
ICsgICAgeGZyZWUocGRldi0+dnBjaS0+bXNpKTsKPj4gPiAgICAgIHhmcmVlKHBkZXYtPnZwY2kp
Owo+PiAKPj4gT2theSwgdGhlICNpZmRlZiBoZXJlIGlzIGdvbmUgYXMgYWdyZWVkLiBCdXQgc29t
ZXRoaW5nIGlzIHN0aWxsIGZpc2h5Cj4+IGhlcmUgZm9yIHRoZSB0ZXN0IHV0aWxpdHk6IFlvdSBk
b24ndCBjaGFuZ2UgdGhlIHRlc3QgY29kZSBoZXJlIGF0IGFsbCwKPj4gd2hpY2ggbWFkZSBtZSBn
byBsb29rIHdoeSB0aGF0IGlzLiBBcyBpdCBsb29rcyB5b3UgdXNlIGEgc2luZ2xlCj4+IHN0YXRp
YyBzdHJ1Y3QgdnBjaSBpbnN0YW5jZSB0aGVyZS4gVGhhdCdsbCBtYWtlIHRoZSB4ZnJlZSgpIHlv
dSBhZGQKPj4gaGVyZSBjb3JyZWN0LCBidXQgdGhlIG90aGVyIG9uZSBhYm92ZSB0aGVuIGlzIHdy
b25nICh5b3UncmUgZnJlZWluZwo+PiBzdGF0aWMgZGF0YSkuIE9yIGFtIEkgbWlzc2luZyBzb21l
dGhpbmc/Cj4gCj4gdnBjaV9yZW1vdmVfZGV2aWNlIGlzIG5ldmVyIGNhbGxlZCBmcm9tIHRoZSB1
c2VyLXNwYWNlIHRlc3QgaGFybmVzcywKPiBzbyBpdCBqdXN0IG5lZWRzIHRvIGJ1aWxkLCBidXQg
bm90IG5lY2Vzc2FyaWx5IGJlIGNvcnJlY3QgaW4gdGhhdAo+IGNvbnRleHQuCj4gCj4gVGhlIHRl
c3QgaGFybmVzcyBkb2Vzbid0IHVzZSB2cGNpX2FkZF9oYW5kbGVycyBvciB2cGNpX3JlbW92ZV9k
ZXZpY2UsCj4gaXQganVzdCBhZGRzIGFuZCByZW1vdmVzIGhhbmRsZXJzIHVzaW5nIHZwY2lfYWRk
X3JlZ2lzdGVyIGFuZAo+IHZwY2lfcmVtb3ZlX3JlZ2lzdGVyLgoKSSBkaXNsaWtlIHN1Y2ggYSBz
ZXR1cCAtIHRoZW4geW91J2QgYmV0dGVyICNpZmRlZiBvdXQgdGhlIGVudGlyZQpmdW5jdGlvbiwg
YW5kIHVuZG8gc29tZSBvZiB0aGUgb3RoZXIgcmVjZW50bHkgYWRkZWQgI2lmZGVmLWFyeS4KCkph
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
