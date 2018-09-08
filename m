From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen/netfront: fix waiting for xenbus state
 change
Date: Fri, 07 Sep 2018 23:03:48 -0700 (PDT)
Message-ID: <20180907.230348.33221589667753465.davem__25020.5343626023$1536386574$gmane$org@davemloft.net>
References: <20180907122130.30810-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vwjv=lw=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1fyWLX-0001AQ-PX
 for xen-devel@lists.xenproject.org; Sat, 08 Sep 2018 06:03:51 +0000
In-Reply-To: <20180907122130.30810-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpEYXRlOiBGcmksICA3IFNlcCAy
MDE4IDE0OjIxOjMwICswMjAwCgo+IENvbW1pdCA4MjJmYjE4YTgyYWJhICgieGVuLW5ldGZyb250
OiB3YWl0IHhlbmJ1cyBzdGF0ZSBjaGFuZ2Ugd2hlbiBsb2FkCj4gbW9kdWxlIG1hbnVhbGx5Iikg
YWRkZWQgYSBuZXcgd2FpdCBxdWV1ZSB0byB3YWl0IG9uIGZvciBhIHN0YXRlIGNoYW5nZQo+IHdo
ZW4gdGhlIG1vZHVsZSBpcyBsb2FkZWQgbWFudWFsbHkuIFVuZm9ydHVuYXRlbHkgdGhlcmUgaXMg
bm8gd2FrZXVwCj4gYW55d2hlcmUgdG8gc3RvcCB0aGF0IHdhaXRpbmcuCj4gCj4gSW5zdGVhZCBv
ZiBpbnRyb2R1Y2luZyBhIG5ldyB3YWl0IHF1ZXVlIHJlbmFtZSB0aGUgZXhpc3RpbmcKPiBtb2R1
bGVfdW5sb2FkX3EgdG8gbW9kdWxlX3dxIGFuZCB1c2UgaXQgZm9yIGJvdGggcHVycG9zZXMgKGxv
YWRpbmcgYW5kCj4gdW5sb2FkaW5nKS4KPiAKPiBBcyBhbnkgc3RhdGUgY2hhbmdlIG9mIHRoZSBi
YWNrZW5kIG1pZ2h0IGJlIGludGVuZGVkIHRvIHN0b3Agd2FpdGluZwo+IGRvIHRoZSB3YWtlX3Vw
X2FsbCgpIGluIGFueSBjYXNlIHdoZW4gbmV0YmFja19jaGFuZ2VkKCkgaXMgY2FsbGVkLgo+IAo+
IEZpeGVzOiA4MjJmYjE4YTgyYWJhICgieGVuLW5ldGZyb250OiB3YWl0IHhlbmJ1cyBzdGF0ZSBj
aGFuZ2Ugd2hlbiBsb2FkIG1vZHVsZSBtYW51YWxseSIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPiAjNC4xOAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KCkFwcGxpZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
