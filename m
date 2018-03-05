From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 02/20] x86emul: support most remaining
 AVX2 insns
Date: Mon, 05 Mar 2018 07:50:22 -0700
Message-ID: <5A9D673E02000078001AE9BD@prv-mh.provo.novell.com>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
 <5A96B57302000078001ACB87@prv-mh.provo.novell.com>
 <41511c2b-8fd1-222e-f6ee-8da280004876@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zn8f=f3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1esrRh-0000LC-6b
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 14:50:33 +0000
In-Reply-To: <41511c2b-8fd1-222e-f6ee-8da280004876@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE4IGF0IDE0OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDIvMTggMTI6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IAo+IFlvdSdyZSBt
aXNzaW5nIGEgU29CIG9uIHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2gsIGJ1dCBhc3N1bWluZyB0
aGF0Cj4gZ2V0cyBmaXhlZCwgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpUaGFua3MgYW5kIC0gb29wcywgSSBoYWQgZHJvcHBlZCBkZXNjcmlwdGlv
biBhbmQgcmV2aXNpb24gaW5mbyBhcyB3ZWxsOgoKSS5lLiB0aG9zZSBub3QgYmVpbmcgZXF1aXZh
bGVudHMgb2YgU1NFbiBvbmVzLCBidXQgd2l0aCB0aGUgZXhjZXB0aW9uCm9mIHRoZSB2YXJpb3Vz
IGdhdGhlciBvcGVyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgotLS0KdjQ6IFNwbGl0IG9mZiBBVlgyIGV4dGVuc2lvbnMgdG8gdmJyb2FkY2Fz
dHN7cyxkfS4gRHJvcCBjb21tZW50CiAgICByZWZlcnJpbmcgdG8gbm8gbG9uZ2VyIGV4aXN0aW5n
IHNpbWRfc2NhbGFyX2RxLgoKPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9l
bXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMK
Pj4gQEAgLTczMDYsNiArNzMyNSwxMSBAQCB4ODZfZW11bGF0ZSgKPj4gICAgICAgICAgb3BfYnl0
ZXMgPSA4IDw8IHZleC5sOwo+PiAgICAgICAgICBnb3RvIHNpbWRfMGZfeW1tOwo+PiAgCj4+ICsg
ICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjM4LCAweDE2KTogLyogdnBlcm1wcyB5bW0v
bTI1Nix5bW0seW1tICovCj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19WRVhfNjYoMHgwZjM4LCAw
eDM2KTogLyogdnBlcm1kIHltbS9tMjU2LHltbSx5bW0gKi8KPiAKPiBJdCBzZWVtcyBlc3BlY2lh
bGx5IG9kZCB0aGF0IHRoZXNlIGRvbid0IGNvcGUgd2l0aCB2ZXgubCBvciB2ZXgudy4gIEkKPiBj
YW4gb25seSBndWVzcyB0aGF0IGl0IGRvd24gdG8gYSBsaW1pdGF0aW9uIGluIHRoZSB2ZWN0b3Ig
cGlwZWxpbmUgd2hpY2gKPiB3YXNuJ3QgcmVzb2x2ZWQgdW50aWwgQVZYLTUxMiB3YXMgaW50cm9k
dWNlZC4KClllYWgsIHRoZXJlIGFyZSBhIGZldyBtb3JlIHN1Y2ggYW5vbWFsaWVzLCBhbHNvIGlu
IEFWWDUxMiBpaXJjLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
