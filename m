From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] tools/libxl: correct vcpu affinity
 output with sparse physical cpu map
Date: Thu, 30 Aug 2018 02:42:02 -0600
Message-ID: <5B87ADDA02000078001E36C8@prv1-mh.provo.novell.com>
References: <20180829182302.9977-1-jgross@suse.com>
 <20180829182302.9977-2-jgross@suse.com>
 <5B87A5B402000078001E361E@suse.com>
 <34fa0d2b-beb9-11df-6e90-e0496680a1d5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wyq4=ln=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fvIWk-0002Nb-6h
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:42:06 +0000
In-Reply-To: <34fa0d2b-beb9-11df-6e90-e0496680a1d5@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDEwOjExLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MC8wOC8xOCAxMDowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI5LjA4LjE4IGF0IDIw
OjIzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IFdpdGggbm90IGFsbCBwaHlzaWNhbCBj
cHVzIG9ubGluZSAoaS5lLiB3aXRoIHNtdD0wKSB0aGUgb3V0cHV0IG9mIGh0ZQo+PiAKPj4gSSB0
aGluayB5b3UgbWVhbiAiZS5nLiIgaW5zdGVhZCBvZiAiaS5lLiIgaGVyZSwgYXMgdGhlcmUgYXJl
IG90aGVyCj4+IG1lYW5zIHRvIGhhdmUgc29tZSBDUFVzIG9mZmxpbmUuCj4gCj4gSSB1c2VkIGl0
IGluIHRoZSBtZWFuaW5nIG9mICJuYW1lbHkiLCBpbiBvcmRlciB0byBoaWdobGlnaHQgdGhlIHJl
Y2VudAo+IGNoYW5nZSB0byBYZW4gbWFraW5nIGl0IG1vcmUgY2xlYXIgd2h5IHRoZSBjaGFuZ2Ug
aXMgSU1PIGltcG9ydGFudC4KCklpcmMgaXQgd2FzIElhbiB3aG8gdG9sZCBtZSBhIHdoaWxlIGFn
byB0aGF0IG91ciBHZXJtYW4gYmFzZWQgdXNlCm9mICJuYW1lbHkiIGluIGNhc2VzIGxpa2UgdGhp
cyBpc24ndCByZWFsbHkgYXBwcm9wcmlhdGU7IEknbSBub3Qgc3VyZQpJJ3ZlIGZ1bGx5IHVuZGVy
c3Rvb2Qgd2hlcmUgIm5hbWVseSIgd291bGQgYmUgdXNhYmxlIG9yIG5vdCwgc28KSSdtIHNpbXBs
eSB0cnlpbmcgdG8gYXZvaWQgaXQgbm93IGluIG1vc3QgY2FzZXMsIGFuZCBJJ20gdGhlcmVmb3Jl
Cm5vdCBzdXJlIGlmIGl0IHdhcyBhcHByb3ByaWF0ZSB0byBiZSB1c2VkIGhlcmUuIEknbSBhbHNv
IG5vdCBzdXJlCndoZXRoZXIgbXkgYXNzaWdubWVudCBvZiBtZWFuaW5nIHRvICJpLmUuIiBpcyBy
ZWFsbHkgY29ycmVjdCwgYnV0CkknZCBnZW5lcmFsbHkgdmlldyBpdCBhcyBhbiBhbmFsb2d1ZSBv
ZiAidGhhdCBpcyIsIHJhdGhlciB0aGFuIHRoZQoic3BlY2lmaWNhbGx5IiB5b3UgYXBwZWFyIHRv
IG1lYW4gaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
