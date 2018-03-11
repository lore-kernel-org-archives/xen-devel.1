From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/11] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Sun, 11 Mar 2018 14:12:10 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803111409550.23583__23297.569275792$1520802674$gmane$org@sstabellini-ThinkPad-X260>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
 <20180308200345.GD3417@localhost.localdomain>
 <23202.28943.344150.512881@mariner.uk.xensource.com>
 <23202.30969.590920.764930@mariner.uk.xensource.com>
 <20180309125833.GI3417@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=izcy=gb=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ev8GY-0007SH-MK
 for xen-devel@lists.xenproject.org; Sun, 11 Mar 2018 21:12:26 +0000
In-Reply-To: <20180309125833.GI3417@localhost.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@citrix.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCA5IE1hciAyMDE4LCBFZHVhcmRvIEhhYmtvc3Qgd3JvdGU6Cj4gT24gRnJpLCBNYXIg
MDksIDIwMTggYXQgMTI6MDc6MjFQTSArMDAwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBJYW4g
SmFja3NvbiB3cml0ZXMgKCJSZTogW1BBVENIIDAzLzExXSB4ZW46IGRlZmVyIGNhbGwgdG8geGVu
X3Jlc3RyaWN0IHVudGlsIGp1c3QgYmVmb3JlIG9zX3NldHVwX3Bvc3QiKToKPiA+ID4gRWR1YXJk
byBIYWJrb3N0IHdyaXRlcyAoIlJlOiBbUEFUQ0ggMDMvMTFdIHhlbjogZGVmZXIgY2FsbCB0byB4
ZW5fcmVzdHJpY3QgdW50aWwganVzdCBiZWZvcmUgb3Nfc2V0dXBfcG9zdCIpOgo+ID4gPiA+IEkg
ZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYWNjZWxlcmF0b3Itc3BlY2lmaWMgY29kZSBpbiBt
YWluKCksCj4gPiA+ID4gaWYgd2UgYWxyZWFkeSBoYXZlIGFjY2VsZXJhdG9yIGNsYXNzZXMgdGhh
dCBjYW4gYWJzdHJhY3QgdGhhdAo+ID4gPiA+IG91dC4gIEkgc3VnZ2VzdCBhZGRpbmcgYSBBY2Nl
bENsYXNzOzpzZXR1cF9wb3N0KCkgbWV0aG9kIHRoYXQgY2FuCj4gPiA+ID4gYmUgY2FsbGVkIGhl
cmUuCj4gPiA+IAo+ID4gPiBJIHRoaW5rIEkgY2FuIGRvIHRoYXQuCj4gPiAKPiA+IEhvdyBhYm91
dCB0aGlzID8KPiA+IAo+ID4gRnJvbSA2MWYxMTIyMWFmYWEyOWUxMDAyMTU5OTQyMDIzOGUwMzgz
NmJhNDEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gRnJvbTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiBEYXRlOiBGcmksIDkgTWFyIDIwMTggMTI6MDI6
NTAgKzAwMDAKPiA+IFN1YmplY3Q6IFtQQVRDSCB2Ni4yIDEyLzExXSBBY2NlbENsYXNzOiBJbnRy
b2R1Y2UgYWNjZWxfc2V0dXBfcG9zdAo+ID4gCj4gPiBUaGlzIGlzIGNhbGxlZCBqdXN0IGJlZm9y
ZSBvc19zZXR1cF9wb3N0LiAgQ3VycmVudGx5IG5vbmUgb2YgdGhlCj4gPiBhY2NlbGVyYXRvcnMg
cHJvdmlkZSB0aGlzIGhvb2ssIGJ1dCB0aGUgWGVuIG9uZSBpcyBnb2luZyB0byBwcm92aWRlCj4g
PiBvbmUgaW4gYSBtb21lbnQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJ
YW4uSmFja3NvbkBldS5jaXRyaXguY29tPgo+IAo+IExvb2tzIGdvb2QgdG8gbWUuCj4gCj4gUmV2
aWV3ZWQtYnk6IEVkdWFyZG8gSGFia29zdCA8ZWhhYmtvc3RAcmVkaGF0LmNvbT4KPiAKPiBUaGF0
IHNhaWQsIEkgZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQgYmxvY2sgdGhlIGluY2x1c2lvbiBvZiB0
aGUKPiBwcmV2aW91cyBwYXRjaCBpbiAyLjEyLCBpZiB0aGUgWGVuIG1haW50YWluZXJzIHdlcmUg
YWxyZWFkeSBnb2luZwo+IHRvIG1lcmdlIGl0LgoKSWFuLAoKVGhlIFhlbiBzaWRlIGlzIGFsbW9z
dCBlbnRpcmVseSByZXZpZXdlZCBhbmQgc2hvdWxkIGJlIE9LLCBidXQgeW91IG5lZWQKcmV2aWV3
ZWQtYnlzIG9uIHNvbWUgbm9uLVhlbiBzcGVjaWZpYyBwYXRjaGVzOiAjNyAjOCAjMTEuCgpDaGVl
cnMsCgpTdGVmYW5vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
