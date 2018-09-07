From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/netfront: fix waiting for xenbus state
 change
Date: Fri, 7 Sep 2018 09:46:21 -0400
Message-ID: <70297033-99c8-f5b0-a36c-652594706c1c__9847.95486224375$1536327838$gmane$org@oracle.com>
References: <20180907122130.30810-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oxwu=lv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fyH4U-00042z-BK
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 13:45:14 +0000
In-Reply-To: <20180907122130.30810-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: davem@davemloft.net, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDcvMjAxOCAwODoyMSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgODIy
ZmIxOGE4MmFiYSAoInhlbi1uZXRmcm9udDogd2FpdCB4ZW5idXMgc3RhdGUgY2hhbmdlIHdoZW4g
bG9hZAo+IG1vZHVsZSBtYW51YWxseSIpIGFkZGVkIGEgbmV3IHdhaXQgcXVldWUgdG8gd2FpdCBv
biBmb3IgYSBzdGF0ZSBjaGFuZ2UKPiB3aGVuIHRoZSBtb2R1bGUgaXMgbG9hZGVkIG1hbnVhbGx5
LiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzIG5vIHdha2V1cAo+IGFueXdoZXJlIHRvIHN0b3AgdGhh
dCB3YWl0aW5nLgo+Cj4gSW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhIG5ldyB3YWl0IHF1ZXVlIHJl
bmFtZSB0aGUgZXhpc3RpbmcKPiBtb2R1bGVfdW5sb2FkX3EgdG8gbW9kdWxlX3dxIGFuZCB1c2Ug
aXQgZm9yIGJvdGggcHVycG9zZXMgKGxvYWRpbmcgYW5kCj4gdW5sb2FkaW5nKS4KPgo+IEFzIGFu
eSBzdGF0ZSBjaGFuZ2Ugb2YgdGhlIGJhY2tlbmQgbWlnaHQgYmUgaW50ZW5kZWQgdG8gc3RvcCB3
YWl0aW5nCj4gZG8gdGhlIHdha2VfdXBfYWxsKCkgaW4gYW55IGNhc2Ugd2hlbiBuZXRiYWNrX2No
YW5nZWQoKSBpcyBjYWxsZWQuCj4KPiBGaXhlczogODIyZmIxOGE4MmFiYSAoInhlbi1uZXRmcm9u
dDogd2FpdCB4ZW5idXMgc3RhdGUgY2hhbmdlIHdoZW4gbG9hZCBtb2R1bGUgbWFudWFsbHkiKQo+
IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIzQuMTgKPiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNr
eSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
