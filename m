From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 2/2] mfi-common: Enable livepatch
 tests in 4.10 and 4.11 as intended (!)
Date: Thu, 1 Nov 2018 16:04:22 +0000
Message-ID: <23515.9222.78665.850989@mariner.uk.xensource.com>
References: <20181101155335.20138-1-ian.jackson@eu.citrix.com>
 <20181101155335.20138-2-ian.jackson@eu.citrix.com>
 <1aefcd8a-698e-c88f-b381-aade8aef6bef@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvhc=nm=citrix.com=prvs=836b135c8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIFSp-0002i2-T0
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 16:04:55 +0000
In-Reply-To: <1aefcd8a-698e-c88f-b381-aade8aef6bef@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW09TU1RFU1QgUEFUQ0ggMi8yXSBtZmktY29tbW9u
OiBFbmFibGUgbGl2ZXBhdGNoIHRlc3RzIGluIDQuMTAgYW5kIDQuMTEgYXMgaW50ZW5kZWQgKCEp
Iik6Cj4gT24gMDEvMTEvMTggMTU6NTMsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gVGhlIHBhdHRl
cm4geGVuLTQuMSogbWF0Y2hlcyB4ZW4tNC4xMC10ZXN0aW5nLCB4ZW4tNC4xMS10ZXN0aW5nLCBl
dGMuCj4gPiBUaGUgcmlnaHQgYXBwcm9hY2ggaXMgdG8gc3RhdGUgdGhlIGV4Y2x1ZGVkIGJyYW5j
aCBuYW1lcyBleHBsaWNpdGx5Cj4gPiBhcyBpcyBkb25lIGVsc2V3aGVyZS4KPiA+Cj4gPiBSZXN1
bHRpbmcgY2hhbmdlcyAoc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzKToK
PiA+ICAqIG5ldyBqb2JzOiB0ZXN0LWFtZDY0LXthbWQ2NCxpMzg2fS1saXZlcGF0Y2gKPiA+ICAq
IHJ1bnZhciBzZXQ6IGVuYWJsZV9saXZlcGF0Y2g9dHJ1ZSBpbiBidWlsZC1BUkNILCBidWlsZC1B
UkNILXhzbQo+ID4gICogYWxsIG9mIHRoZSBhYm92ZSBpbiBicmFuY2hlczogeGVuLTQuMTAtdGVz
dGluZyB4ZW4tNC4xMS10ZXN0aW5nCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+ID4gQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gCj4gRnVydGhlcm1vcmUsIHdlJ2xsIGV4cGVjdCB0aGlzIHRv
IGZhaWwgb24gNC4xMSBhbmQgbGF0ZXIsIHVudGlsIHdlIGNhbgo+IGZpeCB0aGUgbGl2ZXBhdGNo
IGJ1aWxkIHRvb2xzIGludGVyYWN0aW9uIHdpdGggYWx0aW5zdHJ1Y3Rpb25zLgoKVGhhdCdzIGZp
bmUgZnJvbSBvc3N0ZXN0J3MgcG92LiAgVGhlc2UgcGF0Y2hlcyBhcmUgdG8gZml4IHRoZSB0ZXN0
IHNvCnJlZ3Jlc3Npb25zIGRvbid0IHNsaXAgaW4gYWdhaW4gYWZ0ZXIgaXQncyBmaXhlZC4KCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
