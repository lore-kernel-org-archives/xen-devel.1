From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [OSSTEST PATCH v2 07/19] ts-host-install: don't use
 the new nic naming scheme
Date: Fri, 15 Dec 2017 15:45:06 +0000
Message-ID: <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-8-wei.liu2@citrix.com>
 <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fz67=dl=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ePsAg-0007C1-Rf
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 15:45:10 +0000
Received: by mail-wm0-x231.google.com with SMTP id i11so18344345wmf.4
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2017 07:45:09 -0800 (PST)
In-Reply-To: <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xMi8xNyAxNToxNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFdlaS9JYW4sCgpI
aSwKCj4gSSBoYXZlIHRyaWVkIHRoaXMgc2VyaWVzIG9uIEFybTY0IGhhcmR3YXJlLiBJIGFtIGFi
bGUgdG8gYm9vdCBhbmQgCj4gaW5zdGFsbCBEZWJpYW4gb24gQU1EIFNlYXR0bGUgKGxheHRvbnsw
LDF9KS4gQnV0IEkgZG9uJ3QgZ2V0IG5ldHdvcmsgCj4gd2hlbiB1c2luZyBDYXZpdW0gVGh1bmRl
ci1YIChyb2NoZXN0ZXJ7MCwxfSkgYWZ0ZXIgcmVib290Lgo+IAo+IExvb2tpbmcgaW50byBtb3Jl
IGRldGFpbHMsIHRoZSBpbnRlcmZhY2UgbmFtaW5nIGlzIG5vdCB0aGUgc2FtZSBiZXR3ZWVuIAo+
IHRoZSBpbnN0YWxsZXIgYW5kIGFmdGVyIHJlYm9vdC4gSW4gdGhlIGZvcm1lciwgZXRoNCBpcyB1
c2VkIHdoaWxzdCB0aGUgCj4gbGF0dGVyIHVzZXMgZXRoNSBmb3IgdGhlIHNhbWUgaW50ZXJmYWNl
IChVU0IgbmV0d29yayBkb25nbGUpLgo+IAo+IEkgaGF2ZSB0cmllZCB0byB1c2UgJ2ludGVyZmFj
ZSBmb3JjZScgcHJvcGVydHkgdG8gaW1wb3NlIGV0aDQsIHdpdGhvdXQgCj4gbXVjaCBsdWNrLiBU
aGUgaW50ZXJmYWNlIG5hbWluZyBpcyBzdGlsbCBldGg1IGFmdGVyIHJlYm9vdC4KPiAKPiBJIHdh
cyB3b25kZXJpbmcgaWYgeW91IGhhdmUgYW55IGlkZWEgaG93IHRvIHNvbHZlIHRoZSBuYW1pbmcg
c2NoZW1lIGlzc3VlPwoKSSBkdWcgYSBiaXQgbW9yZSwgc28gJ2ZvcmNlIGludGVyZmFjZScgd2ls
bCBjcmVhdGUgdGhlIAovZXRjL3VkZXYvcnVsZXMuZC83MC1wZXJzaXN0ZW50LW5ldC5ydWxlcyBm
b3IgdGhlIGluc3RhbGxlciBpbml0cmQuCgpIb3dldmVyLCBpdCBkb2VzIG5vdCBnZXQgY29waWVk
IHRvIHRoZSBpbnN0YWxsZWQgRGViaWFuLiBGb3IgdGhlIG1vbWVudCwgCkkgd29ya2Fyb3VuZCB0
aGlzIGJ5IGNvcHlpbmcgdGhlIGZpbGUgaW4gb3ZlcmxheS8gc28gaXQgZ2V0IGluc3RhbGxlZC4K
CldpdGggdGhhdCwgSSBtYW5hZ2UgdG8gZ2V0IHRoZSBuZXR3b3JrIGluIHRoZSBpbnN0YWxsZWQg
RGViaWFuLiBJIGd1ZXNzIAp0aGlzIGlzIG5vdCB0aGUgcmlnaHQgd2F5LiBXaGF0IHdvdWxkIGJl
IHRoZSByaWdodCB3YXk/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
