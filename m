From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] libx86: Introduce
 x86_cpuid_lookup_vendor()
Date: Tue, 26 Mar 2019 08:39:44 -0600
Message-ID: <5C9A39B00200007800221F23@prv1-mh.provo.novell.com>
References: <1553170866-23812-1-git-send-email-andrew.cooper3@citrix.com>
 <1553170866-23812-2-git-send-email-andrew.cooper3@citrix.com>
 <5C9A12690200007800221E05@prv1-mh.provo.novell.com>
 <c5d1df3d-038d-8c0a-97da-a71f8f3fd009@citrix.com>
 <5C9A320A0200007800221EFF@prv1-mh.provo.novell.com>
 <3a504ce9-9cad-f2a3-4ed5-bd42b114ee06@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3a504ce9-9cad-f2a3-4ed5-bd42b114ee06@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAzLjE5IGF0IDE1OjIzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJTU8g
ZXNwZWNpYWxseSBpbiB0aGUgQ1BVSUQgY2FzZSBpdCBpcyBkZXNpcmFibGUgdG8gZXhwbGljaXRs
eSBzcGVjaWZ5Cj4gdGhlIHdpZHRoIG9mIHRoZSBkYXRhLiBMb29raW5nIGF0IG5vZGVzIDB4ODAw
MDAwMDIgYW5kIGZvbGxvd2luZyB0aGlzCj4gc2hvdWxkIGJlIHJhdGhlciBjbGVhciAoYW5kIEkg
ZXZlbiB0aGluayBnZXRfbW9kZWxfbmFtZSgpIHNob3VsZCBiZQo+IG1vZGlmaWVkIHRvIHVzZSBh
IHBvaW50ZXIgdG8gdWludDMyX3QgaW5zdGVhZCBvZiB1bnNpZ25lZCBpbnQpLiBVc2luZwo+IGEg
dHlwZSB3aXRoIHNpemUgPj0gNCBkb2Vzbid0IGZpdCByZWFsbHkgd2VsbC4gWW91IHdhbnQgc2l6
ZSA9PSA0LgoKV2h5PyBGaXhlZCB3aWR0aCB0eXBlcyBvbmx5IGludHJvZHVjZSB1bm5lY2Vzc2Fy
eSByZXN0cmljdGlvbnMKd2hlbiB3YW50aW5nIHRvIHJlLXVzZSBjb2RlIGluIG90aGVyIGVudmly
b25tZW50cy4gQW5kIEkgZG9uJ3QKc2VlIHdoeSBDUFVJRCBub2RlcyAweDgwMDAwMDBbMjM0XSB3
b3VsZCBiZSBhbnkgYmV0dGVyIChvcgp3b3JzZSkgYXMgYW4gZXhhbXBsZSBoZXJlLiBJZiBhbnl0
aGluZyB0aGV5IHRlbGwgdXMgdGhhdCBuZWl0aGVyCnVpbnQzMl90IG5vciB1bnNpZ25lZCBpbnQg
YXJlIHJpZ2h0LCBhbmQgaXQgc2hvdWxkIGJlIGNoYXJbNF0gb3IKdWludDhfdFs0XSBpbnN0ZWFk
IChkZXBlbmRpbmcgb24gd2hldGhlciB3ZSB3YW50IHRvIHRpZQpvdXJzZWx2ZXMgdG8gQ0hBUl9C
SVQgPT0gOCwgd2hpY2ggY2xlYXJseSBpcyBtb3JlIHJlc3RyaWN0aXZlCnRoYW4gc2l6ZW9mKGlu
dCkgPj0gNCwgYnV0IG90b2ggaXMgYWxzbyBsZXNzIGxpa2VseSB0byBnZXQgaW4gdGhlCndheSku
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
