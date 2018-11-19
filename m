From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] libx86: Work around GCC bug with ebx output
 constrants
Date: Mon, 19 Nov 2018 07:21:27 -0700
Message-ID: <5BF2C6E702000078001FD7F3@prv1-mh.provo.novell.com>
References: <1542633088-11101-1-git-send-email-andrew.cooper3@citrix.com>
 <5BF2BFDE02000078001FD7D2@prv1-mh.provo.novell.com>
 <743294a2-4cee-5573-abfc-ba6817e7d32e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <743294a2-4cee-5573-abfc-ba6817e7d32e@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjExLjE4IGF0IDE1OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTEvMjAxOCAxMzo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5
LjExLjE4IGF0IDE0OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliL3g4Ni9jcHVpZC5oCj4+PiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vbGliL3g4Ni9jcHVpZC5oCj4+PiBAQCAtMjAsMjEgKzIwLDQ4IEBAIHN0cnVjdCBjcHVp
ZF9sZWFmCj4+PiAgICAgIHVpbnQzMl90IGEsIGIsIGMsIGQ7Cj4+PiAgfTsKPj4+ICAKPj4+ICsv
Kgo+Pj4gKyAqIFNvbWUgdmVyc2lvbnMgb2YgR0NDIGFyZSB1bmFibGUgdG8gY29wZSB3aXRoIHBy
ZXNlcnZpbmcgdGhlIEdPVCAoaGVsZCBpbgo+Pj4gKyAqICVlYngpIGFyb3VuZCBhbiBhc20oKSB3
aXRoIGFuICVlYnggb3V0cHV0IGNvbnN0cmFpbnQsIGFuZCBwcm9kdWNlIGEgcmF0aGVyCj4+PiAr
ICogY3J5cHRpYyBlcnJvcjoKPj4+ICsgKiAgICBlcnJvcjogaW5jb25zaXN0ZW50IG9wZXJhbmQg
Y29uc3RyYWludHMgaW4gYW4g4oCYYXNt4oCZCj4+PiArICoKPj4+ICsgKiBFeHBlcmltZW50YWxs
eSwgNjQtYml0IGJ1aWxkcyB3b3JrIGNvcnJlY3RseSwgYW5kIDMyLWJpdCBidWlsZHMgb24gR0ND
IDYgb3IKPj4+ICsgKiBsYXRlciB3b3JrIGNvcnJlY3RseS4KPj4+ICsgKgo+Pj4gKyAqIFRvIHdv
cmsgYXJvdW5kIHRoZSBpc3N1ZSwgdXNlIGEgc2VwYXJhdGUgcmVnaXN0ZXIgdG8gaG9sZCB0aGUg
dGhlIGVieAo+Pj4gKyAqIG91dHB1dCwgYW5kIHhjaGcgdHdpY2UgdG8gbGVhdmUgJWVieCBwcmVz
ZXJ2ZWQgYXJvdW5kIHRoZSBhc20oKSBzdGF0ZW1lbnQuCj4+PiArICovCj4+PiArI2lmIF9fUElD
X18gJiYgX19pMzg2X18gJiYgX19HTlVDX18gPCA2ICYmICFfX2NsYW5nX18KPj4gSSB0aGluayB5
b3UncmUgbWlzc2luZyBhIGJ1bmNoIG9mIGRlZmluZWQoKSBoZXJlLgo+IAo+IEFtIEk/ICBVbmRl
ZmluZWQgc3ltYm9scyBiZWhhdmUgYXMgaWYgdGhleSBoYWQgdGhlIHZhbHVlIDAgaW4gYW4gI2lm
CgpCdXQgY29tcGlsZXJzIG1heSB3YXJuIGluIHN1Y2ggY2FzZXMuIE9yIGVsc2UgdGhlcmUgd291
bGQgYWxtb3N0Cm5ldmVyIGJlIGEgbmVlZCB0byB1c2UgZGVmaW5lZCgpLgoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
