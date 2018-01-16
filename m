From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/2] xen-netfront: Fix race between device
	setup and open
Date: Tue, 16 Jan 2018 13:56:37 -0500
Message-ID: <de3cc880-e94e-304a-0d90-e5f90d21a734__4258.72119744799$1516128935$gmane$org@oracle.com>
References: <20180111093638.28937-1-ross.lagerwall@citrix.com>
 <20180111093638.28937-3-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=o+4p=el=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ebWPb-0002Jv-Ml
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 18:56:43 +0000
In-Reply-To: <20180111093638.28937-3-ross.lagerwall@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAwNDozNiBBTSwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4gV2hlbiBhIG5l
dGZyb250IGRldmljZSBpcyBzZXQgdXAgaXQgcmVnaXN0ZXJzIGEgbmV0ZGV2IGZhaXJseSBlYXJs
eSBvbiwKPiBiZWZvcmUgaXQgaGFzIHNldCB1cCB0aGUgcXVldWVzIGFuZCBpcyBhY3R1YWxseSB1
c2FibGUuIEEgdXNlcnNwYWNlIHRvb2wKPiBsaWtlIE5ldHdvcmtNYW5hZ2VyIHdpbGwgaW1tZWRp
YXRlbHkgdHJ5IHRvIG9wZW4gaXQgYW5kIGFjY2VzcyBpdHMgc3RhdGUKPiBhcyBzb29uIGFzIGl0
IGFwcGVhcnMuIFRoZSBidWcgY2FuIGJlIHJlcHJvZHVjZWQgYnkgaG90cGx1Z2dpbmcgVklGcwo+
IHVudGlsIHRoZSBWTSBydW5zIG91dCBvZiBncmFudCByZWZzLiBJdCByZWdpc3RlcnMgdGhlIG5l
dGRldiBidXQgZmFpbHMKPiB0byBzZXQgdXAgYW55IHF1ZXVlcyAoc2luY2UgdGhlcmUgYXJlIG5v
IG1vcmUgZ3JhbnQgcmVmcykuIEluIHRoZQo+IG1lYW50aW1lLCBOZXR3b3JrTWFuYWdlciBvcGVu
cyB0aGUgZGV2aWNlIGFuZCB0aGUga2VybmVsIGNyYXNoZXMgdHJ5aW5nCj4gdG8gYWNjZXNzIHRo
ZSBxdWV1ZXMgKG9mIHdoaWNoIHRoZXJlIGFyZSBub25lKS4KPgo+IEZpeCB0aGlzIGluIHR3byB3
YXlzOgo+ICogRm9yIGluaXRpYWwgc2V0dXAsIHJlZ2lzdGVyIHRoZSBuZXRkZXYgbXVjaCBsYXRl
ciwgYWZ0ZXIgdGhlIHF1ZXVlcwo+IGFyZSBzZXR1cC4gVGhpcyBhdm9pZHMgdGhlIHJhY2UgZW50
aXJlbHkuCj4gKiBEdXJpbmcgYSBzdXNwZW5kL3Jlc3VtZSBjeWNsZSwgdGhlIGZyb250ZW5kIHJl
Y29ubmVjdHMgdG8gdGhlIGJhY2tlbmQKPiBhbmQgdGhlIHF1ZXVlcyBhcmUgcmVjcmVhdGVkLiBJ
dCBpcyBwb3NzaWJsZSAodGhvdWdoIGhpZ2hseSB1bmxpa2VseSkgdG8KPiByYWNlIHdpdGggc29t
ZXRoaW5nIG9wZW5pbmcgdGhlIGRldmljZSBhbmQgYWNjZXNzaW5nIHRoZSBxdWV1ZXMgYWZ0ZXIK
PiB0aGV5IGhhdmUgYmVlbiBkZXN0cm95ZWQgYnV0IGJlZm9yZSB0aGV5IGhhdmUgYmVlbiByZWNy
ZWF0ZWQuIEV4dGVuZCB0aGUKPiByZWdpb24gY292ZXJlZCBieSB0aGUgcnRubCBzZW1hcGhvcmUg
dG8gcHJvdGVjdCBhZ2FpbnN0IHRoaXMgcmFjZS4gVGhlcmUKPiBpcyBhIHBvc3NpYmlsaXR5IHRo
YXQgd2UgZmFpbCB0byByZWNyZWF0ZSB0aGUgcXVldWVzIHNvIGNoZWNrIGZvciB0aGlzCj4gaW4g
dGhlIG9wZW4gZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9z
cy5sYWdlcndhbGxAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJv
cmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
