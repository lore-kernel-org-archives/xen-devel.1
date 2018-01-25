From: "msd+xen-devel@msd.im" <msd+xen-devel@msd.im>
Subject: Re: [Xen EFI] Impossible to limit the dom0 memory
Date: Thu, 25 Jan 2018 12:16:10 +0100
Message-ID: <9a1b2db6-a5cf-be6b-d403-d68386d2e931@msd.im>
References: <54c84622-01da-6cbd-1c3e-3cbbb66ad44d@msd.im>
 <5A67493902000078001A1924@prv-mh.provo.novell.com>
 <5fe79d73-8b29-5ad6-831d-a509bccf6970@msd.im>
 <5A68472302000078001A1C8C@prv-mh.provo.novell.com>
 <864eea58-74a5-f005-60a4-5549805df3eb@msd.im>
 <5A69C21602000078001A24A3@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i0y5=eu=msd.im=msd+xen-devel@srs-us1.protection.inumbo.net>)
 id 1eefW1-0008BT-QW
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 11:16:21 +0000
In-Reply-To: <5A69C21602000078001A24A3@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

IyBBYm91dCB0aGUga2VybmVsIGNyYXNoCgo+IERpZCB5b3UgcmVhZCB0aGUgYWJvdmU/CgpJIGp1
c3Qgd2FudGVkIHRvIHNheSB0aGF0IEkgaGF2ZSBzb2x2ZWQgdGhlIGtlcm5lbCBwYW5pYyBjcmFz
aCB0aGF0IEkgCmhhZCBiZWZvcmUsIHdoZW4geW91IGV4cGxhaW5lZCAiWGVuIGRvZXNuJ3QgY3Jh
c2ggYXQgYWxsLiBJdCdzIHRoZSBEb20wIAprZXJuZWwgd2hpY2ggcGFuaWNzIi4KCkp1c3QgZm9y
IGluZm9ybWF0aW9uIHRoZSBjcmFzaCBoYXBwZW5zIGlmIEkgcHV0IHRoZSAiY29uc29sZT1jb20x
IiB0byAKdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuCgpgYGAKa2VybmVsPXZtbGludXogcm9vdD0v
ZGV2L21kMiBybyByb290ZGVsYXk9MTAgbm9xdWlldCBub3NwbGFzaCAKZWFybHlwcmludGs9eGVu
IGNvbnNvbGU9Y29tMQpgYGAKCkFuZCB0aGlzLCBJIHVuZGVyc3RhbmQsIGlzIG5vdCBsaW5rZWQg
dG8gWGVuLgoKIyBBYm91dCB0aGUgWGVuIERvbTAgY3Jhc2gKCj4gVGhpcyB0ZWxscyB1cyAodG9n
ZXRoZXIgd2l0aCB0aGUgcGFnZSBmYXVsdCBlcnJvciBjb2RlKSB0aGF0IHRoZQo+IERvbTAga2Vy
bmVsIHRyaWVkIHRvIHByb3ZpZGUgbWVtb3J5IGFzIGtlcm5lbCBzdGFjayB3aGljaAo+IGNhbid0
IGJlIHdyaXR0ZW4uIFRoaXMgbWF5IGJlIGEgRG9tMCBrZXJuZWwgc3RhY2sgb3ZlcmZsb3csCj4g
YnV0IHRoZXJlIG1heSBhbHNvIGJlIG90aGVyIHJlYXNvbnMuIEF0IHRoaXMgcG9pbnQgSSBjYW4n
dAo+IGV4Y2x1ZGUgdGhlcmUgYmVpbmcgc29tZSByb290IGNhdXNlIGluIFhlbiwgYnV0IHRoZSBp
c3N1ZQo+IG5lZWRzIHRvIGJlIGludmVzdGlnYXRlZCBmcm9tIHRoZSBEb20wIGtlcm5lbCBzaWRl
LgoKSSBoYXZlIHRlc3RlZCB3aXRoIHRoZSB2ZXJzaW9uIDQuOSBhbmQgNC4xNCBvZiB0aGUga2Vy
bmVsIGZyb20gRGViaWFuIAphbmQgdGhlIGNyYXNoIG9jY3VycyB3aGVuIHRoZXJlIGlzIHRoZSBv
cHRpb24gImRvbTBfbWVtPTFHLG1heDoxRyIuCgpodHRwczovL3BhY2thZ2VzLmRlYmlhbi5vcmcv
c3RyZXRjaC9saW51eC1pbWFnZS1hbWQ2NApodHRwczovL3BhY2thZ2VzLmRlYmlhbi5vcmcvc3Ry
ZXRjaC1iYWNrcG9ydHMvbGludXgtaW1hZ2UtYW1kNjQKCkRvIHlvdSB3YW50IHRoYXQgSSB0ZXN0
IHNvbWV0aGluZyBlbHNlID8KClJlZ2FyZHMsCgoKR3VpbGxhdW1lCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
