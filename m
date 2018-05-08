From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] vpci/msi: fix updating already bound
 MSI interrupts
Date: Tue, 8 May 2018 11:30:18 +0200
Message-ID: <75378768-2fb2-1ec3-3091-62380224fb96@suse.com>
References: <20180508092359.6829-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=orcc=h3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFyww-0004rk-Lt
 for xen-devel@lists.xenproject.org; Tue, 08 May 2018 09:30:22 +0000
In-Reply-To: <20180508092359.6829-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDUvMTggMTE6MjMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBIZWxsbywKPiAKPiBU
aGVyZSdzIGEgYnVnIGluIGN1cnJlbnQgdnBjaSBjb2RlIGZvciBNU0kgZW11bGF0aW9uIHdoZW4g
dXBkYXRpbmcgYW4KPiBhbHJlYWR5IGJvdW5kIGludGVycnVwdC4gVGhlIGNvZGUgd2lsbCBkaXNh
YmxlIGFuZCBlbmFibGUgdGhlIGludGVycnVwdAo+IGluIG9yZGVyIHRvIHVwZGF0ZSB0aGUgYmlu
ZGluZywgd2hpY2ggY2FsbHMgdW5tYXBfZG9tYWluX3BpcnEgdGhhdAo+IGRpc2FibGVzIHRoZSBn
bG9iYWwgTVNJIGVuYWJsZSBmbGFnIGluIHRoZSBjb250cm9sIHJlZ2lzdGVyLgo+IAo+IEluIG9y
ZGVyIHRvIGZpeCB0aGlzIGluY29ycmVjdCBiZWhhdmlvciBpbnRyb2R1Y2UgYSBuZXcgdXBkYXRl
IGhlbHBlcgo+IHRoYXQgc2hvdWxkIGJlIHVzZWQgdG8gdXBkYXRlIHRoZSBiaW5kaW5ncyBvZiBh
biBhbHJlYWR5IGVuYWJsZWQgZ3JvdXAKPiBvZiBNU0kgaW50ZXJydXB0cy4KPiAKPiBUaGFua3Ms
IFJvZ2VyLgo+IAo+IFJvZ2VyIFBhdSBNb25uZSAoMik6Cj4gICB2cGNpL21zaTogc3BsaXQgY29k
ZSB0byBiaW5kIHBpcnEKPiAgIHZwY2kvbXNpOiBmaXggdXBkYXRlIG9mIGJvdW5kIE1TSSBpbnRl
cnJ1cHRzCj4gCj4gIHhlbi9hcmNoL3g4Ni9odm0vdm1zaS5jIHwgOTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgeGVuL2RyaXZlcnMvdnBjaS9tc2kuYyAgfCAg
MyArLQo+ICB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICB8ICAyICsKPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA3MSBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKPiAKCkkgZ3Vlc3MgdGhpcyBpcyA0
LjExIG1hdGVyaWFsPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
