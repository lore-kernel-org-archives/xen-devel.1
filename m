From: Jim Fehlig <jfehlig@suse.com>
Subject: Re: libvirtd hang on CentOS6 after latest updates
Date: Wed, 25 Jul 2018 10:58:55 -0600
Message-ID: <8d51c1cc-f2d4-5037-396b-5b2c033c744c@suse.com>
References: <7e0dd5bb-cd78-6f6c-810c-766060da29bf@karlos.cz>
 <a4725ddd-6ec4-8e44-2d67-6d91dd809a62@suse.com>
 <CAFLBxZbiGrK8uwpuxY4SmALm17au7uHEH7fy0OyN7y4-kP94qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=u8ay=kj=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1fiN7t-0004Gx-7A
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 16:59:01 +0000
In-Reply-To: <CAFLBxZbiGrK8uwpuxY4SmALm17au7uHEH7fy0OyN7y4-kP94qw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Karel Hendrych <k+centosvirt@karlos.cz>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjUvMjAxOCAxMDoxNyBBTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiBXZWQsIEp1
bCAyNSwgMjAxOCBhdCA0OjQyIFBNLCBKaW0gRmVobGlnIDxqZmVobGlnQHN1c2UuY29tPiB3cm90
ZToKPj4gT24gMDcvMjIvMjAxOCAwNDowMyBQTSwgS2FyZWwgSGVuZHJ5Y2ggd3JvdGU6Cj4+Pgo+
Pj4gSGksIEkgYW0gc2VlaW5nIGZyZXF1ZW50IGxpYnZpcnRkIGhhbmdzIChjbGllbnRzIG5vdCBy
ZXNwb25kaW5nKSBhZnRlcgo+Pj4gbGFzdCBDZW50T1M2LVhlbiB1cGRhdGUgOgo+Pgo+Pgo+PiB4
ZW4tZGV2ZWwgaXMgbm90IHRoZSBiZXN0IHBsYWNlIHRvIHNlZWsgaGVscCB3aXRoIGRvd25zdHJl
YW0gaXNzdWVzLAo+PiBwYXJ0aWN1bGFybHkgbGlidmlydCBvbmVzIDotKS4gWW91IHdvdWxkIGhh
dmUgYmV0dGVyIGx1Y2sgY29udGFjdGluZyB0aGUKPj4gQ2VudE9TNiBtYWludGFpbmVycy4KPiAK
PiBJbiB0aGlzIGNhc2UsIGl0IGxvb2tzIHZlcnkgbXVjaCBsaWtlIHRoZXkncmUgc3VpbmcgdGhl
IFZpcnQgU0lHCj4gYmluYXJpZXMsIHdoaWNoIGFyZSBwcmV0dHkgY2xvc2UgdG8gYmVpbmcgc3Ry
YWlnaHQtdXAgcGFja2luZyBvZiB0aGUKPiB1cHN0cmVhbSB0YXJiYWxscywgYW5kIHRoZSBtYWlu
dGFpbmVycyB3b3VsZCBiZSBBbnRob255ICYgSS4gIEFuZCBJIGF0Cj4gbGVhc3Qga25vdyB2ZXJ5
IGxpdHRsZSBhYm91dCBsaWJ2aXJ0LiAgSWYgS2FyZWwgaGFkIHBvc3RlZCB0aGlzIG9uCj4gY2Vu
dG9zLWRldmVsLCBJIHdvdWxkIGFsbW9zdCBjZXJ0YWlubHkgaGF2ZSBlbmRlZCB1cCBhc2tpbmcg
aGltIHRvCj4gcmVwb3N0IHRvIHhlbi1kZXZlbCBhbnl3YXksIGF0IHdoaWNoIHBvaW50IEkgd291
bGQgaGF2ZSBjYydkIHlvdS4gOi0pCgpIZWgsIG9rIDotKS4KCj4gRG9lcyB0aGUgZXJyb3Igcmlu
ZyBhbnkgYmVsbHM/CgpUaGUgdWRldiBtZXNzYWdlcyBhcmUgJ2RlYnVnJyBsZXZlbCAobm90IGZh
dGFsKSBhbmQgdW5yZWxhdGVkIElNTy4gSXQgd291bGQgYmUgCmJlc3QgdG8gYXR0YWNoIGdkYiB0
byB0aGUgbGlidmlydGQgcHJvY2VzcyBhbmQgZ2V0IGEgYmFja3RyYWNlIG9mIGFsbCB0aHJlYWRz
LgoKUmVnYXJkcywKSmltCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
