From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86-64/Xen: eliminate W+X mappings
Date: Mon, 18 Dec 2017 12:50:20 +0100
Message-ID: <903b2ec7-8338-658f-665b-41719e82387b__40984.4353482642$1513597762$gmane$org@suse.com>
References: <5A2FAEB802000055000F9D66@suse.com>
 <5A2FBE540200007800196B52@suse.com> <5A37B0770200007800198130@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gg45=do=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eQtw8-0003du-L8
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 11:50:24 +0000
In-Reply-To: <5A37B0770200007800198130@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, mingo@elte.hu, hpa@zytor.com, tglx@linutronix.de, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMTIvMTcgMTI6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEEgZmV3IHRob3VzYW5kIHN1
Y2ggcGFnZXMgYXJlIHVzdWFsbHkgbGVmdCBhcm91bmQgZHVlIHRvIHRoZSByZS11c2Ugb2YKPiBM
MSB0YWJsZXMgaGF2aW5nIGJlZW4gcHJvdmlkZWQgYnkgdGhlIGh5cGVydmlzb3IgKERvbTApIG9y
IHRvb2wgc3RhY2sKPiAoRG9tVSkuIFNldCBOWCBpbiB0aGUgZGlyZWN0IG1hcCB2YXJpYW50LCB3
aGljaCBuZWVkcyB0byBiZSBkb25lIGluIEwyCj4gZHVlIHRvIHRoZSBkdWFsIHVzZSBvZiB0aGUg
cmUtdXNlZCBMMXMuCj4gCj4gRm9yIHg4Nl9jb25maWd1cmVfbngoKSB0byBhY3R1YWxseSBkbyB3
aGF0IGl0IGlzIHN1cHBvc2VkIHRvIGRvLCBjYWxsCj4gZ2V0X2NwdV9jYXAoKSBmaXJzdC4gVGhp
cyB3YXMgYnJva2VuIGJ5IGNvbW1pdCA0NzYzZWQ0ZDQ1ICgieDg2LCBtbToKPiBDbGVhbiB1cCBh
bmQgc2ltcGxpZnkgTlggZW5hYmxlbWVudCIpIHdoZW4gc3dpdGNoaW5nIGF3YXkgZnJvbSB0aGUK
PiBkaXJlY3QgRUZFUiByZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAtLS0KPiB2MjogQWRqdXN0IGNvbW1lbnQgc3R5bGUgYW5kIGluZGVu
dGF0aW9uLgo+IC0tLQo+IFdoaWxlIEkgY2VydGFpbmx5IGRpc2xpa2UgdGhlIGFkZGVkIGhlYWRl
ciBpbmNsdXNpb24gdG8gb2J0YWluIHRoZQo+IHByb3RvdHlwZSBmb3IgZ2V0X2NwdV9jYXAoKSwg
SSBjb3VsZG4ndCBmaW5kIGEgYmV0dGVyIGFsdGVybmF0aXZlLiBJJ20KPiBvcGVuIHRvIHN1Z2dl
c3Rpb25zLgoKTW92ZSB0aGUgcHJvdG90eXBlIHRvIGFyY2gveDg2L2luY2x1ZGUvYXNtL2NwdS5o
ID8KCldpdGggdGhhdCBmaXhlZCAob3Igd2l0aG91dCBpdCBpbiBjYXNlIHRoZSB4ODYgbWFpbnRh
aW5lcnMgZG9uJ3QgbGlrZQp0aGUgcHJvdG90eXBlIHRvIGJlIG1vdmVkKToKClJldmlld2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
