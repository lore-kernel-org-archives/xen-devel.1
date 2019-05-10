From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 4/5] xen: fix handling framebuffer
 located above 4GB
Date: Fri, 10 May 2019 06:52:10 +0200
Message-ID: <ddcf231a-6871-348b-0e2e-b601e5607ca7@suse.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
 <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOxW6-0003hB-98
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 04:52:18 +0000
In-Reply-To: <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDUvMjAxOSAyMTo0OCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIHNvbWUgbWFjaGluZXMgKGZvciBleGFtcGxlIFRoaW5rcGFkIFA1MiksIFVFRkkgR09QIHJl
cG9ydHMKPiBmcmFtZWJ1ZmZlciBsb2NhdGVkIGFib3ZlIDRHQiAoMHg0MDAwMDAwMDAwIG9uIHRo
YXQgbWFjaGluZSkuIFRoaXMKPiBhZGRyZXNzIGRvZXMgbm90IGZpdCBpbiB7eGVuLGRvbTB9X3Zn
YV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5sZmJfYmFzZQo+IGZpZWxkLCB3aGljaCBpcyAzMmJp
dC4gVGhlIG92ZXJmbG93IGhlcmUgY2F1c2UgYWxsIGtpbmQgb2YgbWVtb3J5Cj4gY29ycnVwdGlv
biB3aGVuIGFueXRoaW5nIHRyaWVzIHRvIHdyaXRlIHNvbWV0aGluZyBvbiB0aGUgc2NyZWVuLAo+
IHN0YXJ0aW5nIHdpdGggemVyb2luZyB0aGUgd2hvbGUgZnJhbWVidWZmZXIgaW4gdmVzYV9pbml0
KCkuCj4gCj4gRml4IHRoaXMgc2ltaWxhciB0byBob3cgaXQncyBkb25lIGluIExpbnV4OiBhZGQg
ZXh0X2xmYl9iYXNlIGZpZWxkIGF0Cj4gdGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlLCB0byBob2xk
IHVwcGVyIDMyYml0cyBvZiB0aGUgYWRkcmVzcy4gU2luY2UgdGhlCj4gZmllbGQgaXMgYWRkZWQg
YXQgdGhlIGVuZCBvZiB0aGUgc3RydWN0dXJlLCBpdCB3aWxsIHdvcmsgd2l0aCBvbGRlcgo+IExp
bnV4IHZlcnNpb25zIHRvbyAob3RoZXIgdGhhbiB1c2luZyBwb3NzaWJseSB0cnVuY2F0ZWQgYWRk
cmVzcyAtIG5vCj4gd29yc2UgdGhhbiB3aXRob3V0IHRoaXMgY2hhbmdlKS4gVGhhbmtzIHRvIEFC
SSBjb250YWluaW5nIHNpemUgb2YgdGhlCj4gc3RydWN0dXJlIChzdGFydF9pbmZvLmNvbnNvbGUu
ZG9tMC5pbmZvX3NpemUpLCBMaW51eCBjYW4gZGV0ZWN0IHdoZW4KPiB0aGlzIGZpZWxkIGlzIHBy
ZXNlbnQgYW5kIHVzZSBpdCBhcHByb3ByaWF0ZWx5IHRoZW4uCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPgoKUHVibGljIGludGVyZmFjZSBwYXJ0OgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
