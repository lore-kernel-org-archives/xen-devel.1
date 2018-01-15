From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] fix potential null dereference
Date: Mon, 15 Jan 2018 01:22:58 -0700
Message-ID: <5A5C72F2020000780019EAB8@prv-mh.provo.novell.com>
References: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
 <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gnt3=ek=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eb02v-0003cV-If
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2018 08:23:09 +0000
In-Reply-To: <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@linaro.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAxLjE4IGF0IDA3OjIxLCA8anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+IE9uIDAxLzEyLzIwMTggMTE6NDAgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4g
aGFuZGxlcyBjYW4gdGhlb3JldGljYWxseSBiZSBOVUxMLCBjaGVjayBmb3IgaXQgZXhwbGljaXRs
eSBiZWZvcmUKPj4gZGVyZWZlcmVuY2luZyBpdC4KPiAKPiBJIGRvdWJ0IGhhbmRsZXMgY291bGQg
YmUgTlVMTCBpZiBMb2NhdGVIYW5kbGUgc3VjY2VlZC4gVGhpcyBzZWVtcyB0byBiZSAKPiBjb25m
aXJtZWQgYnkgdGhlIHNwZWMgKFBhZ2UgMjA4IGluIFVFRkkgc3BlYyAyLjcpLgo+IAo+IFNvIEkg
YW0gbm90IGVudGlyZWx5IGNvbnZpbmNlIHdlIHNob3VsZCBhZGQgeWV0IGFub3RoZXIgY2hlY2sg
aW4gdGhlIAo+IGNvZGUuIEFuIEFTU0VSVCBtaWdodCBiZSBiZXR0ZXIuCgpJbmRlZWQgaWYgdGhl
cmUgaXMgYSBwbGF0Zm9ybSB3aGVyZSBOVUxMIGlzIGNvbWluZyBiYWNrIGluIHRoZQpzdWNjZXNz
IGNhc2UsIHRoYXQgcGxhdGZvcm0gc2hvdWxkIGJlIG5hbWVkIGFzIGEganVzdGlmaWNhdGlvbgpp
biB0aGUgY29tbWl0IG1lc3NhZ2UuIE90aGVyd2lzZSBJIGRvbid0IHNlZSB0aGUgdmFsdWUgb2Yg
dGhpcwpjaGFuZ2UuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
