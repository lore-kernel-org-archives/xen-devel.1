From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Fri, 05 Oct 2018 09:05:28 -0600
Message-ID: <5BB77DB802000078001EEF6A@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <64d542e2-dc22-f157-5b71-2e5c82bdd6b7@citrix.com>
 <6c5acfad-7390-c21b-65c6-97e85d292315@citrix.com>
 <5BB76A9E02000078001EEE9E@prv1-mh.provo.novell.com>
 <d3af6b3b-6c0a-7c0c-95c6-fa6e23f5616e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vier=mr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g8RfX-0000nS-7P
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 15:05:31 +0000
In-Reply-To: <d3af6b3b-6c0a-7c0c-95c6-fa6e23f5616e@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE2OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDUvMTAvMTggMTQ6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNS4x
MC4xOCBhdCAxNDozOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MDMvMTAvMTggMTk6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gTWFrZWZpbGU6MTM2OiBy
ZWNpcGUgZm9yIHRhcmdldCAnL2xvY2FsL3hlbi5naXQveGVuL3hlbicgZmFpbGVkCj4+Pj4gbWFr
ZVsxXTogKioqIFsvbG9jYWwveGVuLmdpdC94ZW4veGVuXSBFcnJvciAyCj4+Pj4gTWFrZWZpbGU6
NDU6IHJlY2lwZSBmb3IgdGFyZ2V0ICdidWlsZCcgZmFpbGVkCj4+Pj4gbWFrZTogKioqIFtidWls
ZF0gRXJyb3IgMgo+Pj4+Cj4+Pj4gVXNpbmcgTEQgMi4zMCBidWlsdCBmcm9tIHNvdXJjZSBpcyBm
aW5lLCBidXQgSSdtIG5vdCBzdXJlIGV4YWN0bHkgd2hhdAo+Pj4+IGlzIGdvaW5nIG9uIGhlcmUu
Cj4+PiBBY3R1YWxseSwgSSd2ZSBqdXN0IGVuY291bnRlcmVkIHRoaXMgZmFpbHVyZSB0byBsaW5r
IG9uIHN0YWdpbmcgYXMgd2VsbCwKPj4+IHNvIGl0IGlzIGNsZWFybHkgbm90IHJlbGF0ZWQgdG8g
dGhpcyBzZXJpZXMuICBTb3JyeSBmb3IgdGhlIG5vaXNlIChidXQKPj4+IEknbSBzdGlsbCBub24t
dGhlLXdpc2VyIGFzIHRvIHdoYXQgaXMgYWN0dWFsbHkgYnJva2VuKS4KPj4gQ291bGQgeW91IHRy
eSAyLjMxLjE/IE9mIGNvdXJzZSBJIGRpZCB1c2UgMi4zMCB1bnRpbCAyLjMxIHdlbnQgb3V0LAo+
PiBhbmQgc3RpbGwgZGlkbid0IHNlZSB0aGlzLiBZZXQgdGhlbiBhZ2FpbiBteSB2YXJpYW50IGlz
IG5vdCBleGFjdGx5Cj4+IHZhbmlsbGEuCj4gCj4gSSBjb3VsZCAod2hlbiBJJ3ZlIGdvdCB0aW1l
IHRvIHJlY29tcGlsZSBteSBub24tZGVmYXVsdCBjb21waWxlcnMpLCBidXQKPiB3aGF0IGlzIHRo
aXMgZ29pbmcgdG8gZGVtb25zdHJhdGU/ICBJIHdvdWxkbid0IGV4cGVjdCAyLjMxIHRvIGJlIGJy
b2tlbgo+IHdoZW4gMi4zMCB3b3JrcyBmaW5lLgoKT2gsIHNvcnJ5IC0gSSBtaXMtcmVhZCB5b3Vy
IG9yaWdpbmFsIHN0YXRlbWVudC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
