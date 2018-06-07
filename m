From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 1/6] Port WARN_ON_ONCE() from Linux
Date: Wed, 6 Jun 2018 19:21:45 -0600
Message-ID: <d5a4e953-63b3-1ac0-b56e-1f4afb54db7f@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-2-sameer.goel@linaro.org>
 <5B066F7302000078001C56BB@prv1-mh.provo.novell.com>
 <aee35e24-cf78-5f33-c13d-f10715e899f4@linaro.org>
 <5B07B63702000078001C5D4E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3wol=iz=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fQjcc-0000Dk-A8
 for xen-devel@lists.xenproject.org; Thu, 07 Jun 2018 01:21:50 +0000
Received: by mail-io0-x242.google.com with SMTP id s26-v6so9897440ioj.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jun 2018 18:21:48 -0700 (PDT)
In-Reply-To: <5B07B63702000078001C5D4E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Manish Jaggi <mjaggi@caviumnetworks.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8yNS8yMDE4IDAxOjA3IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNC4w
NS4xOCBhdCAyMjoyMywgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+IHdyb3RlOgo+Pj4+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+
Pj4+IEBAIC0xMSw2ICsxMSwxOSBAQAo+Pj4+ICAgICNkZWZpbmUgQlVHX09OKHApICBkbyB7IGlm
ICh1bmxpa2VseShwKSkgQlVHKCk7ICB9IHdoaWxlICgwKQo+Pj4+ICAgICNkZWZpbmUgV0FSTl9P
TihwKSBkbyB7IGlmICh1bmxpa2VseShwKSkgV0FSTigpOyB9IHdoaWxlICgwKQo+Pj4+ICAgIAo+
Pj4+ICsjZGVmaW5lIFdBUk5fT05fT05DRShwKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4+Pj4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4+PiArICAgIHN0YXRpYyBib29sIF9fc2VjdGlvbigiLmRhdGEudW5saWtlbHki
KSB3YXJuZWQ7ICAgXAo+Pj4gTGludXggdXNlcyAuZGF0YS5vbmNlLiBUaGF0IG9yIC5kYXRhLmNv
bGQgd291bGQgc2VlbSBiZXR0ZXIgdG8gbWUgdGhhbgo+Pj4gLmRhdGEudW5saWtlbHkuCj4+IEkg
Z3Vlc3MgdGhlcmUgaXMgbm90IHJlYXNvbiB0byBrZWVwIHRoaXMgaW4gYSBzcGVjaWZpYyBzZWN0
aW9uLiBJJ2xsCj4+IGp1c3QgZ28gYWhlYWQgYW5kIHJlbW92ZSB0aGUgc2VjdGlvbiBoZXJlPwo+
IFRoZXJlIGNlcnRhaW5seSBpcyBhIHJlYXNvbjogV2UgZG9uJ3Qgd2FudCBzdWNoIHZhcmlhYmxl
cyB0byBzaXQgaW4gdGhlCj4gbWlkZGxlIG9mIGFuIG90aGVyd2lzZSBmcmVxdWVudGx5IGFjY2Vz
c2VkIGNhY2hlIGxpbmUuIEhlbmNlIHRoZSAiY29sZCIKPiBwYXJ0IG9mIHRoZSBzdWdnZXN0ZWQg
YWx0ZXJuYXRpdmVzIG5hbWUuClRpbGwgdGhlIGxhc3QgcmVsZWFzZSBMaW51eCB3YXMgdXNpbmcg
LmRhdGEudW5saWtlbHkgdG8ganVzdCBrZWVwIHRoaXMgCnZhciBpbiBpdHMgb3duIGRhdGEgc2Vj
dGlvbi4gSSBjYW4gY2hhbmdlIHRoZSBuYW1lIHRvIGNvbGQuIEluIExpbnV4IAp0aGlzIHdhcyBj
aGFuZ2VkIHRvIG9uY2UgdG8gZW5hYmxlIGEgc3lzIG5vZGUgdGhhdCBjYW4gcmVzZXQgdGhlIHZh
bHVlIApvZiB0aGlzIHNlY3Rpb24gYW5kIGZvciBYZW4gdGhpcyBpcyBub3QgbmVlZGVkLgoKVGhh
bmtzLApTYW1lZXIKPiBKYW4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
