From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/12] xen: use macros for filling parameter
 definition blocks
Date: Thu, 04 Oct 2018 09:37:32 -0600
Message-ID: <5BB633BC02000078001EE6DE@prv1-mh.provo.novell.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=z6fo=mq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g85h3-00047K-9l
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:37:37 +0000
In-Reply-To: <20180918060309.7186-2-jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA5LjE4IGF0IDA4OjAyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBEZWZp
bmUgbWFjcm9zIGZvciBmaWxsaW5nIHN0cnVjdCBrZXJuZWxfcGFyYW0gd2hlbiBkZWZpbmluZyBw
YXJhbWV0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPiAtLS0KPiAgeGVuL2luY2x1ZGUveGVuL2luaXQuaCB8IDU4ICsrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MCBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKClRoZSBkaWZmc3RhdCBwZXJoYXBzIG1h
a2VzIHRoaXMgYSB3b3J0aHdoaWxlIHBhdGNoIGV2ZW4gaW5kZXBlbmRlbnQKb2YgdGhlIHJlc3Qg
b2YgdGhlIHNlcmllcyAoaS5lLiBpZiBhbmQgaG93IG11Y2ggb2YgYSByZS13b3JrIHdpbGwgYmUg
bmVlZGVkKS4KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2luaXQuaAo+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9pbml0LmgKPiBAQCAtMTAxLDcyICsxMDEsNTQgQEAgZXh0ZXJuIGNvbnN0IHN0cnVj
dCBrZXJuZWxfcGFyYW0gX19wYXJhbV9zdGFydFtdLCAKPiBfX3BhcmFtX2VuZFtdOwo+ICAgICAg
X19hdHRyaWJ1dGVfXygoX19hbGlnbmVkX18oMSkpKSBjaGFyCj4gICNkZWZpbmUgX19rcGFyYW0g
ICAgICAgICAgX19wYXJhbShfX2luaXRzZXR1cCkKPiAgCj4gKyNkZWZpbmUgZGVmX2N1c3RvbV9w
YXJhbShfbmFtZSwgX2Z1bmMpIFwKPiArICAgIHsgLm5hbWUgPSBfbmFtZSwgXAo+ICsgICAgICAu
dHlwZSA9IE9QVF9DVVNUT00sIFwKPiArICAgICAgLnBhci5mdW5jID0gX2Z1bmMgfQo+ICsjZGVm
aW5lIGRlZl92YXJfcGFyYW0oX25hbWUsIF90eXBlLCBfdmFyKSBcCj4gKyAgICB7IC5uYW1lID0g
X25hbWUsIFwKPiArICAgICAgLnR5cGUgPSBfdHlwZSwgXAo+ICsgICAgICAubGVuID0gc2l6ZW9m
KF92YXIpLCBcCj4gKyAgICAgIC5wYXIudmFyID0gJl92YXIgfQoKTWF5IEkgYXNrIHRoYXQgYXQg
bGVhc3QgaW4gdGhlIG5ldyBtYWNyb3MgeW91IGludHJvZHVjZSB5b3UgZG8KYXdheSB3aXRoIHRo
ZSBib2d1cyBsZWFkaW5nIHVuZGVyc2NvcmVzPyBQZXJzb25hbGx5IEkgaGF2ZSBubwppc3N1ZSB3
aXRoIHNpbmdsZSBjaGFyYWN0ZXIgbWFjcm8gcGFyYW1ldGVyIG5hbWVzIChJIHNheSB0aGF0CmJl
Y2F1c2Ugc2ltcGx5IGRyb3BwaW5nIHRoZSB1bmRlcnNjb3JlcyB3aWxsIG9idmlvdXNseSBub3Qg
d29yaykuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
