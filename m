From: Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
Date: Mon, 20 May 2019 15:24:06 +0100
Message-ID: <9454fe63-9870-5795-beae-7f4dda4684b1@xen.org>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
 <23778.45224.28897.55507@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TkHb=TU=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hSjD0-0006dM-7s
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:24:10 +0000
Received: by mail-ed1-f67.google.com with SMTP id g57so24104522edc.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 07:24:08 -0700 (PDT)
In-Reply-To: <23778.45224.28897.55507@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, wl@xen.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMC8wNS8yMDE5IDE0OjUwLCBJYW4gSmFja3NvbiB3cm90ZToKPiBXZWkgTGl1IHdyaXRl
cyAoIltQQVRDSF0gbGlieGw6IGZpeCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYWZ0ZXIgODk5
NDMzZjE0OWQiKToKPj4gQWZ0ZXIgODk5NDMzZjE0OWQgbGlieGwgbmVlZHMgdG8ga25vdyB0aGUg
Y29udGVudCBvZiBkX2NvbmZpZyB0bwo+PiBkZXRlcm1pbmUgd2hpY2ggUUVNVSBpcyB1c2VkLiBU
aGUgY29kZSBpcyBjaGFuZ2VkIHN1Y2ggdGhhdAo+PiBsaWJ4bF9fZG9tYWluX3NldF9kZXZpY2Vf
bW9kZWwgbmVlZHMgdG8gYmUgY2FsbGVkIGJlZm9yZQo+PiBsaWJ4bF9fZG9tYWluX2J1aWxkX2lu
Zm9fc2V0ZGVmYXVsdC4KPj4KPj4gVGhpcyBpcyBmaW5lIGZvciBsaWJ4bCBjb2RlLCBidXQgaXQg
aXMgcHJvYmxlbWF0aWMgZm9yCj4+IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSwgd2hpY2ggaXMg
dGhlIG9ubHkgcHVibGljIEFQSSB0aGF0IHRha2VzIGEKPj4gYnVpbGRfaW5mby4gVG8gYXZvaWQg
YnJlYWsgaXRzIHVzZXJzLCBwcm92aWRlIGEgY29tcGF0aWJpbGl0eSBzZXR0aW5nCj4+IGluc2lk
ZSB0aGF0IGZ1bmN0aW9uLgo+IAo+IFRoaXMgbG9va3MgcGxhdXNpYmxlIHRvIG1lLiAgSSBzZWUg
dGhhdCB0aGlzIGZ1bmN0aW9uIGFscmVhZHkgbWFrZXMgYQo+IGNvcHkgb2YgdGhlIGJfaW5mbywg
c28gd2UgZG8gbm90IGVuZCB1cCBhY2NpZGVudGFsbHkgbGVha2luZyB0aGlzIG5ldwo+IGRlZmF1
bHQgc2V0dGluZyB0byB0aGUgY2FsbGVyLgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiAKClRoYW5rcy4KCkkgaGF2ZSBmaXhlZCB1cCB0aGUg
aXNzdWVzIFJvZ2VyIGFuZCBBbmR5IGZvdW5kIGFuZCBwdXNoZWQgdGhpcyBwYXRjaC4KCldlaS4K
Cj4gVGhhbmtzLAo+IElhbi4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
