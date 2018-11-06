From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC 15/16] xen/arm: Implement Set/Way operations
Date: Tue, 6 Nov 2018 17:34:57 +0000
Message-ID: <6f09ab9e-93a2-0d0f-4dbe-0dd6dd1041a5@arm.com>
References: <20181008183352.16291-1-julien.grall@arm.com>
 <20181008183352.16291-16-julien.grall@arm.com>
 <alpine.DEB.2.10.1811051244320.18518@sstabellini-ThinkPad-X260>
 <cafc35cb-857d-b892-1791-eb0c83d647b9@arm.com>
 <alpine.DEB.2.10.1811060927560.18518@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1811060927560.18518@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA2LzExLzIwMTggMTc6MzEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDUgTm92IDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IFRoaXMgd2ls
bCBhZmZlY3QgYWxsIHRoZSByZWdpc3RlcnMgdHJhcHBlZCB3aXRoIFRWTS4gU2hvdWxkbid0IHdl
IG9ubHkKPj4+IGNhbGwgcDJtX3RvZ2dsZV9jYWNoZSB3aGVuIHJlbGV2YW50PyBpLmUuIHdoZW4g
Y2hhbmdpbmcgU0NUTFI/Cj4+PiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBvbmx5IG1v
ZGlmeSB0aGUgU0NUTFIgZW11bGF0aW9uIGhhbmRsZXIuCj4+Cj4+IFRoaXMgaXMgbWFkZSBvbiBw
dXJwb3NlLCB5b3UgaW5jcmVhc2UgdGhlIGNoYW5jZSB0byBkaXNhYmxlIFRWTSBhcyBzb29uIGFz
Cj4+IHBvc3NpYmxlLiBJZiB5b3Ugb25seSByZWx5IG9uIFNDVExSLCB5b3UgbWF5IGVuZCB1cCB0
byB0cmFwIGEgbG90IG9mIHJlZ2lzdGVycwo+PiBmb3IgYSBsb25nIHRpbWUuCj4+Cj4+IEZXSVcs
IGFzIEkgYWxyZWFkeSB3cm90ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIHRoaXMgaXMgYmFzZWQg
b24gd2hhdCBLVk0KPj4gZG9lcy4KPiAKPiBJIG1pc3NlZCB0aGF0LiBBcyB5b3UgZXhwbGFpbiBp
dCwgaXQgbWFrZXMgc2Vuc2UuIE1heWJlIHdvcnRoIGFkZGluZyBhbgo+IGV4cGxpY2l0IHN0YXRl
bWVudCBhYm91dCBpdDogIk9uIEFSTTY0LCB3ZSBjYWxsIHAybV90b2dnbGVfY2FjaGUgZnJvbSBv
bgo+IHRoZSBUVk0tdHJhcHBlZCByZWdpc3RlciBoYW5kbGVycyB0byBpbmNyZWFzZSB0aGUgY2hh
bmNlcyBvZiBkaXNhYmxpbmcKPiBUVk0gYXMgc29vbiBhcyBwb3NzaWJsZS4iCgpJIGFtIGFzc3Vt
aW5nIHlvdSBtZWFudCBhcm0zMiBoZXJlPyBMb29raW5nIGF0IHRoZSBjb2RlLCBpdCBsb29rcyBs
aWtlIEkgCmltcGxlbWVudGVkIHRoZSBhcm02NCBkaWZmZXJlbnRseS4gQnV0IHdlIHByb2JhYmx5
IHdhbnQgYXBwbHkgdG8gY2FsbCAKcDJtX3RvZ2dsZV9jYWNoZSBpbiBhbGwgVFZNIHRyYXBwZWQg
cmVnaXN0ZXJzLgoKVGhpcyB3b3VsZCBrZWVwIHRoZSBsb2dpYyBldmVyeXdoZXJlIHRoZSBzYW1l
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
