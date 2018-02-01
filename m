From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] firmware/shim: fix Xen tree setup
Date: Thu, 01 Feb 2018 03:11:28 -0700
Message-ID: <5A72F5E002000078001A4439@prv-mh.provo.novell.com>
References: <5A72030902000078001A4165@prv-mh.provo.novell.com>
 <20180201100153.oqzfeqm7xb7sxmit@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xbw8=e3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ehBq9-0000Yj-UU
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 10:11:33 +0000
In-Reply-To: <20180201100153.oqzfeqm7xb7sxmit@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE4IGF0IDExOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSmFuIDMxLCAyMDE4IGF0IDA5OjU1OjIxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+ICsrKyBiL3Rv
b2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPj4gQEAgLTE2LDE4ICsxNiwxOCBAQCBERVBf
RklMRVM9JChmb3JlYWNoIGksICQoTElOS19GSUxFUyksICQoCj4+ICAKPj4gIGxpbmtmYXJtLnN0
YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykgRk9SQ0UKPj4gIAlta2RpciAtcCAkKEQpCj4+
IC0Jc2V0IC1lCj4+ICAJcm0gLWYgbGlua2Zhcm0uc3RhbXAudG1wCj4+ICsJc2V0IC1lOyBcCj4+
ICAJJChmb3JlYWNoIGQsICQoTElOS19ESVJTKSwgXAo+PiAgCQkgKG1rZGlyIC1wICQoRCkvJChk
KTsgXAo+PiAgCQkgIGNkICQoRCkvJChkKTsgXAo+PiAgCQkgIGZpbmQgJChYRU5fUk9PVCkvJChk
KS8gLXR5cGUgZCB8XAo+PiAtCQkJc2VkICdzLF4kKFhFTl9ST09UKS8kKGQpLywsZycgfCB4YXJn
cyBta2RpciAtcCk7KQo+PiArCQkJc2VkICdzLF4kKFhFTl9ST09UKS8kKGQpLywsZycgfCB4YXJn
cyBta2RpciAtcCk7KSBcCj4+ICAJJChmb3JlYWNoIGQsICQoTElOS19ESVJTKSwgXAo+PiAgCQko
Y2QgJChYRU5fUk9PVCk7IFwKPj4gLQkJIGZpbmQgJChkKSAhIC10eXBlIGwgLXR5cGUgZiBcCj4+
IC0JCSAkKGFkZHByZWZpeCAhIC1wYXRoICwgJyouW29kYTFdJyAnKi5kWzEyXScpKSBcCj4+IC0J
CSA+PiBsaW5rZmFybS5zdGFtcC50bXAgOyApCj4+ICsJCSBmaW5kICQoZCkgLXh0eXBlIGYgXAo+
IAo+IE5vIHh0eXBlIHBsZWFzZS4gRG9lcyBpdCB3b3JrIHdpdGggc29tZXRoaW5nIGxpa2U6Cj4g
Cj4gYGZpbmQgLUggJChkKSAtdHlwZSBmYAoKQWgsIHllcywgZGlkbid0IHRoaW5rIG9mIHRoYXQg
b25lLiBCdXQgcGVyaGFwcyAtTCByYXRoZXIgdGhhbiAtSD8KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
