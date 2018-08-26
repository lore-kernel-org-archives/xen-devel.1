From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 2/2] x86/pae: use 64 bit atomic xchg
 function in native_ptep_get_and_clear
Date: Sun, 26 Aug 2018 12:25:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1808261224440.1195__15720.7217569978$1535279067$gmane$org@nanos.tec.linutronix.de>
References: <20180821153755.30462-1-jgross@suse.com>
 <20180821153755.30462-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fs1w=lj=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1ftsEb-0005tc-Dn
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 10:25:29 +0000
In-Reply-To: <20180821153755.30462-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, hpa@zytor.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMSBBdWcgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKCj4gVXNpbmcgb25seSAz
Mi1iaXQgd3JpdGVzIGZvciB0aGUgcHRlIHdpbGwgcmVzdWx0IGluIGFuIGludGVybWVkaWF0ZQo+
IEwxVEYgdnVsbmVyYWJsZSBQVEUuIFdoZW4gcnVubmluZyBhcyBhIFhlbiBQViBndWVzdCB0aGlz
IHdpbGwgYXQgb25jZQo+IHN3aXRjaCB0aGUgZ3Vlc3QgdG8gc2hhZG93IG1vZGUgcmVzdWx0aW5n
IGluIGEgbG9zcyBvZiBwZXJmb3JtYW5jZS4KPiAKPiBVc2UgYXJjaF9hdG9taWM2NF94Y2hnKCkg
aW5zdGVhZCB3aGljaCB3aWxsIHBlcmZvcm0gdGhlIHJlcXVlc3RlZAo+IG9wZXJhdGlvbiBhdG9t
aWNhbGx5IHdpdGggYWxsIDY0IGJpdHMuCj4gCj4gU29tZSBwZXJmb3JtYW5jZSBjb25zaWRlcmF0
aW9ucyBhY2NvcmRpbmcgdG86Cj4gCj4gaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vc2l0ZXMv
ZGVmYXVsdC9maWxlcy9tYW5hZ2VkL2FkL2RjL0ludGVsLVhlb24tU2NhbGFibGUtUHJvY2Vzc29y
LXRocm91Z2hwdXQtbGF0ZW5jeS5wZGYKPiAKPiBUaGUgbWFpbiBudW1iZXIgc2hvdWxkIGJlIHRo
ZSBsYXRlbmN5LCBhcyB0aGVyZSBpcyBubyB0aWdodCBsb29wIGFyb3VuZAo+IG5hdGl2ZV9wdGVw
X2dldF9hbmRfY2xlYXIoKS4KPiAKPiAibG9jayBjbXB4Y2hnOGIiIGhhcyBhIGxhdGVuY3kgb2Yg
MjAgY3ljbGVzLCB3aGlsZSAibG9jayB4Y2hnIiAod2l0aCBhCj4gbWVtb3J5IG9wZXJhbmQpIGlz
bid0IG1lbnRpb25lZCBpbiB0aGF0IGRvY3VtZW50LiAibG9jayB4YWRkIiAod2l0aCB4YWRkCj4g
aGF2aW5nIDMgY3ljbGVzIGxlc3MgbGF0ZW5jeSB0aGFuIHhjaGcpIGhhcyBhIGxhdGVuY3kgb2Yg
MTEsIHNvIHdlIGNhbgo+IGFzc3VtZSBhIGxhdGVuY3kgb2YgMTQgZm9yICJsb2NrIHhjaGciLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmll
d2VkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
