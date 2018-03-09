From: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 03/11] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Fri, 9 Mar 2018 09:58:33 -0300
Message-ID: <20180309125833.GI3417@localhost.localdomain>
References: <1520530757-4477-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520530757-4477-4-git-send-email-ian.jackson@eu.citrix.com>
 <20180308200345.GD3417@localhost.localdomain>
 <23202.28943.344150.512881@mariner.uk.xensource.com>
 <23202.30969.590920.764930@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pjas=f7=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1euHbh-0008KC-FB
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 12:58:45 +0000
Content-Disposition: inline
In-Reply-To: <23202.30969.590920.764930@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMDksIDIwMTggYXQgMTI6MDc6MjFQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCAwMy8xMV0geGVuOiBkZWZlciBj
YWxsIHRvIHhlbl9yZXN0cmljdCB1bnRpbCBqdXN0IGJlZm9yZSBvc19zZXR1cF9wb3N0Iik6Cj4g
PiBFZHVhcmRvIEhhYmtvc3Qgd3JpdGVzICgiUmU6IFtQQVRDSCAwMy8xMV0geGVuOiBkZWZlciBj
YWxsIHRvIHhlbl9yZXN0cmljdCB1bnRpbCBqdXN0IGJlZm9yZSBvc19zZXR1cF9wb3N0Iik6Cj4g
PiA+IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYWNjZWxlcmF0b3Itc3BlY2lmaWMgY29k
ZSBpbiBtYWluKCksCj4gPiA+IGlmIHdlIGFscmVhZHkgaGF2ZSBhY2NlbGVyYXRvciBjbGFzc2Vz
IHRoYXQgY2FuIGFic3RyYWN0IHRoYXQKPiA+ID4gb3V0LiAgSSBzdWdnZXN0IGFkZGluZyBhIEFj
Y2VsQ2xhc3M7OnNldHVwX3Bvc3QoKSBtZXRob2QgdGhhdCBjYW4KPiA+ID4gYmUgY2FsbGVkIGhl
cmUuCj4gPiAKPiA+IEkgdGhpbmsgSSBjYW4gZG8gdGhhdC4KPiAKPiBIb3cgYWJvdXQgdGhpcyA/
Cj4gCj4gRnJvbSA2MWYxMTIyMWFmYWEyOWUxMDAyMTU5OTQyMDIzOGUwMzgzNmJhNDEzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgo+IERhdGU6IEZyaSwgOSBNYXIgMjAxOCAxMjowMjo1MCArMDAwMAo+IFN1Ympl
Y3Q6IFtQQVRDSCB2Ni4yIDEyLzExXSBBY2NlbENsYXNzOiBJbnRyb2R1Y2UgYWNjZWxfc2V0dXBf
cG9zdAo+IAo+IFRoaXMgaXMgY2FsbGVkIGp1c3QgYmVmb3JlIG9zX3NldHVwX3Bvc3QuICBDdXJy
ZW50bHkgbm9uZSBvZiB0aGUKPiBhY2NlbGVyYXRvcnMgcHJvdmlkZSB0aGlzIGhvb2ssIGJ1dCB0
aGUgWGVuIG9uZSBpcyBnb2luZyB0byBwcm92aWRlCj4gb25lIGluIGEgbW9tZW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgoKTG9v
a3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBFZHVhcmRvIEhhYmtvc3QgPGVoYWJrb3N0QHJl
ZGhhdC5jb20+CgpUaGF0IHNhaWQsIEkgZG9uJ3QgdGhpbmsgdGhpcyBzaG91bGQgYmxvY2sgdGhl
IGluY2x1c2lvbiBvZiB0aGUKcHJldmlvdXMgcGF0Y2ggaW4gMi4xMiwgaWYgdGhlIFhlbiBtYWlu
dGFpbmVycyB3ZXJlIGFscmVhZHkgZ29pbmcKdG8gbWVyZ2UgaXQuCgotLSAKRWR1YXJkbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
