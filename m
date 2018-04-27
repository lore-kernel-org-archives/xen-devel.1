From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] docs/process/xen-release-management: Lesson
 to learn
Date: Fri, 27 Apr 2018 16:45:03 +0200
Message-ID: <4639e1dc-2348-cce6-9b31-8d298032e56b@suse.com>
References: <1513166547-6002-1-git-send-email-ian.jackson@eu.citrix.com>
 <CAFLBxZY4aOaX-iC0FO+3oeb1QbaRyWfTXnVky3Duw2XeMEB5ng@mail.gmail.com>
 <23267.13438.222034.769494@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mnjk=hq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fC4cV-0003r0-9p
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 14:45:07 +0000
In-Reply-To: <23267.13438.222034.769494@mariner.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDQvMTggMTY6MzIsIElhbiBKYWNrc29uIHdyb3RlOgo+IEdlb3JnZSBEdW5sYXAgd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gZG9jcy9wcm9jZXNzL3hlbi1yZWxlYXNlLW1h
bmFnZW1lbnQ6IExlc3NvbiB0byBsZWFybiIpOgo+PiBIb3cgd291bGQgeW91IGFwcGx5IHRoaXMg
ZGlyZWN0aXZlIHRvIHRoZSBwYXJ0aWN1bGFyIHNpdHVhdGlvbiB3ZQo+PiBmb3VuZCBvdXJzZWx2
ZXMgaW4gdGhpcyB0aW1lPwo+Pgo+PiBBcyBhIHJlbWluZGVyOgo+Pgo+PiAqIEFyb3VuZCAzIERl
Y2VtYmVyLCB3ZSBkaWRuJ3QgdGhpbmsgd2UnZCBiZSByZWFkeSB0byByZWxlYXNlIHVudGlsIDEx
IERlY2VtYmVyCj4+ICogVGhlIHNlY3VyaXR5IHRlYW0gaGFkIGFscmVhZHkgc2V0IGFuIGVtYmFy
Z28gZm9yIDEyIERlY2VtYmVyCj4+ICogT3VyIFBSIHBlb3BsZSBhZHZpc2VkIHVzIHRoYXQgMTMg
b3IgMTQgRGVjZW1iZXIgd291bGQgYmUgdGhlIGxhc3QKPj4gc3VpdGFibGUgZGF5IHRvIGFubm91
bmNlIGEgcmVsZWFzZSBpbiBvcmRlciB0byBoYXZlIGFuIGltcGFjdCBiZWZvcmUKPj4gQ2hyaXN0
bWFzCj4gCj4gV2VsbCwgd2UgY291bGQgcHV0IG9mZiB0aGUgcmVsZWFzZS4KPiAKPiBJIGd1ZXNz
IEknbSBiZWluZyBxdWl0ZSBzZWxmaXNoIGhlcmUuICBJJ20gdXN1YWxseSB0aGUgcmVsZWFzZQo+
IHRlY2huaWNpYW4uICBEb2luZyByZWxlYXNlIHByZXBhcmF0aW9uIGF0IHRoZSBsYXN0IG1pbnV0
ZSBhbmQgaW4KPiBzdHJhbmdlIHdheXMgbWVhbnMgbG90cyBvZiBvcHBvcnR1bml0eSBmb3IgbWUg
dG8gbWFrZSBtaXN0YWtlcy4KPiAKPiBJIHdvdWxkIGxpa2UgdG8gcHV0IHNvbWV0aGluZyBpbiB0
aGUgcmVsZWFzZSBjaGVja2xpc3QgdGhhdCBzdG9wcwo+IHBlb3BsZSBwdXR0aW5nIG1lIGluIGEg
ZGlmZmljdWx0IHBvc2l0aW9uIHdoZXJlIEkgYW0gKGEpIGxpa2VseSB0bwo+IG1ha2UgbWlzdGFr
ZXMgKGIpIHRob3NlIG1pc3Rha2VzIHdpbGwgYmUgZW1iYXJyYXNzaW5nLgo+IAo+IFB1dHRpbmcg
dGhpcyBpbiB0aGUgcmVsZWFzZSBjaGVja2xpc3QgZG9lc24ndCBtZWFuIHRoYXQgaXQgYWx3YXlz
IGhhcwo+IHRvIGJlIGZvbGxvd2VkLCBvZiBjb3Vyc2UuICBDaGVja2xpc3RzIGFyZSBub3QgcnVs
ZXM7IHRoZXkgYXJlCj4gZ3VpZGVsaW5lcy4KPiAKPiBCdXQgaWYgdGhpcyBndWlkZWxpbmUgaXMg
dmlvbGF0ZWQsIGFuZCBhcyBhIHJlc3VsdCBJIG1lc3Mgc29tZXRoaW5nIHVwCj4gZHVlIHRvIGhh
dmluZyB0byBkbyBhIGxvdCBvZiBjb21wbGljYXRlZCwgYWQtaG9jLCB1bi1xYS1hYmxlLCB3b3Jr
LAo+IGFsbCBpbiBhIGh1cnJ5LCB0aGVuIGl0IHdvdWxkIGJlIG5pY2UgaWYgaXQgd2VyZSBvYnZp
b3VzIHRoYXQgdGhlCj4gY2F1c2Ugb2YgdGhlIHRyb3VibGUgd2FzIHRoZSBkZWNpc2lvbiB0byB0
YWtlIHRoaXMgcmlzaywgcmF0aGVyIHRoYW4KPiBteSBjYXJlbGVzc25lc3Mgb3IgbGFjayBvZiBh
dHRlbnRpb24gdG8gZGV0YWlsLgoKKzEKClJlbHlpbmcgb24gbHVjayBpcyBub3RoaW5nIHdlIHNo
b3VsZCBiYXNlIG91ciBwcm9jZXNzIG9uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
