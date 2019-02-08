From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 8 Feb 2019 15:23:00 +0200
Message-ID: <82b0247f-fed4-5b1c-7f7c-5ee88ea56e61@bitdefender.com>
References: <1549619775-4129-1-git-send-email-rcojocaru@bitdefender.com>
 <5C5D5F450200007800214FDD@prv1-mh.provo.novell.com>
 <4618b7c6-0fea-e33b-1218-731d8b3124a5@bitdefender.com>
 <38873a60-ef41-d85e-3766-da4d1072c53d@bitdefender.com>
 <5C5D7D0802000078002150D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5uHS=QP=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gs67W-0004Gj-Qx
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 13:23:06 +0000
In-Reply-To: <5C5D7D0802000078002150D7@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi84LzE5IDI6NTggUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlbGwsIHRvIGJlIGhvbmVz
dCBJIGV4cGVjdGVkIGRlcGVuZGVuY2llcyBsaWtlIHRoaXMgdG8gYmUgdGhlcmUsCj4gYW5kIGhl
bmNlIEkgZGlkbid0IGV4cGVjdCBpdCB3b3VsZCBiZSBhIHN0cmFpZ2h0Zm9yd2FyZCBjaGFuZ2Uu
Cj4gSnVzdCBsaWtlIHdlIGRvIGUuZy4gZm9yIHRoZSBJT01NVSBlbmFibGluZywgSSBndWVzcyB0
aGUgYm9vbGVhbgo+IHdhbnRzIHRvIGJlY29tZSBhIHRyaXN0YXRlIHRoZW4gKG9mZiAtPiBlbmFi
bGluZyAtPiBlbmFibGVkKSwKPiB3aGljaCBpbnRlcmVzdGVkIHNpdGVzIHRoZW4gY2FuIHVzZSB0
byBkaXN0aW5ndWlzaCB3aGF0IHRoZXkKPiB3YW50L25lZWQgdG8gZG8uCj4gCj4gQW5vdGhlciBy
ZWxhdGl2ZWx5IG9idmlvdXMgc29sdXRpb24gd291bGQgYmUgdG8gYWRkIGEgYm9vbGVhbgo+IHBh
cmFtZXRlciB0byBhbHRwMm1fdmNwdV91cGRhdGVfcDJtKCkgc3VjaCB0aGF0Cj4gYWx0cDJtX3Zj
cHVfaW5pdGlhbGlzZSgpIGNhbiBndWlkZSBpdCBwcm9wZXJseS4gQnV0IHRoaXMgb2YgY291cnNl
Cj4gZGVwZW5kcyB0byBhIGNlcnRhaW4gZGVncmVlIG9uIGhvdyB3aWRlIHNwcmVhZCB0aGUgcHJv
YmxlbSBpcy4KCkZhaXIgZW5vdWdoLCBJJ2xsIGF0dGVtcHQgVjIgd2l0aCB0aGUgc2Vjb25kIHN1
Z2dlc3Rpb24gKGFkZGluZyBhIGJvb2wgCnRvIGFsdHAybV92Y3B1X3VwZGF0ZV9wMm0oKSkuCgoK
UmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
