From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v7 16/18] xen: automatically create
 XenBlockDevice-s
Date: Tue, 8 Jan 2019 13:53:21 +0100
Message-ID: <20190108125321.GD11492__37950.8952879862$1546951941$gmane$org@linux.fritz.box>
References: <20181220171439.11159-1-paul.durrant@citrix.com>
 <20181220171439.11159-17-paul.durrant@citrix.com>
 <20190104163124.GE1508@perard.uk.xensource.com>
 <da727b0b8a9a4f9baa47a660298a9cba@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lY5R=PQ=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1ggqso-0004or-88
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 12:53:26 +0000
Content-Disposition: inline
In-Reply-To: <da727b0b8a9a4f9baa47a660298a9cba@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

QW0gMDQuMDEuMjAxOSB1bSAxNzo0MCBoYXQgUGF1bCBEdXJyYW50IGdlc2NocmllYmVuOgo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiA+IFNlbnQ6IDA0IEphbnVhcnkgMjAxOSAx
NjozMQo+ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBD
YzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWJsb2NrQG5vbmdudS5vcmc7IHhlbi0KPiA+
IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29t
PjsgTWF4IFJlaXR6Cj4gPiA8bXJlaXR6QHJlZGhhdC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3IDE2LzE4
XSB4ZW46IGF1dG9tYXRpY2FsbHkgY3JlYXRlIFhlbkJsb2NrRGV2aWNlLXMKPiA+IAo+ID4gQWxt
b3N0IGRvbmUsIHRoZXJlIGlzIG9uZSB0aGluZyBsZWZ0IHdoaWNoIEkgYmVsaWV2ZSBpcyBhbiBp
c3N1ZS4KPiA+IFdoZW5ldmVyIEkgYXR0YWNoIGEgcmF3IGZpbGUgdG8gUUVNVSwgaXQgcHJpbnQ6
Cj4gPiAgICAgcWVtdS1zeXN0ZW0taTM4Njogd2FybmluZzogT3BlbmluZyBhIGJsb2NrIGRldmlj
ZSBhcyBhIGZpbGUgdXNpbmcgdGhlCj4gPiAnZmlsZScgZHJpdmVyIGlzIGRlcHJlY2F0ZWQKPiAK
PiBPaCwgSSdkIG5vdCBub3RpY2VkIHRoYXQuLi4gYnV0IHRoZW4gSSBvbmx5IHVzZSByYXcgZmls
ZXMgb2NjYXNpb25hbGx5LgoKU3RyaWN0bHkgc3BlYWtpbmcsIHRoaXMgaXMgbm90IGFib3V0IHJh
dyAocmVndWxhcikgZmlsZXMsIGJ1dCByYXcgYmxvY2sKZGV2aWNlcy4gJ2ZpbGUnIGlzIGZpbmUg
Zm9yIGFjdHVhbCByZWd1bGFyIGZpbGVzLCBidXQgdGhlIHByb3RvY29sCmRyaXZlciBmb3IgYmxv
Y2sgZGV2aWNlcyBpcyAnaG9zdF9kZXZpY2UnLgoKPiA+IHJhdyBmaWxlcyBzaG91bGQgdXNlIHRo
ZSAicmF3IiBkcml2ZXIsIHNvIHdlIGFyZW4ndCBkb25lIHlldC4KPiAKPiBPay4gSGF2aW5nIGEg
c3RyaWN0bHkgMi1sYXllciBzdGFjayBhY3R1YWxseSBtYWtlcyB0aGluZ3Mgc2ltcGxlciBhbnl3
YXkgOi0pCgpVc2luZyAncmF3JyB0aGVyZSB3aWxsIG1ha2UgdGhlIGJsb2NrIGxheWVyIGF1dG8t
ZGV0ZWN0IHRoZSByaWdodApwcm90b2NvbCBsYXllciwgc28gdGhpcyB3b3Jrcy4gSWYgeW91IHdh
bnQgdG8gYXZvaWQgdGhlIHNlY29uZCBsYXllciwKeW91J2QgaGF2ZSB0byBmaWd1cmUgb3V0IG1h
bnVhbGx5IHdoZXRoZXIgdG8gdXNlICdmaWxlJyBvcgonaG9zdF9kZXZpY2UnLgoKS2V2aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
