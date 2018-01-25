From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v10 09/11] x86/ctxt: Issue a speculation
 barrier between vcpu contexts
Date: Thu, 25 Jan 2018 16:48:43 +0000
Message-ID: <6eadf5f8-4479-0c02-f707-106e92fbacec@citrix.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-10-git-send-email-andrew.cooper3@citrix.com>
 <5A6A0C7A02000078001A275A@prv-mh.provo.novell.com>
 <345bd2ef-1319-d9a6-522c-31e42bcd2c2e@citrix.com>
 <5A6A147502000078001A27A0@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A6A147502000078001A27A0@prv-mh.provo.novell.com>
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
Cc: David Woodhouse <dwmw@amazon.co.uk>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDEvMTggMTY6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjAxLjE4IGF0
IDE3OjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI1LzAxLzE4
IDE1OjU3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI0LjAxLjE4IGF0IDE0OjEyLCA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gQEAgLTE3NDMsNiArMTc0NCwz
NCBAQCB2b2lkIGNvbnRleHRfc3dpdGNoKHN0cnVjdCB2Y3B1ICpwcmV2LCBzdHJ1Y3QgdmNwdSAq
bmV4dCkKPj4+PiAgICAgICAgICB9Cj4+Pj4gIAo+Pj4+ICAgICAgICAgIGN0eHRfc3dpdGNoX2xl
dmVsbGluZyhuZXh0KTsKPj4+PiArCj4+Pj4gKyAgICAgICAgaWYgKCBvcHRfaWJwYiAmJiAhaXNf
aWRsZV9kb21haW4obmV4dGQpICkKPj4+IElzIHRoZSBpZGxlIGRvbWFpbiBjaGVjayBoZXJlIHJl
YWxseSB1c2VmdWw/Cj4+IFllcywgYmVjYXVzZSBhcyB5b3UgcG9pbnRlZCBvdXQgaW4gdjksIHRo
ZSBvdXRlciBjb25kaXRpb24gaXNuJ3QKPj4gc3VmZmljaWVudCB0byBleGNsdWRlIG5leHRkIGJl
aW5nIGlkbGUuCj4gVHJ1ZSwgYnV0IHRoZW4gYWdhaW4gLSB3aGF0J3Mgd3Jvbmcgd2l0aCBhbiBp
ZGxlIHZDUFUgbWFraW5nIGl0Cj4gaW50byB0aGUgYmxvY2s/IEl0J2xsIGJlIGEgcG9pbnRsZXNz
IGJhcnJpZXIgdGhhdCB5b3UgaXNzdWUsIGJ1dCBubwo+IG90aGVyIGhhcm0gYWZhaWNzLiBSZW1l
bWJlciB0aGF0IEkgY29tcGxhaW5lZCBhYm91dCB0aGUgbWlzc2luZwo+IGNoZWNrIG9ubHkgYmVj
YXVzZSBvZiB0aGUgY2hvc2VuIHZhcmlhYmxlIG5hbWluZywgYnV0IHlvdSd2ZQo+IHJlbmFtZWQg
dGhlIHZhcmlhYmxlcyBpbiBxdWVzdGlvbiwgc28gSSBkb24ndCBzZWUgd2h5IHlvdSd2ZSBhbHNv
Cj4gYWRkZWQgdGhlIGV4dHJhIGNvbmRpdGlvbi4KClRoZSBiYXJyaWVyIHdvdWxkIGJlIHBvaW50
bGVzcywgeWVzLCBidXQgYXQgOGsgY3ljbGVzLCB0aGUgY29zdCBpcyBtYXNzaXZlLgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
