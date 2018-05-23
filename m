From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v5 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Wed, 23 May 2018 12:30:47 -0400
Message-ID: <19ab48d1-333c-73fa-8586-c433b5bd7b90__44562.9033180468$1527094691$gmane$org@oracle.com>
References: <20180523143002.29252-1-boris.ostrovsky@oracle.com>
 <20180523143002.29252-2-boris.ostrovsky@oracle.com>
 <5B058BA002000078001C523F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z25m=ik=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fLX6l-00078i-3D
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:59:27 +0000
In-Reply-To: <5B058BA002000078001C523F@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, brgerst@gmail.com, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjMvMjAxOCAxMTo0MSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDUu
MTggYXQgMTY6MzAsIDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4+IEBAIC05
OCw2ICsxMDEsMTIgQEAgRU5UUlkocHZoX3N0YXJ0X3hlbikKPj4gIAkvKiA2NC1iaXQgZW50cnkg
cG9pbnQuICovCj4+ICAJLmNvZGU2NAo+PiAgMToKPj4gKwkvKiBTZXQgYmFzZSBhZGRyZXNzIGlu
IHN0YWNrIGNhbmFyeSBkZXNjcmlwdG9yLiAqLwo+PiArCW1vdiAkTVNSX0dTX0JBU0UsJWVjeAo+
PiArCW1vdiAkX3BhKGNhbmFyeSksICVyYXgKPj4gKwl4b3IgJXJkeCwgJXJkeAo+IFdoeSByYXgg
YW5kIHJkeCBpbnN0ZWFkIG9mIGVheCBhbmQgZWR4PyBJbiB0aGUgZm9ybWVyIGNhc2UsIHRoZQo+
IHJlbG9jYXRpb24gcHJvZHVjZWQgbWlnaHQgY29uZnVzZSB3aGF0ZXZlciBlbnRpdHkgcHJvY2Vz
c2luZyBpdAo+IChpdCdsbCBoYXZlIGEgc2lnbi1leHRlbmRlZCAzMi1iaXQgcXVhbnRpdHkgdG8g
ZGVhbCB3aXRoLCB3aGljaAo+IHdvdWxkbid0IGFsbG93IHJlcHJlc2VudGluZyBhbiBhZGRyZXNz
IGluIHRoZSBbMkdiLCA0R2IpIHJhbmdlKS4KPiBJbiB0aGUgbGF0dGVyIGNhc2UsIHdoaWxlIHN1
cmVseSBuZWl0aGVyIHBlcmZvcm1hbmNlIG5vciBjb2RlIHNpemUKPiBtYXR0ZXIgbXVjaCBoZXJl
LCBpdCdzIHN0aWxsIGEgYmFkIHByZWNlZGVudCAocGVvcGxlIGNvcHktYW5kLXBhc3RlCj4gY29k
ZSBhbGwgdGhlIHRpbWUpOiBaZXJvLWluZyBvZiByZWdpc3RlcnMgc2hvdWxkIGdlbmVyYWxseSB1
c2UgdGhlCj4gMzItYml0IGZvcm1zIG9mIHRoZSBpbnNuLiBHYXMgaGFzIGFjdHVhbGx5IGdhaW5l
ZCBhbiBvcHRpbWl6YXRpb24KPiBtb2RlIHJlY2VudGx5ICh1cG9uIHJlcXVlc3QgZnJvbSBMaW51
cyBhbmQgdGhlIHg4NiBtYWludGFpbmVycykKPiB0byBzaWxlbnRseSAicmVwYWlyIiBzdWNoIGlu
ZWZmaWNpZW5jaWVzLgoKClN1cmUsIEkgY2FuIHJlcGxhY2UgdGhlc2UgdHdvIHdpdGggMzItYml0
IHZhcmlhbnRzLiBJZiB0aGVyZSBhcmUgbm8Kb3RoZXIgY29tbWVudHMgSSB3b24ndCByZS1zZW5k
IHRoaXMgYWdhaW4uCgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
