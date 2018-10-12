From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/6] x86/pvh: fix TSC mode setup for PVH Dom0
Date: Fri, 12 Oct 2018 09:34:35 -0600
Message-ID: <5BC0BF0B02000078001F11F1@prv1-mh.provo.novell.com>
References: <20181009094236.51522-1-roger.pau@citrix.com>
 <20181009094236.51522-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=tlq1=my=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAzSa-0005LC-0W
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:34:40 +0000
In-Reply-To: <20181009094236.51522-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjEwLjE4IGF0IDExOjQyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEEgUFZIIERvbTAgbWlnaHQgdXNlIFRTQyBzY2FsaW5nIG9yIG90aGVyIEhWTSBzcGVjaWZpYyBU
U0MKPiBhZGp1c3RtZW50cywgc28gb25seSBzaG9ydC1jaXJjdWl0IHRoZSBUU0Mgc2V0dXAgZm9y
IGEgY2xhc3NpYyBQVgo+IERvbTAuCgpIb3cgdGhhdD8KCj4gLS0tIGEveGVuL2FyY2gveDg2L3Rp
bWUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiBAQCAtMjEyNSw3ICsyMTI1LDcgQEAg
dm9pZCB0c2Nfc2V0X2luZm8oc3RydWN0IGRvbWFpbiAqZCwKPiAgewo+ICAgICAgQVNTRVJUKCFp
c19zeXN0ZW1fZG9tYWluKGQpKTsKPiAgCj4gLSAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihk
KSApCj4gKyAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiBpc19oYXJkd2FyZV9kb21haW4oZCkg
KQoKVGhpcyBjb2RlIHBhdGggaXMgcmVhY2hhYmxlIG9ubHkgZnJvbSBhcmNoX2RvbWFpbl9jcmVh
dGUoKQooc2V0dGluZyBkZWZhdWx0cykgYW5kIFhFTl9ET01DVExfc2V0dHNjaW5mbyAod2hpY2gg
RG9tMCBjYW4ndAppc3N1ZSBhZ2FpbnN0IGl0c2VsZikuIFNvIGVpdGhlciB0aGVyZSdzIHNvbWUg
aW1wb3J0YW50IHBhcnQgbWlzc2luZwpmcm9tIHRoZSBkZXNjcmlwdGlvbiwgb3IgSSBmYWlsIHRv
IHNlZSB3aGF0IHVzZSB0aGlzIGNoYW5nZSBpcy4gSG1tLApvbiBhIHBsYXRmb3JtIHdoZXJlIGhv
c3RfdHNjX2lzX3NhZmUoKSByZXR1cm5zIGZhbHNlIHRoZSBzZXR0aW5nCm9mIGRlZmF1bHRzIHdv
dWxkIGhhdmUgYW4gZWZmZWN0LCBidXQgSSB0aGluayB0aGUgZGVzY3JpcHRpb24Kc2hvdWxkIHRo
ZW4gc2F5IHNvLCBpbnN0ZWFkIG9mIGdpdmluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZQpmdW5j
dGlvbmFsaXR5IHdvdWxkIGJlY29tZSBhdmFpbGFibGUgaW4gZnVsbC4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
