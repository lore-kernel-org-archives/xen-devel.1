From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Regression in xen-unstable due to commit
 3802ecbaa9eb36
Date: Thu, 16 May 2019 12:24:50 +0100
Message-ID: <20190516112450.GW2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hREVK-0001Od-8L
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:24:54 +0000
Content-Disposition: inline
In-Reply-To: <20190516125735.6c1bf1ca.ohering@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <ohering@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTI6NTc6MzVQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxMjo0NTo0MCArMDIwMAo+IHNjaHJpZWIgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+IAo+ID4gSGF2aW5nIGEgZmllbGQg
aW4gYnVpbGRfaW5mbyB3aXRoIGEgZGVmYXVsdCB2YWx1ZSB0aGF0IGRlcGVuZHMgb24KPiA+IGZp
ZWxkcyBvdXRzaWRlIG9mIGJ1aWxkX2luZm8gaXMgcHJvYmxlbWF0aWMsIHNpbmNlIG5vdCBhbGwg
Y2FsbGVycyBvZgo+ID4gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQgaGF2ZSBh
Y2Nlc3MgdG8gbGlieGxfZG9tYWluX2NvbmZpZy4KPiAKPiBPbmUgb3B0aW9uIHdvdWxkIGJlIGEg
bmV3IEFQSSB0aGF0IGdldHMgYSBsaWJ4bF9kb21haW5fY29uZmlnIGFuZCB3aGljaAo+IGNhbGxz
IGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbCwgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5m
b19zZXRkZWZhdWx0Cj4gYW5kIGxpYnhsX19kb21haW5fYnVpbGRfaW5mb19zZXRkZWZhdWx0LiBU
byBtZSBpdCBsb29rcyBsaWtlIGNyZWF0ZV9kb21haW4KPiBjYW4gbm90IGJ1aWxkIGEgcHJvcGVy
IGRfY29uZmlnIGFsbCBvbiBpdHMgb3duLCBpdCBqdXN0IGhhcyBub3QgZW5vdWdoIGluZm8uCgpJ
ZiB5b3UncmUgdGFsa2luZyBhYm91dCBhZGRpbmcgYSBuZXcgX3B1YmxpY18gQVBJOgoKVGhlIHBy
b2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgaXQgZG9lc24ndCBoZWxwIGV4aXN0aW5n
IGxpYnhsCnVzZXJzLiBUaGV5IHdpbGwgbmVlZCB0byBiZSBmaXhlZCBieSBjYWxsaW5nIHRoaXMg
bmV3IEFQSS4KCldpbGwgaXQgd29yayBpZiAxKSB5b3UgbWFrZSBsaWJ4bF9fZG9tYWluX3NldF9k
ZXZpY2VfbW9kZWwgaWRlbXBvdGVudAphbmQgMikgY2FsbCBpdCBmcm9tIHdpdGhpbiBsaWJ4bF9f
ZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCAod2hpY2gKYmFzaWNhbGx5IHJlc3RvcmVzIHRo
ZSBvcmlnaW5hbCBjb2RlIHBhdGggYmVmb3JlIHlvdXIgcGF0Y2gpPwoKV2VpLgoKCj4gCj4gT2xh
ZgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
