From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] firmware/shim : filter output files during
 Xen tree setup
Date: Tue, 24 Jul 2018 03:43:52 -0600
Message-ID: <5B56F4D802000078001D7155@prv1-mh.provo.novell.com>
References: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhtrJ-0003CZ-98
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 09:43:57 +0000
In-Reply-To: <1532121305-5253-1-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA3LjE4IGF0IDIzOjE1LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEV4Y2x1ZGUgbmFtZWQgb3V0cHV0IGZpbGVzIGZyb20gdGhlIFhlbiB0cmVlIHNl
dHVwLgo+IAo+IFRoZSBsaW5rZmFybS5zdGFtcCBjb250ZW50IHdpbGwgZGlmZmVyIGJldHdlZW4g
dG9wIGxldmVsICJtYWtlIgo+IGFuZCAibWFrZSBpbnN0YWxsIiBpbnZvY2F0aW9ucywgZHVlIHRv
IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlc2UKPiBvdXRwdXQgZmlsZXMgdGhhdCBhcmUgcHJvZHVj
ZWQgZHVyaW5nIHRoZSAibWFrZSIgYnVpbGQuCj4gCj4gRmlsdGVyIHRoZXNlIG91dCB0byBwcmV2
ZW50IGFuIHVubmVjZXNzYXJ5IHJlYnVpbGQgb2YgdGhlIHNoaW0gZHVyaW5nCj4gIm1ha2UgaW5z
dGFsbCIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVy
LmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KPiAtLS0KPiAgdG9vbHMvZmlybXdhcmUveGVuLWRpci9N
YWtlZmlsZSB8IDYgKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtl
ZmlsZSAKPiBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKPiBpbmRleCA4NDY0OGMz
Li5lNDkwZGNhIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUK
PiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4gQEAgLTExLDYgKzExLDkg
QEAgRD14ZW4tcm9vdAo+ICBMSU5LX0RJUlM9Y29uZmlnIHhlbgo+ICBMSU5LX0ZJTEVTPUNvbmZp
Zy5tawo+ICAKPiArIyBGaWxlcyB0byBleGNsdWRlIGZyb20gdGhlIGxpbmsgZmFybQo+ICtFWENM
VURFX0ZJTEVTPXhlbiB4ZW4uZ3ogeGVuLXN5bXMgeGVuLXN5bXMubWFwIGVmaS5sZHMgeGVuLmxk
cyBta2VsZjMyIG1rcmVsb2MKCldoYXQgYWJvdXQgeGVuLmVmaSBhbmQgYWxsIG9mIGl0cyBhdXhp
bGlhcnkgZmlsZXM/IFdoYXQgYWJvdXQgb3RoZXIgZ2VuZXJhdGVkCmZpbGVzPwoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
