From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] firmware/shim : filter output files
 during Xen tree setup
Date: Fri, 27 Jul 2018 02:34:32 -0600
Message-ID: <5B5AD91802000078001D8662@prv1-mh.provo.novell.com>
References: <1532639806-21606-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mek3=kl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fiyCp-0003rl-Fw
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 08:34:35 +0000
In-Reply-To: <1532639806-21606-1-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA3LjE4IGF0IDIzOjE2LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEV4Y2x1ZGUgbmFtZWQgb3V0cHV0IGZpbGVzIGZyb20gdGhlIFhlbiB0cmVlIHNl
dHVwLgo+IAo+IFRoZSBsaW5rZmFybS5zdGFtcCBjb250ZW50IHdpbGwgZGlmZmVyIGJldHdlZW4g
dG9wIGxldmVsICJtYWtlIgo+IGFuZCAibWFrZSBpbnN0YWxsIiBpbnZvY2F0aW9ucywgZHVlIHRv
IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlc2UKPiBvdXRwdXQgZmlsZXMgdGhhdCBhcmUgcHJvZHVj
ZWQgZHVyaW5nIHRoZSAibWFrZSIgYnVpbGQuCj4gCj4gRmlsdGVyIHRoZXNlIG91dCB0byBwcmV2
ZW50IGFuIHVubmVjZXNzYXJ5IHJlYnVpbGQgb2YgdGhlIHNoaW0KPiBkdXJpbmcgIm1ha2UgaW5z
dGFsbCIsIGFmdGVyICJtYWtlIiB3aXRoaW4gYSBmcmVzaCBzb3VyY2UgdHJlZS4KPiAKPiBFeGNs
dWRlZCBmcm9tIGNvbnNpZGVyYXRpb24gd2l0aCB0aGlzIGNoYW5nZTogZGlmZmVyZW5jZXMgaW4g
c3RhbXAKPiBjb250ZW50IHdoZW4gcGVyZm9ybWluZyBpbmNyZW1lbnRhbCBidWlsZHMgaW4gYW4g
ZXhpc3RpbmcgdHJlZS4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIChhcyB3ZWxsIGFzIHlvdSBt
b3N0IHJlY2VudCByZW1hcmsgb24gdGhlCnYyIHRocmVhZCk6IFRoZSAibWFrZSBpbnN0YWxsIiBp
bnZvY2F0aW9uIF9pc18gYW4gaW5jcmVtZW50YWwKcmVidWlsZC4gSGVuY2UgSSBkb24ndCB1bmRl
cnN0YW5kIGhvdyBleGNsdWRpbmcgc29tZSBidXQgbm90IGFsbApnZW5lcmF0ZWQgZmlsZXMgaGVs
cHMuIEJ1dCBJJ20gbm90IGdvaW5nIHRvIGV4Y2x1ZGUgdGhhdCB0aGlzIGlzCnNpbXBseSBiZWNh
dXNlIEkgZG9uJ3QgdW5kZXJzdGFuZCB3ZWxsIGVub3VnaCB0aGUgbG9naWMgaW4KeGVuLWRpci9N
YWtlZmlsZSB3aGVuIHRvIHRyaWdnZXIgYSByZWJ1aWxkLgoKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgo+IC0tLQo+
IENoYW5nZXMgaW4gdjM6IGFkZGVkICcueGVuLmVmaS4qJyAnLnhlbi1zeW1zLionIHRvIHRoZSBl
eGNsdWRlIGxpc3QuCj4gCj4gVGVzdGVkIHdpdGg6IFhlbiA0LjEwLjEsIDQuMTEuMCBhbmQgc3Rh
Z2luZywKPiBZb2N0byBwb2t5LCBPcGVuRW1iZWRkZWQgbWV0YS1vcGVuZW1iZWRkZWQsIG1ldGEt
dmlydHVhbGl6YXRpb24KPiB3aXRoIGJpbnV0aWxzIDIuMy4wIHdpdGggeDg2XzY0LXBlcCB0YXJn
ZXQgZW5hYmxlZC4KCkkgc2luY2VyZWx5IGhvcGUgeW91IG1lYW4gMi4zMCBvciBzb21lIHN1Y2gg
KGhhbGZ3YXkgcmVjZW50KSBoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
