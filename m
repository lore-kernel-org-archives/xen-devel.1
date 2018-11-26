From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 16:25:05 +0100
Message-ID: <b8bc03f0-d305-951d-b11d-d44caa9b61f9@suse.com>
References: <20181123132516.28681-1-jgross@suse.com>
 <5BFBD1C602000078001FFE09@prv1-mh.provo.novell.com>
 <23548.2354.97061.49099@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xwch=of=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRIl2-0003bX-TU
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:25:08 +0000
In-Reply-To: <23548.2354.97061.49099@mariner.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMTEvMjAxOCAxNTo1NCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2ggd3Jp
dGVzICgiUmU6IFtQQVRDSF0geGVuOiBvbmx5IGNsb2JiZXIgbXVsdGljYWxsIGVsZW1lbnRzIHdp
dGhvdXQgZXJyb3IiKToKPj4gT24gMjMuMTEuMTggYXQgMTQ6MjUsIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOgo+Pj4gSW4gZGVidWcgYnVpbGRzIHRoZSBoeXBlcnZpc29yIHdpbGwgZGVsaWJlcmF0
ZWx5IGNsb2JiZXIgcHJvY2Vzc2VkCj4+PiBlbGVtZW50cyBvZiB0aGUgbXVsdGljYWxsIHN0cnVj
dHVyZS4gSW4gb3JkZXIgdG8gZWFzZSBkaWFnbm9zdGljIGRhdGEKPj4+IHByaW50b3V0IGluIHRo
ZSBhZmZlY3RlZCBndWVzdCBvbmx5IGNsb2JiZXIgZWxlbWVudHMgd2hpY2ggZGlkbid0Cj4+PiBy
ZXR1cm4gYW4gZXJyb3IuCj4+Cj4+IEJlc2lkZXMgd2hhdCBBbmRyZXcgaGFzIHNhaWQgc3VjaCBh
IHJlbGF4YXRpb24gcmVkdWNlcwo+PiB0aGUgZ3VhcmRpbmcgYWdhaW5zdCBiYWQgZ3Vlc3Qgc2lk
ZSBjb2RlLiBJZiBhIGd1ZXN0IHJlYWxseQo+PiB3aXNoZXMgdG8gcHJvZHVjZSBkaWFnbm9zdGlj
cywgSSB0aGluayBpdCBzaG91bGQgZ28gdG8gdGhlCj4+IGxlbmd0aHMgb2YgY29weWluZyBhcmd1
bWVudHMgKGlmIHRoZXkgY2FuJ3QgYmUgcmUtY2FsY3VsYXRlZAo+PiBhbnl3YXkpLiBTdXBwcmVz
c2luZyB0aGUgY2xvYmJlcmluZyBpbiBtb3JlIGNhc2VzIG1lcmVseQo+PiBpbnZpdGVzIGd1ZXN0
cyB0byByZWFkIHRoZSBhcmd1bWVudHMgYWZ0ZXIgdGhlIGNhbGwsIHdoaWNoCj4+IHRoZXkgc2lt
cGx5IHNob3VsZCBub3QgZG8uIE5vdCBjbG9iYmVyaW5nIHRoZSB2YWx1ZXMgaW4KPj4gcmVsZWFz
ZSBidWlsZHMgaXMgYSBwZXJmb3JtYW5jZSBjaG9pY2UsIGFuZCB3ZSBvdWdodCB0byBiZQo+PiBh
bGxvd2VkIHRvIGNoYW5nZSBvdXIgb3BpbmlvbiByZWdhcmRpbmcgdGhpcyBpbXBsZW1lbnRhdGlv
bgo+PiBkZXRhaWwgYXQgYW55IHBvaW50IGluIHRpbWUuCj4gCj4gTWF5YmUgdGhleSBjb3VsZCBi
ZSBjbG9iYmVyZWQgbG9zc2xlc3NseSA/ICBFZywgYnkgeG9yaW5nIHdpdGggMHhhYSBvcgo+IHNv
bWV0aGluZy4KClRoaXMgd291bGQgYmUgcmF0aGVyIGhhY2t5OiBJJ2QgbmVlZCB0byBmaW5kIG91
dCBpZiBjbG9iYmVyaW5nIHdhcwpwZXJmb3JtZWQgb3Igbm90IGFuZCB0aGUgd2F5IG9mIGNsb2Ji
ZXJpbmcgd291bGQgYmUga2luZCBvZiBhbiBpbnRlcmZhY2UKd2hpY2ggSSBndWVzcyB3ZSdkIGxp
a2UgdG8gYXZvaWQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
