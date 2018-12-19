From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/netfront: tolerate frags with no data
Date: Wed, 19 Dec 2018 07:02:52 +0100
Message-ID: <425ca7b2-de7b-0490-0f10-e64dce1a6e28__40714.6174613901$1545199293$gmane$org@suse.com>
References: <20181218150619.6964-1-jgross@suse.com>
 <20181218.220013.1743575331051422957.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=O4Zs=O4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gZUwZ-0006od-Is
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 06:02:55 +0000
In-Reply-To: <20181218.220013.1743575331051422957.davem@davemloft.net>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Miller <davem@davemloft.net>
Cc: sstabellini@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTIvMjAxOCAwNzowMCwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+IEZyb206IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBEYXRlOiBUdWUsIDE4IERlYyAyMDE4IDE2OjA2OjE5
ICswMTAwCj4gCj4+IEF0IGxlYXN0IG9sZCBYZW4gbmV0IGJhY2tlbmRzIHNlZW0gdG8gc2VuZCBm
cmFncyB3aXRoIG5vIHJlYWwgZGF0YQo+PiBzb21ldGltZXMuIEluIGNhc2Ugc3VjaCBhIGZyYWdt
ZW50IGhhcHBlbnMgdG8gb2NjdXIgd2l0aCB0aGUgZnJhZyBsaW1pdAo+PiBhbHJlYWR5IHJlYWNo
ZWQgdGhlIGZyb250ZW5kIHdpbGwgQlVHIGN1cnJlbnRseSBldmVuIGlmIHRoaXMgc2l0dWF0aW9u
Cj4+IGlzIGVhc2lseSByZWNvdmVyYWJsZS4KPj4KPj4gTW9kaWZ5IHRoZSBCVUdfT04oKSBjb25k
aXRpb24gYWNjb3JkaW5nbHkuCj4+Cj4+IFRlc3RlZC1ieTogRGlldG1hciBIYWhuIDxkaWV0bWFy
LmhhaG5AdHMuZnVqaXRzdS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPiAKPiBBcHBsaWVkIGFuZCBxdWV1ZWQgdXAgZm9yIC1zdGFibGUuCj4g
Cj4gQnV0IG1hbnkgb2YgdGhlc2UgQlVHJ3MgaW4gdGhlIGRyaXZlciBzaG91bGQgYmUgY29udmVy
dGVkIHRvCj4gV0FSTnMgYW5kIHJlY292ZXJ5IGNvZGUgYWRkZWQuCj4gCgpSaWdodCwgYnV0IHRo
YXQgd2lsbCBiZSBubyBzdGFibGUgbWF0ZXJpYWwgdGhlbi4gV2lsbCBzdGFydCB0aGF0IGVmZm9y
dAphZnRlciBDaHJpc3RtYXMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
